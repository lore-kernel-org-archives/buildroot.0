From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Apr 2015 01:44:21 +0200
Subject: [Buildroot] [PATCH 5/8 v4] toolchain/external: ignore missing
 hash for custom downloaded toolchain
In-Reply-To: <c059378e6b67661e3986d270cd6be406fb312a21.1428512075.git.yann.morin.1998@free.fr>
References: <cover.1428512075.git.yann.morin.1998@free.fr>
 <c059378e6b67661e3986d270cd6be406fb312a21.1428512075.git.yann.morin.1998@free.fr>
Message-ID: <552C54D5.5030502@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/04/15 18:57, Yann E. MORIN wrote:
> We will *always* be missing a hash file for custom external toolchains
> that are downloaded.
> 
> So, just ignore that failure.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Cc: Arnout Vandecappelle <arnout@mind.be>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> 
> ---
> Chamges v3 -> v4:
>   - drop magic value, append to the exclusion list  (Arnout)
> 
> Changes v1 -> v2:
>   - fix typoes in title
> ---
>  toolchain/toolchain-external/toolchain-external.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index c0429bb..09b16d1 100644
> --- a/toolchain/toolchain-external/toolchain-external.mk
> +++ b/toolchain/toolchain-external/toolchain-external.mk
> @@ -400,6 +400,8 @@ else
>  # Custom toolchain
>  TOOLCHAIN_EXTERNAL_SITE = $(dir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
>  TOOLCHAIN_EXTERNAL_SOURCE = $(notdir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
> +# We can't check hashes for custom downloaded toolchains
> +BR_NO_CHECK_HASH_FOR += $(TOOLCHAIN_EXTERNAL_SOURCE)
>  endif
>  
>  # In fact, we don't need to download the toolchain, since it is already
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
