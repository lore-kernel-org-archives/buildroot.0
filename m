From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 01 May 2013 01:31:10 +0200
Subject: [Buildroot] [PATCH] libnl: enable parallel make
In-Reply-To: <1367347109-27608-1-git-send-email-ntl@pobox.com>
References: <1367347109-27608-1-git-send-email-ntl@pobox.com>
Message-ID: <5180543E.6050907@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30/04/13 20:38, Nathan Lynch wrote:
> Current versions of libnl (since 3.2.4, at least) do not appear to
> require MAKE1.
>
> Signed-off-by: Nathan Lynch <ntl@pobox.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Tried with a -j30 and it worked like a charm.

  Regards,
  Arnout

> ---
>   package/libnl/libnl.mk | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
> index 2a9f5a9..681d364 100644
> --- a/package/libnl/libnl.mk
> +++ b/package/libnl/libnl.mk
> @@ -10,7 +10,6 @@ LIBNL_LICENSE = LGPLv2.1+
>   LIBNL_LICENSE_FILES = COPYING
>   LIBNL_INSTALL_STAGING = YES
>   LIBNL_DEPENDENCIES = host-bison host-flex
> -LIBNL_MAKE = $(MAKE1)
>   LIBNL_BINARIES = class-add class-delete class-list classid-lookup cls-add \
>   	cls-delete cls-list link-list pktloc-lookup qdisc-add qdisc-delete \
>   	qdisc-list
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
