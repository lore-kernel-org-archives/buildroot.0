From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Oct 2016 22:01:22 +0200
Subject: [Buildroot] [PATCH] config: add Synopsys nSIM and nSIM OSCI
 platforms
In-Reply-To: <1470399797.3430.75.camel@synopsys.com>
References: <1470394586-6091-1-git-send-email-vzakhar@synopsys.com>
 <20160805140115.071073db@free-electrons.com>
 <1470399797.3430.75.camel@synopsys.com>
Message-ID: <20161025220122.0ae10f17@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 5 Aug 2016 12:24:54 +0000, Alexey Brodkin wrote:

> > > nSIM OSCI emulates more functional boards having not only serial port
> > > but as well:
> > > ?* LCD screen
> > > ? * PS/2 keyboard
> > > ???* Ethernet controller (which communicates with the host)
> > > 
> > > Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>  
> > 
> > Thanks for this contribution. It would be useful to add a readme.txt
> > file that explains how to start the result of the Buildroot build with
> > those simulation platforms, especially the one that is freely available.

Would it be possible to resubmit with a readme.txt file (not one per
configuration, but a global one that covers all those configurations).

> > > ?configs/snps_nsim_700_defconfig??????????| 18 ++++++++++++++++++
> > > ?configs/snps_nsim_hs38_defconfig?????????| 19 +++++++++++++++++++
> > > ?configs/snps_nsim_hs38_smp_defconfig?????| 19 +++++++++++++++++++
> > > ?configs/snps_nsimosci_700_defconfig??????| 19 +++++++++++++++++++
> > > ?configs/snps_nsimosci_hs38_defconfig?????| 20 ++++++++++++++++++++
> > > ?configs/snps_nsimosci_hs38_smp_defconfig | 20 ++++++++++++++++++++  
> > 
> > Do we really need all those combinations? I do understand the 700 vs.
> > HS38 difference, but couldn't the rest be handled with just different
> > DTBs ? It seems annoying to have both one kernel defconfig for each of
> > those, and then one Buildroot configuration for each of those as well.  
> 
> Unfortunately it's not only different .dtb.
> On ARC for SMP we need to modify kernel configuration as well.
> 
> I hope some day we'll be able to run the same one kernel binary on any
> flavor of ARCv2 CPU (be it UP or SMP) but now we cannot.

OK.

Then is there a way to where the nsim and its corresponding nsimosci
variant? What is the difference between the two?

Looking at the kernel defconfigs, it seems that the only important
difference is the built-in DTB:

-CONFIG_ARC_BUILTIN_DTB_NAME="nsim_hs"
+CONFIG_ARC_BUILTIN_DTB_NAME="nsimosci_hs"

Can't you use an external DTB instead ?

> In general I agree so many configs in BR look weird and what's worse requires
> much more work on maintenance. So we may try to select more useful configs but
> for me it's hard to make this decision because from one point of view in case of
> ARCv2 we're more interested in SMP configs (that's one of the main differences compared
> to older ARCompact CPUs) but in simulation SMP setups work significantly slower
> and IMHO UP versions are much more usable if SMP itself is not a requirement.

Is nSIM even available for free ? Can I download it and test those
defconfigs ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
