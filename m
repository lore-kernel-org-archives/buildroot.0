From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Oct 2014 17:48:59 +0100
Subject: [Buildroot] [PATCH 2/2] polarssl: disable assembly for more
 scenarios
In-Reply-To: <1414418838-3487-2-git-send-email-gustavo@zacarias.com.ar>
References: <1414418838-3487-1-git-send-email-gustavo@zacarias.com.ar>
 <1414418838-3487-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141027174859.45788b19@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 27 Oct 2014 11:07:18 -0300, Gustavo Zacarias wrote:

> +# ARM in thumb mode breaks debugging with asm optimizations
> +# Microblaze asm optimizations are broken in general
> +ifeq ($(BR2_ENABLE_DEBUG)$(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_ARM_INSTRUCTIONS_THUMB2),yy)
> +POLARSSL_POST_CONFIGURE_HOOKS += POLARSSL_DISABLE_ASM

It's not really great to have to build things differently debugging on
BR2_ENABLE_DEBUG, because the prompt of BR2_ENABLE_DEBUG is "build
packages with debugging symbols". So the user may expect that we build
the same set of features, just with debugging symbols.

Though I agree that with BR2_ENABLE_DEBUG also activating
--enable-debug, a lot more than just debugging symbols actually happens.

Therefore, committed, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
