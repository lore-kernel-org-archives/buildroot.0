From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Wed, 2 Aug 2017 09:49:11 -0400
Subject: [Buildroot] [v5 2/3] qt5webengine: new package
In-Reply-To: <5012f8e7-0164-27c7-813e-86f1f2dcb0df@gmail.com>
References: <20170724134429.22816-1-gael.portay@savoirfairelinux.com>
 <20170724134429.22816-3-gael.portay@savoirfairelinux.com>
 <5012f8e7-0164-27c7-813e-86f1f2dcb0df@gmail.com>
Message-ID: <20170802134911.7aghi4vv3h2oul3p@gportay>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Zoltan,

On Sat, Jul 29, 2017 at 04:13:27PM +0200, Zoltan Gyarmati wrote:
> Dear Ga?l & All,
> 
> 
> with the shipped raspberrypi3_qt5_defconfig (where also the qt5 examples
> are enabled), the building of the 'demobrowser' example is failing:
> 
> .obj/browsermainwindow.o: In function `BrowserMainWindow::printRequested(QWebEnginePage*)':
> browsermainwindow.cpp:(.text+0x29d8): undefined reference to `QWebEnginePage::print(QPrinter*, QWebEngineCallback<bool> const&)'
> 
> probably due to the fact that in the qtwebengine config the PDF/print
> support is not enabled:
> 
> Qt WebEngine:
> 
>   Embedded build ......................... yes
> 
>   Pepper Plugins ......................... no
> 
>   Printing and PDF ....................... no
> 
>   Proprietary Codecs ..................... no
> 
>   Spellchecker ........................... yes
> 
> 
> There is a webengine config option 'WEBENGINE_CONFIG += use_printing
> use_pdf' ,
> maybe it has to be set explicitly in  qt5webengine.mk when
> BR2_PACKAGE_QT5BASE_PRINTSUPPORT is set?
> 

My bad.

I forgot to git add the following patch to package/qt5/qt5webengine/5.9.1.

	085c2c52 Always compile QWebEnginePage::print

I will resend a v6. In the meanwhile, you can download the patch[1] and test it.

> Regards,
> 
> Zoltan Gyarmati
> https://zgyarmati.de
> 

Regards,
Gael

[1]: https://github.com/qt/qtwebengine/commit/085c2c529473bbe9dd7c8c5698a45053520cc423.patch
