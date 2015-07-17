From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 17 Jul 2015 10:04:07 +0300
Subject: [Buildroot] Another Buildroot Enhancement Suggestion (re-use
 base build)
In-Reply-To: <CALoSW65V2bmF8GEtUH_hLm-_n9vPDEjnK5-YXyx_eXoy04fDKw@mail.gmail.com>
References: <CALoSW65V2bmF8GEtUH_hLm-_n9vPDEjnK5-YXyx_eXoy04fDKw@mail.gmail.com>
Message-ID: <20150717070407.GF3147@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Nimai,

On Thu, Jul 16, 2015 at 08:48:02AM -0400, Nimai Mahajan wrote:
> I should have brought this up during the hackathon but it totally
> slipped my mind. But anyways, here it goes: we use Buildroot for ~3-4
> projects here at work and it's been great for us since it is very easy
> to customize and build from the ground up. We generally compile our
> builds from scratch, as is the Buildroot norm, and that works (I also
> use CCACHE and external toolchain and that does help quite a bit) but
> I was wondering if this could be even further sped up.
> 
> The use case is that our release builds for those 3-4 projects is
> always the same (minus a slightly different fs overlay and 1-2
> different packages). Is there any way or do you guys see any
> usefulness in taking an already built "external base build" with all
> the packages that subsequent builds will use and telling Buildroot
> what to add on top of it? Basically, it doesn't make sense to me to
> rebuild the entire thing when only a few files change. This is
> probably a huge effort as I don't think a mechanism exists to do it
> but I'm just looking for some comments/thoughts. Does this even make
> sense or is there already a decent way to do this?
> 
> For release builds, this is not a major problem because builds only
> take 5-10 min at most, but when you're compiling debug builds with
> debugging symbols for various projects, this can add hours or even
> days if builds fail. We have Jenkins running and pumping out builds
> for us 24/7, and this would help a lot in testing, taking a prebuilt
> base build and just recompiling our custom packages (for now, we do a
> -dirclean on our packages and rebuild them every time which works for
> the time being).

The patch at http://patchwork.ozlabs.org/patch/464753/ might be helpful for 
you. Please check it out and let us know.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
