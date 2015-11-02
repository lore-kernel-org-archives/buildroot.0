From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Nov 2015 16:50:16 +0100
Subject: [Buildroot] [PATCH v4 1/1] gauche: new package
In-Reply-To: <201510310122.t9V1M8CT023045@ms-omx01.plus.so-net.ne.jp>
References: <201510310122.t9V1M8CT023045@ms-omx01.plus.so-net.ne.jp>
Message-ID: <20151102165016.62635bd0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Hiroshi Kawashima,

On Sat, 31 Oct 2015 10:22:08 +0900, Hiroshi Kawashima wrote:

> diff --git a/package/gauche/0001-fix-so-suffix.patch b/package/gauche/0001-fix-so-suffix.patch
> new file mode 100644
> index 0000000..77bb355
> --- /dev/null
> +++ b/package/gauche/0001-fix-so-suffix.patch

This ...


> diff --git a/package/gauche/0002-fix-so-suffix-configure-ac.patch b/package/gauche/0002-fix-so-suffix-configure-ac.patch
> new file mode 100644
> index 0000000..f9b4459
> --- /dev/null
> +++ b/package/gauche/0002-fix-so-suffix-configure-ac.patch

... and this should be in the same patch, since it's exactly the same
change. Also it should carry an explanation as to why we are patching
the configure script directly instead of patching just configure.ac and
doing an autoreconf.

> +GAUCHE_VERSION = 0.9.4
> +GAUCHE_SOURCE = Gauche-$(GAUCHE_VERSION).tgz
> +GAUCHE_SITE = http://downloads.sourceforge.net/project/gauche/Gauche
> +GAUCHE_LICENSE = BSD-3c, Boehm-gc, SRFI (srfi-11.scm), reload (reload.scm)
> +GAUCHE_LICENSE_FILES = COPYING
> +GAUCHE_DEPENDENCIES = host-gauche
> +
> +# Checking c99 support in configure fails without WCHAR. But we do not
> +# need WCHAR at gauche runtime, so explicitly specify here.

This explanation doesn't seem properly worded, because it doesn't at
all explain why passing -std=gnu99 is solving a wchar problem.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
