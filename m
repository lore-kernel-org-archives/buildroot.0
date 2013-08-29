From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Aug 2013 10:12:14 +0200
Subject: [Buildroot] wanna compile busybox and uclib with self modified
 code, please help
In-Reply-To: <521EDAF9.1080609@mind.be>
References: <BAY167-W75F3A55D10B8CCC0F96A74944A0@phx.gbl>
 <521C5ABF.4000301@relinux.de>
 <BAY167-W23A3ABEDF04D72F595092D944A0@phx.gbl>
 <521C70CE.4060101@relinux.de>
 <BAY167-W54738C29151963CCC2605944B0@phx.gbl>
 <521EDAF9.1080609@mind.be>
Message-ID: <20130829101214.61597274@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Thu, 29 Aug 2013 07:24:09 +0200, Arnout Vandecappelle wrote:

>   Perhaps you are using an internal toolchain? In that case buildroot 
> also needs to install kernel headers (as part of the toolchain), and this 
> is handled separately. So you should also add this to you local.mk:
> 
> LINUX_HEADERS_OVERRIDE_SRCDIR = /home/wangk/linux-2.6.39

Originally, William said he wanted to modify Busybox and uClibc. So why
would using LINUX_OVERRIDE_SRCDIR or LINUX_HEADERS_OVERRIDE_SRCDIR be
useful for that?

I'm thinking that William has read the LINUX_OVERRIDE_SRCDIR example in
some slides or documentation, without realizing that it's actually
<pkg>_OVERRIDE_SRCDIR and that therefore if the intent is to make some
modifications to Busybox, BUSYBOX_OVERRIDE_SRCDIR should be used.

Also, note that both linux-headers and uclibc became real packages
*after* the 2013.05 release. So if anyone is using 2013.05 or earlier,
those aren't packages, and the override source directory feature cannot
be used.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
