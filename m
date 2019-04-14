From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Apr 2019 15:42:25 +0200
Subject: [Buildroot] [PATCH 1/1] dacapo: new package
In-Reply-To: <7B9EA298F6C566489E909E1B85615FB80186965B3A@AWHMBX02.belcan.com>
References: <7B9EA298F6C566489E909E1B85615FB80186965B3A@AWHMBX02.belcan.com>
Message-ID: <20190414154225.48347784@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Daniel,

On Mon, 18 Feb 2019 21:55:03 +0000
"Leach, Daniel J." <dleach@belcan.com> wrote:

> The DaCapo benchmark suite is intended as a tool for Java benchmarking
> by the programming language, memory management and computer architecture
> communities.
> 
> Depends on the OpenJDK package for Java runtime environment.
> 
> Signed-off-by: Daniel J. Leach <dleach@belcan.com>

Thanks for your contribution, I have applied after doing a few changes.
First of all, your patch didn't apply as-is, it was probably mangled by
your e-mail client. Please try to use "git send-email" to send patches
in the future.

> diff --git a/DEVELOPERS b/DEVELOPERS
> index baa325eead..a64a671b56 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1405,6 +1405,7 @@ F:        package/checksec/
>  F:      package/cgroupfs-mount/
>  F:      package/crda/
>  F:      package/cunit/
> +F:     package/dacapo

Why was this added in the middle of Matt Weber entries ? It should have
been associated to your name, since you are the one contributing
dacapo. I fixed that up.

> diff --git a/package/dacapo/dacapo.mk b/package/dacapo/dacapo.mk
> new file mode 100644
> index 0000000000..32d0cc0701
> --- /dev/null
> +++ b/package/dacapo/dacapo.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# dacapo
> +#
> +################################################################################
> +
> +DACAPO_VERSION = 9.12-MR1-bach
> +DACAPO_SOURCE = dacapo-$(DACAPO_VERSION).jar
> +DACAPO_SITE = http://sourceforge.net/projects/dacapobench/files/9.12-bach-MR1
> +DACAPO_LICENSE = Apache-2.0
> +DACAPO_LICENSE_FILES = LICENSE
> +
> +define DACAPO_EXTRACT_CMDS
> +       unzip $(DACAPO_DL_DIR)/$(DACAPO_SOURCE) LICENSE -d $(@D)
> +endef
> +
> +define DACAPO_INSTALL_TARGET_CMDS
> +       $(INSTALL) -D -m 755 $(DACAPO_DL_DIR)/$(DACAPO_SOURCE) $(TARGET_DIR)/usr/bin/

The destination path should include the filename, so I also fixed that.

Applied with those two issues fixed. Thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
