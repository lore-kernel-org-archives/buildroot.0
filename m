From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 May 2015 23:38:46 +0200
Subject: [Buildroot] [PATCH] docs/manual: add list of instrumentation
	steps
In-Reply-To: <1430602482-26882-1-git-send-email-yann.morin.1998@free.fr>
References: <1430602482-26882-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150502213846.GJ13701@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2015-05-02 23:34 +0200, Yann E. MORIN spake thusly:
> The names of steps is not obvious, so add this list to the manual.
> 
> Small formatting fix at the same time.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  docs/manual/debugging-buildroot.txt | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/manual/debugging-buildroot.txt b/docs/manual/debugging-buildroot.txt
> index b97f633..c014fa1 100644
> --- a/docs/manual/debugging-buildroot.txt
> +++ b/docs/manual/debugging-buildroot.txt
> @@ -12,8 +12,8 @@ space-separated list, you want called before and after each step. The
>  scripts are called in sequence, with three parameters:
>  
>    - +start+ or +end+ to denote the start (resp. the end) of a step;
> -  - the name of the step about to be started, or which just ended.
> -  - the name of the package
> +  - the name of the step about to be started, or which just ended;
> +  - the name of the package (empty for the +target-finalize+ step).

Damn, that last line has slipped in unwittingly... :-/
I'll respin a cleaned up version.

Regards,
Yann E. MORIN.

>  For example :
>  
> @@ -21,6 +21,17 @@ For example :
>  make BR2_INSTRUMENTATION_SCRIPTS="/path/to/my/script1 /path/to/my/script2"
>  ----
>  
> +The list of steps are:
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
>  
>    - +BR2_CONFIG+: the path to the Buildroot .config file
> -- 
> 1.9.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
