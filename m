From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Sep 2016 14:43:14 +0200
Subject: [Buildroot] [PATCH] package/binutils: Disable -Os for Thumb-2
 only platforms
In-Reply-To: <1472978990-14884-1-git-send-email-romain.naour@gmail.com>
References: <1472978990-14884-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160904144314.2dd0f130@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  4 Sep 2016 10:49:50 +0200, Romain Naour wrote:

> +# Workaround a build issue with -Os on Thumb-2 only platforms
> +# (such as Cortex-M). (Binutils 2.25.1 and 2.26.1)
> +ifeq ($(BR2_ARM_CPU_HAS_ARM)$(BR2_OPTIMIZE_S),yy)

Unless I'm missing something, I don't see how the code is matching the
comment above. Your comment is "with Thumb-2 only platforms, there is
an issue with the -Os optimization level" while your condition is "with
ARM-capable platforms, there is an issue with the -Os optimization
level".

Are you sure what want is not:

ifeq ($(BR2_ARM_CPU_HAS_ARM):$(BR2_OPTIMIZE_S),:y)
....
endif

Also, I'm a bit surprised this happens only on Thumb-2 only platforms,
and not on all ARM platforms, when Thumb-2 is chosen. But I'm far from
understanding all the fine details of relocations.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
