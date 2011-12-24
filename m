From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 Dec 2011 10:38:51 +0100
Subject: [Buildroot] [PATCH] Xorg and Tslib
In-Reply-To: <CAKm6Z3UVRFhfa68gRWXu0Oj1UD0vGh6T0p93uL8C=r2xt_ijgQ@mail.gmail.com>
References: <CAKm6Z3Vnevex7hjJo7DxQRX_pnS6L1foeih=m=cQgttG7ZeaNQ@mail.gmail.com>
 <CAKm6Z3UVRFhfa68gRWXu0Oj1UD0vGh6T0p93uL8C=r2xt_ijgQ@mail.gmail.com>
Message-ID: <20111224103851.364e126a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Fri, 23 Dec 2011 20:07:21 -0200,
Sergio Prado <sergiosiena@gmail.com> a ?crit :

> Sorry, I forgot to send it in rich text format. Here is the patch again:

Please don't include "personal" messages before the "---". Everything
which is placed before this "---" marker ends up inside the commit
message which is stored forever in the Git history.

Moreover, you should add a Signed-off-by: line to your patch. Some
further comments below.

> +++ b/package/x11r7/xdriver_xf86-input-tslib/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_XDRIVER_XF86_INPUT_TSLIB
> + bool "xf86-input-tslib"
> + select BR2_PACKAGE_XPROTO_INPUTPROTO
> + select BR2_PACKAGE_XSERVER_XORG_SERVER
> + select BR2_PACKAGE_XPROTO_RANDRPROTO
> + select BR2_PACKAGE_XPROTO_XPROTO
> + help
> +  Touch screen library input driver

Indentation broken here, but it was correct in your first patch. Since
your patch is also word-wrapped, I'd recommend either to fix your
e-mail client, or better, to use "git send-email" to send your patches
(this way you're sure that your e-mail client will not do evil things
with the patches).

> +XDRIVER_XF86_INPUT_TSLIB_VERSION = 0.0.6
> +XDRIVER_XF86_INPUT_TSLIB_SOURCE =
> xf86-input-tslib_$(XDRIVER_XF86_INPUT_TSLIB_VERSION).orig.tar.gz
> +XDRIVER_XF86_INPUT_TSLIB_SITE =
> http://ftp.de.debian.org/debian/pool/main/x/xf86-input-tslib/

Instead of Debian, could you use the upstream version available at
http://www.ptxdist.org/software/xf86-input-tslib/download/ ?

> +XDRIVER_XF86_INPUT_TSLIB_AUTORECONF = NO

Not needed, this is the default.

> +$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-input-tslib))

Since Buildroot 2011.11, this line should be simply:

$(eval $(call AUTOTARGETS))

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
