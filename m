From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jan 2016 22:56:29 +0100
Subject: [Buildroot] [PATCH 2/2] crudini: new package
In-Reply-To: <1453594504-8725-2-git-send-email-mr.zoltan.gyarmati@gmail.com>
References: <1453594504-8725-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
 <1453594504-8725-2-git-send-email-mr.zoltan.gyarmati@gmail.com>
Message-ID: <20160126225629.39d6f239@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Zoltan Gyarmati,

On Sun, 24 Jan 2016 01:15:04 +0100, Zoltan Gyarmati wrote:

> diff --git a/package/crudini/Config.in b/package/crudini/Config.in
> new file mode 100644
> index 0000000..c677f3b
> --- /dev/null
> +++ b/package/crudini/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_CRUDINI
> +	depends on BR2_PACKAGE_PYTHON
> +	select BR2_PACKAGE_PYTHON_INIPARSE
> +	bool "crudini"

See the documentation which has been recently updated on the ordering
of properties:

+As a convention specific to Buildroot, the ordering of the attributes
+is as follows:
+
+1. The type of option: +bool+, +string+... with the prompt
+2. If needed, the +default+ value(s)
+3. Any dependency of the +depends on+ form
+4. Any dependency of the +select+ form
+5. The help keyword and help text.

Also, please indicate above the select BR2_PACKAGE_PYTHON_INIPARSE that
this is a runtime dependency.

> +	help
> +	  A utility for handling ini files from the command line and shell scripts

Wrap at 72 characters.

> diff --git a/package/crudini/crudini.hash b/package/crudini/crudini.hash
> new file mode 100644
> index 0000000..04e2575
> --- /dev/null
> +++ b/package/crudini/crudini.hash
> @@ -0,0 +1,2 @@
> +#md5 from https://pypi.python.org/pypi?:action=show_md5&digest=7d1313f1bb9800db9cbceaa518bcf212
> +md5    7d1313f1bb9800db9cbceaa518bcf212 crudini-0.7.tar.gz

sha256 hash needed.

Other than that, looks good! Can you fix the minor issues above and
resubmit an updated version?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
