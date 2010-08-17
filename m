From: Paul Jones <paul@pauljones.id.au>
Date: Tue, 17 Aug 2010 19:36:47 +1000
Subject: [Buildroot] ldconfig errors
Message-ID: <000501cb3def$b74a9eb0$25dfdc10$@pauljones.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

 

I seem to have run into the ldconfig error while using a crosstool-ng
external toolchain (uclibc based). I remember this being discussed a while
back but can't seem to find a solution, short of using an internal
toolchain.

This is the error:

if [ -x
"/media/dev/arm-unknown-linux-uclibcgnueabi/bin/arm-unknown-linux-uclibcgnue
abi-ldconfig" ]; \

        then \

 
/media/dev/arm-unknown-linux-uclibcgnueabi/bin/arm-unknown-linux-uclibcgnuea
bi-ldconfig -r /media/dev/buildroot-arm/output/target 2>/dev/null; \

        else \

                /sbin/ldconfig -r /media/dev/buildroot-arm/output/target
2>/dev/null; \

        fi

make: *** [target-finalize] Error 1

 

I can't use the host version unless I run as root. This is on a Gentoo
x86_64 host with ARM target.

Any suggestions?

 

 

Paul.

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100817/2a83cca4/attachment.html>
