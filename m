From: Andre <armcc2000@yahoo.com>
Date: Wed, 6 Dec 2006 17:08:54 -0800 (PST)
Subject: [Buildroot] uClibc doesn't include legacy SuSv3 support by default
	anymore...
Message-ID: <820140.22973.qm@web35601.mail.mud.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


http://buildroot.uclibc.org/cgi-bin/viewcvs.cgi?rev=16732&view=rev

SuSv3 legacy support is required to build apps such as Wireless
Tools. Tweak Buildroot's default uClibc.config to compensate:

Index: toolchain/uClibc/uClibc.config
===========================================================
--- toolchain/uClibc/uClibc.config      (revision 16783)
+++ toolchain/uClibc/uClibc.config      (working copy)
@@ -84,6 +84,7 @@
 UCLIBC_DYNAMIC_ATEXIT=y
 # COMPAT_ATEXIT is not set
 # UCLIBC_SUSV3_LEGACY is not set
+UCLIBC_SUSV3_LEGACY_MACROS=y
 HAS_SHADOW=y
 # UCLIBC_HAS_PROGRAM_INVOCATION_NAME is not set
 UCLIBC_HAS___PROGNAME=y

Andre
--



 
____________________________________________________________________________________
Need a quick answer? Get one in minutes from people who know.
Ask your question on www.Answers.yahoo.com
