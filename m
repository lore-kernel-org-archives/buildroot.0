From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Apr 2014 00:24:23 +0200
Subject: [Buildroot] [PATCH 3/3] package/zile: add Zile is Lossy Emacs
 editor
In-Reply-To: <1397225156-23112-4-git-send-email-alex.bennee@linaro.org>
References: <1397225156-23112-1-git-send-email-alex.bennee@linaro.org>
 <1397225156-23112-4-git-send-email-alex.bennee@linaro.org>
Message-ID: <20140412002423.3e6bcd0c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alex Benn?e,

On Fri, 11 Apr 2014 15:05:56 +0100, Alex Benn?e wrote:

> diff --git a/package/zile/remove-help2man.patch b/package/zile/remove-help2man.patch
> new file mode 100644
> index 0000000..d397543
> --- /dev/null
> +++ b/package/zile/remove-help2man.patch
> @@ -0,0 +1,30 @@
> +Upstream-Status: Inappropriate [configuration]
> +
> +Signed-off-by: Alex Benn?e <alex.bennee@linaro.org>
> +
> +diff --git a/Makefile.am b/Makefile.am

You're patching Makefile.am here...


> +ZILE_VERSION = 2.4.11
> +ZILE_SITE = http://ftp.gnu.org/gnu/zile/
> +ZILE_LICENSE = GPLv1+
> +ZILE_LICENSE_FILES = COPYING
> +ZILE_CONF_OPT += --without-help2man
> +ZILE_DEPENDANCIES += libgc

but you never mark zile as requiring autoreconf using ZILE_AUTORECONF =
YES. How can this work?

Also, use '=' instead of '+=' above.

And use $(BR2_GNU_MIRROR) for the download URL.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
