From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 21 Jul 2013 23:53:21 +0200
Subject: [Buildroot] [PATCH 1/1] netcat6: new package
In-Reply-To: <1374260280-514-1-git-send-email-tjlee@ambarella.com> (Tzu-Jung
 Lee's message of "Sat, 20 Jul 2013 02:58:00 +0800")
References: <1374260280-514-1-git-send-email-tjlee@ambarella.com>
Message-ID: <87a9lfshpq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "T" == Tzu-Jung Lee <roylee17@gmail.com> writes:

 T> Signed-off-by: Tzu-Jung Lee <tjlee@ambarella.com>
 T> ---
 T>  package/Config.in          |  1 +
 T>  package/netcat6/Config.in  | 12 ++++++++++++
 T>  package/netcat6/netcat6.mk | 13 +++++++++++++
 T>  3 files changed, 26 insertions(+)
 T>  create mode 100644 package/netcat6/Config.in
 T>  create mode 100644 package/netcat6/netcat6.mk

 T> diff --git a/package/Config.in b/package/Config.in
 T> index 286a605..df7da83 100644
 T> --- a/package/Config.in
 T> +++ b/package/Config.in
 T> @@ -760,6 +760,7 @@ source "package/ncftp/Config.in"
 T>  source "package/ndisc6/Config.in"
 T>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 T>  source "package/netcat/Config.in"
 T> +source "package/nc6/Config.in"

You called the package netcat6, not nc6. Did you test your patch before
submitting?


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

What is the difference with the normal GNU netcat and this one?

The description and download URL seems to be identatical to the existing
GNU netcat package.

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

>>> netcat6 1.0 Downloading
--2013-07-21 20:34:30--  http://downloads.sourceforge.net/project/netcat/netcat/1.0/nc6-1.0.tar.bz2
Resolving downloads.sourceforge.net (downloads.sourceforge.net)... 216.34.181.59
Connecting to downloads.sourceforge.net (downloads.sourceforge.net)|216.34.181.59|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2013-07-21 20:34:30 ERROR 404: Not Found.

So what is that supposed to mean?

-- 
Bye, Peter Korsgaard
