From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Feb 2020 20:39:08 +0100
Subject: [Buildroot] [PATCH] package/libxml2: add upstream security fix
 for CVE-2019-20388
In-Reply-To: <20200217121626.31154-1-patrickdepinguin@gmail.com>
References: <20200217121626.31154-1-patrickdepinguin@gmail.com>
Message-ID: <20200217203908.19c223e9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Feb 2020 13:16:25 +0100
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> Fixes CVE-2019-20388: xmlSchemaPreRun in xmlschemas.c in libxml2 2.9.10
> allows an xmlSchemaValidateStream memory leak.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  ...mory-leak-in-xmlSchemaValidateStream.patch | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/libxml2/0002-Fix-memory-leak-in-xmlSchemaValidateStream.patch
> 
> diff --git a/package/libxml2/0002-Fix-memory-leak-in-xmlSchemaValidateStream.patch b/package/libxml2/0002-Fix-memory-leak-in-xmlSchemaValidateStream.patch
> new file mode 100644
> index 0000000000..49ff6fbe00
> --- /dev/null
> +++ b/package/libxml2/0002-Fix-memory-leak-in-xmlSchemaValidateStream.patch
> @@ -0,0 +1,33 @@
> +From 7ffcd44d7e6c46704f8af0321d9314cd26e0e18a Mon Sep 17 00:00:00 2001
> +From: Zhipeng Xie <xiezhipeng1@huawei.com>
> +Date: Tue, 20 Aug 2019 16:33:06 +0800
> +Subject: [PATCH] Fix memory leak in xmlSchemaValidateStream
> +
> +When ctxt->schema is NULL, xmlSchemaSAXPlug->xmlSchemaPreRun
> +alloc a new schema for ctxt->schema and set vctxt->xsiAssemble
> +to 1. Then xmlSchemaVStart->xmlSchemaPreRun initialize
> +vctxt->xsiAssemble to 0 again which cause the alloced schema
> +can not be freed anymore.
> +
> +Found with libFuzzer.
> +
> +Signed-off-by: Zhipeng Xie <xiezhipeng1@huawei.com>

Thanks Thomas for sending security patches! :-)

We request patches to have a SoB line from the person submitting them.
Could you add your SoB here ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
