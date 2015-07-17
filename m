From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 17 Jul 2015 08:04:34 +0000
Subject: [Buildroot] [PATCH] ARC: allow selection of MMU page size
In-Reply-To: <20150717095945.0fafbba4@free-electrons.com>
References: <1437073441-11321-1-git-send-email-abrodkin@synopsys.com>
 <55A832D4.9020801@mind.be> <20150717095945.0fafbba4@free-electrons.com>
Message-ID: <1437120274.9157.3.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Arnout,

On Fri, 2015-07-17 at 09:59 +0200, Thomas Petazzoni wrote:
> Arnout,
> 
> On Fri, 17 Jul 2015 00:40:20 +0200, Arnout Vandecappelle wrote:
> 
> > > +choice
> > > +	prompt "MMU Page Size"
> > 
> >  It is not really current policy, but wouldn't it make more sense to do
> > 
> > 	prompt "MMU Page Size" if BR2_arc770d || BR2_archs38
> 
> Why? In the patch submitted by Alexey, the 8K option is available for
> all cores.

Indeed there's no reason to select page size for MMUv2 (read ARC 750D), but
IMHO it's good to let user know what's current page size.

Because software built for ARC 750D will run perfectly fine on ARC770D
if it has the same page size (and by default it is 8k).

That's why I decided to leave a "Page Size" entry in configuration utility
even though it could not be modified for ARC 750D.

-Alexey
