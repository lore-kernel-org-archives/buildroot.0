From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Jun 2014 17:07:26 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140613145515.GA15237@rmm-p1267483>
References: <20140613063010.B26041011DE@stock.ovh.net>
 <20140613111216.1fdae121@free-electrons.com>
 <20140613145515.GA15237@rmm-p1267483>
Message-ID: <20140613170726.4db5e1cf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Le Bihan,

On Fri, 13 Jun 2014 16:55:17 +0200, Eric Le Bihan wrote:

> > Will be fixed by http://patchwork.ozlabs.org/patch/358913/.
> This patch will only fix http://autobuild.buildroot.net/results/4b00d517c17cfcd29359e63423f15ac5331096b2/.
> 
> The error in http://autobuild.buildroot.net/results/33e1447949d13bccc4076b69f902432e2131cc1c/ is:
> 
>   src/libsystemd/sd-rtnl/rtnl-types.c:70:10: error: 'IFLA_VLAN_PROTOCOL'
>   undeclared here (not in a function)
>            [IFLA_VLAN_PROTOCOL]    = { .type = NLA_U16 },
> 
> IFLA_VLAN_PROTOCOL was introduced in Linux 3.10. I'll post a patch updating
> the kernel headers needs for systemd.

Ah, yes, right. Crazy that kernel headers as recent as 3.10 are needed
to build systemd...

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
