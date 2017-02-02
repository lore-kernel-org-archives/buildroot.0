From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Feb 2017 16:21:05 +0100
Subject: [Buildroot] [PATCH 1/1] grub2: add option to specify grub.cfg
	file.
In-Reply-To: <CAFSsvmqtxvxDK--NU-kZHGYed9wqp4XbqdGUTufEJpnc-PTCKQ@mail.gmail.com>
References: <20170202134023.25002-1-Adamduskett@outlook.com>
 <20170202145558.2f6b5923@free-electrons.com>
 <CAFSsvmqtxvxDK--NU-kZHGYed9wqp4XbqdGUTufEJpnc-PTCKQ@mail.gmail.com>
Message-ID: <20170202162105.65d7f27b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Please keep the mailing list in Cc. Thanks!

On Thu, 2 Feb 2017 10:01:47 -0500, Adam Duskett wrote:

> It's not technically "needed" I guess, but I am usually not a fan of hard coded
> things such as this.

There are full of hardcoded things all over the place. Each package
installs its own init script or systemd unit file, and the one we
install is hardcoded. If you want some customization, just overwrite
with your own in a rootfs overlay or post-build script.

> Sure I could create a extra folder and then change the menuconfig
> to add a new overlay, but why would they have to instead of just
> putting it in a board file or any other folder they choose?

What's the difference? In all situations you have to put your own
custom file somewhere. Specifying the location of this file through a
grub2 specific option like you propose or through the generic rootfs
overlay option is *exactly* the same.

Except that the latter can be used to override *any* file in the
filesystem, and therefore avoids the need to add gazillions of options
in each and every package. With you reasoning, we should have an option
in the openssh package to install a custom ssh_config file, another one
to install a custom sshd_config file, and then dbus should also have
its own options to install custom dbus policy files, etc, etc. This is
definitely not the direction we want to take.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
