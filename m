From: mlweber1 at rockwellcollins.com <mlweber1@rockwellcollins.com>
Date: Thu, 19 Sep 2013 10:02:28 -0500
Subject: [Buildroot] [PATCH 1/1] iputils: new package
In-Reply-To: <20130919165917.021f2bd4@skate>
References: <1379533013-13209-1-git-send-email-mlweber1@rockwellcollins.com>	<523A2AEE.4070606@mind.be>
 <OF635D0B64.199C14BF-ON86257BEB.000D9C69-86257BEB.004AD41E@rockwellcollins.com>
 <523AFFFA.7020809@mind.be> <20130919165917.021f2bd4@skate>
Message-ID: <OF952C3494.90E0D391-ON86257BEB.00528672-86257BEB.0052A01A@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 09/19/2013 
09:59:17 AM:

> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> To: Arnout Vandecappelle <arnout@mind.be>
> Cc: mlweber1 at rockwellcollins.com, buildroot at busybox.net
> Date: 09/19/2013 09:59 AM
> Subject: Re: [Buildroot] [PATCH 1/1] iputils: new package
> 
> Arnout, Matthew,
> 
> On Thu, 19 Sep 2013 15:45:30 +0200, Arnout Vandecappelle wrote:
> 
> > > After removing libsysfs and libcap (below) that leaves openssl. 
Since
> > > that's conditional, would something like this be reasonable?
> > > if BR2_INET_IPV6
> > >          select BR2_OPENSSL
> > > endif
> > 
> >   Correct, except that it should be:
> > 
> >    select BR2_OPENSSL if BR2_INET_IPV6
> 
> Just curious: does this package really needs OpenSSL only when IPv6
> support is available? At first sight, I don't quite see why SSL support
> and IPv6 support would be related, but maybe I'm missing something?
> 

Yeah, only for IPv6 doing a md5 sum.  What's the cleanest way to comment 
that in the Config.in?  Part of the description?

> At least, this unusual select should carry a comment above it that
> explains why it is needed.
> 
> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130919/c391ebb8/attachment.html>
