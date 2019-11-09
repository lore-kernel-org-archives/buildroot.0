From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 09 Nov 2019 18:52:10 +0100
Subject: [Buildroot] [PATCH] package/elf2flt: .ARM.exidx RO data section
 is incorrectly mapped to data
In-Reply-To: <20191106211913.21256-1-romain.naour@smile.fr> (Romain Naour's
 message of "Wed, 6 Nov 2019 22:19:13 +0100")
References: <20191106211913.21256-1-romain.naour@smile.fr>
Message-ID: <878sopkkdx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > Starting with Binutils 2.33.1, elf2flt segfault while building busybox:
 > "ld (ld-elf2flt):
 > /opt/armv7m--uclibc--bleeding-edge-2/arm-buildroot-uclinux-uclibcgnueabi/bin/elf2flt

 > This was reported to the Binutils mailing list and it's seems
 > an elf2flt issue with .ARM.exidx RO data section as explained
 > by: https://sourceware.org/ml/binutils/2019-10/msg00132.html

 > Apply the patch provided by Greg Ungerer [1] and tested by
 > Christophe Priouzeau using stm32f469_disco_defconfig on
 > stm32f469-disco board.

 > Fixes:
 > https://gitlab.com/kubu93/toolchains-builder/-/jobs/319395300

 > [1] https://github.com/uclinux-dev/elf2flt/issues/12

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>
 > Cc: Christophe Priouzeau <christophe.priouzeau@st.com>

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
