From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Dec 2016 17:28:04 +0100
Subject: [Buildroot] [PATCH 2/2] orangepi: add basic support for
	orangepi-one board
In-Reply-To: <20161213205237.7119-2-geomatsi@gmail.com> (Sergey Matyukevich's
 message of "Tue, 13 Dec 2016 23:52:37 +0300")
References: <20161213205237.7119-1-geomatsi@gmail.com>
 <20161213205237.7119-2-geomatsi@gmail.com>
Message-ID: <87wpf1b1ij.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sergey" == Sergey Matyukevich <geomatsi@gmail.com> writes:

 > Board support package includes the following components:
 > - mainline u-boot 2016.09.01
 > - mainline kernel 4.9

 > Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
 > ---
 >  board/orangepi/orangepi-one/boot.cmd      |  8 +++++++
 >  board/orangepi/orangepi-one/genimage.cfg  | 36 +++++++++++++++++++++++++++++++
 >  board/orangepi/orangepi-one/post-build.sh | 11 ++++++++++
 >  board/orangepi/orangepi-one/post-image.sh | 14 ++++++++++++
 >  board/orangepi/orangepi-one/readme.txt    | 29 +++++++++++++++++++++++++
 >  configs/orangepi_one_defconfig            | 29 +++++++++++++++++++++++++

It is a bit annoying that we have to duplicate all files for each of the
several orangepi board variants, so I've added a patch to share the
post-build / post-image scripts and committed both patches, thanks.

 > +BR2_TARGET_UBOOT=y
 > +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 > +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 > +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09.01"
 > +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_one"

Any specific reason to not use uboot-2016.11?

-- 
Bye, Peter Korsgaard
