From: Paul Jones <paul@pauljones.id.au>
Date: Tue, 20 Jul 2010 15:42:41 +1000
Subject: [Buildroot] make linux26-menuconfig
Message-ID: <001a01cb27ce$6015d1a0$204174e0$@pauljones.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm not sure if this is a bug or not, so I thought I'd ask here.

 

I just spent the last 20 mins trying to figure out why make
linux26-menuconfig didn't work - it was because I was running it immediately
after make menuconfig, so /output/toolchain/bin/sed didn't yet exist.

 

Should there be a warning or something if someone tries to do this? It was
very confusing.

 

>>>   Downloading kernel

mkdir -p /media/dev/buildroot-tut/output/build/linux-custom

touch /media/dev/buildroot-tut/output/build/linux-custom/.stamp_downloaded

>>>   Extracting kernel

mkdir -p /media/dev/buildroot-tut/output/build/linux-custom

>>>   Patching kernel

>>>   Configuring kernel

cp "./configs/mini2440_kernelconfig"
/media/dev/buildroot-tut/output/build/linux-custom/.config

/media/dev/buildroot-tut/output/toolchain/bin/sed -i -e
"/\\<CONFIG_AEABI\\>/d"
/media/dev/buildroot-tut/output/build/linux-custom/.config

/bin/sh: /media/dev/buildroot-tut/output/toolchain/bin/sed: No such file or
directory

make: ***
[/media/dev/buildroot-tut/output/build/linux-custom/.stamp_configured] Error
127

 

 

Paul.

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100720/959f11a5/attachment.html>
