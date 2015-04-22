From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 22 Apr 2015 22:15:43 +0200
Subject: [Buildroot] Disabling Synopsys ARC pre-built toolchains in
 Buildroot
In-Reply-To: <1429699622.2596.34.camel@synopsys.com>
References: <20150410112156.6b0e42f7@free-electrons.com>	
 <1429260577.2846.27.camel@synopsys.com> <5531634E.5070104@mind.be>
 <1429699622.2596.34.camel@synopsys.com>
Message-ID: <5538016F.7020308@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/22/15 12:47, Alexey Brodkin wrote:
[snip]
> As for remaining differences between Buildroot and ARC uClibc defconfigs
> these are ones I may see (comparing
> https://github.com/foss-for-synopsys-dwc-arc-processors/uClibc/blob/arc-mainline-dev/extra/Configs/defconfigs/arc/defconfig with "uClibc-snapshot.config" from http://patchwork.ozlabs.org/patch/462812/):
> 
>  [1] MALLOC_GLIBC_COMPAT=y
>  [2] UCLIBC_HAS_GETPT=y
>  [3] UCLIBC_HAS_CTYPE_CHECKED=y
>  [4] UCLIBC_HAS_HEXADECIMAL_FLOATS=y
>  [5] UCLIBC_HAS_GLIBC_CUSTOM_PRINTF=y
>  [6] UCLIBC_HAS_FOPEN_EXCLUSIVE_MODE=y
>  [7] UCLIBC_HAS_PRINTF_M_SPEC=y
>  [8] UCLIBC_HAS_SSP=y
>  [9] UCLIBC_BUILD_NOW=y
> 
> Most of these options enable more compatibility with glibc or even
> expand support for non-standard features like
> UCLIBC_HAS_FOPEN_EXCLUSIVE_MODE.
> 
> Do you think some of them are really important and we may want to add
> them in ARC defconfigs?

 Well, basically the uClibc configs we have are just a configuration that was
created many many years ago. Occasionally some option is added when there are
important packages that need it, but it's not as if really a lot of thought goes
into these configs nowadays.

 Since you're doing active development with uClibc, I expect that there are some
options that you encounter that actually improve the quality of the resulting
library, it would be good to get patches that enable them (of course with
sufficient explanation _why_ it's a good idea to enable it).

 Your commit 826f315d is a great example of this.


 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
