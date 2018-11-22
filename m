From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Date: Thu, 22 Nov 2018 18:55:24 +0100
Subject: [Buildroot] [PATCH] Add mini-snmpd package
In-Reply-To: <20181113225227.32ee1b8e@windsurf>
References: <20181111150652.17459-1-alexander.sverdlin@gmail.com>
 <20181111150652.17459-4-alexander.sverdlin@gmail.com>
 <20181113225227.32ee1b8e@windsurf>
Message-ID: <24587aac-c3c0-dc1e-fab4-43d165f1b46a@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On 13/11/2018 22:52, Thomas Petazzoni wrote:
> mini-snmpd has an optional dependency on libconfuse, when --with-config
> is passed, or by default. So, you should either pass --without-config
> and not bother with this dependency, or handle it explicitly with
> something like this:
> 
> ifeq ($(BR2_PACKAGE_LIBCONFUSE),y)
> MINI_SNMPD_DEPENDENCIES += host-pkgconf libconfuse
> MINI_SNMPD_CONF_OPTS += --with-config
> else
> MINI_SNMPD_CONF_OPTS += --without-config
> endif

I believe, we can ignore this for now until the new feature with config file is released.
Current latest release package (1.4) doesn't have such an option.

But thanks for heads-up, one updating the version should not forget to add the
above handling.

--
Alex.
