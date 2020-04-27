From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Apr 2020 22:15:17 +0200
Subject: [Buildroot] [PATCH] package/ebtables: bump to version 2.0.11
In-Reply-To: <CALq67GAv1jE5y2qoD5JSqt=oUFTAM3zeEoRVkajFijuWw51tqQ@mail.gmail.com>
References: <20200426132940.25969-1-ryanbarnett3@gmail.com>
 <20200427212303.4b4cb6ab@windsurf.home>
 <CALq67GAv1jE5y2qoD5JSqt=oUFTAM3zeEoRVkajFijuWw51tqQ@mail.gmail.com>
Message-ID: <20200427221517.29e4eb7d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 27 Apr 2020 15:02:44 -0500
Ryan Barnett <ryanbarnett3@gmail.com> wrote:

> Thomas,
> 
> On Mon, Apr 27, 2020 at 2:23 PM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > On Sun, 26 Apr 2020 08:29:40 -0500
> > Ryan Barnett <ryanbarnett3@gmail.com> wrote:
> >  
> > > With the version bump to 2.0.11, ebtables switch to autotools build
> > > system. In addition, ebtables-{restore/save} moved to being installed
> > > as ebtables-legacy-{restore/save}.
> > >
> > > Changes to support this version bump include:
> > >
> > >  * Utilize configure options for static library support
> > >  * Remove ebtables-restore config option as configure scripts checks
> > >    dependencies for ebtables-legacy-restore.  
> >
> > This does not really explain why we remove this option. What checks are
> > done? Why do these checks mean we have to remove this option?  
> 
> The configure script (autotools) provides support for:
> 
> --enable-static
> or
> --enabled-shared
> 
> This enables building of static libraries from the config.log:
> 
> configure:12059: checking whether to build shared libraries
> configure:12084: result: no
> configure:12087: checking whether to build static libraries
> configure:12091: result: yes
> 
> Will updated the commit message to reflect this.

My question was not about static/shared, but about ebtables-restore.
BTW, --enable-static/--enable-shared is handled by the
autotools-package infra in a generic way.

> > I think it's a bit annoying to have an option for the "save" tool but
> > not the corresponding option for the "restore" tool.  
> 
> Would the better option be to move both config options to legacy and
> select bash when ebtables is selected?

It's always a bit annoying to force bash when it's only needed by a
script that may not even be necessary.

> ebtables has renamed ebtables-{save/restore} to
> ebtables-legacy-{save/restore}. ebtables-legacy-save would then be
> replaced by the bash script which is currently being patch in by
> default.
> 
> http://git.netfilter.org/ebtables/commit/?id=6218f812d894fdd733d95c3c86b385f6f223a36a

Why not simply preserve both options, and keep things working like they
are today, of course with the installed binaries having a different
name (ebtables-legacy-<foo>) ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
