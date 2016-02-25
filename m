From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2016 23:00:52 +0100
Subject: [Buildroot] [PATCH v2] dt: new package
In-Reply-To: <1453894838-15276-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1453894838-15276-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <20160225230052.4df48d9f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 27 Jan 2016 08:40:38 -0300, gustavo.zacarias at free-electrons.com
wrote:

> diff --git a/package/dt/dt.mk b/package/dt/dt.mk
> new file mode 100644
> index 0000000..290ff91
> --- /dev/null
> +++ b/package/dt/dt.mk
> @@ -0,0 +1,40 @@
> +################################################################################
> +#
> +# dt
> +#
> +################################################################################
> +
> +DT_VERSION = v18.32
> +DT_SITE = http://pkgs.fedoraproject.org/repo/pkgs/dt/$(DT_SOURCE)/3054aeaaba047a1dbe90c2132a382ee2
> +DT_SOURCE = dt-source-$(DT_VERSION).tar.gz
> +DT_SUBDIR = dt.$(DT_VERSION)

Since dt.$(DT_VERSION) was the only sub-directory, I thought it was
easier to do DT_STRIP_COMPONENTS = 2, as it allows to get rid
completely of all DT_SUBDIR references later, so I've done this change.

> +define DT_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/$(DT_SUBDIR) -f Makefile.linux \
> +	$(TARGET_CONFIGURE_OPTS) \
> +	CFLAGS="$(TARGET_CFLAGS) $(DT_CFLAGS)" \
> +	OS=linux

Indentation was not correct here, the follow-up lines should be
intended with two tabs. I've fixed this minor nit.

Applied to next, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
