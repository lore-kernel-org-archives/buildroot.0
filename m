From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 22 Apr 2016 23:25:59 +0200
Subject: [Buildroot] [PATCH v9 11/11] docs/manual: document how to debug
 shell script
In-Reply-To: <1461358223-18312-12-git-send-email-s.martin49@gmail.com>
References: <1461358223-18312-1-git-send-email-s.martin49@gmail.com>
 <1461358223-18312-12-git-send-email-s.martin49@gmail.com>
Message-ID: <CAGm1_ku8N-2RvLN8RthPVJBokGW832LLRtkcfhGAsepjF9DCvA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Apr 22, 2016 at 10:50 PM, Samuel Martin <s.martin49@gmail.com> wrote:
> The method describes here is only true for scripts using the shell

s/describes/described ?

> modules from support/scripts/shell/*.
>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

>
> ---
> changes v8->v9:
> - none
>
> changes v7->v8:
> - put instrumentation in a subsection (Arnout)
> - minor rewording
>
> changes v6->v7:
> - new patch
> ---
>  docs/manual/debugging-buildroot.txt | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/docs/manual/debugging-buildroot.txt b/docs/manual/debugging-buildroot.txt
> index f575fc4..b809c2d 100644
> --- a/docs/manual/debugging-buildroot.txt
> +++ b/docs/manual/debugging-buildroot.txt
> @@ -5,6 +5,8 @@
>
>  == Debugging Buildroot
>
> +=== Running scripts before and after each build step
> +
>  It is possible to instrument the steps +Buildroot+ does when building
>  packages. Define the variable +BR2_INSTRUMENTATION_SCRIPTS+ to contain
>  the path of one or more scripts (or other executables), in a
> @@ -41,3 +43,18 @@ The script has access to the following variables:
>    - +BINARIES_DIR+: the place where all binary files (aka images) are
>      stored
>    - +BASE_DIR+: the base output directory
> +
> +=== Debugging shell scripts in Buildroot
> +
> +For shell scripts using the _shell modules_ (available in
> ++support/scripts/shell/+), an environment variable is available to trace
> +the scripts:
> +
> +  - +SHELL_DEBUG+ adjustes the debug level, from 0 to 3 (only errors to
> +    all debug messages)
> +
> +To enable these debug outputs:
> +
> +----
> +SHELL_DEBUG=3 make
> +----
> --
> 2.8.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
