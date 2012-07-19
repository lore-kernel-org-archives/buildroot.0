From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Jul 2012 23:50:41 +0200
Subject: [Buildroot] [PATCH  2/2] New package: cpuload
In-Reply-To: <1342688049-12065-2-git-send-email-keguang.zhang@gmail.com>
References: <1342688049-12065-1-git-send-email-keguang.zhang@gmail.com>
 <1342688049-12065-2-git-send-email-keguang.zhang@gmail.com>
Message-ID: <20120719235041.46ba9c2c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 19 Jul 2012 16:54:09 +0800,
Kelvin Cheung <keguang.zhang@gmail.com> a ?crit :

> Add new package: cpuload
> 
> cpuload is a simple tool to obtain intuitive vision of CPU load
> (including total, user, system, irq and softirq) within a certain
> time, which is especially useful for embedded system without GUI.
> 
> Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>

Your code includes <wchar.h>, but the package does not depend on
BR2_USE_WCHAR. Did you try to build your package with the minimal
uClibc settings (i.e wchar, IPv6, RPC, locale, etc. disabled) to see if
it builds without requiring any special toolchain feature?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
