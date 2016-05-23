From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 23 May 2016 16:04:05 +0000
Subject: [Buildroot] [PATCH] Config.in: Use CDN kernel.org mirror
In-Reply-To: <20160523174643.777faf11@free-electrons.com>
References: <1464017813-22503-1-git-send-email-abrodkin@synopsys.com>
 <20160523174643.777faf11@free-electrons.com>
Message-ID: <1464019414.7749.8.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, 2016-05-23 at 17:46 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 23 May 2016 18:36:53 +0300, Alexey Brodkin wrote:
> > 
> > It turned out for quite some time CDN-powered mirror
> > of kernel.org is available. See this announce:
> > https://www.kernel.org/introducing-fastly-cdn.html
> > 
> > This change switches to that faster mirror by default.
> > 
> > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Cc: Peter Korsgaard <peter@korsgaard.com>
> That's a good change. It was suggested some time ago on IRC, and we
> should do it.
> 
> > 
> > ?config BR2_KERNEL_MIRROR
> > ?	string "Kernel.org mirror"
> > -	default "https://www.kernel.org/pub"
> > +	default "https://cdn.kernel.org/pub"
> > ?	help
> > ?	??kernel.org is mirrored on a number of servers around the world.
> > ?	??The following allows you to select your preferred mirror.
> > @@ -236,6 +236,9 @@ config BR2_KERNEL_MIRROR
> > ?	?????http://www.XX.kernel.org/pub (XX = country code)
> > ?	?????http://mirror.aarnet.edu.au/pub/ftp.kernel.org
> Should this list of mirrors be removed?

Well I have no preference here.
I mean user still may have a preferred mirror so why would we
limit him or her here?

> > 
> > +	??Now when kernel.org is mirrored by CDN as well we'll be using
> > +	??it by default to speed-up downloads all over the world.
> I'm sorry, but I don't understand this sentence.

If I'm not mistaken CDN allows to use the best server for each user
(based on some criteria). Now kerenl.org is mirrored with use of that
technology. And in theory users of Buildroot all over the world will
benefit from much faster downloads from this CDN mirror (which will
be in real life different physical servers for different users).

Not sure if that explanation makes more sense.

But for me use of CDN gave 2.5 boost (1.8 vs 5 Mbit/sec).
And still there's a probability that it was our ISP that limited to
5 Mbit'sec and given I have a wider channel download speed might be
even higher.

-Alexey
