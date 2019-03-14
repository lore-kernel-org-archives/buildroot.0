From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Mar 2019 08:52:13 +0100
Subject: [Buildroot] [git commit] package/qt5/qt5webengine: fix comment
 on GL dependencies
In-Reply-To: <20190313200725.33bae840@gmx.net>
References: <20190313164746.ECDF38B66D@busybox.osuosl.org>
 <20190313200725.33bae840@gmx.net>
Message-ID: <20190314085213.4d9a904e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 13 Mar 2019 20:07:25 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> This comment change is only valid for BR2_PACKAGE_QT5_VERSION_LATEST/Qt5.12.x as
> qt5webengine selects BR2_PACKAGE_QT5DECLARATIVE_QUICK and qt5declarative/Config.in
> states:
> 
>   config BR2_PACKAGE_QT5DECLARATIVE_QUICK
>           bool "quick module"
>           depends on BR2_PACKAGE_QT5_GL_AVAILABLE || BR2_PACKAGE_QT5_VERSION_LATEST

Aah, yes, indeed. I had missed that qt5webengine not only selects
QT5DECLARATIVE, but also QT5DECLARATIVE_QUICK. So I think we should
simply revert the change.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
