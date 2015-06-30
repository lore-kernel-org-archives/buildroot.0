From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jun 2015 22:59:15 +0200
Subject: [Buildroot] [PATCH 1/1] util-linux: allow programs to be
 disabled by default
In-Reply-To: <1435635368-26928-1-git-send-email-danomimanchego123@gmail.com>
References: <1435635368-26928-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20150630225915.6838f4f2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Danomi Manchego,

On Mon, 29 Jun 2015 23:36:08 -0400, Danomi Manchego wrote:

> +ifeq ($(BR2_PACKAGE_UTIL_LINUX_DISABLE_BY_DEFAULT),y)
> +UTIL_LINUX_CONF_OPTS += --disable-all-programs
> +endif

I understand the idea, but it's a bit weird to have an option to enable
to say that you want to disable everything.

Also, we are already passing --disable-all-programs when
BR2_PACKAGE_UTIL_LINUX_BINARIES is not enabled. Maybe we should instead
pass --disable-all-programs unconditionally. However this would change
the visible behavior for users, since programs that used to be built
would no longer be built. But it seems the most correct solution
nonetheless.

Any opinions from other Buildroot developers?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
