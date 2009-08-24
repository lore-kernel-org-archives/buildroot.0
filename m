From: Bai Shuwei <baishuwei@gmail.com>
Date: Mon, 24 Aug 2009 13:39:53 +0800
Subject: [Buildroot] diskimage HOWTO
Message-ID: <f3566d60908232239l268a7233necd10a6dd342f58f@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, All:
  I want to build a test enviroment with QEMU and buildroot. But I don't
know how to build the diskimage which same as linux-0.2.img offered by
BUILD-ROOT. I build the diskimage following the
   buildroot-2009.05/docs/README.diskimage<http://192.168.1.102/crosscopile/buildroot-2009.05/docs/README.diskimage>,
but failure.

   The bellow is my process.

   # dd if=/dev/zero of=img bs=4096 count=16384
   # echo -e "n\np\n1\n\nw\n" | fdisk -C 16065 -H 255 -S 63 ./img
   # losetup -o 512 /dev/loop0 img
   # mkfs.ext2 -m0 -Lslash /dev/loop0
   # mount -oloop,rw /dev/loop0 fs/
   # cp -a ../root/* fs/
..root is the filesystem built by BUILD-ROOT and the bzImage has been copied
into root/boot/, grub.lst has been created too.
  # umount fs/
  # losetup -d /dev/loop0
  # losetup /dev/loop0 img
  # grub --device-map=/dev/null
grub> device (hd0) img
device (hd0) img
grub> geometry (hd0) 16065 255 63
geometry (hd0) 16065 255 63
drive 0x80: C/H/S = 16065/255/63, The number of sectors = 258084225, img
   Partition num: 0,  Filesystem type unknown, partition type 0x83
grub> root (hd0,0)
root (hd0,0)
 Filesystem type unknown, partition type 0x83
grub> setup (hd0)
setup (hd0)

*Error 17: Cannot mount selected partition*
I don't know why it is error. Gald if you can help or give me some document
on it.

Best Regards!

Bai SHuwei






-- 
Love other people, as same as love yourself!
Don't think all the time, do it by your hands!

Personal URL: http://dslab.lzu.edu.cn:8080/members/baishw/
E-Mail: baishuwei at gmail.com or baishuwei at dslab.lzu.edu.cn
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090824/2908e3cd/attachment.htm>
