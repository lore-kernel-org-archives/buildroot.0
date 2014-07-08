From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Jul 2014 14:09:25 +0200
Subject: [Buildroot] [PATCH v2] configs: add defconfig for TS-5x00 SBCs
In-Reply-To: <1404767273-1973-1-git-send-email-vivien.didelot@savoirfairelinux.com>
 (Vivien Didelot's message of "Mon, 7 Jul 2014 17:07:53 -0400")
References: <1404767273-1973-1-git-send-email-vivien.didelot@savoirfairelinux.com>
Message-ID: <87tx6sxdai.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vivien" == Vivien Didelot <vivien.didelot@savoirfairelinux.com> writes:

 > This patch adds support for the TS-5x00 serie of Technologic Systems
 > x86-based Single Board Computers, featuring an AMD Elan520 processor.

 > http://wiki.embeddedarm.com/wiki/#AMD

 > Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
 > ---
 >  .../ts5x00/fs-overlay/boot/syslinux/syslinux.cfg   |   9 ++
 >  board/ts/ts5x00/linux-3.14.config                  | 113 ++++++++++++++++++++
 >  .../linux/linux-001-add-support-for-ts5400.patch   | 117 +++++++++++++++++++++
 >  board/ts/ts5x00/readme.txt                         |  51 +++++++++
 >  configs/ts5x00_defconfig                           |  13 +++
 >  5 files changed, 303 insertions(+)
 >  create mode 100644 board/ts/ts5x00/fs-overlay/boot/syslinux/syslinux.cfg
 >  create mode 100644 board/ts/ts5x00/linux-3.14.config
 >  create mode 100644 board/ts/ts5x00/patches/linux/linux-001-add-support-for-ts5400.patch
 >  create mode 100644 board/ts/ts5x00/readme.txt
 >  create mode 100644 configs/ts5x00_defconfig

 > +++ b/board/ts/ts5x00/patches/linux/linux-001-add-support-for-ts5400.patch
 > @@ -0,0 +1,117 @@
 > +From 510acd057785ff52bfdfed6360a44a42f44e078f Mon Sep 17 00:00:00 2001
 > +From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
 > +Date: Mon, 7 Jul 2014 15:56:11 -0400
 > +Subject: [PATCH] x86: (ts5500) add board support for TS-5400
 > +
 > +This patch extends the TS-5500 board support to identify the compatible
 > +TS-5400 Single Board Computer (ID 0x40).
 > +
 > +It also adds a new "name" sysfs attribute for more human readable
 > +identification, actually printing "TS-5500" or "TS-5400".
 > +
 > +Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>

Has this been sent upstream? I don't see it in linux-next.


 > +++ b/board/ts/ts5x00/readme.txt
 > @@ -0,0 +1,51 @@
 > +Technologic Systems TS-5x00 SBCs
 > +================================
 > +
 > +This document explains how to set up a basic Buildroot system for the 
 > +Technologic Systems TS-5x00 serie of x86-based Single Board Computers.

I've stripped a bunch of trailing spaces here.


 > +++ b/configs/ts5x00_defconfig
 > @@ -0,0 +1,13 @@
 > +BR2_KERNEL_HEADERS_3_14=y

And added explicit

BR2_i386=y
BR2_x86_i586=y

even though they are the current default values, for documentation / if
we ever change the defaults.

Committed with these minor changes, thanks.

-- 
Bye, Peter Korsgaard
