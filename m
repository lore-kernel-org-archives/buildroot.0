From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 14 Apr 2013 21:36:18 +0200
Subject: [Buildroot] [PATCH] package: add libwebsockets
In-Reply-To: <1360150139-6879-1-git-send-email-andreas.wetzel@nanotronic.ch>
 (Andreas Wetzel's message of "Wed, 6 Feb 2013 12:28:59 +0100")
References: <1360150139-6879-1-git-send-email-andreas.wetzel@nanotronic.ch>
Message-ID: <871uacq4zx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andreas" == Andreas Wetzel <andreas.wetzel@nanotronic.ch> writes:

 Andreas> Signed-off-by: Andreas Wetzel <andreas.wetzel@nanotronic.ch>
 Andreas> ---
 Andreas>  package/Config.in                      |    1 +
 Andreas>  package/libwebsockets/Config.in        |    8 ++++++++
 Andreas>  package/libwebsockets/libwebsockets.mk |   15 +++++++++++++++
 Andreas>  3 files changed, 24 insertions(+)
 Andreas>  create mode 100644 package/libwebsockets/Config.in
 Andreas>  create mode 100644 package/libwebsockets/libwebsockets.mk

 Andreas> diff --git a/package/Config.in b/package/Config.in
 Andreas> index 15d7ad6..dc0a80d 100644
 Andreas> --- a/package/Config.in
 Andreas> +++ b/package/Config.in
 Andreas> @@ -476,6 +476,7 @@ source "package/libtirpc/Config.in"
 Andreas>  source "package/libtorrent/Config.in"
 Andreas>  source "package/libupnp/Config.in"
 Andreas>  source "package/libvncserver/Config.in"
 Andreas> +source "package/libwebsockets/Config.in"
 Andreas>  source "package/nss-mdns/Config.in"
 Andreas>  source "package/ortp/Config.in"
 Andreas>  source "package/zeromq/Config.in"
 Andreas> diff --git a/package/libwebsockets/Config.in b/package/libwebsockets/Config.in
 Andreas> new file mode 100644
 Andreas> index 0000000..c4d3beb
 Andreas> --- /dev/null
 Andreas> +++ b/package/libwebsockets/Config.in
 Andreas> @@ -0,0 +1,8 @@
 Andreas> +config BR2_PACKAGE_LIBWEBSOCKETS
 Andreas> +	bool "libwebsockets"
 Andreas> +	help

You forgot to select BR2_PACKAGE_ZLIB, otherwise it looks good -
Committed with that fixed, thanks.

I see that there's newer releases than 1.1. Care to send a followup
patch to bump the version?

-- 
Bye, Peter Korsgaard
