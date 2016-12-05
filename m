From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Dec 2016 21:30:31 +0100
Subject: [Buildroot] [PATCH v1] gstreamer1: fix compile for microblaze
 and xtensa architectures
In-Reply-To: <20161205202715.22139-1-ps.report@gmx.net>
References: <20161205202715.22139-1-ps.report@gmx.net>
Message-ID: <20161205213031.7caf4172@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  5 Dec 2016 21:27:15 +0100, Peter Seiderer wrote:
> Fix unaligned access support detection introduced to gstreamer
> by commit 'gstconfig.h: Detect unaligned access support at compile-time' ([1])
> by assuming no unaligned support for unknown architectures.
> 
> Fixes [2], [3]:
> 
>   ../gst/gstconfig.h:112:4: error: #error "Could not detect architecture; don't know whether it supports unaligned access! Please file a bug."
>   #  error "Could not detect architecture; don't know whether it supports unaligned access! Please file a bug."
> 
> [1] https://cgit.freedesktop.org/gstreamer/gstreamer/commit/?h=1.10&id=6ef601367e0f5adb7a8b02cec94dec04fccf701a
> [2] http://autobuild.buildroot.net/results/c1cd60d3f44f2938e5f42453d034ea070898f837
> [3] http://autobuild.buildroot.net/results/c3a6662f0acfda179a58cdad9165f36826229826
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

I've applied after fixing a minor typo (see below). Could you submit
this patch upstream?

> +Better be save (assume no unaligned access) than sorry (bail out

save -> safe

> +with error message at compile time).
> +
> +Fixes compile for xtensa and microblaze architectures.
> +
> +Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
