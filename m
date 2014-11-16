From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Nov 2014 23:23:42 +0100
Subject: [Buildroot] [PATCH v2] pkg-cmake.mk: Set CMAKE_SYSTEM_PROCESSOR.
In-Reply-To: <1416138927-7857-1-git-send-email-volker.krause@kdab.com>
References: <1416138927-7857-1-git-send-email-volker.krause@kdab.com>
Message-ID: <20141116232342.2ae8cce9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Volker Krause,

On Sun, 16 Nov 2014 12:55:27 +0100, Volker Krause wrote:

> +# CMAKE_SYSTEM_PROCESSOR should match uname -m
> +ifeq ($(BR2_ARM_CPU_ARMV5),y)
> +CMAKE_SYSTEM_PROCESSOR = armv5
> +endif
> +ifeq ($(BR2_ARM_CPU_ARMV6),y)
> +CMAKE_SYSTEM_PROCESSOR = armv6l
> +endif
> +ifeq ($(BR2_ARM_CPU_ARMV7A),y)
> +CMAKE_SYSTEM_PROCESSOR = armv7l

I believe armv6l and armv7l is only valid on little-endian ARM systems,
not big endian ones.

> +endif
> +ifndef CMAKE_SYSTEM_PROCESSOR
> +CMAKE_SYSTEM_PROCESSOR = $(BR2_ARCH)
> +endif

Are we sure that $(BR2_ARCH) is valid for all other cases?

Also, please use the following construct instead:

ifeq (....)
...
else ifeq (....)
...
else ifeq (....)
...
else
....
endif

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
