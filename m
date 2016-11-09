From: =?UTF-8?Q?C=c3=a9dric_Marie?= <cedric.marie@openmailbox.org>
Date: Wed, 9 Nov 2016 23:01:12 +0100
Subject: [Buildroot] ninja/python-meson packages
In-Reply-To: <20161109212812.39399895@free-electrons.com>
References: <98b7a6164112ee321e9220d5b8c47a33@openmailbox.org>
 <20161109212812.39399895@free-electrons.com>
Message-ID: <37cfb466-91a2-2434-24a4-dbd13ddfbc0f@openmailbox.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

+ Eric Le Bihan who first proposed ninja/meson support.

Le 09/11/2016 ? 21:28, Thomas Petazzoni a ?crit :
> We are definitely fine with supporting the meson build system in
> Buildroot. The only reason we didn't merge the patches that were
> proposed is because no package was using them. As soon as we have one
> package using this build system in Buildroot, we will of course happily
> merge patches adding support for it.

The current gstreamer1 version in Buildroot is 1.8.3.
The support for meson was added in 1.9.2. So upgrading gstreamer1 is 
certainly necessary before merging Meson support.


>> By the way, is there any chance to give CMake package the possibility to
>> use ninja backend? (which will also decrease build time of CMake
>> packages)
>
> I don't know exactly what is involved in such a change, but in
> principle, I don't see why we wouldn't accept that.

Roughly, add dependency on ninja, add an option in cmake configure step 
(-G ninja) and use ninja instead of make in build and install commands.


> At first, it should probably just be an option under "Build options",
> that affects the behavior of pkg-cmake. Once we get a better
> understanding of what it means to use Ninja in terms of additional
> dependencies to build, and number of CMake packages that work/don't
> work with it, then we can decide what to do.
>
> How does that sound?

That sounds good to me :)

An option in "Build options" is definitely more appropriate. In the 
first place I had just added it in package/cmake/Config.in - which made 
it appear in target development tools.
Then I will check with several existing CMake packages in buildroot.

Regarding Meson integration, I think that Eric - if he's still 
interested in working on that - is the right person. I understand that 
his patches didn't provide pkg-meson.mk yet, but he proposed to do so. 
Am I right?


-- 
C?dric
