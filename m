From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Dec 2016 14:12:18 +0100
Subject: [Buildroot] [PATCH] BeagleBoard X15: new board
In-Reply-To: <20161216222749.p2qhprdn3arg2bpc@skynet.be>
References: <20161215223730.4890-1-theo.debrouwere@skynet.be>
 <87d1gsasv8.fsf@dell.be.48ers.dk>
 <20161216222749.p2qhprdn3arg2bpc@skynet.be>
Message-ID: <20161217141218.1a10616a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 16 Dec 2016 23:27:49 +0100, Theo Debrouwere wrote:

> U-boot (both ti's release & mainline) currently contains 'console=ttyO2',
> but the kernel 'changes' it to ttyS2.
> 
> *snip*
> [    0.000772] WARNING: Your 'console=ttyO2' has been replaced by 'ttyS2'
> [    0.000779] This ensures that you still see kernel messages. Please
> [    0.000784] update your kernel commandline.
> *snip*
> 
> This can be fixed with this config line, although I can also provide a patch.
> Or fix it inside the uEnv.txt

Then I think it makes sense to provide your own uEnv.txt to fix this.

It's somewhat odd that the U-Boot defconfig provided by TI doesn't
match the Linux kernel provided by TI in terms of UART naming.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
