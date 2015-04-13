From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Apr 2015 01:45:12 +0200
Subject: [Buildroot] [PATCH 6/8 v4] package/uclibc: ignore missing hash
	for snapshots
In-Reply-To: <17515f799ca33cad357949df9926d260187d57b4.1428512075.git.yann.morin.1998@free.fr>
References: <cover.1428512075.git.yann.morin.1998@free.fr>
 <17515f799ca33cad357949df9926d260187d57b4.1428512075.git.yann.morin.1998@free.fr>
Message-ID: <552C5508.1050007@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/04/15 18:57, Yann E. MORIN wrote:
> We can't have a hash for snapshots, so add them to the exclusion list.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Cc: Arnout Vandecappelle <arnout@mind.be>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  package/uclibc/uclibc.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
> index 72a46d9..1ec8b10 100644
> --- a/package/uclibc/uclibc.mk
> +++ b/package/uclibc/uclibc.mk
> @@ -11,6 +11,7 @@ UCLIBC_LICENSE_FILES = COPYING.LIB
>  
>  ifeq ($(BR2_UCLIBC_VERSION_SNAPSHOT),y)
>  UCLIBC_SITE = http://www.uclibc.org/downloads/snapshots
> +BR_NO_CHECK_HASH_FOR += uClibc-$(UCLIBC_VERSION).tar.xz
>  else ifeq ($(BR2_UCLIBC_VERSION_NG),y)
>  UCLIBC_SITE = http://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
>  UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
