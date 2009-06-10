From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 10 Jun 2009 20:01:59 +0200
Subject: [Buildroot] [PATCH 2/2] Add target support for MXC based devices
In-Reply-To: <20090610075902.GK26688@buzzloop.caiaq.de> (Daniel Mack's message
	of "Wed\, 10 Jun 2009 09\:59\:03 +0200")
References: <1244473080-8195-1-git-send-email-daniel@caiaq.de>
	<1244473080-8195-2-git-send-email-daniel@caiaq.de>
	<87prdesr1a.fsf@macbook.be.48ers.dk>
	<20090608152648.GL29236@buzzloop.caiaq.de>
	<87hbyqsios.fsf@macbook.be.48ers.dk>
	<20090610075902.GK26688@buzzloop.caiaq.de>
Message-ID: <87k53kq86g.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Mack <daniel@caiaq.de> writes:

 Daniel> diff --git a/target/generic/Config.in b/target/generic/Config.in
 Daniel> index cb7ef77..1e1d11f 100644
 Daniel> --- a/target/generic/Config.in
 Daniel> +++ b/target/generic/Config.in
 Daniel> @@ -106,6 +106,14 @@ config BR2_TARGET_GENERIC_GETTY_TTYSAC2
 Daniel>  	depends on BR2_arm
 Daniel>  config BR2_TARGET_GENERIC_GETTY_TTYSAC3
 Daniel>  	bool "ttySAC3"
 Daniel> +config BR2_TARGET_GENERIC_GETTY_TTYMXC0
 Daniel> +	bool "ttymxc0"
 Daniel> +	depends on BR2_arm
 Daniel> +config BR2_TARGET_GENERIC_GETTY_TTYMXC1
 Daniel> +	bool "ttymxc1"
 Daniel> +	depends on BR2_arm
 Daniel> +config BR2_TARGET_GENERIC_GETTY_TTYMXC2
 Daniel> +	bool "ttymxc2"
 Daniel>  	depends on BR2_arm

You removed the depends on BR2_arm from TTYSAC3, but I've fixed that
and committed - Thanks.

-- 
Bye, Peter Korsgaard
