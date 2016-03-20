From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 23:18:08 +0100
Subject: [Buildroot] [PATCH 1/2] package/qwt : prepared package for
 other versions of Qt.
In-Reply-To: <20160320231324.25e83a99@free-electrons.com>
References: <1458149825-23401-1-git-send-email-davepiq@yahoo.fr>
 <20160320231324.25e83a99@free-electrons.com>
Message-ID: <20160320231808.5f0f51e0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 20 Mar 2016 23:13:24 +0100, Thomas Petazzoni wrote:

> ifeq ($(BR2_PACKAGE_QWT_OPENGL),y)
> QWT_DEPENDENCIES += libgles libegl
> endif

I correct myself on this: this is not needed. Indeed, if
BR2_PACKAGE_QWT_OPENGL is enabled, you have selected
BR2_PACKAGE_QT_OPENGL_ES, so qt already depends on libgles/libegl. So
there's no need to replicate this dependency here.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
