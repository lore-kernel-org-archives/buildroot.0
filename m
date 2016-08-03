From: =?iso-8859-1?B?wWx2YXJvIEzzcGV6IEzzcGV6?= <lopezavila69@hotmail.com>
Date: Wed, 3 Aug 2016 10:19:31 +0200
Subject: [Buildroot] Buildroot x86 hangs at login prompt
In-Reply-To: <DUB121-W3D8EC5A65EEC9FB579DC1DF060@phx.gbl>
References: <DUB121-W3D8EC5A65EEC9FB579DC1DF060@phx.gbl>
Message-ID: <DUB121-W314693264DAEF982A175ADF060@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have managed, after some modifications, to build a complete **Buildroot** system (2016.05) for an x86 CPU. In a 1 GB flash drive I have created an unique partition where I have extracted the rootfs.tar file (ext4 format) and installed grub2 using:

    grub-install --no-floppy --force --root-directory=/media/rootfs /dev/sdb1

After this, I have inserted the flash drive into the final CPU and the fact was that the system starts but gets frozen at login prompt, although it displays system messages whenever I plug/unplug the keyboard or mouse. Moreover, ntpd gives a segmentation fault on libgcc and I cannot enter any character with the keyboard.

After some time I see a trace similar to this one:

[411.433013] perf interrupt took too long (2532 > 2500), lowering kernel perf_event_max_sample_rate to 50000.

Just in case it helps, I have used this configuration:

- Internal toolchain with uClibc with Linux kernel headers 4.4.11 (option 4.4.x).
- Dev management with devtmpfs only.
- Init system: BusyBox.
- Bootloader: Grub2.
- Filesystem type: ext4.
- Kernel sources: the ones from Ubuntu 16.04 LTS related to kernel 4.4.0-31-generic, which seems to be based on Kernel 4.4.13 (as modules where installed in /lib/modules/4.4.13 folder). Config taken from the /usr/src/4.4.0-31.generic folder.

As I cannot work with the keyboard I cannot access to system logs.
May I review the Buildroot configuration? What is happening?

 		 	   		  
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160803/16d010cc/attachment.html>
