From: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Fri, 29 Apr 2016 08:26:57 +0200
Subject: [Buildroot] [genimage] Create a folder with a file using
	genimage
In-Reply-To: <87bn4tv2d2.fsf@dell.be.48ers.dk>
References: <CALtfCQYZn9FVyFPfjsL6YmGsPpkGwfsDeGWg_bdNezkKjm5=qg@mail.gmail.com>
 <87bn4tv2d2.fsf@dell.be.48ers.dk>
Message-ID: <CALtfCQbB6e2mipiVj=jKKbFGwjq3r_od1EFppQg_8jV99Y7e=A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you very much Peter,

I've got two more questions related to genimage.

1?.- Is there any way to give the partition boot the label "BOOT" and the
partition rootfs the label "rootfs"? It will be very useful because when I
insert the sd card in a computer I'm going to know the folder name where is
going to be mounted the sd card.

2?.- When the sdcard.img is generated and when you make a dd command to the
sd card, it's wasted most of the size of the sd card. I usually use a
16GBytes sd card, and my sdcard.img is only  around 110 MB so the remaining
space is wasted. Is there any way to give the rootfs partition an extra
size (for example 1 Gbyte o something like that)? I was trying to use this,
but it doesn't work:

image sdcard.img {
  hdimage {
  }

  partition boot {
    partition-type = 0xC
    bootable = "true"
    image = "boot.vfat"
  }

  partition rootfs {
    partition-type = 0x83
    image = "rootfs.ext4"
    size = 1G
  }
}

Best regards.

Oscar Gomez Fuente.

On 28 April 2016 at 23:40, Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Oscar" == Oscar Gomez Fuente <oscargomezf@gmail.com> writes:
>
>  > Hi,
>  > I would like to use genimage to create an overlay folder in boot.vfat
>  > partition to add (.dtbo or .dtb)  files. Does anyone know how to do
> this?
>
> That is afaik not currently possible. We can either talk to the
> pengutronix guys if they would be interested in adding such support
> (E.G. either a "dir" type or allowing wildcards for the "file" type), or
> you can generate the list of files outside genimage (E.G. in the
> post-image script) and include that genimage snippet in the main file:
>
> http://git.pengutronix.de/?p=genimage.git;a=blob;f=README#l16
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160429/061f42f0/attachment.html>
