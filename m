From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 29 Nov 2009 08:49:20 +0100
Subject: [Buildroot] Buildroot - ltrace build failure
In-Reply-To: <200911281932.43827.minimod@morethan.org> (Michael S. Zick's
	message of "Sat\, 28 Nov 2009 19\:32\:41 -0600")
References: <200911281932.43827.minimod@morethan.org>
Message-ID: <87zl653h4v.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael S Zick <minimod@morethan.org> writes:

 Michael> If we can believe the messages on stderr:
 Michael> make[2]: *** No rule to make target `mips/arch.h', needed by `sysdep.h'.  Stop.
 Michael> make[1]: *** [sysdeps/sysdep.o] Error 2
 Michael> make[1]: *** Waiting for unfinished jobs....
 Michael> In file included from ltrace.c:15:
 Michael> ltrace.h:12:20: error: sysdep.h: No such file or directory
 Michael> In file included from ltrace.c:15:
 Michael> ltrace.h:26: error: ?BREAKPOINT_LENGTH? undeclared here (not in a function)
 Michael> make[1]: *** [ltrace.o] Error 1
 Michael> make: *** [/Builds/BLDRT/br-head/output/build/ltrace-0.5/ltrace] Error 2

 Michael> That one just isn't going to build for MIPS.

Exactly. It seems like ltrace doesn't have any mips support upstream, so
I'll hide it for the archs we have that ltrace doesn't support.

http://packages.debian.org/lenny/ltrace

-- 
Bye, Peter Korsgaard
