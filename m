From: Anders Darander <anders.darander@gmail.com>
Date: Fri, 18 Dec 2009 08:15:57 +0100
Subject: [Buildroot] [buildroot] telnetd and udhcpc
In-Reply-To: <4B2CB099CF3D4F40B1B1442281CA94FFCED852@EXCHANGEVS01.appsig.com>
References: <4B2CB099CF3D4F40B1B1442281CA94FFCED852@EXCHANGEVS01.appsig.com>
Message-ID: <2c9a759f0912172315u61f3aff9ud9c30594dce91b5@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Dec 17, 2009 at 22:15, NEAL, RYAN <RYAN_NEAL@appsig.com> wrote:
>I have the kernel set to have the IP: DHCP support
> enabled (CONFIG_IP_PNP_DHCP).? Should I disable this and then somehow set it
> to call the udhcpc in busybox?

Yes, disable the kernel DHCP and IP configuration stuff. (This is of
course, as long as you're not using an NFS-mounted rootfs etc).

The preferred way is to let userspace handle as much as possible,
unless it is required by the kernel.

Regards,
Anders
