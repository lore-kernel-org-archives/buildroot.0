From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 27 Mar 2019 18:45:34 +0100
Subject: [Buildroot] [PATCH 1/1] package/keepalived: add optional
 nftables dependency
In-Reply-To: <85eb5528-6572-ddee-eecc-a9f13a413c72@mind.be>
References: <20190324120016.28701-1-fontaine.fabrice@gmail.com>
 <87h8bsmq9q.fsf@tarshish> <20190325185421.6141a000@windsurf>
 <20190325182227.dr6qkvvh4dq3gb55@sapphire.tkos.co.il>
 <85eb5528-6572-ddee-eecc-a9f13a413c72@mind.be>
Message-ID: <CAPi7W82CBRNowAqDiteNi_Q+WtxJmr4b3Rn6s265B3Bu82L78w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,

Le lun. 25 mars 2019 ? 22:22, Arnout Vandecappelle <arnout@mind.be> a ?crit :
>
>
>
> On 25/03/2019 19:22, Baruch Siach wrote:
> > BTW, what happens when both BR2_PACKAGE_NFTABLES and
> > BR2_PACKAGE_IPTABLES_NFTABLES are enabled? Do both coexist? If they do, I see
> > no way for keepalived to know which library to link against. iptables will
> > always build before keepalived because it optionally depends on
> > BR2_PACKAGE_IPTABLES anyway. But nftables might not build before keepalived in
> > that case.
>
>  I guess the configure script will prefer one over the other if both are available.
>
>  If the configure script prefers iptables over nftables, then the proposed patch
> looks good to me. If, however, the configure script prefers nftables over
> iptables, then the patch is wrong because the keepalived would be built
> differently depending on whether nftables is built first or not.
I sent a v2, nftables support in keepalived depends on libmnl and
libnftnl, it does not depend on iptables/nftables applications.
>
>  Regards,
>  Arnout
Best Regards,

Fabrice
