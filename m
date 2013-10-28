From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 28 Oct 2013 10:11:02 +0100
Subject: [Buildroot] [PATCH] qt5base: add tslib plugin
In-Reply-To: <1382920167-3336-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 (Ezequiel Garcia's message of "Sun, 27 Oct 2013 21:29:27 -0300")
References: <1382920167-3336-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <8761shu5eh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ezequiel" == Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> writes:

 > Add support for Tslib plugin.
 > Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
 > ---
 >  package/qt5/qt5base/Config.in  | 5 +++++
 >  package/qt5/qt5base/qt5base.mk | 3 +++
 >  2 files changed, 8 insertions(+)

 > diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
 > index e433373..cfe8f02 100644
 > --- a/package/qt5/qt5base/Config.in
 > +++ b/package/qt5/qt5base/Config.in
 > @@ -185,4 +185,9 @@ config BR2_PACKAGE_QT5BASE_ICU
 >  	  This option enables ICU support in Qt5. This is for example
 >  	  needed for Qt5Webkit.
 
 > +config BR2_PACKAGE_QT5BASE_TSLIB
 > +	bool "Enable Tslib support"
 > +	select BR2_PACKAGE_TSLIB
 > +	help
 > +	  This options enables the Tslib plugin

Tslib depends on !BR2_PREFER_STATIC_LIB, so you need to propagate that
dependency and show a comment line if not available.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
