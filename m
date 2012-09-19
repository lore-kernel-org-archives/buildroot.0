From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 19 Sep 2012 08:19:36 +0200
Subject: [Buildroot] rootfs hooks okay to use?
In-Reply-To: <CANxTyt7HEBtj+WUzAcwii7n9K3drUEz=34yMAOeN8FHOG2DqfA@mail.gmail.com>
References: <CANxTyt7HEBtj+WUzAcwii7n9K3drUEz=34yMAOeN8FHOG2DqfA@mail.gmail.com>
Message-ID: <505963F8.7050705@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/19/12 03:44, Danomi Manchego wrote:
> Hi all,
>
> I tried adding something like this to one of our proprietary packages:
>
> +define TEST_PRE_GEN_HOOK_FIXUP
> + echo "This is a test hook"
> +endef
> +
> +ROOTFS_CRAMFS_PRE_GEN_HOOKS    += TEST_PRE_GEN_HOOK_FIXUP
> +ROOTFS_CLOOP_PRE_GEN_HOOKS     += TEST_PRE_GEN_HOOK_FIXUP
> +ROOTFS_EXT2_PRE_GEN_HOOKS      += TEST_PRE_GEN_HOOK_FIXUP
> +ROOTFS_JFFS2_PRE_GEN_HOOKS     += TEST_PRE_GEN_HOOK_FIXUP
> +ROOTFS_UBIFS_PRE_GEN_HOOKS     += TEST_PRE_GEN_HOOK_FIXUP
> +ROOTFS_SQUASHFS_PRE_GEN_HOOKS  += TEST_PRE_GEN_HOOK_FIXUP
> +ROOTFS_TAR_PRE_GEN_HOOKS       += TEST_PRE_GEN_HOOK_FIXUP
> +ROOTFS_CPIO_PRE_GEN_HOOKS      += TEST_PRE_GEN_HOOK_FIXUP
> +ROOTFS_ISO9660_PRE_GEN_HOOKS   += TEST_PRE_GEN_HOOK_FIXUP
> +ROOTFS_INITRAMFS_PRE_GEN_HOOKS += TEST_PRE_GEN_HOOK_FIXUP
> +ROOTFS_ROMFS_PRE_GEN_HOOKS     += TEST_PRE_GEN_HOOK_FIXUP
>
> But when I run make, I get:
>
> fs/cpio/cpio.mk:32 <http://cpio.mk:32>: *** missing separator (did you mean TAB instead of 8 spaces?).  Stop.
> make: *** [all] Error 2

  Any commands to be executed by make should start with a TAB character,
so make recognizes them as commands.  That is also true for the hooks.
So you should define

define TEST_PRE_GEN_HOOK_FIXUP
	echo "This is a test hook"
endef

where there is a single tab before echo.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
