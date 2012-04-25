From: Markos Chandras <Markos.Chandras@imgtec.com>
Date: Wed, 25 Apr 2012 12:21:42 +0100
Subject: [Buildroot] [PATCH] pkg-download.mk: Add missing argument for
	DOWNLOAD_WGET
In-Reply-To: <1335344690-21404-1-git-send-email-markos.chandras@imgtec.com>
References: <1335344690-21404-1-git-send-email-markos.chandras@imgtec.com>
Message-ID: <4F97DE46.7060802@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/25/2012 10:04 AM, Markos Chandras wrote:

> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
> ---
>  package/pkg-download.mk |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index ccf819e..df63c26 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -161,7 +161,7 @@ endef
>  # download fails).
>  define DOWNLOAD_WGET
>         test -e $(DL_DIR)/$(2) || \
> -       $(WGET) -O $(DL_DIR)/$(2) '$(call qstrip,$(1))' || \
> +       $(WGET) -O $(DL_DIR)/$(2) '$(call qstrip,$(1))'/$(2) || \
>         (rm -f $(DL_DIR)/$(2) ; exit 1)
>  endef
> 
> --
> 1.7.1
> 


This patch fixes the problem with the primary download mirror but breaks
the rest of the download methods. I will prepare a new patch

-- 
markos
