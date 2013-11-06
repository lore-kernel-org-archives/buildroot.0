From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Nov 2013 21:54:52 +0100
Subject: [Buildroot] [PATCH v3] uclibc: reinstate support for version
 0.9.31
In-Reply-To: <1383767739-762-1-git-send-email-spdawson@gmail.com>
References: <1383767739-762-1-git-send-email-spdawson@gmail.com>
Message-ID: <20131106215452.7c38fc1f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Simon,

On Wed,  6 Nov 2013 19:55:39 +0000, spdawson at gmail.com wrote:

> +	config BR2_UCLIBC_VERSION_0_9_31
> +		bool "uClibc 0.9.31.x"
> +		depends on !BR2_xtensa
> +

Can we make this depends on BR2_avr32 instead, and generally consider
0.9.31 as an avr32 only version?

Also, I believe if the other uClibc versions do not work for AVR32,
then we should add the corresponding 'depends on !BR2_avr32'.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
