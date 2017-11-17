From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Nov 2017 21:40:45 +0100
Subject: [Buildroot] [PATCH v3 1/2] libkrb5: New package
In-Reply-To: <1510859154-26878-1-git-send-email-nerv@dawncrow.de>
References: <1510859154-26878-1-git-send-email-nerv@dawncrow.de>
Message-ID: <20171117214045.1563ed6f@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 Nov 2017 20:05:53 +0100, Andr? Hentschel wrote:

> diff --git a/package/libkrb5/0001-cross-compile.patch b/package/libkrb5/0001-cross-compile.patch
> new file mode 100644
> index 0000000..13a29bb
> --- /dev/null
> +++ b/package/libkrb5/0001-cross-compile.patch
> @@ -0,0 +1,39 @@
> +Add sane assumptions about cross-compiling
> +
> +Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>

You should be able to replace this patch with:

LIBKRB5_CONF_ENV = \
	ac_cv_printf_positional=yes \
	ac_cv_func_regcomp=yes \
	krb5_cv_attr_constructor_destructor=yes

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
