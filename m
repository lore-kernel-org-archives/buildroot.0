From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 01 May 2015 15:37:42 +0200
Subject: [Buildroot] [PATCH 7/7] package/xenomai: ignore custom versions
In-Reply-To: <c7721b4bf0d66994d78b3ad75a5371bdbe390d9a.1430260630.git.yann.morin.1998@free.fr>
References: <cover.1430260630.git.yann.morin.1998@free.fr>
 <c7721b4bf0d66994d78b3ad75a5371bdbe390d9a.1430260630.git.yann.morin.1998@free.fr>
Message-ID: <554381A6.40307@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/04/15 00:40, Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <jacmet@uclibc.org>
> ---
>  package/xenomai/xenomai.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
> index ccbae35..17299ac 100644
> --- a/package/xenomai/xenomai.mk
> +++ b/package/xenomai/xenomai.mk
> @@ -7,6 +7,9 @@
>  XENOMAI_VERSION = $(call qstrip,$(BR2_PACKAGE_XENOMAI_VERSION))
>  ifeq ($(XENOMAI_VERSION),)
>  XENOMAI_VERSION = 2.6.4
> +else
> +# We can do that because it's a recursively-expanded variable

 I don't think this comment is needed. Move it to the commit message.

 Either way: Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> +BR_NO_CHECK_HASH_FOR += $(XENOMAI_SOURCE)
>  endif
>  
>  XENOMAI_SITE = http://download.gna.org/xenomai/stable
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
