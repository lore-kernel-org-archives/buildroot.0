From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 May 2016 19:44:34 +0200
Subject: [Buildroot] [PATCH] [PATCH v2] p7zip: New package
References: <1464539299-3853-1-git-send-email-nerv@dawncrow.de>
Message-ID: <2dmr1dxg2e.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 29 May 2016 18:28:19 +0200 schrieb Andr? Hentschel:

> +	depends on BR2_i386 || BR2_x86_64 || \
> +		BR2_aarch64 || BR2_arm || BR2_armeb

Hi Andr?,

I also tested with xtensa and microblazeel with success, please do not get
confused by the list of archs in C/CpuArch.h.

Lines 69 

|| (defined(__BYTE_ORDER__) && (__BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__))

and 85

|| (defined(__BYTE_ORDER__) && (__BYTE_ORDER__ == __ORDER_BIG_ENDIAN__))

are a major catch-all which however does not work out for blackfin.

Adding

|| defined(__BLACKFIN__)

around line 68 in C/CpuArch.h should be enough to fix the problem
because blackfin is little endian:

https://git.busybox.net/buildroot/tree/arch/Config.in.bfin#n69

Regards, Bernd
