From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Sep 2017 21:42:13 +0200
Subject: [Buildroot] [PATCH 3/3] sdl2: Add KMS/DRM(experimental) video
 driver support
In-Reply-To: <0c84c541-fe77-0f6f-bea5-ce4f88097fab@mind.be>
References: <20170926144723.17619-1-olivier.schonken@gmail.com>
 <20170926144723.17619-3-olivier.schonken@gmail.com>
 <20170926170727.3fdcd9c9@windsurf.lan>
 <CALdGskKTn3HBvSg=HJ7m1iaAt_bVgEDNq1hMsa4EhFOkaGrkhA@mail.gmail.com>
 <0c84c541-fe77-0f6f-bea5-ce4f88097fab@mind.be>
Message-ID: <20170926214213.03f191eb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 26 Sep 2017 21:36:40 +0200, Arnout Vandecappelle wrote:

>  XORG7 is a special case, we never select it (and we assume it's obvious that
> you need X to be able to use X stuff). But if you look at e.g.
> BR2_PACKAGE_SDL2_X11, it selects BR2_PACKAGE_XLIB_LIBX11 and
> BR2_PACKAGE_XLIB_LIBXEXT rather than depending on them.
> 
>  BR2_PACKAGE_DIRECTFB should indeed be selected instead of depended on. That's
> historical accident, because sdl2 was largely copied from sdl, and sdl had this
> construct since 2009 when there were no clear rules yet about select/depend.

For sdl2, it would be useful to look at the review discussion. I'm
wondering if I didn't suggest to have a "depends on" for DirectFB, just
for the sake of having something consistent between the different
graphics backends. I don't remember.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
