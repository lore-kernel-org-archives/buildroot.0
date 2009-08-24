From: Bai Shuwei <baishuwei@gmail.com>
Date: Mon, 24 Aug 2009 16:30:54 +0800
Subject: [Buildroot] [Qemu-devel] diskimage HOWTO
In-Reply-To: <4A9245EA.9030108@redhat.com>
References: <f3566d60908232239l268a7233necd10a6dd342f58f@mail.gmail.com>
	<4A9245EA.9030108@redhat.com>
Message-ID: <f3566d60908240130o225f99d4s8059da4fb5aca8d8@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 8/24/09, Kevin Wolf <kwolf@redhat.com> wrote:
>
> Bai Shuwei schrieb:
> > Hi, All:
> >   I want to build a test enviroment with QEMU and buildroot. But I don't
> > know how to build the diskimage which same as linux-0.2.img offered by
> > BUILD-ROOT. I build the diskimage following the
> >    buildroot-2009.05/docs/README.diskimage
> > <
> http://192.168.1.102/crosscopile/buildroot-2009.05/docs/README.diskimage>,
> > but failure.
> >
> >    The bellow is my process.
> >
> >    # dd if=/dev/zero of=img bs=4096 count=16384
> >    # echo -e "n\np\n1\n\nw\n" | fdisk -C 16065 -H 255 -S 63 ./img
> >    # losetup -o 512 /dev/loop0 img
>
> This looks like the wrong offset. The first partition usually starts at
> sector 63. But probably you'll want to use kpartx which takes an image
> and creates device nodes for each partition.


This the result

qemu/xtratum# fdisk -ul img

You must set cylinders.
You can do this from the extra functions menu.

Disk rootfs: 0 MB, 0 bytes
255 heads, 63 sectors/track, 0 cylinders, total 0 sectors
Units = sectors of 1 * 512 = 512 bytes
Disk identifier: 0x545a5c26

 Device Boot      Start         End      Blocks   Id  System
img1              63   258084224   129042081   83  Linux
Partition 1 has different physical/logical endings:
     phys=(1023, 254, 63) logical=(16064, 254, 63)

Kevin
>



-- 
Love other people, as same as love yourself!
Don't think all the time, do it by your hands!

Personal URL: http://dslab.lzu.edu.cn:8080/members/baishw/
E-Mail: baishuwei at gmail.com or baishuwei at dslab.lzu.edu.cn
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090824/0b2ad94c/attachment.htm>
