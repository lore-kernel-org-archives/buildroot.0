From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Aug 2018 12:03:09 +0200
Subject: [Buildroot] [PATCH next] package/asterisk: fix compilation with
 libsrtp 2.2.0
In-Reply-To: <20180823072615.32065-1-yann.morin.1998@free.fr>
References: <20180823072615.32065-1-yann.morin.1998@free.fr>
Message-ID: <20180823120309.08a04ced@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Thu, 23 Aug 2018 09:26:15 +0200, Yann E. MORIN wrote:

> diff --git a/package/asterisk/0007-res_srtp-Add-support-for-libsrtp2-with-AES-GCM.patch b/package/asterisk/0007-res_srtp-Add-support-for-libsrtp2-with-AES-GCM.patch
> new file mode 100644
> index 0000000000..65ebe06582
> --- /dev/null
> +++ b/package/asterisk/0007-res_srtp-Add-support-for-libsrtp2-with-AES-GCM.patch
> @@ -0,0 +1,171 @@
> +From 95b45d1c46b35232ee0b9bdb3135b080c164c7c6 Mon Sep 17 00:00:00 2001
> +From: Alexander Traud <pabstraud@compuserve.com>
> +Date: Wed, 18 Oct 2017 10:30:25 +0200
> +Subject: [PATCH] res_srtp: Add support for libsrtp2 with AES-GCM.
> +
> +Beside allowing AES-GCM again, this adds AES-192 again.
> +
> +ASTERISK-27356
> +
> +Change-Id: Ia97a435faf26300335d9552fa676b5d17e5f7233
> +[yann.morin.1998 at free.fr: backport from upstream]
> +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +---
> + configure              | 104 +++++++++++++++++++++++++++++++++++++++++++++++++

The asterisk package has ASTERISK_AUTORECONF = YES, so carrying the
changes to the configure file doesn't seem to be very useful.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
