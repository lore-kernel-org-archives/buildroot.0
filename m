From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jun 2016 15:44:02 +0200
Subject: [Buildroot] [PATCH 1/2] package/libmdnsresponder: new package
In-Reply-To: <1466946336-6741-1-git-send-email-bernd.kuhls@t-online.de>
References: <1466946336-6741-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160626154402.00b57836@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 Jun 2016 15:05:35 +0200, Bernd Kuhls wrote:

> diff --git a/package/libmdnsresponder/0001-android-embedded.patch b/package/libmdnsresponder/0001-android-embedded.patch
> new file mode 100644
> index 0000000..e82c352
> --- /dev/null
> +++ b/package/libmdnsresponder/0001-android-embedded.patch
> @@ -0,0 +1,413 @@
> +Add wrapper for mDNSEmbeddedAPI with Bonjour.
> +
> +Downloaded from Kodi:
> +https://github.com/xbmc/xbmc/blob/master/tools/depends/target/mdnsresponder/01-android-embedded.patch
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

This looks like a feature patch... somewhat annoying to have in
Buildroot. Is there any chance of getting this upstream?

> diff --git a/package/libmdnsresponder/libmdnsresponder.mk b/package/libmdnsresponder/libmdnsresponder.mk
> new file mode 100644
> index 0000000..05c54ff
> --- /dev/null
> +++ b/package/libmdnsresponder/libmdnsresponder.mk
> @@ -0,0 +1,31 @@
> +################################################################################
> +#
> +# libmdnsresponder
> +#
> +################################################################################
> +
> +LIBMDNSRESPONDER_VERSION = 625.41.2
> +LIBMDNSRESPONDER_SITE = https://opensource.apple.com/tarballs/mDNSResponder
> +LIBMDNSRESPONDER_SOURCE = mDNSResponder-$(LIBMDNSRESPONDER_VERSION).tar.gz
> +LIBMDNSRESPONDER_LICENSE = \
> +	Apache-2.0, BSD-3c (shared library), GPLv2 (mDnsEmbedded.h), \
> +	NICTA Public Software Licence

This is a somewhat odd combination of licenses. Especially using GPLv2
for a header, when the library itself is BSD-3c.

The main concern is really the feature patch. The rest looks fine.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
