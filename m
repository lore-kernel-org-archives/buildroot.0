From: Kelvin Cheung <keguang.zhang@gmail.com>
Date: Fri, 20 Jul 2012 14:05:12 +0800
Subject: [Buildroot] [PATCH 2/2] New package: cpuload
In-Reply-To: <20120719235041.46ba9c2c@skate>
References: <1342688049-12065-1-git-send-email-keguang.zhang@gmail.com>
 <1342688049-12065-2-git-send-email-keguang.zhang@gmail.com>
 <20120719235041.46ba9c2c@skate>
Message-ID: <CAJhJPsWtEALX7PJjSfoQK9X5xjJxi83j5=EKpcA13ZdndLVJ=w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/7/20 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> Le Thu, 19 Jul 2012 16:54:09 +0800,
> Kelvin Cheung <keguang.zhang@gmail.com> a ?crit :
>
> > Add new package: cpuload
> >
> > cpuload is a simple tool to obtain intuitive vision of CPU load
> > (including total, user, system, irq and softirq) within a certain
> > time, which is especially useful for embedded system without GUI.
> >
> > Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>
>
> Your code includes <wchar.h>, but the package does not depend on
> BR2_USE_WCHAR. Did you try to build your package with the minimal
> uClibc settings (i.e wchar, IPv6, RPC, locale, etc. disabled) to see if
> it builds without requiring any special toolchain feature?
>

Thanks for reminding me.
I have removed the unnecessary wide-character string code in cpuload,
and upgrade it to version 0.3.

Please review the new patch.

In addtion, I have tested 'cpuload' on several architectures: x86, MIPS
and ARM. It works well so far.


>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
>



-- 
Best Regards!
Kelvin
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120720/6db05983/attachment.html>
