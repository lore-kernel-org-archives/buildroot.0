From: Alexey Brodkin <alexey.brodkin@synopsys.com>
Date: Wed, 5 Dec 2018 14:28:38 +0000
Subject: [Buildroot] [PATCH] package/qt5base: fix build when system awk
 is mawk, not gawk
In-Reply-To: <20181205140012.11bb4726@windsurf>
References: <20181205110223.27310-1-yann.morin.1998@free.fr>
 <20181205140012.11bb4726@windsurf>
Message-ID: <7b18519fa5136046a32209206b05b29812686479.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, all,

On Wed, 2018-12-05 at 14:00 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed,  5 Dec 2018 12:02:23 +0100, Yann E. MORIN wrote:
> > Commit c2ea056a1b (package/qt5/qt5base: use ccache for building host
> > code) introduced a tweak to qt5's mkspec file, to define the compilers
> > (C and C++) to use to build qmake.
> > 
> > In doing so, it changed the variables in that file, from this layout:
> >     VAR = value
> > 
> > to this:
> >     VAR=value
> > 
> > During its configuration phase, qt5 will parse that file using the
> > system awk.
> > 
> > However, the system awk is not necessarily GNU awk; some systems,
> > especially Debian ones, use mawk as the default awk implementation.
> > 
> > mawk does not behave the same as GNU awk, and this causes qt5 to extract
> > empty values, and thus leads to build failures.
> > 
> > Fix that by replacing the variables with similar layout, keeping the
> > spaces around the equal signs.
> > 
> > Fixes:
> >     
> > https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.org_results_cb5_cb555a124bb3bdb9c5a3465673c21022d94cf2ca_&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=S86BonA9k4UF7AG3ANLOEQcjguj5mvG5hEL4MrugAKw&s=vGDbSOkH-rPmnukIWusRAMfV7JGOSP3N68M7J9Q1FnM&e=
> > 
> > Reported-by: Alexey Brodkin <Alexey.Brodkin@synopsys.com>

In fact "reported by BR autobuilder" :)

> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> Thanks a lot Yann for the research/investigation!

Indeed thanks a lot for this super fast investigation and the fix!

-Alexey
