From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 18 Jun 2013 08:48:33 +0200
Subject: [Buildroot] [PATCH] dhcpcd: new package
In-Reply-To: <1362964994-32042-1-git-send-email-john@stilen.com> (John Stile's
 message of "Sun, 10 Mar 2013 18:23:14 -0700")
References: <1362964994-32042-1-git-send-email-john@stilen.com>
Message-ID: <874ncvsym6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "John" == John Stile <john@stilen.com> writes:

 John> From: John Stile <johns@msli.com>
 John> Dhcpcd is an RFC2131 compliant DHCP client.

 John> Signed-off-by: John Stile <john@stilen.com>
 John> ---
 John>  package/Config.in        |  1 +
 John>  package/dhcpcd/Config.in |  7 +++++++
 John>  package/dhcpcd/dhcpcd.mk | 43 +++++++++++++++++++++++++++++++++++++++++++
 John>  3 files changed, 51 insertions(+)
 John>  create mode 100644 package/dhcpcd/Config.in
 John>  create mode 100644 package/dhcpcd/dhcpcd.mk

 John> diff --git a/package/Config.in b/package/Config.in
 John> index 0ba7762..4bfa1e7 100644
 John> --- a/package/Config.in
 John> +++ b/package/Config.in
 John> @@ -634,6 +634,7 @@ source "package/cups/Config.in"
 John>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 John>  source "package/dhcp/Config.in"
 John>  endif
 John> +source "package/dhcpcd/Config.in"
 John>  source "package/dhcpdump/Config.in"
 John>  source "package/dnsmasq/Config.in"
 John>  source "package/dropbear/Config.in"
 John> diff --git a/package/dhcpcd/Config.in b/package/dhcpcd/Config.in
 John> new file mode 100644
 John> index 0000000..152d7f3
 John> --- /dev/null
 John> +++ b/package/dhcpcd/Config.in
 John> @@ -0,0 +1,7 @@
 John> +config BR2_PACKAGE_DHCPCD
 John> +	bool "dhcpcd"
 John> +	help

It needs IPv6 support in the toolchain, so it need to depend on
BR2_INET_IPV6 and show a comment if not available.

 John> +	  An RFC2131 compliant DHCP client
 John> +	  NOTE: If uClibc, depends on  UCLIBC_SUPPORT_AI_ADDRCONFIG=y

Our default uClibc defconfig has AI_ADDRCONFIG enabled, so I dropped
this line.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
