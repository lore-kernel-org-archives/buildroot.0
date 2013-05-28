From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 May 2013 15:32:43 +0200
Subject: [Buildroot] [PATCH] lttng-babeltrace: fix build failure on gcc14
In-Reply-To: <87sj179qrd.fsf@dell.be.48ers.dk>
References: <1369747369-21243-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <87sj179qrd.fsf@dell.be.48ers.dk>
Message-ID: <20130528153243.04176f08@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Tue, 28 May 2013 15:29:42 +0200, Peter Korsgaard wrote:

>  Thomas> +# We patch configure.ac to fix a problem that appears
>  Thomas> +# only with some old host gcc
>  Thomas> +HOST_LTTNG_BABELTRACE_AUTORECONF = YES
> 
> The patch also gets applied for target builds. Don't we need to
> autoreconf there as well?

I was focused on the host gcc problem, but if the user decides to use
an old gcc as the cross-compiler, then there may be the same issue.

And anyway, patching configure.ac without doing the autoreconf means
that at build time, the thing will notice that configure.ac is more
recent than configure, and will do some kind of autoreconf.

So yes, adding LTTNG_BABELTRACE_AUTORECONF = YES is probably a good
thing to do.

BTW:

 * I've submitted the patch upstream. See
   http://lists.lttng.org/pipermail/lttng-dev/2013-May/020542.html and
   http://lists.lttng.org/pipermail/lttng-dev/2013-May/020543.html.

 * This host/target difference on autoreconf will disappear with the
   out-of-tree stuff, since we'll have only one source tree.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
