From: =?UTF-8?B?5b6Q5byA?= <greatsnows@gmail.com>
Date: Sat, 17 Apr 2010 09:20:12 +0800
Subject: [Buildroot] There are not device files in dev/ when I extract
	tarball image as root. bug?
Message-ID: <o2p2134af141004161820q79e42c27s847369b14bfa8c13@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am trying to boot my board over NFS, but show some stuff like "not found
/dev/ttySAC0".

I found this words on buildroot's website:

target/ which contains *almost* the root filesystem for the target:
everything needed is present except the device files in /dev/ (Buildroot
can't create them because Buildroot doesn't run as root and does not want to
run as root). Therefore, this directory *should not be used on your target*.
Instead, you should use one of the images built in the images/ directory. If
you need an extracted image of the root filesystem for booting over NFS,
then use the tarball image generated in images/ and extract it as root.

And I followed it, but I did not get device files except this:

$ ls /tftpboot/rootfs/dev/ -l
??? 1
lrwxrwxrwx 1 root root   10 2010-04-17 00:02 log -> ../tmp/log
drwxr-xr-x 2 root root 1024 2010-04-17 00:02 pts

Does it must mknod manually?


-- 
Aaron Xu
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100417/42227483/attachment-0001.htm>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 19468 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100417/42227483/attachment-0001.obj>
