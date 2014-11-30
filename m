From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Nov 2014 14:55:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/minidlna: disable on nios2
In-Reply-To: <20141130112049.GA4124@free.fr>
References: <1417287381-5045-1-git-send-email-bernd.kuhls@t-online.de>
 <20141130094300.256d43e0@free-electrons.com>
 <20141130112049.GA4124@free.fr>
Message-ID: <20141130145524.3fce8153@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 30 Nov 2014 12:20:49 +0100, Yann E. MORIN wrote:

> > Can we instead please blacklist only the specific NIOS II toolchain
> > causing the problem?
> 
> Well, as Bernd says, both toolchains we support exhibit that bug.
> 
> And you already did two similar patches, where you just did what Bernd
> submitted for minidlna:
>   - f287f0aa crda: disable on NIOS II
>   - 50d36731 aiccu: not available on NIOS II
> 
> So I think it is a bit too much to ask to just blacklist the affected
> toolchains, especially since they all are affected, and we can not build
> our own.

I agree that we may not be doing this properly in other packages.
However, I still believe in such situations that it's better to
blacklist the individual toolchains that are known to be broken, so
that if we add another toolchain, we will be able to see if the same
bug happens as well or not.

Ideally, we should report such bugs to Mentor, but so far, they have
never seem to be really interested by bug reports we could make about
their toolchains.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
