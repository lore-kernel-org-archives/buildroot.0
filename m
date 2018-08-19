From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Aug 2018 21:26:52 +0200
Subject: [Buildroot] Analysis of build results for 2018-08-17
In-Reply-To: <871saunpwq.fsf@dell.be.48ers.dk>
References: <20180818060019.8702120DE6@mail.bootlin.com>
 <20180818215603.04843f8d@windsurf>
 <871saunpwq.fsf@dell.be.48ers.dk>
Message-ID: <20180819212652.01b7b9c9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 19 Aug 2018 20:59:33 +0200, Peter Korsgaard wrote:

>  > This is due to a Qt method that has been removed in Qt 5.11. It can be
>  > fixed by applying
>  > https://src.fedoraproject.org/rpms/python-qt5/c/47fb7fdc5d16582772f9c3fc8a6a674a41a7f605?branch=master,
>  > but we need to find a way to make this conditional on Qt 5.11 (indeed
>  > with Qt 5.6, this should be preserved).  
> 
> I believe this can be done by checking QT_VERSION:
> 
> https://doc.qt.io/qt-5/qtglobal.html#QT_VERSION

The SIP stuff that is used by PyQt to generate the binding also has a
mechanism for conditional compilation depending on the Qt version.

However, as explained in the patch I submitted to fix this issue [1],
in the upstream PyQt5, they decided to drop entirely the support for
this waitForEvents() method, even if PyQt5 is built against an older
version of Qt than 5.11 (PyQt5 is full of conditionals depending on the
Qt version, but they decided to not use that for waitForEvents). My
patch follows what upstream did.

Best regards,

Thomas

[1] http://patchwork.ozlabs.org/patch/959269/
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
