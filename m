From: Petr Vorel <petr.vorel@gmail.com>
Date: Sat, 8 Jun 2019 00:12:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/iputils: fix static build with
 gcrypt
In-Reply-To: <20190607214931.30262-1-fontaine.fabrice@gmail.com>
References: <20190607214931.30262-1-fontaine.fabrice@gmail.com>
Message-ID: <20190607221224.GA4673@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> Fixes:
>  - http://autobuild.buildroot.net/results/fb698e3e903869978bd5e69d791ec362317b7981

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...n.build-fix-static-build-with-gcrypt.patch | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 package/iputils/0002-meson.build-fix-static-build-with-gcrypt.patch

> diff --git a/package/iputils/0002-meson.build-fix-static-build-with-gcrypt.patch b/package/iputils/0002-meson.build-fix-static-build-with-gcrypt.patch
> new file mode 100644
> index 0000000000..de58b7e03e
> --- /dev/null
> +++ b/package/iputils/0002-meson.build-fix-static-build-with-gcrypt.patch
> @@ -0,0 +1,55 @@
> +From 940f19a51e334ac23a4bc43bbcb17dfc5cea3cf0 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Fri, 7 Jun 2019 23:17:13 +0200
> +Subject: [PATCH] meson.build: fix static build with gcrypt
> +
> +Use dependency instead of cc.find_library to find gcrypt dependencies
> +such as gpg-error otherwise static build will fail
> +
> +Fixes:
> + - http://autobuild.buildroot.net/results/fb698e3e903869978bd5e69d791ec362317b7981
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/iputils/iputils/pull/185]
for reviewers: nack as this one is broken.

Kind regards,
Petr
