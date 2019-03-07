From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Mar 2019 23:13:11 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/log4cplus: add optional
 qt5 dependency
In-Reply-To: <20190303101252.3374-1-fontaine.fabrice@gmail.com>
References: <20190303101252.3374-1-fontaine.fabrice@gmail.com>
Message-ID: <20190307231311.463320c2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Sun,  3 Mar 2019 11:12:52 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/log4cplus/log4cplus.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Thanks, I've applied, with one minor change, see below.

> diff --git a/package/log4cplus/log4cplus.mk b/package/log4cplus/log4cplus.mk
> index 0bc4fc9aa6..b632066de1 100644
> --- a/package/log4cplus/log4cplus.mk
> +++ b/package/log4cplus/log4cplus.mk
> @@ -11,6 +11,13 @@ LOG4CPLUS_LICENSE = Apache-2.0, BSD-2-Clause, BSD-like (threadpool)
>  LOG4CPLUS_LICENSE_FILES = LICENSE
>  LOG4CPLUS_INSTALL_STAGING = YES
>  
> +ifeq ($(BR2_PACKAGE_QT5),y)

I've changed to use BR2_PACKAGE_QT5BASE here. Obviously, it's
functionally exactly the same, because BR2_PACKAGE_QT5 selects
BR2_PACKAGE_QT5BASE. However, because we add qt5base to the
DEPENDENCIES variable below, I found it more consistent to check for
this specific package being enabled.

> +LOG4CPLUS_DEPENDENCIES += host-pkgconf qt5base
> +LOG4CPLUS_CONF_OPTS += --with-qt5
> +else
> +LOG4CPLUS_CONF_OPTS += --without-qt5
> +endif

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
