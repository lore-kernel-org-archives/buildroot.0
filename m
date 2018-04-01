From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 1 Apr 2018 23:55:12 +0200
Subject: [Buildroot] [PATCH v2] package/qt5/qt5scxml: install missing
 QML module
In-Reply-To: <20180301141628.10735-1-b.bilas@grinn-global.com>
References: <20180301141628.10735-1-b.bilas@grinn-global.com>
Message-ID: <83121016-12c9-1e97-ae88-ac9950e0e90c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Bartosz,

On 01-03-18 15:16, Bartosz Bilas wrote:
> Fixes:
>  qrc:/MainUI.qml:2 module "QtScxml" is not installed
> 
> 
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> Reviewed-by: Peter Seiderer <ps.report@gmx.net>


 Applied to master, thanks.

 Regards,
 Arnout

> ---
> Changes v1 -> v2:
> 	* Remove QT5DECLARATIVE QUICK dependency (suggested by Peter)
> 
>  package/qt5/qt5scxml/qt5scxml.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/qt5/qt5scxml/qt5scxml.mk b/package/qt5/qt5scxml/qt5scxml.mk
> index 2d197a2bca..b6281975c6 100644
> --- a/package/qt5/qt5scxml/qt5scxml.mk
> +++ b/package/qt5/qt5scxml/qt5scxml.mk
> @@ -35,6 +35,10 @@ define QT5SCXML_INSTALL_TARGET_LIBS
>  endef
>  endif
>  
> +define QT5SCXML_INSTALL_TARGET_QMLS
> +	cp -dpfr $(STAGING_DIR)/usr/qml/QtScxml/ $(TARGET_DIR)/usr/qml/
> +endef
> +
>  ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
>  define QT5SCXML_INSTALL_TARGET_EXAMPLES
>  	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/scxml $(TARGET_DIR)/usr/lib/qt/examples/
> @@ -43,6 +47,7 @@ endif
>  
>  define QT5SCXML_INSTALL_TARGET_CMDS
>  	$(QT5SCXML_INSTALL_TARGET_LIBS)
> +	$(QT5SCXML_INSTALL_TARGET_QMLS)
>  	$(QT5SCXML_INSTALL_TARGET_EXAMPLES)
>  endef
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
