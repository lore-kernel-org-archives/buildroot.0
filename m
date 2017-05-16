From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 May 2017 23:32:00 +0200
Subject: [Buildroot] [PATCH 2/2] package/qt5base: link with -latomic for
 sparc
In-Reply-To: <628b089124e34bcc2f6cd9be57c65d567872ef1f.1494969180.git.yann.morin.1998@free.fr>
References: <cover.1494969180.git.yann.morin.1998@free.fr>
 <628b089124e34bcc2f6cd9be57c65d567872ef1f.1494969180.git.yann.morin.1998@free.fr>
Message-ID: <20170516233200.496380dd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 16 May 2017 23:13:13 +0200, Yann E. MORIN wrote:

>  QT5BASE_ARCH_CONFIG_FILE = $(@D)/mkspecs/devices/linux-buildroot-g++/arch.conf
> +ifeq ($(BR2_sparc)$(BR2_PACKAGE_QT5_VERSION_LATEST),yy)

You shouldn't use BR2_sparc here, but BR2_TOOLCHAIN_HAS_LIBATOMIC

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
