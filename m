From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 08 Aug 2018 17:47:11 +0200
Subject: [Buildroot] [Buildroot & ArchLinux] can not build host-m4 on
 machine with glibc-2.28 installed
In-Reply-To: <20180808031502.GE1085@techyauld.com> (=?utf-8?B?IumDkS4g56WO?=
 =?utf-8?B?LiIncw==?= message of "Wed, 8 Aug 2018 11:15:02 +0800")
References: <20180808031502.GE1085@techyauld.com>
Message-ID: <87lg9gg8sg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "?" == ? ? <yzheng@techyauld.com> writes:

Hello,

Please mail the buildroot mailing list and not individual contributors,
thanks!

 > Hi,
 > 	I found that failure and do some hacking.

 > 	(1) m4 source, lib/freadahead.c: It use the internal symbols to guess the C runtime lib's type.

 > 	(2) glibc-2.28 removed the header file /usr/include/bits/libio.h.
 > 	    In fact, libio.h seems an internal header. The content of it has been
 > 	    moved into <glibc source>/libio/libio.h, which is not installed.


 > 	Anyone can help me out? M4 has not released new version since 1.4.18(2016-12-31).

 > Allan,
 > 	It seems that that bug will hit our lovely ArchLinux!

What is the build failure you are seeing exactly? Looking around, it
seems linuxfromscratch has some workarounds for building against
glibc-2.28, perhaps we can do the same?

http://www.linuxfromscratch.org/lfs/view/development/chapter05/m4.html

-- 
Bye, Peter Korsgaard
