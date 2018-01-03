From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Jan 2018 21:44:03 +0100
Subject: [Buildroot] [PATCH v3 1/1] opentracing-cpp: new package
In-Reply-To: <CAHXCMMJo24SinfZnTfbee5X3MjfF31cYHEJkH9=dJ=TmZpDDZg@mail.gmail.com>
References: <1514014802-23736-2-git-send-email-heyleke@gmail.com>
 <1514969543-20452-1-git-send-email-heyleke@gmail.com>
 <1514969543-20452-2-git-send-email-heyleke@gmail.com>
 <20180103090357.4mgwa6xeo2iw25hi@sapphire.tkos.co.il>
 <CAGszK3jrDpyP6eyg8J3N371YVQpV+KUFB90=608LC0viDMFFbA@mail.gmail.com>
 <20180103092503.twpzntqwteqhb4oh@sapphire.tkos.co.il>
 <20180103111020.0311f39c@windsurf.lan>
 <CAHXCMMJo24SinfZnTfbee5X3MjfF31cYHEJkH9=dJ=TmZpDDZg@mail.gmail.com>
Message-ID: <20180103214403.04e54ec6@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 3 Jan 2018 21:37:03 +0100, Samuel Martin wrote:

> > On the other hand, there doesn't seem to be a real standardization of
> > such options in the CMake world. I.e it's really up to each individual
> > package to obey to BUILD_SHARED_LIBS/BUILD_STATIC_LIBS, and many CMake
> > packages have their own custom options to enable/disable shared/static
> > library build.
> >
> > But I guess for the sake of consistency pkg-cmake.mk should also pass
> > BUILD_STATIC_LIBS, and we should accordingly cleanup the CMake packages
> > that rely on BUILD_SHARED_LIBS/BUILD_STATIC_LIBS to not pass them
> > explicitly, and rely on what the pkg-cmake infra is doing.  
> 
> Adding BUILD_STATIC_LIBS will make thing a bit nicer (at least
> symetric), though it is not standard in any way, which means some
> projects may choose another name for a similar option and there is not
> much we can do about this.
> 
> BTW, some projects still seems ignoring the existence of the
> BUILD_SHARED_LIBS variable since they add a similar option with a
> different name.
> 
> 
> [1] https://cmake.org/cmake/help/v3.8/manual/cmake-variables.7.html#variables-that-change-behavior

So BUILD_SHARED_LIBS is somewhat standardized by CMake, but not
BUILD_STATIC_LIBS.

If that's the case, then we should not handle BUILD_STATIC_LIBS in
pkg-cmake.mk, contrary to what I said previously. And we should add a
comment explaining this in pkg-cmake.mk.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
