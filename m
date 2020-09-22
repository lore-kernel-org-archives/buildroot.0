From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Sep 2020 22:19:36 +0200
Subject: [Buildroot] [PATCH] package/qt5/qt5location: needs
 qt5declarative quick package
In-Reply-To: <3e8a0246-3edb-578d-9d31-21a2f66f493b@grinn-global.com>
References: <20200919194857.491282-1-b.bilas@grinn-global.com>
 <20200919220820.2d5d47ab@windsurf>
 <6c7c6fdf-a5a8-e1cf-ad28-9b7d7ba34b7b@grinn-global.com>
 <3e8a0246-3edb-578d-9d31-21a2f66f493b@grinn-global.com>
Message-ID: <20200922221936.560d4ab7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

First of all, thanks for the additional investigation, much appreciated.

On Sat, 19 Sep 2020 23:05:00 +0200
Bartosz Bilas <b.bilas@grinn-global.com> wrote:

> >> So, the "location" subdirectory should not be built of the quick module
> >> is not there.  
> > Yes, it's weird - it seems that this condition is always true even 
> > though quick module isn't compiled therefore I sent a quick workaround 
> > to fix build errors until I find a proper solution ;)  
> 
> After a quick investigation it seems that we should drop 
> BR2_PACKAGE_QT5DECLARATIVE_QUICK option and select 
> BR2_PACKAGE_QT5BASE_OPENGL option if BR2_PACKAGE_QT5_GL_AVAILABLE 
> directly when BR2_PACKAGE_QT5DECLARATIVE package is selected because 
> qt5declarative module includes quick subdirectory when gui module is 
> available:

Could you provide a sample patch? Because I am a bit confused when you
say "select BR2_PACKAGE_QT5BASE_OPENGL option if
BR2_PACKAGE_QT5_GL_AVAILABLE". Where would you do that? qt5location?
qt5declarative?

> 
> qtHaveModule(gui):qtConfig(qml-animation) {

What is the qml-animation condition? When is it true/false?

>  ??? SUBDIRS += quick
> 
>  ?? ...snip...
> }
> 
> and then we should add dependency of the qt5declarative package in 
> qt5location to solve the issue above.

But, as I have reported, qt5declarative is not mandatory for
qt5location, only some parts of qt5location need the quick module from
qt5declarative.

Could you submit another patch (or patch series, if needed), with more
substantial explanations?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
