From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Mar 2018 23:25:01 +0200
Subject: [Buildroot] [PATCH 1/1] safeclib: fix build without wchar and
 host-doxygen
In-Reply-To: <20180315193711.11437-1-fontaine.fabrice@gmail.com>
References: <20180315193711.11437-1-fontaine.fabrice@gmail.com>
Message-ID: <20180325232501.5e846351@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 15 Mar 2018 20:37:11 +0100, Fabrice Fontaine wrote:

> diff --git a/package/safeclib/0001-Add-disable-doc-option.patch b/package/safeclib/0001-Add-disable-doc-option.patch
> new file mode 100644
> index 0000000000..67c48906f3
> --- /dev/null
> +++ b/package/safeclib/0001-Add-disable-doc-option.patch
> @@ -0,0 +1,58 @@
> +From 0d56b6327f6b652511c3e4c72382f4dc4d194e10 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Thu, 15 Mar 2018 20:12:28 +0100
> +Subject: [PATCH] Add --disable-doc option
> +
> +This option allows the user to disable man pages even if pod2man and
> +doxygen programs are found
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Since it has been applied upstream now, I've added a reference to the
upstream commit here.

> ++AC_ARG_ENABLE(doc,
> ++	AS_HELP_STRING([--disable-doc],
> ++	               [disable documentation @<:@default=no@:>@]),
> ++	[case "${enableval}" in
> ++	yes) enable_doc=true ;;
> ++	no)  enable_doc=false ;;
> ++	*)   AC_MSG_ERROR([bad value ${enableval} for --enable-doc]) ;;

I haven't seen many configure.ac scripts that do this. Most simply do:

	enable_doc=${enableval}

and that's it.

But OK, it's been accepted upstream, so I don't care :)

Patch applied to master. Thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
