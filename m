From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 2 May 2016 13:14:32 -0300
Subject: [Buildroot] SDL2_ttf requires libpng12 but Buildroot installs
 libpng16
In-Reply-To: <CAGrGpJCvESbiBVRkYkyxX_oMgkhnxqNjq5BKGs50LCa1Na_JSw@mail.gmail.com>
References: <CAGrGpJCvESbiBVRkYkyxX_oMgkhnxqNjq5BKGs50LCa1Na_JSw@mail.gmail.com>
Message-ID: <57277CE8.9020008@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/05/16 12:57, Peter Thompson wrote:

> I am trying to install the SDL2 suite  (SDL2, SDL2_gfx, SDL2_image,
> SDL2_ttf) using Buildroot-2016-02.  SDL2 is incorporated into
> Buildroot-2016-02.   SDL2_gfx and SDL2_image are relatively straight
> forward to add,  but SDL2_ttf is being problematic.    SDL2_ttf
> can't/won't use libpng16.

Hi.
SDL2_ttf doesn't use libpng at all, combined with the fact that you're 
building the additional SDL2* packages manually is a recipe for trouble.

> My questions are:
>
> 1. Can I change Buildroot-2016-02 to use libpng12 instead of libpng16?
> I looked at libpng dependencies in Buildroot and they are HUGE!   I see
> no easy way to change to libpng12.

Maybe, but expect other packages breaking because they require newer API 
functionality or decided they didn't want to deal with old libpng.

> 2. Does an earlier version of buildroot use libpng12?  Should I use
> that?  I would miss having SDL2 available in buildroot - I had problems
> compiling that earlier.

Not really, i think you're wrong in trying to manually build everything.

> 3. Should I use buildroot to build a barebones rootfs without libpng and
> create what I need from there.  Looking briefly at the dependencies, I
> am not sure that is possible.

No, again, make the additional SDL2* packages (sic) proper packages, 
that's the way, i'm pretty sure it will just work(tm) at least for 
SDL2_ttf since there's no mention of anything png-related in the source.
Regards.
