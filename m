From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 May 2019 00:32:18 +0200
Subject: [Buildroot] [PATCH 3/3] package/libhtp: add -lz to htp.pc
In-Reply-To: <20190424202118.14795-3-fontaine.fabrice@gmail.com>
References: <20190424202118.14795-1-fontaine.fabrice@gmail.com>
 <20190424202118.14795-3-fontaine.fabrice@gmail.com>
Message-ID: <39348602-af67-f54e-604a-5da668409715@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24/04/2019 22:21, Fabrice Fontaine wrote:
> This will fix static build of suricata
> 
> Fixes:
>  - No autobuilder failures
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

> ---
>  ...002-htp.pc.in-add-lz-to-Libs.private.patch | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 package/libhtp/0002-htp.pc.in-add-lz-to-Libs.private.patch
> 
> diff --git a/package/libhtp/0002-htp.pc.in-add-lz-to-Libs.private.patch b/package/libhtp/0002-htp.pc.in-add-lz-to-Libs.private.patch
> new file mode 100644
> index 0000000000..b5b0c0e2b6
> --- /dev/null
> +++ b/package/libhtp/0002-htp.pc.in-add-lz-to-Libs.private.patch
> @@ -0,0 +1,29 @@
> +From 39e534ab696157b244ec226d649c789dcf423e42 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Wed, 24 Apr 2019 20:48:57 +0200
> +Subject: [PATCH] htp.pc.in: add -lz to Libs.private
> +
> +zlib is a mandatory dependency so add it to Libs.private otherwise
> +static linking iof suricata will fail

 I've slightly reworded this (grammar errors mostly) so you may want to take the
version I committed to push upstream.

 Regards,
 Arnout

> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: not sent yet]
> +---
> + htp.pc.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/htp.pc.in b/htp.pc.in
> +index 2fec995..9b1a6cc 100644
> +--- a/htp.pc.in
> ++++ b/htp.pc.in
> +@@ -7,6 +7,6 @@ Name: @PACKAGE_NAME@
> + Description: A security-aware HTTP parser, designed for use in IDS/IPS and WAF products.
> + Version: @PACKAGE_VERSION@
> + Libs: -L${libdir} -lhtp
> +-Libs.private: @LIBICONV@
> ++Libs.private: -lz @LIBICONV@
> + Cflags: -I${includedir} -I${libdir}/htp/include
> + 
> +-- 
> +2.20.1
> +
> 
