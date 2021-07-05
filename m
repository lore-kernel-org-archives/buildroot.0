From: Andrey Nechypurenko <andreynech@gmail.com>
Date: Mon, 5 Jul 2021 12:00:25 +0200
Subject: [Buildroot] Buildroot way to populate additional partition
In-Reply-To: <30ad3d8a-cc28-4630-bdcd-2d246670e771@mind.be>
References: <CAOiXNkBX7rM5oLqEEjGJb7Z613=A3g7tK+jJNjOt3e3JosGBpQ@mail.gmail.com>
 <30ad3d8a-cc28-4630-bdcd-2d246670e771@mind.be>
Message-ID: <CAOiXNkD1SEKRp59mPLvOK8D7xHxttU6V9M7kO4PPbqqrqVe=iA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Thanks for your suggestion!

>  There is not really a "Buildroot-way" to do this.

This is what I was suspecting. It is a little bit surprising for me because
I thought that having read-only rootfs with overlayfs for user data is a
rather typical solution for embedded systems. Maybe core Buildroot
developers can figure out how to better support this use-case in the
future ;-)

>  I've used two different approaches in the past:
>
> 1. In the post-build script, create the directories etc. in some temporary
> location and create the "data" filesystem by hand before calling genimage.
> Actually, if you don't use genimage.sh, you can simply use the --rootpath option
> of genimage to point to the data directory (so for the "data" image you would
> sent mountpoint to /).

I was also reading about --rootpath option and found out that it is hard to
use it with provided scripts. I am trying to avoid modifying existing
infrastructure as much as possible.

> 2. Create an init script to populate the data partition. This requires bypassing
> fstab and instead manually mounting the overlays as part of that init script.
> The advantage of this approach is that you can do "factory reset" by simply
> formatting the data partition.

This is a good point. Thanks for the hint.

Thanks,
Andrey.
