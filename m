From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jul 2012 10:50:47 +0200
Subject: [Buildroot] [PATCH v3] Bump gpsd from version 2.95 to version
 3.7
In-Reply-To: <CAHt8ZCNtCKA+KCvEaubBEwvfkDzLaSpCsUSLa2cU1G_pPY1+fw@mail.gmail.com>
References: <1343071776-1689-1-git-send-email-spdawson@gmail.com>
 <20120724084545.6c0cedab@skate> <20120724101103.6a11efda@skate>
 <CAHt8ZCNtCKA+KCvEaubBEwvfkDzLaSpCsUSLa2cU1G_pPY1+fw@mail.gmail.com>
Message-ID: <20120724105047.7e49f624@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 24 Jul 2012 09:23:42 +0100,
Simon Dawson <spdawson@gmail.com> a ?crit :

> I've reproduced the profiling problem with uClibc (Buildroot
> toolchain). But I haven't managed to reproduce the other build
> problems yet (using Linaro 2012.02 toolchain). I wonder if it might be
> better to revert this for the time being; what do you think?

Well, let's try to fix the problems for now :-)

Problem (1) appears when PPS support is enabled. I think it should
appear with all toolchains.

Problem (2) appears when Qt is available.

I have no idea for problem (3), but I think it should easily be
reproducible.

Problem (4) is due to the fact that the gcc14 build machine has Python
2.5 installed. First option: the SConstruct file should be patched to
avoid using the "with" Python thing, that has been introduced in Python
2.6. Second option: we merge the patches from Samuel Martin that checks
whether the version of the host Python is good enough or not, and if
not, builds its own host Python version. Considering that the patch to
apply on SConstruct is fairly small, I think option 1) is easy.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
