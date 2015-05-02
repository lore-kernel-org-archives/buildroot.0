From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 03 May 2015 00:10:51 +0200
Subject: [Buildroot] [PATCHv2] docs/manual: add list of instrumentation
 steps
In-Reply-To: <1430602853-1836-1-git-send-email-yann.morin.1998@free.fr>
References: <1430602853-1836-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <55454B6B.9070706@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/05/15 23:40, Yann E. MORIN wrote:
> The names of steps is not obvious, so add this list to the manual.
                     are

> 
> Small formatting fix at the same time.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> ---
> Changes v1 -> v2:
>   - remove reference to target-finalize, it's currently not a step
> ---
>  docs/manual/debugging-buildroot.txt | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/manual/debugging-buildroot.txt b/docs/manual/debugging-buildroot.txt
> index b97f633..844744b 100644
> --- a/docs/manual/debugging-buildroot.txt
> +++ b/docs/manual/debugging-buildroot.txt
> @@ -12,8 +12,8 @@ space-separated list, you want called before and after each step. The
>  scripts are called in sequence, with three parameters:
>  
>    - +start+ or +end+ to denote the start (resp. the end) of a step;
> -  - the name of the step about to be started, or which just ended.
> -  - the name of the package
> +  - the name of the step about to be started, or which just ended;
> +  - the name of the package.
>  
>  For example :
>  
> @@ -21,6 +21,17 @@ For example :
>  make BR2_INSTRUMENTATION_SCRIPTS="/path/to/my/script1 /path/to/my/script2"
>  ----
>  
> +The list of steps are:
                     is   (or The steps are)

> +
> +  - +extract+
> +  - +patch+
> +  - +configure+
> +  - +build+
> +  - +install-host+, when a host-package is installed in +$(HOST_DIR)+
> +  - +install-target+, when a target-package is installed in +$(TARGET_DIR)+
> +  - +install-staging+, when a target-package is installed in +$(STAGING_DIR)+
> +  - +install-image+, when a target-package installs files in +$(BINARIES_DIR)+
> +
>  That script has access to the following variables:

 The 'That' looks weird now, so replace it with 'The'.

 Regards,
 Arnout

>  
>    - +BR2_CONFIG+: the path to the Buildroot .config file
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
