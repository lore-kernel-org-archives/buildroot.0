From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Sep 2014 09:35:25 +0200
Subject: [Buildroot] [PATCH 1/1] qt: make QtDeclarative depend on QtSql
In-Reply-To: <1410488495-2146-1-git-send-email-danomimanchego123@gmail.com>
References: <1410488495-2146-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20140912093525.7df19a22@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Danomi Manchego,

On Thu, 11 Sep 2014 22:21:35 -0400, Danomi Manchego wrote:
> As indicated by QtDeclarative.pc, QtDeclarative needs QtSql.
> It builds fine without it, but then you get a run-time error.
> So add QtSql to the QtDeclarative depends-on list.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> ---
>  package/qt/Config.in |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/qt/Config.in b/package/qt/Config.in
> index da159b4..1f3e5fb 100644
> --- a/package/qt/Config.in
> +++ b/package/qt/Config.in
> @@ -419,6 +419,7 @@ config BR2_PACKAGE_QT_DECLARATIVE
>  	bool "Declarative module"
>  	depends on BR2_PACKAGE_QT_SCRIPT
>  	depends on BR2_PACKAGE_QT_GUI_MODULE
> +	depends on BR2_PACKAGE_QT_SQL_MODULE
>  	help
>  	  Build the Qt Declarative Module for qml support
>  	  if unsure, say n.

Not really related to your patch, but why do we use "depends on"
instead of "select" here? How am I supposed to know that I need to
enable Sql stuff to be able to build the Declarative module?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
