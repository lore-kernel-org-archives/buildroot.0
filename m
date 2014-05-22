From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 22 May 2014 15:42:09 +0200
Subject: [Buildroot] [PATCH 2/3] qt5enginio: new package
In-Reply-To: <1400587934-17338-2-git-send-email-fatih.asici@gmail.com> ("Fatih
 =?utf-8?B?QcWfxLFjxLEiJ3M=?= message of "Tue, 20 May 2014 15:12:13 +0300")
References: <1400587934-17338-1-git-send-email-fatih.asici@gmail.com>
 <1400587934-17338-2-git-send-email-fatih.asici@gmail.com>
Message-ID: <87oayqc4lq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fatih" == Fatih A??c? <fatih.asici@gmail.com> writes:

 > Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
 > ---
 >  package/qt5/Config.in                |  1 +
 >  package/qt5/qt5enginio/Config.in     | 13 +++++++++
 >  package/qt5/qt5enginio/qt5enginio.mk | 56 ++++++++++++++++++++++++++++++++++++
 >  3 files changed, 70 insertions(+)
 >  create mode 100644 package/qt5/qt5enginio/Config.in
 >  create mode 100644 package/qt5/qt5enginio/qt5enginio.mk

 > diff --git a/package/qt5/Config.in b/package/qt5/Config.in
 > index d36852e..e810ecb 100644
 > --- a/package/qt5/Config.in
 > +++ b/package/qt5/Config.in
 > @@ -29,6 +29,7 @@ if BR2_PACKAGE_QT5
 >  source "package/qt5/qt5base/Config.in"
 >  source "package/qt5/qt5connectivity/Config.in"
 >  source "package/qt5/qt5declarative/Config.in"
 > +source "package/qt5/qt5enginio/Config.in"
 >  source "package/qt5/qt5graphicaleffects/Config.in"
 >  source "package/qt5/qt5imageformats/Config.in"
 >  source "package/qt5/qt5multimedia/Config.in"
 > diff --git a/package/qt5/qt5enginio/Config.in b/package/qt5/qt5enginio/Config.in
 > new file mode 100644
 > index 0000000..c06e6da
 > --- /dev/null
 > +++ b/package/qt5/qt5enginio/Config.in
 > @@ -0,0 +1,13 @@
 > +config BR2_PACKAGE_QT5ENGINIO
 > +	bool "qt5enginio"
 > +	select BR2_PACKAGE_OPENSSL
 > +	select BR2_PACKAGE_QT5BASE
 > +	select BR2_PACKAGE_QT5BASE_GUI
 > +	select BR2_PACKAGE_QT5BASE_NETWORK

<snip>

 > +QT5ENGINIO_DEPENDENCIES = qt5base

You forgot to add openssl to _DEPENDENCIES.

Otherwise it looks good.

-- 
Bye, Peter Korsgaard
