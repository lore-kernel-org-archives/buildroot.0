From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 26 Feb 2011 11:22:04 +0100
Subject: [Buildroot] add liblcms1.19 to buildroot
In-Reply-To: <AANLkTinp++75KxqQa-1oQyPuZhfP5voL+PCbXEx2ZSAY@mail.gmail.com>
	(bao bui's message of "Sat, 26 Feb 2011 01:57:11 -0800")
References: <AANLkTinp++75KxqQa-1oQyPuZhfP5voL+PCbXEx2ZSAY@mail.gmail.com>
Message-ID: <87pqqfp037.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "bao" == bao bui <buiqbao@gmail.com> writes:

 bao> How can I add liblcms1.19 to buildroot? I alway have the error:
 >>>> liblcms 1.19 Extracting
 >>>> liblcms 1.19 Patching package/liblcms
 bao> Aborting.? Reject files found.

Probably the upstream tarball contains .rej files:

find lcms-1.19 -name \*.rej
lcms-1.19/src/cmscam97.c.rej

You can add a _POST_EXTRACT_HOOK to remove it (see busybox package for
an example). Notice that 1.19 isn't the latest upstream version. Once
you have it working, please consider sending us a patch to add it to BR.

-- 
Bye, Peter Korsgaard
