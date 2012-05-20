From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 20 May 2012 21:47:58 +0200
Subject: [Buildroot] Problems at booting U-Boot and loading Kernel
In-Reply-To: <4FB81086.8080609@onlinehome.de>
References: <4FB81086.8080609@onlinehome.de>
Message-ID: <4FB94A6E.5000808@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/19/12 23:28, Tobias Sachs wrote:
> The second problem is a bit more frustrating. I tried to load a 3.3.5 Kernel after U-Boot boot but it fails with the
> message "can't open /dev/ttyAMA0 permission denied". At this point I tried everything I could imagine.
> I used Static device table and entered the permissions to /"target/generic/device_table.txt" and
> "/target/generic/device/table_dev.txt".
> I tried to use udev and created a file in output/target/etc/udev/rules.d with the name "50-udev.rules" which contains
> the following ***KERNEL="tty[A-Z]*", NAME="%k", GROUP="uucp", MODE="666"***
> In both cases I tried various permissions from 644 to 777. But every time I try to boot these Kernel the error are the
> same.

  This type of issue often appears because you attempt to use the output/target
directory directly (as an nfs-root).  You should always use one of the generated
filesystems in the output/images directory.

  Which type of rootfs did you select?

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
