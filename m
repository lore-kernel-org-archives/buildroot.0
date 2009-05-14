From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 14 May 2009 17:28:09 +0200
Subject: [Buildroot] [PATCH] CUPS requires stack protection support
In-Reply-To: <1242251013-25228-4-git-send-email-thiago.correa@gmail.com>
	(root's message of "Wed\, 13 May 2009 18\:43\:26 -0300")
References: <1242251013-25228-1-git-send-email-thiago.correa@gmail.com>
	<1242251013-25228-2-git-send-email-thiago.correa@gmail.com>
	<1242251013-25228-3-git-send-email-thiago.correa@gmail.com>
	<1242251013-25228-4-git-send-email-thiago.correa@gmail.com>
Message-ID: <873ab7r9fa.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "root" == root  <thiago.correa@gmail.com> writes:

 root> Signed-off-by: Thiago A. Correa <thiago.correa@gmail.com>
 root> ---
 root>  package/cups/Config.in |    4 ++++
 root>  1 files changed, 4 insertions(+), 0 deletions(-)

 root> diff --git a/package/cups/Config.in b/package/cups/Config.in
 root> index 8b1f8a5..27611e1 100644
 root> --- a/package/cups/Config.in
 root> +++ b/package/cups/Config.in
 root> @@ -1,6 +1,10 @@
 root>  config BR2_PACKAGE_CUPS
 root>  	bool "cups"
 root> +	depends on BR2_USE_SSP
 root>  	help
 root>  	  The Common Unix Printing System
 
 root>  	  http://www.cups.org
 root> +
 root> +comment "cups requires a toolchain with Stack Protection support"
 root> +	depends on !BR2_USE_SSP

That's hard to believe as we until very recently had broken SSP
support. Looking closer at it, it's just the configure script being
broken. I've fixed it (21c5e5d0d0f8ae0).

-- 
Bye, Peter Korsgaard
