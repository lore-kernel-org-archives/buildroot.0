From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Sep 2010 19:46:24 +0200
Subject: [Buildroot] CONFIG_BLK_DEV_INITRD deactivated on automatic build
In-Reply-To: <4CA47342.7020405@googlemail.com>
References: <4CA47342.7020405@googlemail.com>
Message-ID: <20100930194624.62fdea0e@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Dennis,

On Thu, 30 Sep 2010 13:23:46 +0200
Dennis Borgmann <dennis.borgmann@googlemail.com> wrote:

> First of all - thank you for the work done for this project. It is
> awesome and I really like it. Straightforward and quick to use.
> 
> I think, I found a bug. If you download buildroot and start
> configuring your project with "make menuconfig" and after that
> configure the kernel with "make linux26-menuconfig", everything seems
> to be ok. I did give it a custom kernel-config named
> "/tmp/config-2.6.34".
> 
> After running "make", everything seems to be ok, but the resulting
> kernel does not contain the option "CONFIG_BLK_DEV_INITRD". I need to
> manually do a "make linux26-menuconfig" again and rebuild the kernel
> for the resulting kernel to contain this option.
> 
> This was a really silly thing to find, took me around one week,
> because you wouldn't think of such a mistake. Could it be, that this
> is a bug? I am using buildroot-2010.08.

Yes, it was a bug. When "initramfs" isn't used as the target filesystem
format, we forcefully disabled the CONFIG_BLK_DEV_INITRD option. This
has been fixed post-2010.08, by the following commit:

 http://git.buildroot.net/buildroot/commit/?id=ee3f319249e146d92b093ad8c45a3a908d44236f

So you can either apply this patch on top of 2010.08, or use the latest
Buildroot git. We unfortunately do not maintain "stabilized" versions
of Buildroot (such as 2010.08.x) for the moment.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
