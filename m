From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 11 Jul 2011 21:31:59 +0200
Subject: [Buildroot] [PATCH 03/12] linux: convert to the GENTARGETS
	infrastructure
In-Reply-To: <66c7e86f52aad84878870876946a99810e5fe2cb.1310392269.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 11 Jul 2011 15:53:47 +0200")
References: <cover.1310392269.git.thomas.petazzoni@free-electrons.com>
 <cover.1310392269.git.thomas.petazzoni@free-electrons.com>
 <66c7e86f52aad84878870876946a99810e5fe2cb.1310392269.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87vcv8likw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  linux/linux.mk |  116 +++++++++++++++++++++++++++-----------------------------
 Thomas>  1 files changed, 56 insertions(+), 60 deletions(-)

 Thomas> diff --git a/linux/linux.mk b/linux/linux.mk
 Thomas> index 9a63382..2c7ce89 100644
 Thomas> --- a/linux/linux.mk
 Thomas> +++ b/linux/linux.mk
 Thomas> @@ -15,8 +15,10 @@ LINUX_SOURCE  := linux-$(LINUX_VERSION).tar.bz2
 Thomas>  LINUX_SITE    := $(BR2_KERNEL_MIRROR)/linux/kernel/v2.6/
 Thomas>  endif
 
 Thomas> -LINUX_DIR     := $(BUILD_DIR)/linux-$(LINUX_VERSION)
 Thomas> -LINUX_PATCH   := $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
 Thomas> +LINUX_PATCHES   := $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))

Please use '=' for consistency. Otherwise looks good.

-- 
Bye, Peter Korsgaard
