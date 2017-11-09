From: Chu, Zhuliang (NSB - CN/Shanghai) <zhuliang.chu@nokia-sbell.com>
Date: Thu, 9 Nov 2017 04:44:56 +0000
Subject: [Buildroot] [RFCv1 0/4] Per-package SDK and target directories
In-Reply-To: <20171108175524.29e9a458@windsurf>
References: <5DBA847110A28B46BBA17BE675F0C9B2181A8D38@cnshjmbx01>,
 <20171108175524.29e9a458@windsurf>
Message-ID: <5DBA847110A28B46BBA17BE675F0C9B2181AA413@cnshjmbx01>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

I add some ccnfigurationsthis to enable ccache in qemu_x86_defconfig.
BR2_CCACHE_DIR="$(shell readlink -m $(TOPDIR)/../ccache-buildroot)"
BR2_CCACHE_INITIAL_SETUP="--max-size=10G"
BR2_CCACHE_USE_BASEDIR=y

first this will report 'command not found' error as Q4.
I use my Q4 patch to continue compilation and then this error will appeared .

________________________________________
From: Thomas Petazzoni [thomas.petazzoni at free-electrons.com]
Sent: Thursday, November 09, 2017 0:55
To: Chu, Zhuliang (NSB - CN/Shanghai)
Cc: buildroot at uclibc.org; yann.morin.1998 at free.fr; arnout at mind.be; peter at korsgaard.com; patrickdepinguin+buildroot at gmail.com
Subject: Re: [Buildroot] [RFCv1 0/4] Per-package SDK and target directories

Hello,

On Tue, 7 Nov 2017 11:48:17 +0000, Chu, Zhuliang (NSB - CN/Shanghai)
wrote:

> Q3: ERROR: Could not generate syscalls.(uclibc_error.log)
> I have not solved this problem, I put the error message in the attachment

So I built a basic uClibc system, toolchain included with the following
defconfig:

BR2_arm=y
BR2_cortex_a8=y

And it built just fine.

Are you able to reproduce this problem? Does it happen every time, or
just once in a while?

Best regards,

Thomas
--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
