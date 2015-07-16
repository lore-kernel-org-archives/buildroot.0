From: Nimai Mahajan <nimaim@gmail.com>
Date: Thu, 16 Jul 2015 08:48:02 -0400
Subject: [Buildroot] Another Buildroot Enhancement Suggestion (re-use base
	build)
Message-ID: <CALoSW65V2bmF8GEtUH_hLm-_n9vPDEjnK5-YXyx_eXoy04fDKw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I should have brought this up during the hackathon but it totally
slipped my mind. But anyways, here it goes: we use Buildroot for ~3-4
projects here at work and it's been great for us since it is very easy
to customize and build from the ground up. We generally compile our
builds from scratch, as is the Buildroot norm, and that works (I also
use CCACHE and external toolchain and that does help quite a bit) but
I was wondering if this could be even further sped up.

The use case is that our release builds for those 3-4 projects is
always the same (minus a slightly different fs overlay and 1-2
different packages). Is there any way or do you guys see any
usefulness in taking an already built "external base build" with all
the packages that subsequent builds will use and telling Buildroot
what to add on top of it? Basically, it doesn't make sense to me to
rebuild the entire thing when only a few files change. This is
probably a huge effort as I don't think a mechanism exists to do it
but I'm just looking for some comments/thoughts. Does this even make
sense or is there already a decent way to do this?

For release builds, this is not a major problem because builds only
take 5-10 min at most, but when you're compiling debug builds with
debugging symbols for various projects, this can add hours or even
days if builds fail. We have Jenkins running and pumping out builds
for us 24/7, and this would help a lot in testing, taking a prebuilt
base build and just recompiling our custom packages (for now, we do a
-dirclean on our packages and rebuild them every time which works for
the time being).

Thanks,
Nimai
