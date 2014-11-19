From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 19 Nov 2014 16:29:27 +0200
Subject: [Buildroot] [PATCH v3 1/2] qt: Script Module needs a toolchain
 with NPTL
In-Reply-To: <1416406684-31038-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1416406684-31038-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20141119142926.GE2374@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vicente,

On Wed, Nov 19, 2014 at 02:18:03PM +0000, Vicente Olivert Riera wrote:
> diff --git a/package/qt/Config.in b/package/qt/Config.in
> index da159b4..2a4bf4e 100644
> --- a/package/qt/Config.in
> +++ b/package/qt/Config.in
> @@ -402,11 +402,16 @@ config BR2_PACKAGE_QT_OPENSSL
>  config BR2_PACKAGE_QT_SCRIPT
>  	bool "Script Module"
>  	depends on BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # needs pthread_getattr_np()

The grantlee selects BR2_PACKAGE_QT_SCRIPT, so this dependency must be added 
there too.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
