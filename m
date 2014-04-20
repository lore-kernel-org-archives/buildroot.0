From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Apr 2014 10:15:46 +0200
Subject: [Buildroot] Analysis of build results for 2014-04-18
In-Reply-To: <20140420052348.GB4425@tarshish>
References: <20140419063009.6CB4810148A@stock.ovh.net>
 <20140419090850.339ca98f@skate> <20140420035125.GA4425@tarshish>
 <20140420052348.GB4425@tarshish>
Message-ID: <20140420101546.303ac442@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Sun, 20 Apr 2014 08:23:48 +0300, Baruch Siach wrote:

> > pthread_barrier_* are also available on LT and LT.old.
> 
> This is wrong. These declarations are under '#if 0' in LT.old, but implemented 
> in LT.

Correct. But since we use LT.old by default, and it's pretty much the
recommended solution when NPTL is not available, there's not much in
adding some additional Config.in options just for this. So we can mark
mesa3d as depending on NPTL.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
