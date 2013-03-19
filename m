From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 19 Mar 2013 22:14:59 +0100
Subject: [Buildroot] [PATCH v4 05/21] qt5base: add glib support
In-Reply-To: <1363721394-14973-6-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 19 Mar 2013 20:29:38 +0100")
References: <1363721394-14973-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1363721394-14973-6-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <871ubbt7l8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

 Thomas> ---
 Thomas>  package/qt5/qt5base/qt5base.mk |    4 +++-
 Thomas>  1 file changed, 3 insertions(+), 1 deletion(-)

 Thomas> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
 Thomas> index 62f0b9a..d5dcb7d 100644
 Thomas> --- a/package/qt5/qt5base/qt5base.mk
 Thomas> +++ b/package/qt5/qt5base/qt5base.mk
 Thomas> @@ -21,7 +21,6 @@ QT5BASE_INSTALL_STAGING = YES
 Thomas>  QT5BASE_CONFIGURE_OPTS += \
 Thomas>  	-optimized-qmake \
 Thomas>  	-no-kms \
 Thomas> -	-no-glib \
 Thomas>  	-no-cups \
 Thomas>  	-no-nis \
 Thomas>  	-no-libudev \
 Thomas> @@ -95,6 +94,9 @@ QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_PNG),libpng)
 Thomas>  QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_DBUS),-dbus,-no-dbus)
 Thomas>  QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_DBUS),dbus)
 
 Thomas> +QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_LIBGLIB2),-glib,-no-glib)
 Thomas> +QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_LIBGLIB2),libglib2)

You're adding a mix of:

 - Explicit suboptions which selects the needed libraries
   (fontconfig/jpeg/png/dbus)
 - Automatic enabling/disabling support if package is enabled

Is there any specific reason for this?

-- 
Bye, Peter Korsgaard
