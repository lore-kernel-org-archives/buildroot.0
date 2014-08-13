From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Aug 2014 11:06:04 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <53EB2A53.2040209@lucaceresoli.net>
References: <20140813063010.CD21010118A@stock.ovh.net>
 <20140813101514.384e1435@free-electrons.com>
 <53EB2120.1050400@gmail.com> <53EB2A53.2040209@lucaceresoli.net>
Message-ID: <20140813110604.0b0dfd3e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca Ceresoli,

On Wed, 13 Aug 2014 11:05:23 +0200, Luca Ceresoli wrote:

> > I cannot reproduce these errors - I've used the config in the first
> > build that failed in this way. From what I can see it's failing to pick
> > up libpng, which is listed as a dependency both directly and indirectly
> > through libgd. I can try and screw around with the configure script, but
> > I would need to be able to reproduce it first.
> 
> I haven't looked into this, but maybe the configure scripts look
> for the system libpng (in /usr) instead of the libpng in the
> Buildroot output dir?
> 
> To check that you may try to uninstall libpng from your host and
> see if the error gets reproduced.
> 
> Or look at the config.log files if Peter can provide them. Peter,
> do you still have access to them?

I've reproduced the issue on gcc10, I'll send a patch shortly.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
