From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Jan 2015 09:09:54 +0100
Subject: [Buildroot] [PATCH 2/4] boot/syslinux: bump version to 6.03
In-Reply-To: <54C82817.5060804@openwide.fr>
References: <1421710198-20898-1-git-send-email-romain.naour@openwide.fr>
 <1421710198-20898-2-git-send-email-romain.naour@openwide.fr>
 <20150126232217.04b2fec1@free-electrons.com>
 <54C82817.5060804@openwide.fr>
Message-ID: <20150128090954.29df9abf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Wed, 28 Jan 2015 01:06:47 +0100, Romain Naour wrote:

> I checked if an external gnu-efi can be used but it's hard coded in
> build-gnu-efi.sh.
> 
> The gnu-efi build start in mk/efi.mk line 51 by calling:
> $(topdir)/efi/check-gnu-efi.sh $(EFI_SUBARCH) $(objdir)
> 
> Where:
> topdir = output/build/syslinux-6.03
> EFI_SUBARCH = ia32
> objdir = output/build/syslinux-6.03/efi32 (build output directory)
> 
> The script check-gnu-efi.sh test if gnu-efi needs to be build.
> If yes, it call build-gnu-efi.sh
> 
> The path to gnu-efi is hard coded by EFIDIR:
> EFIDIR="$(readlink -f "$objdir/../gnu-efi/gnu-efi-3.0")"
> 
> I tried to comment this line and define EFIDIR=$(GNU_EFI_DIR) in
> SYSLINUX_BUILD_CMDS.
> But there are some build issues to be investigated.
> 
> But clearly, external gnu-efi is not supported anymore...

Ok, thanks for looking a bit closer!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
