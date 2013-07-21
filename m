From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 21 Jul 2013 23:55:29 +0200
Subject: [Buildroot] [PATCH v2 1/1] netcat6: new package
In-Reply-To: <1374280279-32703-1-git-send-email-tjlee@ambarella.com> (Tzu-Jung
 Lee's message of "Sat, 20 Jul 2013 08:31:19 +0800")
References: <1374280279-32703-1-git-send-email-tjlee@ambarella.com>
Message-ID: <8738r7shm6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "T" == Tzu-Jung Lee <roylee17@gmail.com> writes:

 T> Change-Id: I9bc6ef244276f26ff6e4149677cd3a3d8f2de0c2
 T> Signed-off-by: Tzu-Jung Lee <tjlee@ambarella.com>
 T> ---

Please document (under the --- line) what you have changed when you send
updated patches.

 T>  package/Config.in          |  1 +
 T>  package/netcat6/Config.in  | 12 ++++++++++++
 T>  package/netcat6/netcat6.mk | 13 +++++++++++++
 T>  3 files changed, 26 insertions(+)
 T>  create mode 100644 package/netcat6/Config.in
 T>  create mode 100644 package/netcat6/netcat6.mk

 T> diff --git a/package/Config.in b/package/Config.in
 T> index 286a605..b8011c7 100644
 T> --- a/package/Config.in
 T> +++ b/package/Config.in
 T> @@ -760,6 +760,7 @@ source "package/ncftp/Config.in"
 T>  source "package/ndisc6/Config.in"
 T>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 T>  source "package/netcat/Config.in"
 T> +source "package/netcat6/Config.in"
 T>  source "package/netkitbase/Config.in"
 T>  source "package/netkittelnet/Config.in"
 T>  endif
 T> diff --git a/package/netcat6/Config.in b/package/netcat6/Config.in
 T> new file mode 100644
 T> index 0000000..68cf2dc
 T> --- /dev/null
 T> +++ b/package/netcat6/Config.in
 T> @@ -0,0 +1,12 @@
 T> +config BR2_PACKAGE_NETCAT6
 T> +	bool "netcat6"
 T> +	help
 T> +	  Netcat is a featured networking utility which reads and writes data
 T> +	  across network connections, using the TCP/IP protocol.
 T> +	  It is designed to be a reliable "back-end" tool that can be used
 T> +	  directly or easily driven by other programs and scripts. At the
 T> +	  same time, it is a feature-rich network debugging and exploration
 T> +	  tool, since it can create almost any kind of connection you would
 T> +	  need and has several interesting built-in capabilities.
 T> +
 T> +	  http://netcat.sourceforge.net/download.php
 T> diff --git a/package/netcat6/netcat6.mk b/package/netcat6/netcat6.mk
 T> new file mode 100644
 T> index 0000000..7cf900c
 T> --- /dev/null
 T> +++ b/package/netcat6/netcat6.mk
 T> @@ -0,0 +1,13 @@
 T> +#############################################################
 T> +#
 T> +# netcat6
 T> +#
 T> +#############################################################
 T> +
 T> +NETCAT6_VERSION = 1.0
 T> +NETCAT6_SOURCE = nc6-$(NETCAT6_VERSION).tar.bz2
 T> +NETCAT6_SITE = http://downloads.sourceforge.net/project/netcat/netcat/$(NETCAT6_VERSION)
 T> +NETCAT6_LICENSE = GPLv2+
 T> +NETCAT6_LICENSE_FILES = COPYING
 T> +
 T> +$(eval $(autotools-package))
 T> -- 
 T> 1.8.3.2

 T> _______________________________________________
 T> buildroot mailing list
 T> buildroot at busybox.net
 T> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
