From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Oct 2016 15:08:21 +0200
Subject: [Buildroot] [PATCH] package/ctorrent: fix static builds with
	threads
In-Reply-To: <1476616447-11298-1-git-send-email-razzor@kopf-tisch.de> (Olaf
 Rempel's message of "Sun, 16 Oct 2016 13:14:07 +0200")
References: <1476616447-11298-1-git-send-email-razzor@kopf-tisch.de>
Message-ID: <87shrw5tmi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Olaf" == Olaf Rempel <razzor@kopf-tisch.de> writes:

 > Fix static linking with enabled threads for some toolchains
 > ./arm-buildroot-uclinux-uclibcgnueabi/lib/libstdc++.a(guard.o): In
 > function `(anonymous namespace)::get_static_cond()':
 > guard.cc:(.text._ZN12_GLOBAL__N_115get_static_condEv+0x6): undefined reference to `pthread_once'

 > Fixes: http://autobuild.buildroot.net/results/138/138569071d0514a0301aa5568bc86706e692d5e9/

 > Signed-off-by: Olaf Rempel <razzor@kopf-tisch.de>

Thanks, but this is really a toolchain error with uClibc as ctorrent
doesn't use pthread. With the recently released uClibc-ng 1.0.18 this is
now fixed, so this is now fixed and I've marked this patch as rejected.

-- 
Bye, Peter Korsgaard
