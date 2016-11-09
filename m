From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Nov 2016 23:13:39 +0100
Subject: [Buildroot] ninja/python-meson packages
In-Reply-To: <37cfb466-91a2-2434-24a4-dbd13ddfbc0f@openmailbox.org>
References: <98b7a6164112ee321e9220d5b8c47a33@openmailbox.org>
 <20161109212812.39399895@free-electrons.com>
 <37cfb466-91a2-2434-24a4-dbd13ddfbc0f@openmailbox.org>
Message-ID: <20161109231339.6a4830c6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 9 Nov 2016 23:01:12 +0100, C?dric Marie wrote:

> Le 09/11/2016 ? 21:28, Thomas Petazzoni a ?crit :
> > We are definitely fine with supporting the meson build system in
> > Buildroot. The only reason we didn't merge the patches that were
> > proposed is because no package was using them. As soon as we have one
> > package using this build system in Buildroot, we will of course happily
> > merge patches adding support for it.  
> 
> The current gstreamer1 version in Buildroot is 1.8.3.
> The support for meson was added in 1.9.2. So upgrading gstreamer1 is 
> certainly necessary before merging Meson support.

OK. However, isn't 1.9.x considered a "development" branch from the
point of view of GStreamer? At least for Glib/Gtk, the releases with
an odd are development ones if I remember correctly.

> >> By the way, is there any chance to give CMake package the possibility to
> >> use ninja backend? (which will also decrease build time of CMake
> >> packages)  
> >
> > I don't know exactly what is involved in such a change, but in
> > principle, I don't see why we wouldn't accept that.  
> 
> Roughly, add dependency on ninja, add an option in cmake configure step 
> (-G ninja) and use ninja instead of make in build and install commands.

OK, sounds good. We definitely want to make this optional for now I
believe.

> An option in "Build options" is definitely more appropriate. In the 
> first place I had just added it in package/cmake/Config.in - which made 
> it appear in target development tools.
> Then I will check with several existing CMake packages in buildroot.

Good;

> Regarding Meson integration, I think that Eric - if he's still 
> interested in working on that - is the right person. I understand that 
> his patches didn't provide pkg-meson.mk yet, but he proposed to do so. 
> Am I right?

Having an infrastructure is not necessarily useful at the beginning. If
we have only one or two packages using meson, and its usage is pretty
simple, we can just as well do it directly in the packages themselves.
Like we're doing for qmake based packages today for example.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
