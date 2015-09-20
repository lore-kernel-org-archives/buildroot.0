From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Sep 2015 15:45:02 +0200
Subject: [Buildroot] [PATCH] arc: add HS38 VDK virtual boards
In-Reply-To: <1442755705.17404.8.camel@synopsys.com>
References: <1441724062-27521-1-git-send-email-abrodkin@synopsys.com>
 <20150920150505.3743ee98@free-electrons.com>
 <1442755705.17404.8.camel@synopsys.com>
Message-ID: <20150920154502.4cfda24e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexey,

On Sun, 20 Sep 2015 13:28:26 +0000, Alexey Brodkin wrote:

> > Are these publicly available? I.e can we run ourselves these
> > configurations under the virtualizer?
> 
> Unfortunately Virtualizer is a first class Synopsys citizen...
> product and it is only available for those who paid for it.

Ok, too bad.

> But if you're interested in running anything on ARC in simulation we
> do have finally simulator engine for open-source projects
> which is available for free after very simple registration and approval
> by SNPS employee.
> 
> Just follow this URL and fill in short form with your details and
> in a day or two you'll get download link:
> http://www.synopsys.com/cgi-bin/dwarcnsim/req1.cgi
> 
> That simulator has only serial port but allows running both
> ARCv1 (ARCompact family like ARC750/770) and new gen ARCv2 (ARCH S38).

Could be interesting, though it's sad that it can't be downloaded
automatically. It would have allowed packaging it in Buildroot, and
ease testing of ARC systems.

> > What is the motivation for having both? Is the SMP-capable kernel not
> > working on the non-SMP emulated hardware?
> 
> That's our sad truth.
> The thing is true UP (uniprocessor) HW be it simulator or real HW lacks
> so-called IDU (interrupt-distribution unit) which is required for SMP.
> 
> And so SMP kernel might be only run on SMP HW even if we have only one
> core running and the second one is halted.
> 
> And vice versa UP kernel won't even start (will panic early) on SMP HW.
> 
> That's why we need 2 separate configs for UP and SMP.

Ok, makes sense. So I'll commit your patch which has two separate
configurations.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
