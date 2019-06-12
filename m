From: Christian Stewart <christian@paral.in>
Date: Wed, 12 Jun 2019 14:41:09 -0700
Subject: [Buildroot] add option to run docker with initramfs
In-Reply-To: <20190612201856.GH2647@scaer>
References: <CAL+Nh7PQaDFU_SrWoV_W7-H=s6Y4ALHeC3A_LUozY+SnyXo3Lw@mail.gmail.com>
 <20190612201856.GH2647@scaer>
Message-ID: <CA+h8R2rmc0_Z5ryu290S_A6wq4vS=AvyC6A4bCoK9VMts6CLbw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Frank, all,

Frank is referring to a docker environment variable that must be set in
order to change the root pivot step to be compatible with a ramfs

I do this in my SkiffOS project,

system/docker.service.d/ramdisk.conf

[Service]
Environment=DOCKER_RAMDISK=true

On Wed, Jun 12, 2019, 1:19 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:

> > By default docker uses pivot_root which is not available in initramfs.
>
> pivot_root is provided by either util-linux or busybox; it has (AFAICT)
> no relation to whether running from an initramfs or any other filesystem).
>
> Our default configuration for busybox eeven enables pivot_root.
>

This is more related to docker behavior than busybox or anything else.

Best,
Christian
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190612/61264a19/attachment.html>
