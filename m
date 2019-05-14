From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 May 2019 18:42:17 +0200
Subject: [Buildroot] [PATCH v2 1/1] iputils: Bump to version s20190324
In-Reply-To: <20190509224508.14526-1-petr.vorel@gmail.com>
References: <20190509224508.14526-1-petr.vorel@gmail.com>
Message-ID: <20190514184217.67249ce9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Petr,

On Fri, 10 May 2019 00:45:08 +0200
Petr Vorel <petr.vorel@gmail.com> wrote:

> Upstream changed build system to Meson, these extra changes were
> required:
> 
> * remove custom commands of previous build system
> (IPUTILS_INSTALL_TARGET_CMDS, IPUTILS_PERMISSIONS).
> 
> * backport commits
>   - f65b38b ("ping6_common.c: include stddef.h"): build error fix
>   - 784a67c ("build-sys: make setcap-setuid.sh respect ${DESTDIR}":
>     fix setcap-setuid.sh for cross compilation
> 
> Removed patch included in this release.
> 
> Build ninfod if possible (when use any crypto).
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

It looks mostly good, but I have a few nits and questions.

First, the commit should be prefixed by "package/iputils", not just
"iputils", and "Bump" should be "bump", i.e lowercase. This of course I
had fixed locally, but I had more nits/questions, so I couldn't apply
as-is.


> diff --git a/package/iputils/0001-ping6_common.c-include-stddef.h.patch b/package/iputils/0001-ping6_common.c-include-stddef.h.patch
> new file mode 100644
> index 0000000000..edc8866c31
> --- /dev/null
> +++ b/package/iputils/0001-ping6_common.c-include-stddef.h.patch
> @@ -0,0 +1,25 @@
> +From f65b38b9317e1298cfc5877b0eed7c7badbe597a Mon Sep 17 00:00:00 2001
> +From: Mikhail Efremov <sem@altlinux.org>
> +Date: Mon, 25 Mar 2019 21:41:36 +0300
> +Subject: [PATCH] ping6_common.c: include stddef.h
> +
> +Requird by offsetof().

We need your Signed-off-by here, and a reference to the upstream commit.


> diff --git a/package/iputils/0002-build-sys-make-setcap-setuid.sh-respect-DESTDIR.patch b/package/iputils/0002-build-sys-make-setcap-setuid.sh-respect-DESTDIR.patch
> new file mode 100644
> index 0000000000..5f2104ce27
> --- /dev/null
> +++ b/package/iputils/0002-build-sys-make-setcap-setuid.sh-respect-DESTDIR.patch
> @@ -0,0 +1,28 @@
> +From 784a67cb339cc43db86a676de00b51cb4101d1d6 Mon Sep 17 00:00:00 2001
> +From: Arfrever Frehtes Taifersar Arahesis <Arfrever@Apache.Org>
> +Date: Mon, 1 Apr 2019 00:30:20 +0000
> +Subject: [PATCH] build-sys: make setcap-setuid.sh respect ${DESTDIR}
> +
> +Reference: https://github.com/iputils/iputils/issues/175

We need your Signed-off-by here. If the commit is merged upstream, a
reference to the upstream commit would be better than a reference to a
Github issue.

> -IPUTILS_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) USE_SYSFS=no USE_IDN=no\

So the USE_SYSFS=no and USE_IDN=no are no longer needed / no longer
exist ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
