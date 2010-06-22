From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 22 Jun 2010 09:33:06 +0200
Subject: [Buildroot] Missing UBIFS utils
In-Reply-To: <AANLkTilpYe-9Mk_hZNpeTBGF8YwFAfyW6hBCl2G2OXJd@mail.gmail.com>
	(=?utf-8?Q?=22P=C3=A9ter_St=C3=B3sz=22's?= message of "Mon, 21 Jun 2010
	22:49:35 +0200")
References: <AANLkTilpYe-9Mk_hZNpeTBGF8YwFAfyW6hBCl2G2OXJd@mail.gmail.com>
Message-ID: <87pqzj7c99.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "P?ter" == P?ter St?sz <peter.stosz@mentat.hu> writes:

 P?ter> Hi!
 P?ter> How can I make UBI utils to the target?
 P?ter> Config below.
 P?ter> Found the needed utils on the host/usr/sbin directory, but not exist on target
 P?ter> /... dir.

 P?ter> BR2010.05
 P?ter> Target: SAM9261
 P?ter> Host: Ubuntu10.04

 P?ter> BR2_PACKAGE_MTD=y
 P?ter> ...
 P?ter> BR2_PACKAGE_MTD_MTDINFO=y
 P?ter> BR2_PACKAGE_MTD_UBIATTACH=y
 P?ter> BR2_PACKAGE_MTD_UBICRC32=y
 P?ter> BR2_PACKAGE_MTD_UBIDETACH=y
 P?ter> BR2_PACKAGE_MTD_UBIFORMAT=y
 P?ter> BR2_PACKAGE_MTD_UBIMKVOL=y
 P?ter> BR2_PACKAGE_MTD_UBINFO=y
 P?ter> BR2_PACKAGE_MTD_UBINIZE=y
 P?ter> BR2_PACKAGE_MTD_UBIRENAME=y
 P?ter> BR2_PACKAGE_MTD_UBIRMVOL=y
 P?ter> BR2_PACKAGE_MTD_UBIRSVOL=y
 P?ter> BR2_PACKAGE_MTD_UBIUPDATEVOL=y

It works here. Did you by any chance first build mtd without those ubi
programs and then later on enable them without doing a make clean in
between?

If not, please send your .config so I can investigate.

-- 
Bye, Peter Korsgaard
