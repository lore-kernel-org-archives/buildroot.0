From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Nov 2013 13:07:41 +0100
Subject: [Buildroot] [PATCH v2 1/2] qt: Disable QtScript on MIPS64
In-Reply-To: <1385572207-44666-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1385572207-44666-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20131128130741.085cb04e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Wed, 27 Nov 2013 17:10:06 +0000, Vicente Olivert Riera wrote:

> diff --git a/package/qt/Config.in b/package/qt/Config.in
> index 2651d55..dd2b6d9 100644
> --- a/package/qt/Config.in
> +++ b/package/qt/Config.in
> @@ -385,6 +385,7 @@ config BR2_PACKAGE_QT_OPENSSL
>  
>  config BR2_PACKAGE_QT_SCRIPT
>  	bool "Script Module"
> +	depends on BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT

I'm wondering if we shouldn't rename this option to something more
exact: ARCH_SUPPORTS_JAVASCRIPTCORE. But I don't know, and we don't
have well established best practices for this kind of things.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
