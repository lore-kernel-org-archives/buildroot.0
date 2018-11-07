From: Tim Harvey <tharvey@gateworks.com>
Date: Wed, 7 Nov 2018 14:30:52 -0800
Subject: [Buildroot] Altering a package to pull from GIT
In-Reply-To: <e78429cc-fea9-4583-160b-564f3f1f782b@mind.be>
References: <CAJ+vNU2bzK3AD8BV6u_F-eXGdyKjGrrmGkyGT-e2kyRNxEE+zg@mail.gmail.com>
 <20181107173842.1c7f0755@windsurf>
 <e78429cc-fea9-4583-160b-564f3f1f782b@mind.be>
Message-ID: <CAJ+vNU3rMJBMRRB5y=3WCVCQrLe6gT=Ym6ybPbpoCF7+01dcpg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 7, 2018 at 12:08 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 07/11/18 17:38, Thomas Petazzoni wrote:
> > Hello,
> >
> > On Wed, 7 Nov 2018 08:17:47 -0800, Tim Harvey wrote:
> >
> >> -OPENOCD_VERSION = 0.10.0
> >> +OPENOCD_VERSION = da4b2d5beb
> >>  OPENOCD_SOURCE = openocd-$(OPENOCD_VERSION).tar.bz2
> >> -OPENOCD_SITE =
> >> http://sourceforge.net/projects/openocd/files/openocd/$(OPENOCD_VERSION)
> >> +OPENOCD_SITE = git://git.code.sf.net/p/openocd/code
> >
> >> +OPENCOD_SITE_METHOD = git
> >
> >        ^^^^ Typo here :-)
> >
> > Also, the OPENOCD_SOURCE variable is no longer needed, but really the
> > issue comes from the typo.
>
>  Actually, no. The _SITE_METHOD is not needed at all because the _SITE starts
> with git://.
>
>  However, the git download method will create a gzipped tarball and save it as
> OPENOCD_SOURCE. But then the tar extraction will try to extract it as if it's a
> bzip2. That is the failure.
>
>  Bottom line: remove the _SOURCE definition, or change the .bz2 into .gz.
>

Arnout,

Thanks - that makes complete sense.

I originally tried that but ran into 'ERROR: No hash found for
openocd-da4b2d5beb.tar.gz' but now I understand that I simply need to
remove openocd.hash to get past that one. Adding in an
'OPENOCD_GIT_SUBMODULES = YES' and adding an OPENOCD_CONF_OPTS to
disable a broken driver got me building an up to date openocd
wonderfully.

Thanks for the help!

Tim
