From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 1 Mar 2019 08:28:15 +0100
Subject: [Buildroot] [PATCH 1/2] package/qt5/qt5base: add custom
 configure options last
In-Reply-To: <20190301021712.47698-1-james.grant@jci.com>
References: <20190301021712.47698-1-james.grant@jci.com>
Message-ID: <20190301082815.21ede3d8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello James,

On Fri, 1 Mar 2019 15:17:11 +1300
James Grant <james.grant@jci.com> wrote:

> This allows all options set by Buildroot to be overridden.
> 
> Signed-off-by: James Grant <james.grant@jci.com>
> ---
>  package/qt5/qt5base/qt5base.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index 11c6684812..8c0f5f0c9f 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -296,6 +296,9 @@ define QT5BASE_CONFIGURE_HOSTCC
>  	$(SED) 's,^QMAKE_CXX\s*=.*,QMAKE_CXX = $(HOSTCXX),' $(@D)/mkspecs/common/g++-base.conf
>  endef
>  
> +# Must be last so can override all options set by Buildroot
> +QT5BASE_CONFIGURE_OPTS += $(call qstrip,$(BR2_PACKAGE_QT5BASE_CUSTOM_CONF_OPTS))

Shouldn't this line also be removed from where it originally was ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
