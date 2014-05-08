From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Thu, 08 May 2014 19:19:10 +0200
Subject: [Buildroot] [PATCH v5 00/32] xbmc: bump version to 13.0-Gotham
References: <1399493406-7247-1-git-send-email-bernd.kuhls@t-online.de>
 <CAGduivxVEQFqDVX9uH-cM=GyW26okJrcr84_phGzEgkcnH2NcA@mail.gmail.com>
Message-ID: <etqs3bxdq.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime Hadjinlian
<maxime.hadjinlian@gmail.com> wrote in
news:CAGduivxVEQFqDVX9uH-cM=GyW26okJrcr84_phGzEgkcnH2NcA at mail.gmail.com: 

> And Yann has a weird error that I don't have that the TexturePacker
> doesn't seem to build correctly it's textures.xbt (which is the binary
> blob packing all the GUI elements).

Hi,

I have two systems building xbmc using buildroot.
On the system where I am creating the patches (Debian 7.5) TexturePacker 
works well.

On the other system (Ubuntu Precise) it does not pack png files:

...unable to load image ScrollBarH_bar.png
...unable to load image DefaultAddonArtistInfo.png
...unable to load image flagging/AudioLang.png
[...]

Is this the same problem Yann is seeing? Using strace on the Ubuntu system I 
could see that TexturePacker tries to open libpng12.so.0:

open("/home/br2/buildroot/output/host/usr/lib/libpng12.so.0", 
O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)

which fails because the buildroot package host-libpng provides libpng16.so.16 
while the host systems itself has libpng12 installed:

dpkg -L libpng12-0 | grep so
/lib/i386-linux-gnu/libpng12.so.0.46.0
/lib/i386-linux-gnu/libpng12.so.0

I could not find a reason for this yet. The Debian system lacks libpng.

Regards, Bernd
