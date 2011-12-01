From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Dec 2011 22:18:40 +0100
Subject: [Buildroot] Real time Linux implementation
In-Reply-To: <CAO6BqMXyye4TFHf0Pxc99Naq28wWg1ne=--q=e+VmfvPVuwD3w@mail.gmail.com>
References: <CAO6BqMXyye4TFHf0Pxc99Naq28wWg1ne=--q=e+VmfvPVuwD3w@mail.gmail.com>
Message-ID: <20111201221840.00174379@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 1 Dec 2011 11:27:37 -0800,
Morten Jensen <mjensen@nvs-technologies.com> a ?crit :

> Hello,
> We are using Buildroot on an ARM based development platform from IC-BOARD:
> http://www.ic-board.de/product_info.php?info=p163_STK-ADB3000---ICnova-SAM9G45-XC3S700AN-OEM.html
> 
> Does anybody have any experience with implementing Real Time OS
> functionality in the Linux Buildroot system or can you guide us to someone
> that may be able to help or consult in this effort ?

Yes. First thing to find out is what you need in terms of real-time :

 *) A vanilla Linux kernel with preemption enabled and proper process
    priorities ;

 *) A Linux kernel patched with PREEMPT_RT

 *) The more radical approach provided by Xenomai

All three are possible with Buildroot, it's rather what kind of
real-time guarantees and latencies you need and how much effort you're
ready to spend on achieving those guarantees.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
