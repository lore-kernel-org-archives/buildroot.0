From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Mar 2015 23:28:34 +0100
Subject: [Buildroot] [PATCH 4/7] lttng-modules: bump to version 2.6.0
In-Reply-To: <1425663357-22541-5-git-send-email-eeppeliteloop@gmail.com>
References: <1425663357-22541-1-git-send-email-eeppeliteloop@gmail.com>
 <1425663357-22541-5-git-send-email-eeppeliteloop@gmail.com>
Message-ID: <20150306232834.11368419@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Philippe Proulx,

On Fri,  6 Mar 2015 12:35:54 -0500, Philippe Proulx wrote:
> Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
> ---
>  package/lttng-modules/Config.in          | 34 +++++++++++++++++++++++---------
>  package/lttng-modules/lttng-modules.hash |  8 ++------
>  package/lttng-modules/lttng-modules.mk   |  2 +-
>  3 files changed, 28 insertions(+), 16 deletions(-)

Applied, but I have one comment below.

> -	  The packaged version is compatible with kernel 2.6.38,
> -	  2.6.39, 3.0 and 3.1.0. See
> -	  http://lttng.org/files/bundles/20111214/README.compatible.kernels.txt
> +	    * CONFIG_MODULES: loadable module support
> +	    * CONFIG_KALLSYMS: this is necessary until the few
> +	      required missing symbols are exported to GPL
> +	      modules from mainline
> +	    * CONFIG_HIGH_RES_TIMERS: needed for LTTng 2.x
> +	      clock source
> +	    * CONFIG_TRACEPOINTS: kernel tracepoint instrumentation
> +	      (enabled as a side-effect of any of the
> +	      perf/ftrace/blktrace instrumentation features)

If this is actually needed for lttng-modules to build, then what about
adding some logic in linux/linux.mk to make sure those options are
enabled ?

We already have some logic in linux/linux.mk to enable options for
ktap, so why not for lttng-modules ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
