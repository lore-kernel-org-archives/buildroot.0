From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Jul 2012 12:38:54 +0200
Subject: [Buildroot] Qt tribulations take 2
In-Reply-To: <50029C65.9010004@mind.be>
References: <CALo-6+iZBhkaZJCOG8BLNOGfV36C_ZOHx+-U7hzuArLbrTmN4w@mail.gmail.com>
 <20120713165557.1b39651c@skate>
 <CALo-6+gv+zb1peT7ngOGLL7VnS6xpCUOZRn_J6CD86Kmn7vX=A@mail.gmail.com>
 <20120714182555.4b7b267d@jl-desk-LL>
 <CALo-6+hSrFrqua1s48qzYn9J8qF0F6=zCpgfbguO2hf3VmqeOQ@mail.gmail.com>
 <20120715010542.1a23ba0f@skate> <50029C65.9010004@mind.be>
Message-ID: <20120715123854.3d6c11f1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 15 Jul 2012 12:33:09 +0200,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

>   We could define MAKE as env -i $(MAKE), but there are some environment
> variables that are passed to sub-makes that you loose this way.  Maybe
> better is to define SHELL as env -i sh, but that could have huge side
> effects...

Hm, ok.

>   But maybe we shouldn't exaggerate here.  Putting a QMAKESPEC in your
> environment would make any qt build fail, so it's not really a
> buildroot problem.  Maybe a better idea is to put in the documentation
> that the safe way is to use 'env -i make' to start a build...

Well, there are already many other environment variables that may break
the build and that we are either checking in
support/dependencies/dependencies.sh, or unsetting in main Makefile.
Shouldn't we do the same for QMAKESPEC?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
