From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 23 Sep 2020 20:36:59 +0200
Subject: [Buildroot] [PATCH] package/qt5/qt5declarative: remove optional
 quick module option
In-Reply-To: <20200923182300.58950-1-b.bilas@grinn-global.com>
References: <20200923182300.58950-1-b.bilas@grinn-global.com>
Message-ID: <20200923203659.334cf251@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 23 Sep 2020 20:23:00 +0200
Bartosz Bilas <b.bilas@grinn-global.com> wrote:

> Since commit [1] we are not able to disable/enable this module
> so let's force to set Qt5 OpenGL support by default
> if it's possible because currently quick's components
> are being built anyway.
> 
> This should fix the build errors with qt5location package
> which includes couple of built-in components that require
> OpenGL support [2] when Qt Quick module is detected.
> 
> http://autobuild.buildroot.net/results/ddd/ddda7cdb9400f6ca7d548e9b5ada18674fbe42e0/
> http://autobuild.buildroot.net/results/ddb/ddb25ebb591ed6029a7bd4934464171358553936/
> 
> [1] https://git.buildroot.net/buildroot/commit/package/qt5/qt5declarative/qt5declarative.mk?id=1bdceb5d735aad5fbf32b35e3a7f573ecb727e20
> [2] https://code.woboq.org/qt5/qtdeclarative/src/quick/scenegraph/coreapi/qsgmaterialshader.h.html#105
> 
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>

I am still confused: why should we force something in qt5declarative,
to fix a build issue in qt5location ?

Isn't it a bug in qt5location to use the ->program() method when OpenGL
is disabled, while this method is only available when OpenGL support is
enabled ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
