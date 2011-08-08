From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 08 Aug 2011 21:16:37 +0200
Subject: [Buildroot] util-linux compile problems
In-Reply-To: <87fwlblqxr.fsf@macbook.be.48ers.dk> (Peter Korsgaard's message
 of "Mon, 08 Aug 2011 20:05:20 +0200")
References: <1312804690-21977-1-git-send-email-s.neumann@raumfeld.com>
 <87fwlblqxr.fsf@macbook.be.48ers.dk>
Message-ID: <87y5z3k92i.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:

Hi,

 Peter> We already pass --disable-nls unless you have locales enabled,
 Peter> so perhaps it needs similar handling as libglib2 for uClibc
 Peter> (select LIBINTIL if BR2_NEEDS_GETTEXT). Thomas also mentioned
 Peter> something about that, but I haven't done a locale build lately
 Peter> to test. Will do so now.

It seems to work fine here with:

BR2_arm=y
BR2_arm926t=y
BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
BR2_PACKAGE_UTIL_LINUX=y
BR2_PACKAGE_UTIL_LINUX_MOUNT=y
BR2_PACKAGE_UTIL_LINUX_FSCK=y
BR2_PACKAGE_UTIL_LINUX_LIBMOUNT=y
BR2_PACKAGE_UTIL_LINUX_UUIDD=y
BR2_PACKAGE_UTIL_LINUX_AGETTY=y
BR2_PACKAGE_UTIL_LINUX_CRAMFS=y
BR2_PACKAGE_UTIL_LINUX_SWITCH_ROOT=y
BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT=y
BR2_PACKAGE_UTIL_LINUX_FALLOCATE=y
BR2_PACKAGE_UTIL_LINUX_UNSHARE=y
BR2_PACKAGE_UTIL_LINUX_RENAME=y
BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS=y
BR2_PACKAGE_UTIL_LINUX_WALL=y
BR2_PACKAGE_UTIL_LINUX_ARCH=y
BR2_PACKAGE_UTIL_LINUX_INIT=y
BR2_PACKAGE_UTIL_LINUX_KILL=y
BR2_PACKAGE_UTIL_LINUX_LAST=y
BR2_PACKAGE_UTIL_LINUX_MESG=y
BR2_PACKAGE_UTIL_LINUX_PARTX=y
BR2_PACKAGE_UTIL_LINUX_RAW=y
BR2_PACKAGE_UTIL_LINUX_RESET=y
BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS=y
BR2_PACKAGE_UTIL_LINUX_WRITE=y

E.G. locale support and all util-linux options enabled, but no
gettext/libintl.

-- 
Bye, Peter Korsgaard
