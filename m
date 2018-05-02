From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 May 2018 14:52:56 +0200
Subject: [Buildroot] [PATCH] package/python: add upstream GCC8 build fix
In-Reply-To: <20180502111448.14995-1-chemobejk@gmail.com>
References: <20180502111448.14995-1-chemobejk@gmail.com>
Message-ID: <20180502145256.6dec17cc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Stefan,

On Wed,  2 May 2018 14:14:48 +0300, Stefan Becker wrote:
> Fedora 28 switched to GCC8.
> 
> Signed-off-by: Stefan Becker <chemobejk@gmail.com>

I've applied, after fixing one small formatting issue, see below.

> ---
>  package/python/0035-GCC8-alignment-fix.patch | 66 ++++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 package/python/0035-GCC8-alignment-fix.patch
> 
> diff --git a/package/python/0035-GCC8-alignment-fix.patch b/package/python/0035-GCC8-alignment-fix.patch
> new file mode 100644
> index 0000000000..34618d9b18
> --- /dev/null
> +++ b/package/python/0035-GCC8-alignment-fix.patch
> @@ -0,0 +1,66 @@
> +From 0b91f8a668201fc58fa732b8acc496caedfdbae0 Mon Sep 17 00:00:00 2001
> +From: Florian Weimer <fw@deneb.enyo.de>
> +Date: Sun, 29 Apr 2018 12:18:33 -0700
> +Subject: [PATCH] Indicate that _PyGC_Head is only 8-byte aligned. (closes
> + bpo-33374)
> +
> +By spec, the "long double" in _PyGC_Head requires the union to always be 16-byte
> +aligned. However, obmalloc only yields 8-byte alignment. Compilers including GCC
> +8 are starting to use alignment information to do store-merging. So, the "long
> +double" needs to be changed to a simple "double" as was long ago done in Python
> +3 by e348c8d154cf6342c79d627ebfe89dfe9de23817. For 2.7, we need to add some
> +dummy padding to make sure _PyGC_Head stays the same size.

The Upstream status and SoB should have been here.

> +---
> + Include/objimpl.h                                       | 17 ++++++++++++++++-
> + .../2018-04-29-12-07-00.bpo-33374.-xegL6.rst            |  3 +++
> + 2 files changed, 19 insertions(+), 1 deletion(-)
> + create mode 100644 Misc/NEWS.d/next/Core and Builtins/2018-04-29-12-07-00.bpo-33374.-xegL6.rst
> +
> +Upstream: https://bugs.python.org/issue33374
> +Signed-off-by: Stefan Becker <chemobejk@gmail.com>

Not here.

Once again: applied with this issue fixed. Thanks a lot!

Peter: I guess we want this as well for 2018.02.x.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
