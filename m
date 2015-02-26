From: Diego Iastrubni <diegoiast@gmail.com>
Date: Thu, 26 Feb 2015 14:04:17 +0200
Subject: [Buildroot] [PATCH v2] qt-webkit-kiosk: new package
In-Reply-To: <20150222223215.701a0a03@free-electrons.com>
References: <1424497549-8506-1-git-send-email-jerome.oufella@savoirfairelinux.com>
 <1424578920-21071-1-git-send-email-jerome.oufella@savoirfairelinux.com>
 <20150222223215.701a0a03@free-electrons.com>
Message-ID: <CALR4fE+EWhwQMX2w7eZTFMpaurAjTo_n8fqes_fbBt5yhO=HSA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Feb 22, 2015 at 11:32 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> > diff --git a/package/qt-webkit-kiosk/Config.in
> b/package/qt-webkit-kiosk/Config.in
> > new file mode 100644
> > index 0000000..dd4b06f
> > --- /dev/null
> > +++ b/package/qt-webkit-kiosk/Config.in
> > @@ -0,0 +1,20 @@
> > +config BR2_PACKAGE_QT_WEBKIT_KIOSK
> > +     bool "qt-webkit-kiosk"
> > +     depends on BR2_PACKAGE_QT5
> > +     select BR2_PACKAGE_QT5WEBKIT
> > +     select BR2_PACKAGE_QT5MULTIMEDIA
>
> I've done a test build, and there are some missing dependencies here.
> You should also:
>
>         select BR2_PACKAGE_QT5BASE_GUI
>         select BR2_PACKAGE_QT5BASE_WIDGETS
>         select BR2_PACKAGE_OPENSSL
>
> QT5BASE_WIDGETS is not enabled by default, and is needed because
> qt-webkit-kiosk uses the "printsupport" and qtwebkit widget modules,
> which are only compiled if Qt5 widgets are enabled.
>
>
I disagree. It feels like the problem is in the BR2_PACKAGE_QT5WEBKIT
target - it should depend on
BR2_PACKAGE_QT5BASE_GUI and BR2_PACKAGE_QT5BASE_WIDGETS

Or... does Qt5 have an option to build WEBKIT in QML environment only?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150226/7e446afc/attachment.html>
