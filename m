From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 30 Jul 2013 14:39:46 +0200
Subject: [Buildroot] How to login as root without password
In-Reply-To: <CAHbR41VH17_qSe3T92b=n61_f1a_64jVXy5rNCKaexajmWzt9g@mail.gmail.com>
References: <CAHbR41VH17_qSe3T92b=n61_f1a_64jVXy5rNCKaexajmWzt9g@mail.gmail.com>
Message-ID: <CAAXf6LXRYRvhWwE-TnM2fnGPMp+s+eEa3oUQtwdatMPxP=vAyA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Zhou Qiang,

On Tue, Jul 30, 2013 at 12:43 PM, zhou qiang <zhouqiang.search@gmail.com> wrote:
> Hi , guys
>
> I am working on a server (no root permision)  , my intention is to create a
> root filesystem  for arm board ,and
> login as root ,directly to /bin/sh(no login window ).
> From the document , I know that it is not possible to use target/ , then I
> create a rootfs.tar in images/  , and
> extract it .what  I did  is as following :
>
> (1)  "fakeroot tar -xvf images/rootfs.tar -C work/rootfs " to extract it to
> rootfs directory ,
> since no root permision , fakeroot does a great job.
>
> (2) Adding  "ttyS0:respawn:~/bin/sh " to avoid requiring login .
>
>
> After burning the filesystem to development board.
> The problem is coming , current login is a ordinary user , what I expected
> is root user .

Are you using busybox or not?
By default, on a busybox system, you login as the root user. If this
is not the case, then something about your configuration will be
different.

Best regards,
Thomas
