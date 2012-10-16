From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 16 Oct 2012 20:43:11 +0200
Subject: [Buildroot] BuildRoot not starting with Udev
In-Reply-To: <loom.20121015T104727-737@post.gmane.org>
References: <loom.20121015T104727-737@post.gmane.org>
Message-ID: <507DAABF.7040602@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/10/12 10:55, Antoine Caurier wrote:
> Hello,
>
> I'm working on Buildroot-2012.08, with the at91sam9x5ek_defconfig.
>
> It work perfectly fine with the default configuration. But I have a problem when
> trying to activate udev.
>
> With menuconfig, I set /dev management (Dynamic using udev), and then rebuild
> the kernel and fs.
>
> All is starting fine, except for buildroot. The board stop to display anything
> just before the "Welcome to buildroot" prompt.
>
> Here are the last traces:
>
> UBIFS: mounted UBI device 0, volume 0, name "rootfs"
> UBIFS: file system size:   247603200 bytes (241800 KiB, 236 MiB, 1950 LEBs)
> UBIFS: journal size:       9023488 bytes (8812 KiB, 8 MiB, 72 LEBs)
> UBIFS: media format:       w4/r0 (latest is w4/r0)
> UBIFS: default compressor: lzo
> UBIFS: reserved for root:  0 bytes (0 KiB)
> VFS: Mounted root (ubifs filesystem) on device 0:12.
> Freeing init memory: 136K
> Starting logging: OK
> Populating /dev using udev: done

  So udev starts (or at least doesn't print an error to console).

> Starting portmap: portmap: fork: No such devicedone
> ALSA: Restoring mixer settings...
> Starting network...
> /usr/sbin/alsactl: load_state:1686: No soundcards found...
> Starting dropbear sshd: generating rsa key... generating dsa key... OK

  Since dropbear starts, can you log in with ssh?  Then you can check if
getty is running on the (correct) serial port and if there's something
funny showing up in dmesg or /var/log/messages.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
