From: Diego Iastrubni <diegoiast@gmail.com>
Date: Wed, 20 Jul 2011 11:48:28 +0300
Subject: [Buildroot] devtmpfs and initramfs
In-Reply-To: <87ei1l2wru.fsf@macbook.be.48ers.dk>
References: <201107191222.19313.arnout@mind.be>
 <87aaca4l1y.fsf@macbook.be.48ers.dk>
 <201107191323.36347.arnout@mind.be> <87ei1l2wru.fsf@macbook.be.48ers.dk>
Message-ID: <CALR4fELkEBNtLS2WYXVkLkpttsMrzbHb04i+KZS+wfp3_TwMzQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
> We could, or adjust initramfs.mk to add a small shellscript as /init
> rather than just a symlink:
>
> #!/bin/sh
> # devtmpfs does not get automounted for initramfs'es
> /bin/mount -t devtmpfs devtmpfs /dev
> exec /sbin/init $*
>
> Unless BR2_ROOTFS_DEVICE_CREATION_STATIC is enabled.
>
>
Sorry, but this solution smells just like my socks. I think wk can find a
better one :)
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110720/692cdd8d/attachment.html>
