From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 17 May 2017 09:05:09 -0500
Subject: [Buildroot] [PATCH 1/1] libqmi: move canonicalize_file_name()
In-Reply-To: <821fc908-4c16-0153-8d64-adef6e959439@imgtec.com>
References: <1494815160-53868-1-git-send-email-matthew.weber@rockwellcollins.com>
 <821fc908-4c16-0153-8d64-adef6e959439@imgtec.com>
Message-ID: <CANQCQpZ_HuZM1JcTdNh9dR80PK9HRWOiK4d9tmLO5msfD6Nk2g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Mon, May 15, 2017 at 4:59 AM, Vicente Olivert Riera
<Vincent.Riera@imgtec.com> wrote:
>
> Hello Matt,
>
> On 15/05/17 03:26, Matt Weber wrote:
> > Previously was defined in qmi-util.h to fix musl
> > compatibility.  It was missed that this is a shared
> > header which causes other dependent package builds
> > to fail, so the static definition was moved into the
> > implementation where it was used.
> >
> > Upstream bug report has been updated and this resolves
> > the following autobuilder related failures.
> >
> >  http://autobuild.buildroot.net/results/fe9b6b1b1399a4e8aafc6a326c81ec97c2480025
> >  http://autobuild.buildroot.net/results/40eef797b4d8d53fc6e10f2048316d63549caf6d
> >
> > test-pkg testing was performed against 10 random toolchains
> >
> > ++ Config snippet ++
> > BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> > BR2_PACKAGE_MODEM_MANAGER_LIBQMI=y
> > BR2_PACKAGE_MODEM_MANAGER=y
> > BR2_PACKAGE_LIBQMI=y
> >
> > ++ Tested Toolchains ++ (Verified I hit all libc varients)
> > br-arm-cortex-a9-musl
> > br-arm-full-static
> > br-m68k-68040-full    (uclibc)
> > br-mips32r6-el-hf-glibc
> > br-mips64-n64-full
> > br-mips64r6-el-hf-glibc
> > br-mipsel-o32-full
> > br-sparc64-glibc
> > linaro-arm
> > sourcery-arm
> >
> > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>
> Tested with the following defconfig which was failing before this patch:
>
> BR2_mipsel=y
> BR2_mips_32r2=y
> # BR2_MIPS_SOFT_FLOAT is not set
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> BR2_PACKAGE_MODEM_MANAGER=y
> BR2_PACKAGE_MODEM_MANAGER_LIBQMI=y
> # BR2_TARGET_ROOTFS_TAR is not set
>
> Regards,
>
> Vincent
>

<snip>

Bump, noticed modem manager failed again yesterday.

Matt
