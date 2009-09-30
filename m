From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Sep 2009 10:31:37 +0200
Subject: [Buildroot] multiple architectures
In-Reply-To: <5f2b60909300113o53ef97b7j6910562af6ebb8be@mail.gmail.com>
References: <20090930062658.GG25852@moomers.org> <20090930090102.0189852d@surf>
	<5f2b60909300113o53ef97b7j6910562af6ebb8be@mail.gmail.com>
Message-ID: <20090930103137.304aa012@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 30 Sep 2009 10:13:22 +0200,
Bj?rn Forsman <bjorn.forsman@gmail.com> a ?crit :

> How about that the default BR output directory contains an arch
> postfix? This would eliminate the need for manually setting O=
> according to the current .config. Instead it would happen
> automatically.

This was the case previously. But I don't think it's a good idea, since
it only solves partially the problem: what if you have several
projects, but all these projects use the same architecture ?

This is even more common than multiple architectures projects: you work
on ARM (for example), but you build different filesystems for different
usages of the device. In that case, a default output-arm/ directory
would not solve the problem.

A possibility would be to add a configuration option to set the output
directory path, instead of passing O=. I don't have a strong opinion on
this, but I'd prefer not to have both solutions. The fact that
Buildroot has multiple solutions to do approximately the same thing is
a large part of the confusion for our new users, and I would like to
reduce this confusion.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
