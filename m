From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 30 May 2013 21:26:35 +0200
Subject: [Buildroot] [PATCH v9 11/14] libvpx: new package libvpx
In-Reply-To: <1369931437-12445-12-git-send-email-spenser@gillilanding.com>
 (Spenser Gilliland's message of "Thu, 30 May 2013 11:30:34 -0500")
References: <1369931437-12445-1-git-send-email-spenser@gillilanding.com>
 <1369931437-12445-12-git-send-email-spenser@gillilanding.com>
Message-ID: <87y5awz2tw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Spenser" == Spenser Gilliland <spenser@gillilanding.com> writes:

 Spenser> adds webm multimedia support and the VP8 encoder/decoder library.
 Spenser> http://www.webmproject.org/

 Spenser> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
 Spenser> ---
 Spenser>  package/multimedia/Config.in        |    1 +
 Spenser>  package/multimedia/libvpx/Config.in |    6 ++++
 Spenser>  package/multimedia/libvpx/libvpx.mk |   53 +++++++++++++++++++++++++++++++++++
 Spenser>  3 files changed, 60 insertions(+)
 Spenser>  create mode 100644 package/multimedia/libvpx/Config.in
 Spenser>  create mode 100644 package/multimedia/libvpx/libvpx.mk

 Spenser> diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
 Spenser> index d0594b9..a0927e9 100644
 Spenser> --- a/package/multimedia/Config.in
 Spenser> +++ b/package/multimedia/Config.in
 Spenser> @@ -20,6 +20,7 @@ source "package/multimedia/gst1-plugins-bad/Config.in"
 Spenser>  source "package/multimedia/gst-plugins-ugly/Config.in"
 Spenser>  source "package/multimedia/gst1-plugins-ugly/Config.in"
 Spenser>  source "package/multimedia/lame/Config.in"
 Spenser> +source "package/multimedia/libvpx/Config.in"
 Spenser>  source "package/multimedia/madplay/Config.in"
 Spenser>  source "package/multimedia/mpd/Config.in"
 Spenser>  source "package/multimedia/mpg123/Config.in"
 Spenser> diff --git a/package/multimedia/libvpx/Config.in b/package/multimedia/libvpx/Config.in
 Spenser> new file mode 100644
 Spenser> index 0000000..2327971
 Spenser> --- /dev/null
 Spenser> +++ b/package/multimedia/libvpx/Config.in
 Spenser> @@ -0,0 +1,6 @@
 Spenser> +config BR2_PACKAGE_LIBVPX
 Spenser> +	bool "libvpx"
 Spenser> +	help
 Spenser> +	  a high-quality, open video format that's freely available to everyone.
 Spenser> +
 Spenser> +	  http://webmproject.org
 Spenser> diff --git a/package/multimedia/libvpx/libvpx.mk b/package/multimedia/libvpx/libvpx.mk
 Spenser> new file mode 100644
 Spenser> index 0000000..964d98a
 Spenser> --- /dev/null
 Spenser> +++ b/package/multimedia/libvpx/libvpx.mk
 Spenser> @@ -0,0 +1,53 @@
 Spenser> +#############################################################
 Spenser> +#
 Spenser> +# libvpx
 Spenser> +#
 Spenser> +#############################################################
 Spenser> +
 Spenser> +LIBVPX_VERSION = v1.2.0
 Spenser> +LIBVPX_SITE = http://git.chromium.org/webm/libvpx.git
 Spenser> +LIBVPX_SITE_METHOD = git
 Spenser> +
 Spenser> +LIBVPX_LICENSE = BSD-3c 
 Spenser> +LIBVPX_LICENSE_FILES = LICENSE PATENTS 

Trailing spaces. Otherwise looks good, committed to next - Thanks.

-- 
Bye, Peter Korsgaard
