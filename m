From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 Oct 2014 23:27:57 +0100
Subject: [Buildroot] [PATCH 1/3] binutils: remove dead code
In-Reply-To: <1414534758-7545-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1414534758-7545-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <5450186D.5000806@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/10/14 23:19, Thomas Petazzoni wrote:
> We no longer have any way of using version 2.23, and all the other
> versions that we support are available as .tar.bz2. Therefore we can
> remove the special case related to the 2.23 version only being
> available as a .tar.gz archive.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> ---
>  package/binutils/binutils.mk | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
> index f40c45f..ab9f167 100644
> --- a/package/binutils/binutils.mk
> +++ b/package/binutils/binutils.mk
> @@ -16,10 +16,6 @@ BINUTILS_VERSION = 2.21
>  endif
>  endif
>  
> -ifeq ($(BINUTILS_VERSION),2.23)
> -BINUTILS_SOURCE = binutils-$(BINUTILS_VERSION).tar.gz
> -endif
> -
>  ifeq ($(ARCH),avr32)
>  BINUTILS_SITE = ftp://www.at91.com/pub/buildroot
>  endif
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
