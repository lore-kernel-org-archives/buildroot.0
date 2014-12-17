From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Dec 2014 17:28:18 +0100
Subject: [Buildroot] [PATCH] system: add "askfirst shell" as an option
 for busybox init
In-Reply-To: <1418833123.4132.22.camel@synopsys.com>
References: <1418633784-7709-1-git-send-email-abrodkin@synopsys.com>
 <20141216081450.6438bdb6@free-electrons.com>
 <1418828592.4132.7.camel@synopsys.com>
 <20141217161406.1f418842@free-electrons.com>
 <1418829884.4132.13.camel@synopsys.com>
 <20141217163652.3812739e@free-electrons.com>
 <1418831416.4132.19.camel@synopsys.com>
 <20141217170826.075c6d48@free-electrons.com>
 <1418833123.4132.22.camel@synopsys.com>
Message-ID: <20141217172818.250714b4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Wed, 17 Dec 2014 16:18:44 +0000, Alexey Brodkin wrote:

> > > Then the question is why this is not a default in Buildroot?
> > > IMHO most of the time kernel's bootcmd has console set so explicit setup
> > > of tty in Buildroot might be required in some corner cases only.
> > 
> > I agree, maybe we should make this the default. What happens on
> > PC-style platforms? Is console= typically set to tty1 ?
> 
> Well from dmesg output of my Fedora 21 I see this:
> --->---
> [    0.000000] console [tty0] enabled
> --->---
> Is this what you're looking for?

I don't know if running a getty on tty0 actually works. tty0 is
actually a "fake" device that points to the current virtual console. To
be tested, maybe with the Qemu/x86 emulation.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
