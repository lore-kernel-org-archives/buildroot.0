From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 23 Apr 2013 22:19:17 +0200
Subject: [Buildroot] [PATCH] zyre: new package
In-Reply-To: <1365971582-19802-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Sun, 14 Apr 2013 21:33:01 +0100")
References: <1365971582-19802-1-git-send-email-spdawson@gmail.com>
Message-ID: <87k3ntc856.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 spdawson> From: Simon Dawson <spdawson@gmail.com>
 spdawson> Signed-off-by: Simon Dawson <spdawson@gmail.com>
 spdawson> ---
 spdawson>  package/Config.in      |    1 +
 spdawson>  package/zyre/Config.in |   13 +++++++++++++
 spdawson>  package/zyre/zyre.mk   |   22 ++++++++++++++++++++++
 spdawson>  3 files changed, 36 insertions(+)
 spdawson>  create mode 100644 package/zyre/Config.in
 spdawson>  create mode 100644 package/zyre/zyre.mk

 spdawson> diff --git a/package/Config.in b/package/Config.in
 spdawson> index 322e005..342e92e 100644
 spdawson> --- a/package/Config.in
 spdawson> +++ b/package/Config.in
 spdawson> @@ -543,6 +543,7 @@ source "package/slirp/Config.in"
 spdawson>  source "package/usbredir/Config.in"
 spdawson>  source "package/zeromq/Config.in"
 spdawson>  source "package/zmqpp/Config.in"
 spdawson> +source "package/zyre/Config.in"
 spdawson>  endmenu
 
 spdawson>  menu "Other"
 spdawson> diff --git a/package/zyre/Config.in b/package/zyre/Config.in
 spdawson> new file mode 100644
 spdawson> index 0000000..f839a5d
 spdawson> --- /dev/null
 spdawson> +++ b/package/zyre/Config.in
 spdawson> @@ -0,0 +1,13 @@
 spdawson> +config BR2_PACKAGE_ZYRE
 spdawson> +	bool "zyre"
 spdawson> +	depends on BR2_INSTALL_LIBSTDCPP # filemq
 spdawson> +	depends on BR2_INET_IPV6 # filemq
 spdawson> +	depends on BR2_LARGEFILE # filemq
 spdawson> +	depends on BR2_USE_WCHAR # filemq
 spdawson> +	depends on BR2_TOOLCHAIN_HAS_THREADS # filemq
 spdawson> +	select BR2_PACKAGE_FILEMQ
 spdawson> +	help
 spdawson> +	  An open-source framework for proximity-based peer-to-peer
 spdawson> +	  applications.
 spdawson> +
 spdawson> +	  http://zyre.org

It should also show a comment if those toolchain options aren't
enabled. I've fixed that and committed, thanks.


 spdawson> diff --git a/package/zyre/zyre.mk b/package/zyre/zyre.mk
 spdawson> new file mode 100644
 spdawson> index 0000000..6e295df
 spdawson> --- /dev/null
 spdawson> +++ b/package/zyre/zyre.mk
 spdawson> @@ -0,0 +1,22 @@
 spdawson> +#############################################################
 spdawson> +#
 spdawson> +# zyre
 spdawson> +#
 spdawson> +#############################################################
 spdawson> +
 spdawson> +ZYRE_VERSION = 44a57a449a
 spdawson> +ZYRE_SITE = git://github.com/zeromq/zyre.git
 spdawson> +ZYRE_LICENSE = LGPLv3

License is 'any later version', so LGPL3+

-- 
Bye, Peter Korsgaard
