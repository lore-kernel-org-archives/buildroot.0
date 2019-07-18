From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jul 2019 22:27:38 +0200
Subject: [Buildroot] [PATCH v2] package/python-idna: select
 PYTHON3_UNICODEDATA
In-Reply-To: <20190717191215.61153-1-alex_y_xu@yahoo.ca>
References: <20190717084347.784866e3@windsurf>
 <20190717191215.61153-1-alex_y_xu@yahoo.ca>
Message-ID: <20190718222738.6db4d00d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alex,

Thanks for the new iteration of the patch. There was still an issue,
but see below.

On Wed, 17 Jul 2019 15:12:15 -0400
"Alex Xu (Hello71)" <alex_y_xu@yahoo.ca> wrote:

> diff --git a/package/python-idna/Config.in b/package/python-idna/Config.in
> index 1fd56ceaf6..ddc2cd7d17 100644
> --- a/package/python-idna/Config.in
> +++ b/package/python-idna/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_PYTHON_IDNA
>  	bool "python-idna"
> +	select BR2_PACKAGE_PYTHON3_UNICODEDATA

This only takes care of the case where python3 is used, by python-idna
can also be used when python (2.x) is selected.

So I changed this to:

+       select BR2_PACKAGE_PYTHON_UNICODEDATA if BR2_PACKAGE_PYTHON
+       select BR2_PACKAGE_PYTHON3_UNICODEDATA if BR2_PACKAGE_PYTHON3

and applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
