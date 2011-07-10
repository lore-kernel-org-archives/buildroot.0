From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 10 Jul 2011 10:57:07 +0200
Subject: [Buildroot] [PATCH 07/28] barebox: re-indent variable
	definitions
In-Reply-To: <a7757c6616c0eb9d9f1a3dddf06a3be2f24adcb0.1309895466.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 5 Jul 2011 21:53:58 +0200")
References: <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
 <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
 <a7757c6616c0eb9d9f1a3dddf06a3be2f24adcb0.1309895466.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87mxgm1pjw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  boot/barebox/barebox.mk |   13 +++++++------
 Thomas>  1 files changed, 7 insertions(+), 6 deletions(-)

 Thomas> diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
 Thomas> index f3e769f..88f222e 100644
 Thomas> --- a/boot/barebox/barebox.mk
 Thomas> +++ b/boot/barebox/barebox.mk
 Thomas> @@ -4,12 +4,13 @@
 Thomas>  #
 Thomas>  #############################################################
 
 Thomas> -BAREBOX_VERSION:=2011.05.0
 Thomas> -BAREBOX_SOURCE:=barebox-$(BAREBOX_VERSION).tar.bz2
 Thomas> -BAREBOX_SITE:=http://www.barebox.org/download/
 Thomas> -BAREBOX_DIR:=$(BUILD_DIR)/barebox-$(BAREBOX_VERSION)
 Thomas> -BAREBOX_CAT:=$(BZCAT)
 Thomas> -BAREBOX_BOARD_DEFCONFIG:=$(call qstrip,$(BR2_TARGET_BAREBOX_BOARD_DEFCONFIG))
 Thomas> +BAREBOX_VERSION := 2011.05.0
 Thomas> +BAREBOX_SOURCE  := barebox-$(BAREBOX_VERSION).tar.bz2
 Thomas> +BAREBOX_SITE    := http://www.barebox.org/download/
 Thomas> +BAREBOX_DIR     := $(BUILD_DIR)/barebox-$(BAREBOX_VERSION)
 Thomas> +BAREBOX_CAT     := $(BZCAT)

I prefer the BAREBOX_CAT = $(BZCAT) style, which is the most commonly
used style under package:

grep -l '[A-Z0-9] = ' package/**/*mk|wc -l
625

grep -l '  = ' package/**/*mk|wc -l
18

grep -l '[A-Z0-9] := ' package/**/*mk|wc -l
7

grep -l '  := ' package/**/*mk|wc -l
0

Care to respin?

-- 
Bye, Peter Korsgaard
