From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jun 2012 21:42:25 +0200
Subject: [Buildroot] RFC: x11r7.7 patch series
In-Reply-To: <4FDF63CF.4090702@carallon.com>
References: <4FDF2526.70901@carallon.com> <20120618162156.23914f96@skate>
 <4FDF63CF.4090702@carallon.com>
Message-ID: <20120618214225.63f7cedc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 18 Jun 2012 18:22:23 +0100,
Will Wagner <will_wagner@carallon.com> a ?crit :

> > Most likely if they have been removed upstream, they are
> > unmaintained, and we should remove them as well.
> >
> > I've seen that a fair amount of packages are removed, but I haven't
> > seen any new package. Is this normal? No new components in 7.7
> > compared to the older release we have in BR?
> 
> I do not believe they have added any apps since 7.5

Ok.

> I used this link http://www.x.org/releases/X11R7.7/src/ and made sure 
> that every package listed there was built in buildroot.

Great.

> >> - I had a problem updating mesa3d. The newer versions rely on host
> >> libxml2 with python support. There are a couple of patches to do
> >> this but I don't particularly like these. If someone can come up
> >> with something better then great.
> >
> > Erk. I've seen what you've done, and even though is certainly the
> > easiest solution, I don't like it a lot. Until now, we have tried to
> > avoid the need for options on host packages...
> >
> > Do you have some details on why the mesa3d package needs libxml2
> > with python support?
> 
> I have not gone into too much detail, however it seems like the build 
> process auto generates some part of the code from a python script
> (See
> http://cgit.freedesktop.org/mesa/mesa/tree/src/mesa/main/APIspec.py)
> 
> I could not find any config option to not regenerate this and instead 
> use a prebuilt one, but perhaps I wasn't looking in the right place.

Argh, another X11 package (xcb) also needs XML support in Python, but it
needs expat support, so we have added support for expat in the host
python sometime ago. It's really a shame that another part of X11
requires a different XML library in Python :-(

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
