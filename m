From: Tobias Sachs <Tobias.Sachs@onlinehome.de>
Date: Sat, 19 May 2012 23:28:38 +0200
Subject: [Buildroot] Problems at booting U-Boot and loading Kernel
Message-ID: <4FB81086.8080609@onlinehome.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have two problems with images I created with Buildroot. My Target 
system is an i.MX28EVK from Freescale.

My first problem is the following. I applied the patches to create a 
u-boot.sb (secureboot) image for i.MX Platform. This image build very 
well but in 9 of 10 tries it fails to boot. I disconnect the EVK from 
Power every time a boot failed but cannot say which circumstances made 
it work.

The second problem is a bit more frustrating. I tried to load a 3.3.5 
Kernel after U-Boot boot but it fails with the message "can't open 
/dev/ttyAMA0 permission denied". At this point I tried everything I 
could imagine.
I used Static device table and entered the permissions to 
/"target/generic/device_table.txt" and 
"/target/generic/device/table_dev.txt".
I tried to use udev and created a file in output/target/etc/udev/rules.d 
with the name "50-udev.rules" which contains the following 
***KERNEL="tty[A-Z]*", NAME="%k", GROUP="uucp", MODE="666"***
In both cases I tried various permissions from 644 to 777. But every 
time I try to boot these Kernel the error are the same.

I hope anyone could help me
Thanks Tobias
