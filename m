From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 5 Sep 2018 10:57:52 +0200
Subject: [Buildroot] [PATCH] qt5location: fix build failure due to
 missing qt5base gui dependency
In-Reply-To: <20180905085622.89013-1-giulio.benetti@micronovasrl.com>
References: <20180905085622.89013-1-giulio.benetti@micronovasrl.com>
Message-ID: <00486062-7013-e0c3-724f-a07ad836f9d0@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Il 05/09/2018 10:56, Giulio Benetti ha scritto:
> qt5location fails to build due to missing Qt5 Gui module.
> In configure.json features.opengl is referred, but it is available only
> if qt5base gui submodule is built.
> 
> Add BR2_PACKAGE_QT5BASE_GUI to qt5location Config.in to assure gui
> submodule is built before qt5location.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>   package/qt5/qt5location/Config.in | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/qt5/qt5location/Config.in b/package/qt5/qt5location/Config.in
> index e1778182a0..7c39979eff 100644
> --- a/package/qt5/qt5location/Config.in
> +++ b/package/qt5/qt5location/Config.in
> @@ -1,6 +1,7 @@
>   config BR2_PACKAGE_QT5LOCATION
>   	bool "qt5location"
>   	select BR2_PACKAGE_QT5BASE
> +	select BR2_PACKAGE_QT5BASE_GUI
>   	help
>   	  Qt is a cross-platform application and UI framework for
>   	  developers using C++.
> 

Sorry
Fixes: list is missing in commit log.
I resend with it in v2.

Giulio
