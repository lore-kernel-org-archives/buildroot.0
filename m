From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 27 Jun 2011 00:49:51 +0200
Subject: [Buildroot] [buildroot v2] Add libiqrf package.
In-Reply-To: <1305734907-2692-1-git-send-email-marek.belisko@open-nandra.com>
 (Marek Belisko's message of "Wed, 18 May 2011 18:08:27 +0200")
References: <1305734907-2692-1-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <87y60o5htc.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Marek" == Marek Belisko <marek.belisko@open-nandra.com> writes:

 Marek> Libiqrf is library written in C which implement specific iqrf
 Marek> protocol to communicate with iqrf usb devices (http://iqrf.org).

Thanks, committed with minor tweaks.

 Marek> Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
 Marek> ---
 Marek>  package/Config.in          |    1 +
 Marek>  package/libiqrf/Config.in  |   13 +++++++++++++
 Marek>  package/libiqrf/libiqrf.mk |   14 ++++++++++++++
 Marek>  3 files changed, 28 insertions(+), 0 deletions(-)
 Marek>  create mode 100644 package/libiqrf/Config.in
 Marek>  create mode 100644 package/libiqrf/libiqrf.mk

 Marek> diff --git a/package/Config.in b/package/Config.in
 Marek> index 5e48ab7..d5039b6 100644
 Marek> --- a/package/Config.in
 Marek> +++ b/package/Config.in
 Marek> @@ -298,6 +298,7 @@ source "package/libaio/Config.in"
 Marek>  source "package/libraw1394/Config.in"
 Marek>  source "package/tslib/Config.in"
 Marek>  source "package/libhid/Config.in"
 Marek> +source "package/libiqrf/Config.in"
 Marek>  source "package/libusb/Config.in"
 Marek>  source "package/libusb-compat/Config.in"
 Marek>  source "package/python-serial/Config.in"
 Marek> diff --git a/package/libiqrf/Config.in b/package/libiqrf/Config.in
 Marek> new file mode 100644
 Marek> index 0000000..a95c4d9
 Marek> --- /dev/null
 Marek> +++ b/package/libiqrf/Config.in
 Marek> @@ -0,0 +1,13 @@
 Marek> +config BR2_PACKAGE_LIBIQRF
 Marek> +        bool "libiqrf"
 Marek> +        depends on BR2_PACKAGE_LIBUSB

These lines should be indented using <tab> rather than spaces. We
normally use 'select' rather than 'depends on' for libraries.

-- 
Bye, Peter Korsgaard
