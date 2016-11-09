From: =?UTF-8?Q?C=C3=A9dric_Marie?= <cedric.marie@openmailbox.org>
Date: Wed, 09 Nov 2016 16:26:38 +0100
Subject: [Buildroot] ninja/python-meson packages
Message-ID: <98b7a6164112ee321e9220d5b8c47a33@openmailbox.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Regarding python-meson package that was proposed here:
http://lists.busybox.net/pipermail/buildroot/2016-June/163437.html

>> However, I could provide a real package infrastructure named 
>> "meson-package",
>> but as stated in the discussion about adding support for Cargo (the 
>> Rust
>> package manager), to provide such infrastructure, at least one package 
>> using
>> it should also be provided (it is sensible to have a working example 
>> of
>> the infrastructure).

> I would not say one, but at least 4-5 packages, with a pretty good
> confidence that more packages would be added later on.

Gstreamer has added Meson as an alternative build system (to Autotools) 
since August 2016:

https://cgit.freedesktop.org/gstreamer/gstreamer/commit/meson.build?id=b2f9808722a0254acba17ef98a612a2792184e12

And I suppose that other projects are likely to switch... The decrease 
of build time is really interesting compared to Autotools, CMake, and 
even CMake with ninja backend.

By the way, is there any chance to give CMake package the possibility to 
use ninja backend? (which will also decrease build time of CMake 
packages)
I have local modifications of my buildroot tree that achieve that, but 
I'm not sure about the right way to propose it. I have added an option 
(BR2_PACKAGE_CMAKE_NINJA) but it appears in target packages > 
Development tools, while it is not intended for the target. Would it be 
a better idea to create a specific package infra (pkg-cmake-ninja.mk)?
Or maybe it is just not useful... I don't know whether the user really 
needs to choose between two different backends, while the result is 
supposed to be the same (only the build time will differ).

NB: Comparison of build time can be found here:
https://github.com/mesonbuild/meson/wiki/Simple%20comparison

-- 
C?dric
