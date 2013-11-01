From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Nov 2013 19:20:27 +0100
Subject: [Buildroot] [PATCH v2 1/1] openpgm: disable on AVR32
In-Reply-To: <1383329548-8528-1-git-send-email-alexander.lukichev@gmail.com>
References: <1383329548-8528-1-git-send-email-alexander.lukichev@gmail.com>
Message-ID: <20131101192027.1ea4c1bc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexander Lukichev,

On Fri,  1 Nov 2013 20:12:28 +0200, Alexander Lukichev wrote:

> +	depends on !BR2_avr32 # incorrectly configures for the toolchain

This comment is somewhat misleading. What really happens is that
openpgm uses compiler intrinsics that did not exist in gcc 4.2. So
maybe the test should actually be on BR2_GCC_VERSION_4_2_2_AVR32_2_1_5
instead of BR2_avr32 (even though it's admittedly quite the same thing,
since AVR32 will never use any other version that this heavily patched
gcc 4.2).

I've added Simon Dawson in the CC list, who is the main contributor to
the AVR32 support in Buildroot.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
