From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 26 Sep 2017 21:36:40 +0200
Subject: [Buildroot] [PATCH 3/3] sdl2: Add KMS/DRM(experimental) video
 driver support
In-Reply-To: <CALdGskKTn3HBvSg=HJ7m1iaAt_bVgEDNq1hMsa4EhFOkaGrkhA@mail.gmail.com>
References: <20170926144723.17619-1-olivier.schonken@gmail.com>
 <20170926144723.17619-3-olivier.schonken@gmail.com>
 <20170926170727.3fdcd9c9@windsurf.lan>
 <CALdGskKTn3HBvSg=HJ7m1iaAt_bVgEDNq1hMsa4EhFOkaGrkhA@mail.gmail.com>
Message-ID: <0c84c541-fe77-0f6f-bea5-ce4f88097fab@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 26-09-17 17:10, Olivier Schonken wrote:
> Hi
> 
> I tried to fit in with the style of the rest of the video drivers, should they
> then change as well?

 XORG7 is a special case, we never select it (and we assume it's obvious that
you need X to be able to use X stuff). But if you look at e.g.
BR2_PACKAGE_SDL2_X11, it selects BR2_PACKAGE_XLIB_LIBX11 and
BR2_PACKAGE_XLIB_LIBXEXT rather than depending on them.

 BR2_PACKAGE_DIRECTFB should indeed be selected instead of depended on. That's
historical accident, because sdl2 was largely copied from sdl, and sdl had this
construct since 2009 when there were no clear rules yet about select/depend.

 Regards,
 Arnout


[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
