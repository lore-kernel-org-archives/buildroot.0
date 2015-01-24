From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 24 Jan 2015 10:44:27 +0100
Subject: [Buildroot] [PATCH v1] eudev: fix mkstemp/mkostemp related
	build failure
In-Reply-To: <1422090569-28932-1-git-send-email-ps.report@gmx.net> (Peter
 Seiderer's message of "Sat, 24 Jan 2015 10:09:29 +0100")
References: <1422090569-28932-1-git-send-email-ps.report@gmx.net>
Message-ID: <8761bw5x8k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Fixes [1]:
 > ./.libs/libudev-core.a(util.o): In function `mkostemp_safe':
 > util.c:(.text+0x2950): undefined reference to `mkostemp'

 > Do not only protect the call to the mkostemp wrapper mkostemp_safe
 > with HAVE_DECL_MKOSTEMP but although the wrapper himself.

s/although/also/

Committed, thanks.

-- 
Bye, Peter Korsgaard
