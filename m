From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Thu, 07 Sep 2017 12:10:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/luvi: needs git submodules
In-Reply-To: <20170906231657.382c5f79@windsurf.lan>
References: <20170904053114.16477-1-bernd.kuhls@t-online.de>
 <20170906231657.382c5f79@windsurf.lan>
Message-ID: <1504779004.21841.17.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 2017-09-06 at 23:16 +0200, Thomas Petazzoni wrote:
> Hello J?rg,
> 
> Since you are listed in the DEVELOPERS file for this package, could you
> comment/review/ack the below patch from Bernd touching luvi ?
> 
> Of course, git submodules and bundled libraries are not really nice,
> which is why I'm seeking your opinion.
> 
> Thanks!
> 
> Thomas
> 
> On Mon,  4 Sep 2017 07:31:14 +0200, Bernd Kuhls wrote:
> > Luvi bundles several libraries previously provided by the upstream
> > tarball. Since the tarball is not available anymore we need to fetch
> > the git submodules.

I am quite sure that the maintainer simply forgot to add the release
tarball (he already did before), that's why I opened an issue [1]
asking for a tarball of the sources.

> > Fixes
> > http://autobuild.buildroot.net/results/26d/26d04350a761d362f40e7bd1ac09b639d61de91a/

Until then, we need to fetch the git submodules to fix the build issue.

> > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> > ---
> >  package/luvi/luvi.hash | 2 +-
> >  package/luvi/luvi.mk   | 3 ++-
> >  2 files changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/package/luvi/luvi.hash b/package/luvi/luvi.hash
> > index 7f7abdbf4..ce3785eb8 100644
> > --- a/package/luvi/luvi.hash
> > +++ b/package/luvi/luvi.hash
> > @@ -1,2 +1,2 @@
> >  # Locally calculated
> > -sha256 65d3ded5007d5bb58fc3b76013913596fd42ed7326310d67c668ddf9a017a179  luvi-v2.7.6.tar.gz
> > +sha256 6d2297751b4d4023c1fa8b723b6f04e09584c67694958edbfa0d284f384759d5  luvi-v2.7.6.tar.gz
> > diff --git a/package/luvi/luvi.mk b/package/luvi/luvi.mk
> > index 7dd5e5a32..fc89d4d65 100644
> > --- a/package/luvi/luvi.mk
> > +++ b/package/luvi/luvi.mk
> > @@ -5,7 +5,8 @@
> >  ################################################################################
> >  
> >  LUVI_VERSION = v2.7.6
> > -LUVI_SITE = $(call github,luvit,luvi,$(LUVI_VERSION))
> > +LUVI_SITE = git://github.com/luvit/luvi.git
> > +LUVI_GIT_SUBMODULES = YES
> >  LUVI_LICENSE = Apache-2.0
> >  LUVI_LICENSE_FILES = LICENSE.txt
> >  LUVI_DEPENDENCIES = libuv luajit luv host-luajit
> 

[1] https://github.com/luvit/luvi/issues/161

Acked-by: "J?rg Krause <joerg.krause@embedded.rocks>"
