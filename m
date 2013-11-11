From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 11 Nov 2013 09:30:50 +0100
Subject: [Buildroot] [PATCH 4/4] pkg-infra: add user-supplied step-hooks
In-Reply-To: <1be7266b22b1c6104d2050be1b1f5e75cbf0e362.1384127173.git.yann.morin.1998@free.fr>
References: <cover.1384127173.git.yann.morin.1998@free.fr>
 <1be7266b22b1c6104d2050be1b1f5e75cbf0e362.1384127173.git.yann.morin.1998@free.fr>
Message-ID: <CAAXf6LXzb-EcdYHLKWeEH1=GQweqKaFg44mG__+sdO3HRGwUMg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Mon, Nov 11, 2013 at 12:51 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Allow user to supply their own step-hooks by passing a variable
> on the make command-line:
>     make BR2_STEP_USER_HOOK=/path/to/my/script
>
> This can be usefull to run site-specific actions at each step of the

useful

> build process, such as logging installed, removed or modified files,
> do sanity checks on installed files...
>
> It is possible to call more than one script, by passing a space-separated
> lists of scripts to call.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  docs/manual/debugging-buildroot.txt | 33 +++++++++++++++++++++++++++++++++
>  docs/manual/developer-guide.txt     |  2 ++
>  package/pkg-generic.mk              |  9 +++++++++
>  3 files changed, 44 insertions(+)
>  create mode 100644 docs/manual/debugging-buildroot.txt
>
> diff --git a/docs/manual/debugging-buildroot.txt b/docs/manual/debugging-buildroot.txt
> new file mode 100644
> index 0000000..7e66208
> --- /dev/null
> +++ b/docs/manual/debugging-buildroot.txt
> @@ -0,0 +1,33 @@
> +// -*- mode:doc; -*-
> +// vim: set syntax=asciidoc:
> +
> +[[debugging-buildroot]]
> +
> +Debugging Buildroot
> +-------------------
> +
> +It is possible to instrument the steps +Buildroot+ does when building
> +packages. Define the variable +BR2_STEPS_USER_HOOKS+ to contain the path
> +of one or more scripts (or other executables), in a space-separated list,
> +you want called before and after each step. The script is called with
> +three parameters:
> +
> +  - +start+ or +end+ to denote the start (resp. the end) of a step;
> +  - the name of the step about to be started, or which just ended.
> +  - the name of the package
> +
> +For example :
> +
> +----
> +make BR2_STEPS_USER_HOOKS="/path/to/my/script1 /path/to/my/script2"
> +----

I think this variable should be named more in accordance with the name
GLOBAL_INSTRUMENTATION_HOOKS. For example:
BR2_USER_INSTRUMENTATION_HOOKS
or plainly:
BR2_INSTRUMENTATION_HOOKS
(or something else)

Best regards,
Thomas
