From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 08 Aug 2018 16:55:06 +0200
Subject: [Buildroot] [PATCH] uboot-tools: requires host gcc 4.7+
In-Reply-To: <20180808143953.nxylmvq2ehhs6mx5@sapphire.tkos.co.il> (Baruch
 Siach's message of "Wed, 8 Aug 2018 17:39:54 +0300")
References: <cc4aa02d36bdd5ab0f2a450508c67c332d1b5d2c.1533616681.git.baruch@tkos.co.il>
 <87tvo5exs2.fsf@dell.be.48ers.dk>
 <20180808143953.nxylmvq2ehhs6mx5@sapphire.tkos.co.il>
Message-ID: <87pnysgb79.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

Hi,

 >> >  config BR2_PACKAGE_UBOOT_TOOLS
 >> >  	bool "u-boot tools"
 >> > +	depends on BR2_HOST_GCC_AT_LEAST_4_7 # -std=gnu11
 >> 
 >> What about host-uboot-tools?

 > The only config symbols that builds host-uboot-tools is 
 > BR2_PACKAGE_XVISOR_CREATE_UBOOT_IMAGE. So we should make it depend on 
 > BR2_HOST_GCC_AT_LEAST_4_7, right?

 > AFAIU, there is no way to directly make host packages depend on Kconfig 
 > symbols.

Ehh, but we do have a Config.in.host / BR2_PACKAGE_HOST_UBOOT_TOOLS, and
a number of places where it is selected?

-- 
Bye, Peter Korsgaard
