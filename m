From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Sep 2015 00:12:13 +0200
Subject: [Buildroot] Starting network...
In-Reply-To: <944894A3EB1D044A9003B2F944389BB20474C345D2@svr-wa-exch1.atg.lc>
References: <944894A3EB1D044A9003B2F944389BB20474AD978E@svr-wa-exch1.atg.lc>
 <20150825195452.2d7be97c@free-electrons.com>
 <944894A3EB1D044A9003B2F944389BB20474C3459F@svr-wa-exch1.atg.lc>
 <20150901211412.5a71ae8e@free-electrons.com>
 <944894A3EB1D044A9003B2F944389BB20474C345D2@svr-wa-exch1.atg.lc>
Message-ID: <20150902001213.6aa70acb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 1 Sep 2015 15:03:58 -0700, Lee, Tommy wrote:

> In the buildroot-2015.05 folder the armada-385-gp.dts file does not exist but the armada-385-db-ap.dts one.

Buildroot does *not* contain any armada-*.dts file. Those files come
with the kernel sources. You are confusing things, it seems.

There is indeed no armada-385-gp.dts file in the kernel, as it's called
armada-388-gp.dts.

> Last week I built armada-385-db-ap.dtb using the following .config DTS and eth0 with no problems:
> 
> 
> 
> BR2_SYSTEM_DHCP="eth0"
> 
> BR2_LINUX_KERNEL_DTS_SUPPORT=y
> 
> BR2_LINUX_KERNEL_USE_INTREE_DTS=y
> 
> # BR2_LINUX_KERNEL_USE_CUSTOM_DTS is not set
> 
> BR2_LINUX_KERNEL_INTREE_DTS_NAME="armada-385-db-ap"
> 
> 
> 
> I just used the settings again and built zImage and armada-385-db-ap. This time the armada-385-db-ap.dtb has the same md5sum value as the one I built last week.

And? I don't see where your question is here. Also, I don't understand
why you're sometimes referring to the Armada 388 GP and sometimes to
the Armada 385 DB AP. Those are completely different boards, so you
cannot use the Device Tree for one platform on the other platform.

> On the board, the boot process shows:
> 
> 
> 
> Starting network...
> 
> udhcpc (v1.23.2) started
> 
> Sending discover...
> 
> [    4.732186] mvneta f1070000.ethernet eth2: Link is Up - 100Mbps/Half - flow f
> 
> Sending discover...
> 
> Sending select for 10.28.1.47...
> 
> Lease of 10.28.1.47 obtained, lease time 1209600
> 
> deleting routers
> 
> adding dns 10.28.5.20
> 
> adding dns 10.4.5.7
> 
> ssh-keygen: generating new host keys: RSA1 RSA DSA ECDSA ED25519
> 
> Starting sshd: OK
> 
> Starting network management serv[   11.715258] NET: Registered protocol family 0
> 
> ices:.
> 
> 
> 
> Welcome to Buildroot
> 
> buildroot login:
> 
> 
> 
> After login, the ifconfig result is:
> 
> 
> 
> # ifconfig

Use ifconfig -a to see all interfaces.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
