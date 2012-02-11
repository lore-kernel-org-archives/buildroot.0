From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 11 Feb 2012 18:13:26 +0100
Subject: [Buildroot] [PATCH] pkg-stats: update list of packages to be
	skipped
In-Reply-To: <1328978469-27669-1-git-send-email-luca@lucaceresoli.net>
References: <1328978469-27669-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <201202111813.27003.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Saturday 11 February 2012 17:41:09 Luca Ceresoli wrote:
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>  support/scripts/pkg-stats |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index 8228274..06d9d0d 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -78,7 +78,7 @@ cnt=0
>  for i in $(find package/ -name '*.mk') ; do
>  
>      if test \
> -	$i = "package/java/java.mk" -o \
> +	$i = "package/efl/efl.mk" -o \
>  	$i = "package/games/games.mk" -o \
>  	$i = "package/gtk2-themes/gtk2-themes.mk" -o \
>  	$i = "package/multimedia/multimedia.mk" -o \

 Alternatively, you can just skip mk-files that contain no : and no
'call [A-Z]*TARGETS'


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
