From: Hamish Moffatt <hamish@cloud.net.au>
Date: Tue, 11 Nov 2008 10:23:56 +1100
Subject: [Buildroot] latest iptables requires IPv6
In-Reply-To: <20081110090238.2226416d@surf>
References: <20081110060504.GA31507@cloud.net.au>
	<20081110090238.2226416d@surf>
Message-ID: <20081110232356.GA29343@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Nov 10, 2008 at 09:02:38AM +0100, Thomas Petazzoni wrote:
> Le Mon, 10 Nov 2008 17:05:05 +1100,
> Hamish Moffatt <hamish@cloud.net.au> a ?crit :
> 
> > It looks like a few functions in xtables.c could be disabled, and
> > Makefile.am modified not to compile the ipv6-specific programs
> > (ip6tables etc).. all this would need a runtime IPV6 detection because
> > of external toolchains.
> 
> Users of external toolchains are supposed to tell in the configuration
> system whether their external toolchain supports IPv6 or not.
> 
> See toolchain/external-toolchain/Config.in, option BR2_INET_IPV6.

Thanks, but that doesn't solve the real issue of building without IPV6.
I'll see if I can patch it.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
