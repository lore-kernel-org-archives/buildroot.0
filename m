From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 01 Dec 2013 23:49:25 +0100
Subject: [Buildroot] [PATCH 11/15] grub2: add new package
In-Reply-To: <1384188459-1332-12-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 11 Nov 2013 17:47:35 +0100")
References: <1384188459-1332-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1384188459-1332-12-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87r49wtcei.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 >  boot/Config.in                     |   1 +
 >  boot/grub2/Config.in               | 120 +++++++++++++++++++++++++++++++++++++
 >  boot/grub2/grub.cfg                |   6 ++
 >  boot/grub2/grub2-remove-gets.patch |  21 +++++++
 >  boot/grub2/grub2.mk                |  88 +++++++++++++++++++++++++++
 >  5 files changed, 236 insertions(+)
 >  create mode 100644 boot/grub2/Config.in
 >  create mode 100644 boot/grub2/grub.cfg
 >  create mode 100644 boot/grub2/grub2-remove-gets.patch
 >  create mode 100644 boot/grub2/grub2.mk

 > diff --git a/boot/Config.in b/boot/Config.in
 > index eb5f7cd..71d2fbd 100644
 > --- a/boot/Config.in
 > +++ b/boot/Config.in
 > @@ -6,6 +6,7 @@ source "boot/at91dataflashboot/Config.in"
 >  source "boot/barebox/Config.in"
 >  source "boot/boot-wrapper-aarch64/Config.in"
 >  source "boot/grub/Config.in"
 > +source "boot/grub2/Config.in"
 >  source "boot/lpc32xxcdl/Config.in"
 >  source "boot/mxs-bootlets/Config.in"
 >  source "boot/syslinux/Config.in"
 > diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
 > new file mode 100644
 > index 0000000..e59626a
 > --- /dev/null
 > +++ b/boot/grub2/Config.in
 > @@ -0,0 +1,120 @@
 > +config BR2_TARGET_GRUB2
 > +	bool "grub2"
 > +	depends on BR2_i386 || BR2_x86_64

Doesn't grub2 also need BR2_HOSTARCH_NEEDS_IA32_COMPILER?

-- 
Bye, Peter Korsgaard
