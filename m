From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 11 Jul 2011 21:58:52 +0200
Subject: [Buildroot] [PATCH 12/12] uboot: Add 2011.06
In-Reply-To: <14df8d133d8d461941592ceaab66bc040fbabcbe.1310392269.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 11 Jul 2011 15:53:56 +0200")
References: <cover.1310392269.git.thomas.petazzoni@free-electrons.com>
 <cover.1310392269.git.thomas.petazzoni@free-electrons.com>
 <14df8d133d8d461941592ceaab66bc040fbabcbe.1310392269.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87wrfok2rn.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  boot/uboot/Config.in |    6 +++++-
 Thomas>  1 files changed, 5 insertions(+), 1 deletions(-)

 Thomas> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
 Thomas> index b8eb42d..d396fb5 100644
 Thomas> --- a/boot/uboot/Config.in
 Thomas> +++ b/boot/uboot/Config.in
 Thomas> @@ -12,10 +12,13 @@ config BR2_TARGET_UBOOT_BOARDNAME
 
 Thomas>  choice
 Thomas>  	prompt "U-Boot Version"
 Thomas> -	default BR2_TARGET_UBOOT_2011_03
 Thomas> +	default BR2_TARGET_UBOOT_2011_06
 Thomas>  	help
 Thomas>  	  Select the specific U-Boot version you want to use
 
 Thomas> +config BR2_TARGET_UBOOT_2011_06
 Thomas> +	bool "2011.06"
 Thomas> +
 Thomas>  config BR2_TARGET_UBOOT_2011_03
 Thomas>  	bool "2011.03"
 
 Thomas> @@ -48,6 +51,7 @@ endif
 
 Thomas>  config BR2_TARGET_UBOOT_VERSION
 Thomas>  	string
 Thomas> +	default "2011.06"	if BR2_TARGET_UBOOT_2011_06
 Thomas>  	default "2011.03"	if BR2_TARGET_UBOOT_2011_03
 Thomas>  	default "2010.12"	if BR2_TARGET_UBOOT_2010_12
 Thomas>  	default "2010.09"	if BR2_TARGET_UBOOT_2010_09

So now we're up to 6 versions (+custom/git). I think we should drop
2010.03, but I can do that.

-- 
Bye, Peter Korsgaard
