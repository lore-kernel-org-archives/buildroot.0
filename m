From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 08 Apr 2012 09:44:37 +0200
Subject: [Buildroot] [PATCH v2] Add fmtools package.
In-Reply-To: <1333282723-7276-1-git-send-email-marek.belisko@open-nandra.com>
 (Marek Belisko's message of "Sun, 1 Apr 2012 14:18:43 +0200")
References: <1333282723-7276-1-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <87hawuu0pm.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Marek" == Marek Belisko <marek.belisko@open-nandra.com> writes:

Hi,

 Marek> Change from v1:
 Marek> - use $(TARGET_CONFIGURE_OPTS) instead of setting CC and LD individually
 Marek>   (thanks Baruch)

This info should go after the '---' line, as otherwise 'git am' will add
it to the commit message.


 Marek> diff --git a/package/fmtools/Config.in b/package/fmtools/Config.in
 Marek> new file mode 100644
 Marek> index 0000000..41c883c
 Marek> --- /dev/null
 Marek> +++ b/package/fmtools/Config.in
 Marek> @@ -0,0 +1,9 @@
 Marek> +config BR2_PACKAGE_FMTOOLS
 Marek> +	bool "fmtools"
 Marek> +	help
 Marek> +	  fmtools is a pair of simple command-line utilities for
 Marek> +	  ?video4linux? radio tuner cards under Linux. It includes

Menuconfig shows rubbish for these unicode quotes, so I replaced them
with normal ascii ones.


 Marek> +++ b/package/fmtools/fmtools.mk
 Marek> @@ -0,0 +1,19 @@
 Marek> +#############################################################
 Marek> +#
 Marek> +# fmtools
 Marek> +#
 Marek> +#############################################################
 Marek> +
 Marek> +FMTOOLS_VERSION = 1.0.2
 Marek> +FMTOOLS_SITE = http://www.stanford.edu/~blp/fmtools/
 Marek> +
 Marek> +define FMTOOLS_BUILD_CMDS
 Marek> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
 Marek> +endef
 Marek> +
 Marek> +define FMTOOLS_INSTALL_TARGET_CMDS
 Marek> +	$(INSTALL) -D -m 0755 $(@D)/fm $(TARGET_DIR)/usr/sbin
 Marek> +	$(INSTALL) -D -m 0755 $(@D)/fmscan $(TARGET_DIR)/usr/sbin

With install -D you have to provide the destination filename as well, so
I adjusted these two lines.

Committed with these fixes, thanks.

-- 
Bye, Peter Korsgaard
