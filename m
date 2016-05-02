From: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Mon, 2 May 2016 11:51:48 +0200
Subject: [Buildroot] [genimage] Create a folder with a file using
	genimage
In-Reply-To: <87k2jgtlbq.fsf@dell.be.48ers.dk>
References: <CALtfCQYZn9FVyFPfjsL6YmGsPpkGwfsDeGWg_bdNezkKjm5=qg@mail.gmail.com>
 <87bn4tv2d2.fsf@dell.be.48ers.dk>
 <CALtfCQbB6e2mipiVj=jKKbFGwjq3r_od1EFppQg_8jV99Y7e=A@mail.gmail.com>
 <87r3dotxgr.fsf@dell.be.48ers.dk> <87k2jgtlbq.fsf@dell.be.48ers.dk>
Message-ID: <CALtfCQaCFkUyn5ow=ZaFHK+SJQ-Ecr4bfNN3jvj37xJ7E9Pb0A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ok Peter,

I've
checked BR2_TARGET_ROOTFS_EXT2_LABEL, BR2_TARGET_ROOTFS_EXT2_EXTRA_BLOCKS
and I've changed the boot image label:

...
image boot.vfat {
  vfat {
    extraargs = "-n mylabel"
...

And all work fine.

Thank you very much. Best regards.

Oscar Gomez Fuente
On 29 April 2016 at 18:46, Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:
>
> Hi,
>
>  >> 1?.- Is there any way to give the partition boot the label "BOOT" and
> the
>  >> partition rootfs the label "rootfs"? It will be very useful because
> when I
>  >> insert the sd card in a computer I'm going to know the folder name
> where is
>  >> going to be mounted the sd card.
>
>  > I think you are referring to fat/ext2 filesystem labels as PC-style
>  > partitions don't have labels.
>
>  > We currently don't have an option to set the ext2 label of the
>  > filesystem Buildroot creates, but I'll add that now.
>
> Ehh, I remembered wrong - We already DO have an option for it:
>
> config BR2_TARGET_ROOTFS_EXT2_LABEL
>         string "filesystem label"
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160502/33d2fee9/attachment.html>
