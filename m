From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Jul 2018 22:42:47 +0200
Subject: [Buildroot] [PATCH] qt5base: add comment for qt5webkit examples
In-Reply-To: <20180702122825.14954-1-gael.portay@savoirfairelinux.com>
References: <20180702122825.14954-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180702224247.32e7d5e6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ga?l,

On Mon,  2 Jul 2018 08:28:25 -0400, Ga?l PORTAY wrote:
> Unlike every other Qt5 modules, the examples of QtWebKit are located in
> the dedicated package qt5webkit-examples. This is confusing.
> 
> This commit adds a comment to warn the user that QtWebKit examples are
> available under a dedicated package. The comment shows up in the case
> where the Qt examples is set and qt5webkit-examples is left unset.
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> ---
>  package/qt5/qt5base/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
> index b9aba2d389..35f990b773 100644
> --- a/package/qt5/qt5base/Config.in
> +++ b/package/qt5/qt5base/Config.in
> @@ -42,6 +42,10 @@ config BR2_PACKAGE_QT5BASE_CONFIG_FILE
>  	  This option allows to set the path of such a configuration
>  	  file, which Buildroot will give to Qt at compile time.
>  
> +comment "WebKit examples are available in package qt5webkit-example"
> +	depends on BR2_PACKAGE_QT5BASE_EXAMPLES
> +	depends on !BR2_PACKAGE_QT5WEBKIT_EXAMPLES

We don't typically add such comments, I don't think it's really worth
having it, especially in qt5base.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
