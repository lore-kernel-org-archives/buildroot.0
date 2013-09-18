From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 18 Sep 2013 12:25:44 +0200
Subject: [Buildroot] [PATCH] qt5webkit: select libXrender if xcb is
	enabled
In-Reply-To: <1379489012-21883-1-git-send-email-fatih.asici@gmail.com> ("Fatih
 =?utf-8?B?QcWfxLFjxLEiJ3M=?= message of "Wed, 18 Sep 2013 10:23:32 +0300")
References: <1379489012-21883-1-git-send-email-fatih.asici@gmail.com>
Message-ID: <87bo3qctp3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fatih" == Fatih A??c? <fatih.asici@gmail.com> writes:

 Fatih> Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
 Fatih> ---
 Fatih>  package/qt5/qt5webkit/Config.in    |    1 +
 Fatih>  package/qt5/qt5webkit/qt5webkit.mk |    4 ++++
 Fatih>  2 files changed, 5 insertions(+)

 Fatih> diff --git a/package/qt5/qt5webkit/Config.in b/package/qt5/qt5webkit/Config.in
 Fatih> index 48b5125..ba051d6 100644
 Fatih> --- a/package/qt5/qt5webkit/Config.in
 Fatih> +++ b/package/qt5/qt5webkit/Config.in
 Fatih> @@ -4,6 +4,7 @@ config BR2_PACKAGE_QT5WEBKIT
 Fatih>  	select BR2_PACKAGE_QT5BASE_ICU
 Fatih>  	select BR2_PACKAGE_QT5BASE_GUI
 Fatih>  	select BR2_PACKAGE_SQLITE
 Fatih> +	select BR2_PACKAGE_XLIB_LIBXRENDER if BR2_PACKAGE_QT5BASE_XCB

It also needs libXext. Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
