From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Fri, 14 Apr 2017 00:18:54 +0200
Subject: [Buildroot] [PATCH] core: add rule to dump packages' build order
In-Reply-To: <20170410134440.4713101b@free-electrons.com>
References: <20170402130338.12542-1-yann.morin.1998@free.fr>
 <39bc6b12-1dfd-8ada-f1bc-8597c6872a1c@mind.be>
 <20170404185928.GA3828@scaer>
 <fd9c07fd-2e86-ed73-2fd1-bfcf27522664@mind.be>
 <20170407192458.GA3420@scaer>
 <4fef5a6f-15d2-73f6-c759-2887255c987d@mind.be>
 <20170410134440.4713101b@free-electrons.com>
Message-ID: <20170413221854.4tzd6dwqv3ukeoz5@piout.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 10/04/2017 at 13:44:40 +0200, Thomas Petazzoni wrote:
> On Mon, 10 Apr 2017 11:28:57 +0200, Arnout Vandecappelle wrote:
> 
> >  In my experience, there are two big reasons why an OE build is much slower:
> > 
> > 1. A typical configuration is much bigger (more packages selected).
> > 
> > 2. They do per-package staging in order to enable TLPB.
> 
> This point (2) is in fact not correct, at least according to what I
> understood. My colleague Alexandre can confirm, but apparently,
> per-package staging has only been very recently introduced in OE. And
> yes, top-level parallel build was causing some spurious build failures.
> 
> Alex, if you have more details, we're interested :)
> 

I'd point to
http://cgit.openembedded.org/openembedded-core/commit/?id=809746f56df4b91af014bf6a3f28997d6698ac78

It adds RSS (recipe specific sysroots) applied in january. Some issues
are still being sorted out but it generally builds fine.

Regarding build time, I can point to that one which interestingly
concludes that it doesn't add much to the build time (or more correctly
that a simple optimisation made up for all the lost time):
http://cgit.openembedded.org/openembedded-core/commit/?id=e02716ca29b744fde5a45dabe79fef11df772d92


-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
