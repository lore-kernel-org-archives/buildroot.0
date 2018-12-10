From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Dec 2018 08:52:47 +0100
Subject: [Buildroot] raspberrypi3_qt5we_defconfig fails to build
 qt5webengine
In-Reply-To: <20181209231707.103f56f9@gmx.net>
References: <20181209165328.1d320e03@windsurf>
 <20181209231707.103f56f9@gmx.net>
Message-ID: <20181210085247.50b55d95@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 9 Dec 2018 23:17:07 +0100, Peter Seiderer wrote:

> But QMAKE_COMPILER should already be set in mkspecs/common/g++-base.conf, but
> is changed by buildroot package/qt5/qt5base/qt5base.mk from 'gcc' to
> '/usr/bin/gcc' by
> 
>   # This allows to use ccache when available
>   define QT5BASE_CONFIGURE_HOSTCC
>           $(SED) 's,^QMAKE_COMPILER\s*=.*,QMAKE_COMPILER = $(HOSTCC),' $(@D)/mkspecs/common/g++-base.conf
>           $(SED) 's,^QMAKE_CC\s*=.*,QMAKE_CC = $(HOSTCC),' $(@D)/mkspecs/common/g++-base.conf
>           $(SED) 's,^QMAKE_CXX\s*=.*,QMAKE_CXX = $(HOSTCXX),' $(@D)/mkspecs/common/g++-base.conf
>   endef
> 
> The rigth fix should be removing the first sed line, QMAKE_COMPILER is the
> compiler flavour and not a compiler path (see e.g. [1])...

Ah, ok. Thanks for looking into this.

> Will send a proper patch (after some testing) soon...

Thanks a lot, and sorry for this breakage, I caused it when adding the
ccache stuff for HOSTCC in qt5base.mk.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
