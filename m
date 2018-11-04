From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 4 Nov 2018 22:08:51 +0100
Subject: [Buildroot] [PATCH] qt5: use ccache for building host code
In-Reply-To: <20181103144917.05c221c1@windsurf>
References: <20181020132535.24508-1-thomas.petazzoni@bootlin.com>
 <20181103144917.05c221c1@windsurf>
Message-ID: <20181104220851.7accc310@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sat, 3 Nov 2018 14:49:17 +0100, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello Peter,
> 
> On Sat, 20 Oct 2018 15:25:35 +0200, Thomas Petazzoni wrote:
> > qt5 currently doesn't use HOSTCC/HOSTCXX, so it doesn't use ccache
> > when building all its host code (especially qmake). This means that
> > even with ccache enabled and a hot cache, it still takes a long time
> > to build qt5base.
> > 
> > Before this patch, building qt5base takes:
> > 
> >  - 446 seconds with a cold ccache
> >  - 185 seconds with a hot ccache
> > 
> > This is because the ccache is not used for host code.
> > 
> > After this patch, building qt5base takes:
> > 
> >  - 450 seconds with a cold ccache
> >  - 15 seconds with a hot ccache
> > 
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>  
> 
> Any comment on this patch ?

Sorry, not an regular ccache user (maybe an mistake ;-) ), so I did not
examine this patch yet, nice speedup, some questions at he patch reply...

Regards,
Peter

> 
> Thanks!
> 
> Thomas
