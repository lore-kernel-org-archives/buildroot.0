From: cem akpolat <akpolatcem@gmail.com>
Date: Mon, 26 May 2014 15:37:04 +0200
Subject: [Buildroot] Fwd: all files and folders seem as an executable
	file ?
In-Reply-To: <20140526152359.3918fd4a@free-electrons.com>
References: <CAMm5YqrU4Vk9KJpVVPoYrNL-wNeVXEPVu3GdSLTNe2gYHc=ZMw@mail.gmail.com>
 <20140526135034.74637680@free-electrons.com>
 <CAMm5YqqX4pKA5Exxser2OSWfsUX9sHp2Tjsump2cW65JHktHeA@mail.gmail.com>
 <CAMm5Yqrn7psH2jRb2Uh1u30ni4iQdNMDSUy1=U3vHz5tu+sRTA@mail.gmail.com>
 <20140526152359.3918fd4a@free-electrons.com>
Message-ID: <CAMm5Yqpk5=2-EBa51qmiWrOA2qHE+_2Bh5Y2s=_064zN2u_AeA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

This is the way that I have pack/unpack the .cpio file system:

unpack

sudo cpio -id < ../openwrtWireless

pack

 sudo find . | sudo  cpio --create --format='newc' > /tmp/openwrtWireless

The following shows the folders' permissions, as you see the folders are
seen as executable.


drwxrwxr-x 18 default default   0 May 26 11:10 .
drwxrwxr-x 18 default default   0 May 26 11:10 ..
drwxr-xr-x  2 root    root      0 May 26 11:10 bin
drwxrwxr-x  3 root    root      0 May 26 11:10 boot
drwxr-xr-x  6 root    root      0 May 26 19:15 dev
drwxr-xr-x 20 root    root      0 May 26 19:15 etc
drwxrwxr-x  4 root    root      0 May 26 11:10 home
lrwxrwxrwx  1 root    root      9 May 26 11:10 init -> sbin/init
drwxrwxr-x  5 root    root      0 May 26 11:10 lib
lrwxrwxrwx  1 root    root      3 May 26 11:10 lib32 -> lib
lrwxrwxrwx  1 root    root     11 May 26 11:10 linuxrc -> bin/busybox
drwxrwxr-x  2 root    root      0 May 26 11:10 media
drwxrwxr-x  2 root    root      0 May 26 11:10 mnt
drwxrwxr-x  2 root    root      0 May 26 11:10 opt
dr-xr-xr-x 56 root    root      0 May 26 19:14 proc
drwx------  3 root    root      0 May 26 19:18 root
lrwxrwxrwx  1 root    root      3 May 26 11:10 run -> tmp
drwxr-xr-x  2 root    root      0 May 26 11:10 sbin
dr-xr-xr-x 12 root    root      0 May 26 19:14 sys
drwxrwxrwt  5 root    root    380 May 26 19:15 tmp
drwxrwxr-x  8 root    root      0 May 26 11:10 usr
drwxrwxr-x  5 root    root      0 May 26 11:10 var

best regards,
Cem

Cem Akpolat


On Mon, May 26, 2014 at 3:23 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear cem akpolat,
>
> On Mon, 26 May 2014 13:59:50 +0200, cem akpolat wrote:
>
> > in the generated file system I am seeing that all files/folders are
> > executable. In terms of format, if you mean the file system format, this
> is
> > .cpio. Would it be possible due to the fact that I pack out the file
> system
> > via root permission and then re-pack again with root-permission (I
> haven't
> > started to use root_overlay).
>
> Maybe the way you unpack/repack is incorrect. Can you check just
> unpacking the .cpio ? I'm using the cpio filesystem format everyday,
> and I have correct permissions.
>
> Also, in your separate question about SSH, you pasted the following
> thing:
>
> -rw-r--r--  1 root    root      1574 May 26 11:10 ssh_config
> -rw-------  1 root    root       668 May 26 19:15 ssh_host_dsa_key
> -rw-r--r--  1 root    root       590 May 26 19:15 ssh_host_dsa_key.pub
> -rw-------  1 root    root       227 May 26 19:15 ssh_host_ecdsa_key
> -rw-r--r--  1 root    root       162 May 26 19:15 ssh_host_ecdsa_key.pub
> -rw-------  1 root    root       411 May 26 19:24 ssh_host_ed25519_key
> -rw-------  1 root    root        96 May 26 19:24 ssh_host_ed25519_key.pub
> -rw-------  1 root    root       965 May 26 19:15 ssh_host_key
> -rw-r--r--  1 root    root       630 May 26 19:15 ssh_host_key.pub
> -rw-------  1 root    root      1679 May 26 19:15 ssh_host_rsa_key
> -rw-r--r--  1 root    root       382 May 26 19:15 ssh_host_rsa_key.pub
> -rw-r--r--  1 root    root      3622 May 26 11:10 sshd_config
>
> As you can see, none of these files have the executable permissions.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140526/03d018fb/attachment.html>
