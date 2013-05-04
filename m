From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 04 May 2013 23:21:59 +0200
Subject: [Buildroot] [PATCH v4 07/12] arc: Add support for ARC-specific
	uClibc
In-Reply-To: <1367524293-32081-8-git-send-email-mjonker@synopsys.com> (Mischa
 Jonker's message of "Thu, 2 May 2013 21:51:28 +0200")
References: <1367524293-32081-1-git-send-email-mjonker@synopsys.com>
 <1367524293-32081-8-git-send-email-mjonker@synopsys.com>
Message-ID: <877gjeqw3s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mischa" == Mischa Jonker <Mischa.Jonker@synopsys.com> writes:

 Mischa> Signed-off-by: Mischa Jonker <mjonker@synopsys.com>


 Mischa> ---
 Mischa>  toolchain/uClibc/Config.in              |   10 ++++++++--
 Mischa>  toolchain/uClibc/uClibc-snapshot.config |    2 ++
 Mischa>  toolchain/uClibc/uclibc.mk              |    4 ++++
 Mischa>  3 files changed, 14 insertions(+), 2 deletions(-)

 Mischa> diff --git a/toolchain/uClibc/Config.in b/toolchain/uClibc/Config.in
 Mischa> index b98e2e8..316d006 100644
 Mischa> --- a/toolchain/uClibc/Config.in
 Mischa> +++ b/toolchain/uClibc/Config.in
 Mischa> @@ -16,12 +16,16 @@ choice
 
 Mischa>  	config BR2_UCLIBC_VERSION_0_9_32
 Mischa>  		bool "uClibc 0.9.32.x"
 Mischa> -		depends on !(BR2_avr32 || BR2_sh || BR2_xtensa)
 Mischa> +		depends on !(BR2_arc || BR2_avr32 || BR2_sh || BR2_xtensa)
 
 Mischa>  	config BR2_UCLIBC_VERSION_0_9_33
 Mischa>  		bool "uClibc 0.9.33.x"
 Mischa> -		depends on !BR2_xtensa
 Mischa> +		depends on !(BR2_arc || BR2_xtensa)
 
 Mischa> +	config BR2_UCLIBC_VERSION_0_9_33_ARC
 Mischa> +		bool "uClibc 0.9.33.x-arc"
 Mischa> +		depends on BR2_arc
 Mischa> +	

You're adding a bunch of trailing spaces here.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
