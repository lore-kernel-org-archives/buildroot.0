From: mattwood2000 at gmail.com <mattwood2000@gmail.com>
Date: Wed, 17 Feb 2021 16:17:56 -0500
Subject: [Buildroot] CMake package requires out of source build
In-Reply-To: <20210217181627.kba2lo2fskbvvx3l@falbala.internal.home.lespocky.de>
References: <CADjezmadzNatvC8E3ybVjcv-HmOAUb8zO09jnVfRosSxu1Gokw@mail.gmail.com>
 <20210216000715.2d81f552@gmx.net>
 <CADjezma+0Oav4kZzYnuwdsbruCFuBG3ZLqRPQ2EF7uHyHXg4Cw@mail.gmail.com>
 <20210217155233.3yf2tjemg3mygcm7@falbala.internal.home.lespocky.de>
 <CADjezmY7i+rYoKf2=zUQX2r0j14McNjbZba9D+-WOgRQhjYGxw@mail.gmail.com>
 <20210217181627.kba2lo2fskbvvx3l@falbala.internal.home.lespocky.de>
Message-ID: <CADjezmZhfR4mVdDGF-YjAeOf+AasWLmoPbctaGSZyaWfGkf95w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alex,

On Wed, Feb 17, 2021 at 1:16 PM Alexander Dahl <post@lespocky.de> wrote:
>
>
> Oh, my bad. Of course building in a subfolder "build" (or with another name like above) is
> quite common with CMake. I usually don't do this, but that's of course
> only my personal preference.

No problem at all!

>
> > But in this case there is a cmake rule that iterates over the entire
> > source directory to check if the build directory is present:
> > https://github.com/alexa/avs-device-sdk/blob/master/build/cmake/DisallowOutOfSourceBuilds.cmake
>
> That makes no sense to me. In that script they link to
> https://gitlab.kitware.com/cmake/community/-/wikis/FAQ#cmake-does-not-generate-a-make-distclean-target-why
> but that only covers in source builds.
>
Agreed, very strange indeed.  And, like I said it builds perfectly
fine overriding their rule.

> > Removing the rule from BuildDefaults.cmake gets around this issue.
> > Also, the source builds perfectly fine this way.  I'm not sure why
> > Amazon forces this.
>
> Agreed. So why not patch 'build/BuildDefaults.cmake' like that and add
> the patch to the buildroot package for that avs-device-sdk instead of
> changing buildroot core?

Yup, thats exactly what I did, I reverted my patch against the core
and all works now

Thanks, Matt.
>
> Greets
> Alex
>
> --
> /"\ ASCII RIBBON | ?With the first link, the chain is forged. The first
> \ / CAMPAIGN     | speech censured, the first thought forbidden, the
>  X  AGAINST      | first freedom denied, chains us all irrevocably.?
> / \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)
