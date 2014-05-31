From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 31 May 2014 13:13:46 +0200
Subject: [Buildroot] [PATCH] reenable microblaze little endian for
 internal musl toolchain
In-Reply-To: <20140531084556.GA17277@waldemar-brodkorb.de>
References: <20140531084556.GA17277@waldemar-brodkorb.de>
Message-ID: <20140531131346.082c4fed@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Sat, 31 May 2014 10:45:56 +0200, Waldemar Brodkorb wrote:

>  	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_microblazebe || \
> -		BR2_mips || BR2_mipsel || BR2_powerpc || BR2_x86_64
> +		BR2_microblaze || BR2_mips || BR2_mipsel || BR2_powerpc || BR2_x86_64

Nope, just revert the patch I made, i.e turn BR2_microblazebe into
BR2_microblaze again. We have three options in Buildroot:

	BR2_microblazeel, for Microblaze LE
	BR2_microblazebe, for Microblaze BE
	BR2_microblaze, when either Microblaze LE or BE is chosen

See arch/Config.in.microblaze.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
