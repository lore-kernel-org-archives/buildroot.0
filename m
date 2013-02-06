From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Feb 2013 17:58:33 +0100
Subject: [Buildroot] [PATCH 3/5] qt: define license
In-Reply-To: <1360167853-7177-3-git-send-email-luca@lucaceresoli.net>
References: <1360167853-7177-1-git-send-email-luca@lucaceresoli.net>
 <1360167853-7177-3-git-send-email-luca@lucaceresoli.net>
Message-ID: <20130206175833.6c382929@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca Ceresoli,

On Wed,  6 Feb 2013 17:24:11 +0100, Luca Ceresoli wrote:

> +QT_LICENSE = LGPLv2.1 with exceptions or GPLv3 or commercial
> +QT_LICENSE_FILES = LICENSE.LGPL LGPL_EXCEPTION.txt LICENSE.GPL3

If Qt5, I've done:

+ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+QT5BASE_CONFIGURE_OPTS += -opensource -confirm-license
+QT5BASE_LICENSE = LGPLv2.1 or GPLv3.0
+QT5BASE_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL LGPL_EXCEPTION.txt
+else
+QT5BASE_LICENSE = Commercial license
+QT5BASE_REDISTRIBUTE = NO
+endif

See
http://git.free-electrons.com/users/thomas-petazzoni/buildroot/commit/?h=qt5&id=7c1f7b9967d814e3f5c838e7090ac04b9d06af51

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
