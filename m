From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 25 Mar 2019 22:22:56 +0100
Subject: [Buildroot] [PATCH 1/1] package/keepalived: add optional
 nftables dependency
In-Reply-To: <20190325182227.dr6qkvvh4dq3gb55@sapphire.tkos.co.il>
References: <20190324120016.28701-1-fontaine.fabrice@gmail.com>
 <87h8bsmq9q.fsf@tarshish> <20190325185421.6141a000@windsurf>
 <20190325182227.dr6qkvvh4dq3gb55@sapphire.tkos.co.il>
Message-ID: <85eb5528-6572-ddee-eecc-a9f13a413c72@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25/03/2019 19:22, Baruch Siach wrote:
> BTW, what happens when both BR2_PACKAGE_NFTABLES and 
> BR2_PACKAGE_IPTABLES_NFTABLES are enabled? Do both coexist? If they do, I see 
> no way for keepalived to know which library to link against. iptables will 
> always build before keepalived because it optionally depends on 
> BR2_PACKAGE_IPTABLES anyway. But nftables might not build before keepalived in 
> that case.

 I guess the configure script will prefer one over the other if both are available.

 If the configure script prefers iptables over nftables, then the proposed patch
looks good to me. If, however, the configure script prefers nftables over
iptables, then the patch is wrong because the keepalived would be built
differently depending on whether nftables is built first or not.

 Regards,
 Arnout
