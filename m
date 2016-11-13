From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Nov 2016 12:55:18 +0100
Subject: [Buildroot] [PATCH for-master] package/strace: disable libmpers
 with musl toolchains
In-Reply-To: <1478964612-7028-1-git-send-email-romain.naour@gmail.com>
References: <1478964612-7028-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20161113125518.2797806f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 12 Nov 2016 16:30:12 +0100, Romain Naour wrote:
> strace bundle some kernel headers to build libmpers, this mixes userspace
> headers and kernel headers which break the build with musl.
> The stddef.h from gcc is used instead of the one from musl.
> 
> Disable libmpers for musl toolchains.
> 
> Fixes:
> http://autobuild.buildroot.net/results/6f6/6f63fa2537ff316ba259a20966faadcf5ab9deff
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

Hum, Alpine Linux is not doing this, and they support strace 4.14. Why
are we having this issue and not Alpine Linux?

I've asked on #musl, we'll see if they come back with some explanation.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
