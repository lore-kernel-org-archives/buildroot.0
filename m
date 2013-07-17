From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 18 Jul 2013 00:22:04 +0200
Subject: [Buildroot] [PATCH] arch/arm: add support for thumb(1) mode
In-Reply-To: <1374075555-9599-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 17 Jul 2013 12:39:15 -0300")
References: <1374075555-9599-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <874nbsyghf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  arch/Config.in.arm | 28 ++++++++++++++++++++++++++--
 Gustavo>  1 file changed, 26 insertions(+), 2 deletions(-)

 
 Gustavo>  config BR2_ARM_INSTRUCTIONS_ARM
 Gustavo>  	def_bool y
 Gustavo> -	depends on !BR2_ARM_INSTRUCTIONS_THUMB2
 Gustavo> +	depends on !(BR2_ARM_INSTRUCTIONS_THUMB || BR2_ARM_INSTRUCTIONS_THUMB2)

You seem to have missed setting BR2_TARGET_CPU_MODE to "thumb", so it
doesn't actually do anything.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
