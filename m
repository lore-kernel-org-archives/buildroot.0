From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Oct 2013 20:40:36 +0100
Subject: [Buildroot] SCSI / SAS / FC support
In-Reply-To: <CAK9Ae0P0gJ+cLYR96mz7Xddy4_zpdS6zXqg4ak3nbemTqVR9Yw@mail.gmail.com>
References: <CAK9Ae0P0gJ+cLYR96mz7Xddy4_zpdS6zXqg4ak3nbemTqVR9Yw@mail.gmail.com>
Message-ID: <20131028204036.74e46ef8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Beren Scott,

On Sun, 27 Oct 2013 14:00:37 +1100, Beren Scott wrote:

> I am trying to create a buildroot setup where a wide variety of hard drives
> can be detected and accessed. I have a working solution at the moment,
> which seems to only detect IDE and SATA hard drives, and I am thinking
> along the lines of there not being controller driver support in my current
> setup. So, I am asking, how do I add that into my project? I cannot seem to
> find any option for it.

What you're looking for are drivers for specific pieces of hardware.
Such drivers are typically part of the Linux kernel itself, and
therefore the configuration options to enable/disable them are not
exposed in Buildroot 'make menuconfig'.

However, if you build your kernel with Buildroot, you can run 'make
linux-menuconfig' to adjust the kernel configuration. If you're
building the kernel separately, then it's up to you to adjust your
kernel configuration.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
