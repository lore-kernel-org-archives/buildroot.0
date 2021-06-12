From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sat, 12 Jun 2021 19:38:53 +0200
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.67
In-Reply-To: <20210612173513.2253959-1-giulio.benetti@benettiengineering.com>
References: <20210612173513.2253959-1-giulio.benetti@benettiengineering.com>
Message-ID: <9b3edb4d-362f-c65c-551b-930703723ad9@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All,

this patch superseeds the one which bumps to 3.66 [1], but the one which 
updates libnspr to 4.31 [2] is needed.


[1]: 
https://patchwork.ozlabs.org/project/buildroot/patch/20210531102947.7501-3-giulio.benetti at benettiengineering.com/
[2]: 
https://patchwork.ozlabs.org/project/buildroot/patch/20210531102947.7501-2-giulio.benetti at benettiengineering.com/

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

On 6/12/21 7:35 PM, Giulio Benetti wrote:
> Note: NSS 3.67(like NSS 3.66) requires NSPR 4.31.
> Release Notes (not yet available, but should eventually land):
> https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.67_release_notes
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   package/libnss/libnss.hash | 4 ++--
>   package/libnss/libnss.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
> index 7b27d859b2..3fdb0af6ca 100644
> --- a/package/libnss/libnss.hash
> +++ b/package/libnss/libnss.hash
> @@ -1,4 +1,4 @@
> -# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_66_RTM/src/SHA256SUMS
> -sha256  89a79e3a756cf0ac9ba645f4d4c0fc58d4133134401fb0b6c8a74c420bb4cdc9  nss-3.66.tar.gz
> +# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_67_RTM/src/SHA256SUMS
> +sha256  f6549a9148cd27b394b40c77fa73111d5ea23cdb51d796665de1b7458f88ce7f  nss-3.67.tar.gz
>   # Locally calculated
>   sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
> diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
> index c5398c2959..32b4c379c7 100644
> --- a/package/libnss/libnss.mk
> +++ b/package/libnss/libnss.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBNSS_VERSION = 3.66
> +LIBNSS_VERSION = 3.67
>   LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
>   LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
>   LIBNSS_DISTDIR = dist
> 
