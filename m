From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 26 Apr 2013 12:43:40 +0200
Subject: [Buildroot] [PATCH] neardal: add support for ncl tool
In-Reply-To: <1366971926-16475-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Fri, 26 Apr 2013 11:25:26 +0100")
References: <1366971926-16475-1-git-send-email-spdawson@gmail.com>
Message-ID: <878v458tcz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 spdawson> From: Simon Dawson <spdawson@gmail.com>
 spdawson> Signed-off-by: Simon Dawson <spdawson@gmail.com>
 spdawson> ---
 spdawson>  package/neardal/Config.in  |    6 ++++++
 spdawson>  package/neardal/neardal.mk |    8 ++++++++
 spdawson>  2 files changed, 14 insertions(+)

 spdawson> diff --git a/package/neardal/Config.in b/package/neardal/Config.in
 spdawson> index 045ccee..b3ac67d 100644
 spdawson> --- a/package/neardal/Config.in
 spdawson> +++ b/package/neardal/Config.in
 spdawson> @@ -13,3 +13,9 @@ config BR2_PACKAGE_NEARDAL
 
 spdawson>  comment "neardal requires a toolchain with WCHAR and threads support"
 spdawson>  	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 spdawson> +
 spdawson> +config BR2_PACKAGE_NEARDAL_NCL
 spdawson> +	bool "neardal ncl tool"
 spdawson> +	depends on BR2_PACKAGE_NEARDAL
 spdawson> +	help
 spdawson> +	  Build and install neardal ncl command line interpreter tool.

The sub option should go right after the BR2_PACKAGE_NEARDAL so
menuconfig considers it a sub option and indents it, so I moved it above
the comment and committed, thanks.

-- 
Bye, Peter Korsgaard
