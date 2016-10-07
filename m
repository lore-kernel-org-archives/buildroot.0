From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Oct 2016 23:20:42 +0200
Subject: [Buildroot] [PATCH 3/4] netatop: enable required kernel feature
In-Reply-To: <20161007203031.21528-3-ricardo.martincoski@datacom.ind.br>
References: <20161007203031.21528-1-ricardo.martincoski@datacom.ind.br>
 <20161007203031.21528-3-ricardo.martincoski@datacom.ind.br>
Message-ID: <20161007232042.0e49c4b2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  7 Oct 2016 17:30:30 -0300, Ricardo Martincoski wrote:
> When netatop is enabled, the required kernel feature is enabled.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>

Is CONFIG_NETFILTER=y required to *build* the netatop module, or only
needed at runtime ?

Two cases:

 - If it's needed to build the netatop module, then this change should
   be part of the commit adding the netatop package.

 - If it's needed only at runtime, we have a more relaxed policy, and we
   generally don't enforce the kernel options in such a case.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
