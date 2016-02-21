From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 21:13:40 +0100
Subject: [Buildroot] [PATCH] package/sdl_mixer: disable libmad support
 for static build only
In-Reply-To: <CABLs7GUZJRTddPMzP99Qz4N2AcKL4OZK5UMJ1vDxS9vh-=_M6Q@mail.gmail.com>
References: <1456073708-19562-1-git-send-email-romain.naour@gmail.com>
 <20160221181830.01215f6e@free-electrons.com>
 <CABLs7GUZJRTddPMzP99Qz4N2AcKL4OZK5UMJ1vDxS9vh-=_M6Q@mail.gmail.com>
Message-ID: <20160221211340.4db41609@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 21 Feb 2016 17:06:13 -0300, Rodrigo Rebello wrote:

> I don't think this workaround is necessary at all. Adding a
> 'Libs.private' section to SDL_mixer.pc and fixing packages that depend
> on SDL_mixer so that they use pkg-config doesn't seem too complicated.
> Currently only chocolate-doom, lbreakout2, ltris and prboom depend on
> it.

This is obviously the best option. Unfortunately, many of those
packages are not maintained, so we can't upstream the patches you're
talking about...

> I'll work on a patch for chocolate-doom now and handle the other 3 later.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
