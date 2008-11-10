From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Nov 2008 09:02:38 +0100
Subject: [Buildroot] latest iptables requires IPv6
In-Reply-To: <20081110060504.GA31507@cloud.net.au>
References: <20081110060504.GA31507@cloud.net.au>
Message-ID: <20081110090238.2226416d@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 10 Nov 2008 17:05:05 +1100,
Hamish Moffatt <hamish@cloud.net.au> a ?crit :

> It looks like a few functions in xtables.c could be disabled, and
> Makefile.am modified not to compile the ipv6-specific programs
> (ip6tables etc).. all this would need a runtime IPV6 detection because
> of external toolchains.

Users of external toolchains are supposed to tell in the configuration
system whether their external toolchain supports IPv6 or not.

See toolchain/external-toolchain/Config.in, option BR2_INET_IPV6.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
