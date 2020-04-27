From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Mon, 27 Apr 2020 15:02:44 -0500
Subject: [Buildroot] [PATCH] package/ebtables: bump to version 2.0.11
In-Reply-To: <20200427212303.4b4cb6ab@windsurf.home>
References: <20200426132940.25969-1-ryanbarnett3@gmail.com>
 <20200427212303.4b4cb6ab@windsurf.home>
Message-ID: <CALq67GAv1jE5y2qoD5JSqt=oUFTAM3zeEoRVkajFijuWw51tqQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Mon, Apr 27, 2020 at 2:23 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Sun, 26 Apr 2020 08:29:40 -0500
> Ryan Barnett <ryanbarnett3@gmail.com> wrote:
>
> > With the version bump to 2.0.11, ebtables switch to autotools build
> > system. In addition, ebtables-{restore/save} moved to being installed
> > as ebtables-legacy-{restore/save}.
> >
> > Changes to support this version bump include:
> >
> >  * Utilize configure options for static library support
> >  * Remove ebtables-restore config option as configure scripts checks
> >    dependencies for ebtables-legacy-restore.
>
> This does not really explain why we remove this option. What checks are
> done? Why do these checks mean we have to remove this option?

The configure script (autotools) provides support for:

--enable-static
or
--enabled-shared

This enables building of static libraries from the config.log:

configure:12059: checking whether to build shared libraries
configure:12084: result: no
configure:12087: checking whether to build static libraries
configure:12091: result: yes

Will updated the commit message to reflect this.

> I think it's a bit annoying to have an option for the "save" tool but
> not the corresponding option for the "restore" tool.

Would the better option be to move both config options to legacy and
select bash when ebtables is selected?

ebtables has renamed ebtables-{save/restore} to
ebtables-legacy-{save/restore}. ebtables-legacy-save would then be
replaced by the bash script which is currently being patch in by
default.

http://git.netfilter.org/ebtables/commit/?id=6218f812d894fdd733d95c3c86b385f6f223a36a

Thanks,
-Ryan
