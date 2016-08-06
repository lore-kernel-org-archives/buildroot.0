From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Aug 2016 23:58:17 +0200
Subject: [Buildroot] [PATCH] package/hidapi: depends on NPTL threads
In-Reply-To: <1470517283-4301-1-git-send-email-romain.naour@gmail.com>
References: <1470517283-4301-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160806235817.4c402ef7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  6 Aug 2016 23:01:23 +0200, Romain Naour wrote:

> Fixes:
> [microblaze]
> http://autobuild.buildroot.net/results/f7e/f7e778562aa1a65ba46f3b2f705d13ace8870805
> [m68k]
> http://autobuild.buildroot.net/results/2ec/2ecd240ccb15de76017942a8960faac6b3f973b4

Those two toolchains are broken: their configuration pretends that
thread support is available, but in fact it is not. This is due to
https://patchwork.ozlabs.org/patch/656252/.

That being said, I indeed don't see an implementation of
pthread_barrier_destroy() in the linuxthreads implementation of uClibc.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
