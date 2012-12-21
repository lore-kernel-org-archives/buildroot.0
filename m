From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 21 Dec 2012 13:57:14 +0100
Subject: [Buildroot] [PATCH] ffmpeg: make ARM optimizations explicit
In-Reply-To: <1356093631-558-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 21 Dec 2012 09:40:31 -0300")
References: <1356093631-558-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87pq238swl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> The ffmpeg configure script tries to autodetermine ARM optimizations by
 Gustavo> building a small code snippet with AS.
 Gustavo> If AS allows higher-level (>generic) assembly instructions then it
 Gustavo> passes and enables the relevant optimization path.
 Gustavo> Some toolchains allow/default to more than generic asm and then fail
 Gustavo> when the real code is built.
 Gustavo> Fixes:
 Gustavo> http://autobuild.buildroot.net/results/b6e1225a07a58cc7544e37bc55675be71e2b5088/

Committed, thanks.

It would be good to add some BR2_ARM_HAS_ARMVx config options so we
don't need these written out checks in the packages which care.

-- 
Bye, Peter Korsgaard
