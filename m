From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Nov 2016 21:28:12 +0100
Subject: [Buildroot] ninja/python-meson packages
In-Reply-To: <98b7a6164112ee321e9220d5b8c47a33@openmailbox.org>
References: <98b7a6164112ee321e9220d5b8c47a33@openmailbox.org>
Message-ID: <20161109212812.39399895@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 09 Nov 2016 16:26:38 +0100, C?dric Marie wrote:

> > I would not say one, but at least 4-5 packages, with a pretty good
> > confidence that more packages would be added later on.  
> 
> Gstreamer has added Meson as an alternative build system (to Autotools) 
> since August 2016:
> 
> https://cgit.freedesktop.org/gstreamer/gstreamer/commit/meson.build?id=b2f9808722a0254acba17ef98a612a2792184e12
> 
> And I suppose that other projects are likely to switch... The decrease 
> of build time is really interesting compared to Autotools, CMake, and 
> even CMake with ninja backend.

We are definitely fine with supporting the meson build system in
Buildroot. The only reason we didn't merge the patches that were
proposed is because no package was using them. As soon as we have one
package using this build system in Buildroot, we will of course happily
merge patches adding support for it.

> By the way, is there any chance to give CMake package the possibility to 
> use ninja backend? (which will also decrease build time of CMake 
> packages)

I don't know exactly what is involved in such a change, but in
principle, I don't see why we wouldn't accept that.

> I have local modifications of my buildroot tree that achieve that, but 
> I'm not sure about the right way to propose it. I have added an option 
> (BR2_PACKAGE_CMAKE_NINJA) but it appears in target packages > 
> Development tools, while it is not intended for the target. Would it be 
> a better idea to create a specific package infra (pkg-cmake-ninja.mk)?

Can each and every CMake package use Ninja as a backend?

At first, it should probably just be an option under "Build options",
that affects the behavior of pkg-cmake. Once we get a better
understanding of what it means to use Ninja in terms of additional
dependencies to build, and number of CMake packages that work/don't
work with it, then we can decide what to do.

How does that sound?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
