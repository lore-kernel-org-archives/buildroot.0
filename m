From: Ulf Samuelsson <ulfs@dof.se>
Date: Mon,  6 Nov 2006 21:57:51 +0200
Subject: [Buildroot] Suggestion, move TARGET_DIR
Message-ID: <DQ6KSKMJS5g8.cLWMbj8T@mailout.dof.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> 
> If you have, lets say, several ARM targets, it makes sense to have several "root"
> which you can rebuild without recompiling each package.

and both buld_<ARCH> and target_<ARCH> ends up as the same thing.

but if I understand you, you'd like target_<TARGET_NAME> or
target_<ARCH>_<TARGET_NAME> so we can build for more than one target?

=> Actually I'd like
target_<ARCH>/<TARGET_NAME>

and under that I'd
like to put all things 
related to that target
including "root",
the generated file system(s)
the build for u-boot and
linux so I can have 
several configurations.
Actually every package
which have their own
configuration file should
be in a target specific
directory, so maybe even
busybox.
build_<ARCH> should be used when you can use the same package for several targets.

/Ulf

> Also it would make sense to be able to generate binary rpm's for each package.

Landley mentioned dependencies but it shouldn't be that hard if we drop 
that headache.


Thomas.
_______________________________________________
buildroot mailing list
buildroot at uclibc.org
http://busybox.net/mailman/listinfo/buildroot
