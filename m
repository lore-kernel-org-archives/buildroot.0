From: Willy Lambert <lambert.willy@gmail.com>
Date: Wed, 12 Dec 2012 22:28:10 +0100
Subject: [Buildroot] Creating/installing images
Message-ID: <CAKvQZ_37DWZxZZi5yUS3im0cdHCsDfAXKg=GChc-V8NHj6mCJQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Short story :

I really don't know how to install the rootfs on my flash drive in my
embedded device, and, afaik, buildroots docs stops before this step. I
don't know if it is still a buildroot issue, but I think that, 1-,
it's necesary to benefit from buildroot job, 2-, they are many
embedded user here that can help, so I try my way.

Long story :

I was using for my embedded system a standard debian + a set of
apt-get to get a customized OS on a 2GB on board persistent memory (so
I have a working system, as kernel config for instance). But now I
decided to dive into the wonderfull world of "linux from scratch" with
the great help of busybox in order to :
_ know exactly what's on my board
_ reduce persistent size
_ stop doing overkill with a 2GB system that can fit in 32Mb

So I have setup busybox and spent some days into documentation and
sandbox, but I'm stuck with the target image installation. The
documentation stops at this point and I'm alone in the dark. I spent 2
days in searching docs on the internet without great success.

I have a successful qemu working to test the buildroot output, cause I
don't need bootloader or proper image, just giving bzImage and
rootfs.ext2 is enougth.

But as to create something that my embedded system can boot on .... I
really don't know what and how to do. So I would be glad if anyone
could help me, at least in giving links or keyword for documentation.

My target has an onboard flash memory. World would have been simplier
if I could have a removable "root" memory but it's not the case. So If
I'm correct I need to boot my target (either with an external boot
device like usb key, or with the existing linux installed on it) and
then replace the rootfs. What would you do in this case (knowing that
it will happen often in the dev cycle) ?
_ use a ram pivot_root from the current linux?
_ use a dd from an external usb key boot ?
_ re-partition all this to have a little 10Mb part for a "Tool OS"
that can be used for rootfs installation ?
_ do somethig else ?
_ take a beer and think more ?

For completness here is my board datasheet, but I don't expect anyone
to read :-). It's an Advantech PCM-3362
http://support.elmark.com.pl/advantech/pdf/pcm-3362man.pdf


Is it possible to use other filesystems, like ext3 or 4 ?
