From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 17 Dec 2014 16:18:44 +0000
Subject: [Buildroot] [PATCH] system: add "askfirst shell" as an option
 for busybox init
In-Reply-To: <20141217170826.075c6d48@free-electrons.com>
References: <1418633784-7709-1-git-send-email-abrodkin@synopsys.com>
 <20141216081450.6438bdb6@free-electrons.com>
 <1418828592.4132.7.camel@synopsys.com>
 <20141217161406.1f418842@free-electrons.com>
 <1418829884.4132.13.camel@synopsys.com>
 <20141217163652.3812739e@free-electrons.com>
 <1418831416.4132.19.camel@synopsys.com>
 <20141217170826.075c6d48@free-electrons.com>
Message-ID: <1418833123.4132.22.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, 2014-12-17 at 17:08 +0100, Thomas Petazzoni wrote:
> Dear Alexey Brodkin,
> 
> On Wed, 17 Dec 2014 15:50:16 +0000, Alexey Brodkin wrote:
> 
> > Right it was too obvious.
> > 
> > So looks like this is a replacement for my patch:
> > --->---
> > BR2_TARGET_GENERIC_GETTY_PORT=console
> > BR2_TARGET_GENERIC_GETTY_BAUDRATE_KEEP=y
> > --->---
> 
> Yes. Does it work? :-)

Indeed it worked but on the board I tried it there's only 1 console for
now so didn't have a chance to make sure either of selected consoles may
work but frankly don't expect any issues here.

> > Then the question is why this is not a default in Buildroot?
> > IMHO most of the time kernel's bootcmd has console set so explicit setup
> > of tty in Buildroot might be required in some corner cases only.
> 
> I agree, maybe we should make this the default. What happens on
> PC-style platforms? Is console= typically set to tty1 ?

Well from dmesg output of my Fedora 21 I see this:
--->---
[    0.000000] console [tty0] enabled
--->---
Is this what you're looking for?

-Alexey
