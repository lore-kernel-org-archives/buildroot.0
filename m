From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Jul 2012 14:54:11 +0200
Subject: [Buildroot] [PATCH] pkg-infra: limit -reconfigure and -rebuild
 actions
In-Reply-To: <20120720233136.GA25851@mail.sceen.net>
References: <1342791572-18657-1-git-send-email-rbraun@sceen.net>
 <20120720222722.5f89af04@skate>
 <20120720233136.GA25851@mail.sceen.net>
Message-ID: <20120721145411.6e291ad2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 21 Jul 2012 01:31:36 +0200,
Richard Braun <rbraun@sceen.net> a ?crit :

> To clarify my point of view: the intended behaviour is obvious, and
> I assumed the original author knew what he wanted when these targets
> were added.

Actually, the original author was me :-)

See 4ed4e5016b741341059ed826416dad3291df0b2c.

> But my use cases are rather the following: I am making
> modifications to the source code of a package, and I want to easily use
> the environment provided by buildroot (the toolchain, the staging
> directory and the target optimizations, maybe others). If it fails, it
> will stop in either case. But if it succeeds, I want to easily check the
> output and make sure the build process produced the expected results
> (I mostly check compiler warnings, sometimes the generated code). If I
> am confident in the results, I just add && make (which is short and
> simple enough) to get the current behaviour.
> 
> I usually use buildroot with two flavors of configuration: a production
> one, and a developer one (with debugging symbols, target debugging tools
> such as valgrind, sometimes -O0 executables). This can result in huge
> images, so getting to that step while the build of the package I'm
> working on didn't reach a state I can confidently validate doesn't make
> sense. And when it does (and even if it doesn't), simply adding
> "&& make" does the job.

It does make some sense, but I'd like to see the opinion of others.

However, I don't agree with the change you did on -reconfigure that
would only to the configure step. If -rebuild does build+install, then
-reconfigure should do configure+build+install.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
