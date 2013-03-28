From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Mar 2013 14:14:07 +0100
Subject: [Buildroot] Bug in uClibc-0.9.33.2 resolv.c
In-Reply-To: <51543E86.9000706@wut.de>
References: <51543E86.9000706@wut.de>
Message-ID: <20130328141407.2b625501@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Markus K?nigshaus,

On Thu, 28 Mar 2013 13:58:46 +0100, Markus K?nigshaus wrote:

> I have found a bug in resolv.c in conjunction with the function 
> res_init: res_init sets __ res_sync to res_sync_func and then calls 
> __res_vinit.
> -> __res_vinit calls __ open_nameservers.
> In __open_nameservers __nameserver and __nameservers are set by the 
> contents of resolv.conf. So far so good.
> -> __open_nameserver calls res_sync_func
>          In res_sync_func__nameservers is set to rp->nscount, what is 0.
> Backin _res_vinit rp->nscount is set to __nameservers then, what is 0. 
> So the cat bites its own tail.
> 
> Attached is a simple patch, that fixes the problemby setting __res_sync 
> after calling __res_vinit.

Thanks Markus for this patch. However, this is the mailing list for
Buildroot, so we're not the one responsible for taking such patches.
You should instead get in touch with the uClibc community, that has its
own mailing list: http://uclibc.org/lists.html.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
