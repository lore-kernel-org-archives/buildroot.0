From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Aug 2016 09:25:37 +0200
Subject: [Buildroot] [PATCH] libraw: fix build with gcc 6.x
In-Reply-To: <3cb051ae-2a23-7a0a-edf0-8f901157f7f0@mind.be>
References: <1472246236-31129-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <3cb051ae-2a23-7a0a-edf0-8f901157f7f0@mind.be>
Message-ID: <20160827092537.10f48a8d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 27 Aug 2016 00:26:31 +0200, Arnout Vandecappelle wrote:

>  Hm, turns out that what you put here indeed doesn't fix it completely:
> 
> internal/dcraw_common.cpp: In member function ?void LibRaw::kodak_radc_load_raw()?:
> internal/dcraw_common.cpp:2491:3: error: narrowing conversion of ?-2? from ?int?
> to ?char? inside { } [-Wnarrowing]

Weird, I definitely built the package with a gcc 6.x toolchain, and it
was building fine. Maybe the failure only occurred with some additional
optional dependencies enabled?

>  I was waiting for upstream to fix that one as well (Debian runs into it too, on
> the 0.17 branch, so it ought to be fixed quickly).
> 
>  And indeed, Debian has fixed it already... I'll send a patch.

Your solution is also shorter/simpler, indeed.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
