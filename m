From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Oct 2013 11:47:54 +0200
Subject: [Buildroot] Help with selecting package
In-Reply-To: <525BAB59.4020105@gmail.com>
References: <525BAB59.4020105@gmail.com>
Message-ID: <20131014114754.12f56017@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Marco Trapanese,

On Mon, 14 Oct 2013 10:29:13 +0200, Marco Trapanese wrote:

> I receive a lot of warning during the compilation of a kernel module, 
> like this:
> 
> WARNING: "videobuf_read_stream" 
> [/home/mark/dev/rpiqt5/buildroot-rpi/output/build/sensoray2253-1.2.6/driver/s2253.ko] 
> undefined!
> 
> "videobuf_read_stream" is defined in media/videobuf-core.h.
> 
> How to find which package I have to add to "depends on" and to 
> "PACKAGE_DEPENDENCIES" ?
> I've already added libv4l.

It's not a dependency on an userspace library, it's a dependency on a
kernel option, and there's no way to ensure this option is enabled by
mean of Buildroot dependencies. You should just make sure your kernel
configuration has the right option enabled.

Make sure you have CONFIG_VIDEOBUF_GEN enabled in your kernel, which
seems to be the option that ensures videobuf_read_stream() is provided
by the kernel.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
