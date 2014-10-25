From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 25 Oct 2014 02:16:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/uclibc: Add eventfd_read() and
	eventfd_write()
In-Reply-To: <1414183436-6964-1-git-send-email-bernd.kuhls@t-online.de> (Bernd
 Kuhls's message of "Fri, 24 Oct 2014 22:43:56 +0200")
References: <1414183436-6964-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87wq7p57i0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Needed for upcoming eventfd support in Kodi:
 > https://github.com/FernetMenta/xbmc/commit/1030119691a67511b6e9a27abdec474525de8d26

 > Runtime test was positive:
 > 22:13:39 T:3035360160  NOTICE: Thread FDEventMonitor start, auto delete: false

 > Downloaded from Openembedded:
 > https://github.com/openembedded/oe-core/blob/master/meta/recipes-core/uclibc/uclibc-git/0001-Add-eventfd_read-and-eventfd_write.patch

 > This function needs CONFIG_EVENTFD enabled in kernel and the following line to be
 > added to package/kodi/Config.in when the eventfd support becomes part of upstream:
 > depends on !BR2_TOOLCHAIN_EXTERNAL_UCLIBC

Sorry, I don't like to carry feature patches (that aren't even in
upstream git) to buildroot.

Is there any real reason to use uClibc with kodi? I would imagine that
kodi is so big that the size difference betweeen uClibc and glibc
doesn't really matter.

-- 
Bye, Peter Korsgaard
