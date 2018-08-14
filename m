From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 13 Aug 2018 21:21:11 -0500
Subject: [Buildroot] Analysis of build results for 2018-08-11
In-Reply-To: <bb82de29-ad31-76a6-f0ad-eb74c60f50f4@mind.be>
References: <20180812060015.A385B207E5@mail.bootlin.com>
 <20180812223629.2bac8ebe@windsurf>
 <CANQCQpYGFe1AXd=2=6AG8rJtWp9OFNo3eJtq+u6FOArHz8izsQ@mail.gmail.com>
 <bb82de29-ad31-76a6-f0ad-eb74c60f50f4@mind.be>
Message-ID: <CANQCQpYkZT4zwmtKz9TpOt1_xC_2RcYc+zuj4DSRFyCh+Zk37g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,
On Mon, Aug 13, 2018 at 5:43 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 13-08-18 16:15, Matthew Weber wrote:
> > Thomas,
> > On Sun, Aug 12, 2018 at 3:36 PM Thomas Petazzoni
> > <thomas.petazzoni@bootlin.com> wrote:
> >>
> >> Hello,
> >>
> >> Matt, Hollis, Romain, J?rg, Bernd, there are some questions for you
> >> below.
> >>
> >> On Sun, 12 Aug 2018 08:00:15 +0200 (CEST), Thomas Petazzoni wrote:
> >>
> >>>      powerpc |                aircrack-ng-1.3 | NOK | http://autobuild.buildroot.net/results/87e82a5e8d0b1c1ff10ec3e59d25bcd56b329075 |
> >>
> >> Seems like some PowerPC Altivec code gets used even when Altivec is not
> >> available, or something like that:
> >>
> >>   CC       libaircrack_crypto_ppc_altivec_la-sha1-git.lo
> >> memory.c:1:0: warning: -mvsx requires hardware floating point [enabled by default]
> >>   CC       libaircrack_crypto_ppc_altivec_la-simd-intrinsics.lo
> >> sha1-git.c:1:0: warning: -mvsx requires hardware floating point [enabled by default]
> >>   CC       libaircrack_crypto_ppc_altivec_la-wpapsk.lo
> >> simd-intrinsics.c:1:0: warning: -mvsx requires hardware floating point [enabled by default]
> >> simd-intrinsics.c:147:18: error: unknown type name 'vtype'
> >> simd-intrinsics.c: In function 'dispatch':
> >> simd-intrinsics.c:671:3: warning: implicit declaration of function 'SIMDmd5body' [-Wimplicit-function-declaration]
> >> simd-intrinsics.c:671:16: error: 'vtype' undeclared (first use in this function)
> >> simd-intrinsics.c:671:16: note: each undeclared identifier is reported only once for each function it appears in
> >> simd-intrinsics.c:671:23: error: expected expression before ')' token
> >> simd-intrinsics.c: At top level:
> >> simd-intrinsics.c:905:18: error: unknown type name 'vtype'
> >> simd-intrinsics.c:1386:19: error: unknown type name 'vtype'
> >> simd-intrinsics.c:1928:21: error: unknown type name 'vtype'
> >> simd-intrinsics.c:2547:21: error: unknown type name 'vtype'
> >>

https://patchwork.ozlabs.org/patch/957337/
