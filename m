From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Feb 2014 23:41:25 +0100
Subject: [Buildroot] [PATCH 03/10] package/linux-headers: select
 appropriate 'AT_LEAST_XXX' header version
In-Reply-To: <94dd7d99bafacf64d4b2497b01de76472f4c9a70.1392571021.git.yann.morin.1998@free.fr>
References: <cover.1392571021.git.yann.morin.1998@free.fr>
 <94dd7d99bafacf64d4b2497b01de76472f4c9a70.1392571021.git.yann.morin.1998@free.fr>
Message-ID: <53029015.9020101@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/02/14 18:27, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Select the appropriate BR2_TOOLCHAIN_HEADERS_AT_LEAST_XXX options for the
> internal toolchain backend.
> 
> The custom and snapshot options do not select anything:
>   - snapshot is for a 2.6 kernel (BR2_DEFAULT_KERNEL_HEADERS="2.6" in this
>     case)
>   - we provide most of post-3.x kernel versions
>   - custom and snapshot are thus to select a version before 3.0

 I'm afraid that the custom and snapshot can also be used in other
situations. I've used it for instance with a 3.4 kernel where there were
some vendor-specific additions to the headers.

 So to be complete, there should be another choice to select the actual
kernel version just like for the external toolchain...


 Regards,
 Arnout

> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>


[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
