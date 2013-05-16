From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 16 May 2013 07:59:31 +0200
Subject: [Buildroot] [PATCH] qt5 libQt5OpenGL.so library installation
In-Reply-To: <1368650084-24427-1-git-send-email-wojciech.slenska@gmail.com>
References: <1368650084-24427-1-git-send-email-wojciech.slenska@gmail.com>
Message-ID: <519475C3.7040407@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/05/13 22:34, Wojciech Slenska wrote:
> When qt5 is build with EGLFS support, libQt5OpenGL library should be copied to target.
>
> Signed-off-by: Wojciech Slenska <wojciech.slenska@gmail.com>
> ---
>   package/qt5/qt5base/qt5base.mk | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index bfc6c91..7c6a093 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -118,6 +118,7 @@ QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_CONCURRENT) += Qt5Concurrent
>   QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_SQL)        += Qt5Sql
>   QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_TEST)       += Qt5Test
>   QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_XML)        += Qt5Xml
> +QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_EGLFS)      += Qt5OpenGL

  eglfs works fine for me without this library...

  Regards,
  Arnout

>
>   QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_GUI)          += Qt5Gui
>   QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_WIDGETS)      += Qt5Widgets
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
