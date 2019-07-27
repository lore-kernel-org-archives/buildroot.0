From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 27 Jul 2019 22:37:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: fix build error
In-Reply-To: <20190706064236.30663-1-bernd.kuhls@t-online.de>
References: <20190706064236.30663-1-bernd.kuhls@t-online.de>
Message-ID: <20190727223753.2211ac3f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd,

On Sat,  6 Jul 2019 08:42:36 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> diff --git a/package/tvheadend/0002-tvhcsa.c-include-stdio.h.patch b/package/tvheadend/0002-tvhcsa.c-include-stdio.h.patch
> new file mode 100644
> index 0000000000..a1e80568fb
> --- /dev/null
> +++ b/package/tvheadend/0002-tvhcsa.c-include-stdio.h.patch
> @@ -0,0 +1,40 @@
> +From 693e3a3fe281dd618dd244b245c9bb0a00c7d893 Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd.kuhls@t-online.de>
> +Date: Sat, 6 Jul 2019 08:36:11 +0200
> +Subject: [PATCH] tvhcsa.c: include stdio.h
> +
> +Fixes uclibc build error:
> +
> +CC              src/descrambler/tvhcsa.o
> +In file included from /home/buildroot/autobuild/instance-0/output/build/tvheadend-8f1de1621d78c91431238176bf4f6290870a031a/src/tvhlog.h:30:0,
> +                 from src/descrambler/tvhcsa.h:30,
> +                 from src/descrambler/tvhcsa.c:19:
> +/home/buildroot/autobuild/instance-0/output/build/tvheadend-8f1de1621d78c91431238176bf4f6290870a031a/src/tvh_thread.h:163:25:
> + error: unknown type name '__do_not_use_pthread_mutex_t'
> + #define pthread_mutex_t __do_not_use_pthread_mutex_t
> +
> +detected by buildroot autobuilder:
> +http://autobuild.buildroot.net/results/627/627e7080e655005d6724b9977670cc73059d6281/
> +
> +Patch sent upstream: https://github.com/tvheadend/tvheadend/pull/1285
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Could you give a bit more details about how including <stdio.h> can
solve this build issue ? All this thread stuff in tvheadend isn't that
clear, and the fact that including <stdio.h> solves the build issue
makes it even less clear.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
