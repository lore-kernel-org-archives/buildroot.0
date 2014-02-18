From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Feb 2014 07:32:48 +0100
Subject: [Buildroot] [PATCH v4 7/7] Makefile: export PATH
In-Reply-To: <1392559113-5215-8-git-send-email-s.martin49@gmail.com>
References: <1392559113-5215-1-git-send-email-s.martin49@gmail.com>
 <1392559113-5215-8-git-send-email-s.martin49@gmail.com>
Message-ID: <5302FE90.9070402@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/02/14 14:58, Samuel Martin wrote:
> This can be useful for:
> - package using custom build system that are not aware that the host
>   tree is in $(O)/host/;
> - post-{build,image} scripts, in case some host-tools were specifically
>   built to be used by these scripts.

 This makes all the previous patches redundant, since the PATH=...
invocations should be removed instead of renamed.

> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> ---
> changes v3 -> v4:
> - rebase
> - rename BR2_PATH -> BR_PATH
> 
> changes v2 -> v3:
> - rebase
> - extend commit loghanges v2 -> v3:
> 
> changes v1 -> v2:
> - extend commit message
> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Makefile b/Makefile
> index bb5b38e..ca2d721 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -353,6 +353,7 @@ export STAGING_DIR
>  export HOST_DIR
>  export BINARIES_DIR
>  export BASE_DIR
> +export PATH:=$(BR_PATH)

 With this change, the := in BR_PATH becomes essential. There should be a
comment there to explain why. Also, the assignment to BR_PATH and to PATH
should be right next to each other (the export can stay here, though).

 And in fact, BR_PATH becomes completely redundant, it's sufficient to
have a single PATH := ....:$(PATH)

 Regards,
 Arnout
>  
>  ################################################################################
>  #
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
