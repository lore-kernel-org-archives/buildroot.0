From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 10 May 2012 07:41:32 -0300
Subject: [Buildroot] [PATCH 2/5] Added the libksba package.
In-Reply-To: <1336598986-9518-2-git-send-email-stijn.souffriau@essensium.com>
References: <1336598986-9518-1-git-send-email-stijn.souffriau@essensium.com>
 <1336598986-9518-2-git-send-email-stijn.souffriau@essensium.com>
Message-ID: <6b8500a8286821ac6b5e59fc3224cfd4@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-05-09 18:29, Stijn Souffriau wrote:

> +LIBKSBA_CONF_OPT = \
> +	--disable-optimization \
> +	--with-gpg-error-prefix=$(STAGING_DIR)/usr
> +
> +$(eval $(call AUTOTARGETS))

LIBKSBA_DEPENDENCIES = libgpg-error
and
select BR2_PACKAGE_LIBGPG_ERROR in Config.in maybe?
Regards.
