From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Feb 2011 19:49:52 +0100
Subject: [Buildroot] Kernel refuses to boot
In-Reply-To: <AANLkTinMo+hCnOUmVdKb+pB_G1rX8zLzGhm5y+8VY-1P@mail.gmail.com>
References: <AANLkTinMo+hCnOUmVdKb+pB_G1rX8zLzGhm5y+8VY-1P@mail.gmail.com>
Message-ID: <20110218194952.53214c03@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bruce,

On Fri, 18 Feb 2011 18:21:22 +0000
bruce bushby <bruce.bushby@gmail.com> wrote:

> I'm very new to embedded linux and buildroot....although already
> addicted.
> 
> I've spent the past month trying to boot a kernel on one of Telit's
> modules (GE863-PRO) and am sad to say I have progressed no further
> then the first two hours :) so I must be missing some fundamental
> key...hence this email.
> 
> I have tried various kernel configurations via buildroot, I have also
> downloaded pre-compiled kernels from the linux4sam site....think I
> also tried a few others which were aimed at "at91sam9260" and they
> all do exactly same thing......after uncompressing the kernel they
> print garbage....and after a while return to the uboot prompt.
> 
> Any hints or pointers would be appreciated. I understand this is
> perhaps not the right forum for such a discussion.

What is your hardware exactly ? Which kernel version are you using ?
Which kernel configuration are you using ?

You can't just get a random ~AT91 kernel and have it work on any random
AT91 board. The kernel has to be specifically configured for the
hardware platform you're using. Typically, the hardware vendor (Telit
in your case) provides kernel sources and configuration that work on
their platform.

I haven't seen any Telit board supported in the upstream mainline Linux
kernel. So I don't think you'll have any success with a stock mainline
kernel such as the 2.6.33.7 you're using.

According to
http://www.telit.com/en/products/programming/linux/linux-on-ge863-pro3.php,
they have a Linux kernel running on this platform. So you should ask
the vendor of your hardware platform.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
