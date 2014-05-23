From: Fatih =?utf-8?q?A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Fri, 23 May 2014 08:54:51 +0300
Subject: [Buildroot] [PATCH 2/3] qt5enginio: new package
In-Reply-To: <87oayqc4lq.fsf@dell.be.48ers.dk>
References: <1400587934-17338-1-git-send-email-fatih.asici@gmail.com>
 <1400587934-17338-2-git-send-email-fatih.asici@gmail.com>
 <87oayqc4lq.fsf@dell.be.48ers.dk>
Message-ID: <201405230854.51725.fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 22 May 2014 16:42:09 Peter Korsgaard wrote:
> >>>>> "Fatih" == Fatih A??c? <fatih.asici@gmail.com> writes:
>  > Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
>  > ---
>  > 
>  >  package/qt5/Config.in                |  1 +
>  >  package/qt5/qt5enginio/Config.in     | 13 +++++++++
>  >  package/qt5/qt5enginio/qt5enginio.mk | 56
>  >  ++++++++++++++++++++++++++++++++++++ 3 files changed, 70 insertions(+)
>  >  create mode 100644 package/qt5/qt5enginio/Config.in
>  >  create mode 100644 package/qt5/qt5enginio/qt5enginio.mk
>  > 
>  > diff --git a/package/qt5/Config.in b/package/qt5/Config.in
>  > index d36852e..e810ecb 100644
>  > --- a/package/qt5/Config.in
>  > +++ b/package/qt5/Config.in
>  > @@ -29,6 +29,7 @@ if BR2_PACKAGE_QT5
>  > 
>  >  source "package/qt5/qt5base/Config.in"
>  >  source "package/qt5/qt5connectivity/Config.in"
>  >  source "package/qt5/qt5declarative/Config.in"
>  > 
>  > +source "package/qt5/qt5enginio/Config.in"
>  > 
>  >  source "package/qt5/qt5graphicaleffects/Config.in"
>  >  source "package/qt5/qt5imageformats/Config.in"
>  >  source "package/qt5/qt5multimedia/Config.in"
>  > 
>  > diff --git a/package/qt5/qt5enginio/Config.in
>  > b/package/qt5/qt5enginio/Config.in new file mode 100644
>  > index 0000000..c06e6da
>  > --- /dev/null
>  > +++ b/package/qt5/qt5enginio/Config.in
>  > @@ -0,0 +1,13 @@
>  > +config BR2_PACKAGE_QT5ENGINIO
>  > +	bool "qt5enginio"
>  > +	select BR2_PACKAGE_OPENSSL
>  > +	select BR2_PACKAGE_QT5BASE
>  > +	select BR2_PACKAGE_QT5BASE_GUI
>  > +	select BR2_PACKAGE_QT5BASE_NETWORK
> 
> <snip>
> 
>  > +QT5ENGINIO_DEPENDENCIES = qt5base
> 
> You forgot to add openssl to _DEPENDENCIES.

openssl is not a direct dependency of this package. It needs an openssl-
enabled qt5base. qt5base has openssl in its _DEPENDENCIES variable.

In this case, do I really need to add this dependency to this package?


Regards,
Fatih
