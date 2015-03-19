From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Mar 2015 16:58:44 +0100
Subject: [Buildroot] [PATCH] configs: add defconfig for Freescale i.MX31
 PDK
In-Reply-To: <550AED3F.4070606@freescale.com>
References: <1426585422-22441-1-git-send-email-vincent.stehle@freescale.com>
 <550A0AF9.5050101@mind.be> <550AED3F.4070606@freescale.com>
Message-ID: <20150319165844.63a1fe52@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vincent Stehl?,

On Thu, 19 Mar 2015 16:37:35 +0100, Vincent Stehl? wrote:

> >> +BR2_KERNEL_HEADERS_3_2=y
> >  That doesn't sound like a good idea when the kernel is 2.6.28...
> 
> Granted, this is not optimal. Those are the kernel headers
> closest to 2.6.28, "easily" available in buildroot.
> 
> It is indeed possible to manually specify the 2.6.28 kernel
> headers version, but this necessitates two patches to fix the
> linux-headers "build".
>   Do you prefer this solution?

It is not a preference at all: running userspace binaries and C
libraries built with kernel headers more recent than the running is a
very good recipe for disaster. Your userspace and C library will
believe that certain system calls exist while it's not the case.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
