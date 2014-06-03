From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Jun 2014 17:22:58 +0200
Subject: [Buildroot] Build cross gdb and eclipse plugin
In-Reply-To: <CAM5ihG8wmEYwx7aZRT7+ypTHr3C3AbkzG_LJX8RZu=Qy1Vtm5w@mail.gmail.com>
References: <CAM5ihG8wmEYwx7aZRT7+ypTHr3C3AbkzG_LJX8RZu=Qy1Vtm5w@mail.gmail.com>
Message-ID: <20140603172258.25d64539@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jer?nimo Lopes,

On Tue, 3 Jun 2014 11:29:54 -0300, Jer?nimo Lopes wrote:
> First off all, sorry if this isn't the right place to post this.
> 
> I'm using buildroot, with external toolchain Sourcery CodeBench ARM
> 2013.11. I'm also using buildroot eclipse plugin.
> 
> If I set BR2_PACKAGE_HOST_GDB [=y] buildroot creates a file named
> 'arm-linux-gdb'.
> 
> But if I create a new debug configuration in eclipse, it sets the path for
> the GDB debbuger as
> '"buildroot_folder"/output/host/usr/bin/arm-none-linux-gnueabi-gdb'.
> 
> It's not a big problem at all, I just change the name of the file and
> everything works, but I no idea how to provide a patch for it.

That's because if you use a Sourcery CodeBench ARM toolchain, there is
no reason to enable BR2_PACKAGE_HOST_GDB, because the toolchain already
has a cross-debugger included.

Though, we should probably make this a bit more robust to avoid having
users run into the issue you've seen.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
