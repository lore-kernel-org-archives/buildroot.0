From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Jul 2013 21:57:57 +0200
Subject: [Buildroot] [PATCH 0/3] Upgrade ARC port to new toolchain
In-Reply-To: <1374172354-3248-1-git-send-email-mjonker@synopsys.com>
References: <1374172354-3248-1-git-send-email-mjonker@synopsys.com>
Message-ID: <20130718215757.044949c7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mischa Jonker,

On Thu, 18 Jul 2013 20:32:31 +0200, Mischa Jonker wrote:
> These three patches upgrade the ARC toolchain to GCC 4.8 and
> Binutils 2.23.2. This fixes multiple issues (including most
> autobuilder failures from the past couple of weeks).

Nice!

Can you send a followup patch to remove:

ifeq ($(BR2_GCC_VERSION_4_4_7_ARC),y)
HOST_GCC_COMMON_DEPENDENCIES += host-flex host-bison
endif

from package/gcc/gcc.mk

and

ifeq ($(BINUTILS_VERSION),2.19-arc)
HOST_BINUTILS_DEPENDENCIES = host-flex host-bison
else
HOST_BINUTILS_DEPENDENCIES =
endif

from binutils.mk ?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
