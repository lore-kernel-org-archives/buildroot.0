From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 19 May 2009 20:08:14 +0200
Subject: [Buildroot] [git commit] xserver: mark as broken on avr32
Message-ID: <20090519183052.C8CC77787B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3b850e44589944ae0281e62698daaf69547b4bec
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch is too large, so refusing to show it


Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xserver_xorg-server/Config.in        |    4 +
 target/device/Atmel/atngw100-expanded/Makefile.in  |    7 -
 .../atngw100-expanded-linux-2.6.23.config          | 1290 ------------
 .../atngw100-expanded-linux-2.6.24.config          | 1201 -----------
 .../atngw100-expanded-linux-2.6.25.10.config       | 1271 ------------
 .../atngw100-expanded/atngw100-expanded_defconfig  |  876 --------
 .../Atmel/atngw100-expanded/busybox-1.11.0.config  |  767 -------
 .../Atmel/atngw100-expanded/busybox-1.9.1.config   |  767 -------
 .../Atmel/atngw100-expanded/device_table.txt       |  181 --
 .../Atmel/atngw100-expanded/jffs2_partitions.txt   |    7 -
 .../linux-2.6.24.4-100-atngw100-add-ac97.patch     |   10 -
 .../linux-2.6.24.4-200-atngw100-video.patch        |  148 --
 .../linux-2.6.24.4-300-avr32-psif-2.patch          |   27 -
 ...-2.6.24.4-400-atngw100-unlock-uboot-flash.patch |   11 -
 .../linux-2.6.24.4-500-avr32-ac97-reset.patch      |  289 ---
 ...linux-2.6.24.4-600-atngw100-disable-psif1.patch |   11 -
 .../atngw100-expanded/target_skeleton/dev/.DEVICES |   69 -
 .../Atmel/atngw100-expanded/target_skeleton/etc/TZ |    1 -
 .../target_skeleton/etc/default/ntpdate            |    6 -
 .../target_skeleton/etc/dnsmasq.conf               |  447 -----
 .../atngw100-expanded/target_skeleton/etc/fstab    |   14 -
 .../atngw100-expanded/target_skeleton/etc/group    |   20 -
 .../atngw100-expanded/target_skeleton/etc/hostname |    1 -
 .../atngw100-expanded/target_skeleton/etc/hosts    |   11 -
 .../target_skeleton/etc/hosts.dnsmasq              |  246 ---
 .../target_skeleton/etc/httpd.conf                 |    2 -
 .../target_skeleton/etc/inetd.conf                 |    3 -
 .../target_skeleton/etc/init.d/K70sendsig          |    1 -
 .../target_skeleton/etc/init.d/K80netfs            |    1 -
 .../target_skeleton/etc/init.d/K85network          |   11 -
 .../target_skeleton/etc/init.d/K90localfs          |    1 -
 .../target_skeleton/etc/init.d/S00mountvirtfs      |   76 -
 .../target_skeleton/etc/init.d/S01hotplug          |   14 -
 .../target_skeleton/etc/init.d/S02hostname         |   47 -
 .../target_skeleton/etc/init.d/S08syslog           |   24 -
 .../target_skeleton/etc/init.d/S09klog             |   16 -
 .../target_skeleton/etc/init.d/S10modules-init     |   21 -
 .../target_skeleton/etc/init.d/S20network          |   11 -
 .../target_skeleton/etc/init.d/S41inetd            |   16 -
 .../target_skeleton/etc/init.d/S42httpd            |   16 -
 .../target_skeleton/etc/init.d/S43ntp              |   27 -
 .../target_skeleton/etc/init.d/S49netfs            |   11 -
 .../target_skeleton/etc/init.d/S90firstboot        |   21 -
 .../target_skeleton/etc/init.d/rcK                 |    6 -
 .../target_skeleton/etc/init.d/rcS                 |   11 -
 .../atngw100-expanded/target_skeleton/etc/inittab  |   27 -
 .../atngw100-expanded/target_skeleton/etc/modules  |   13 -
 .../atngw100-expanded/target_skeleton/etc/mtab     |    1 -
 .../target_skeleton/etc/network/interfaces         |    8 -
 .../atngw100-expanded/target_skeleton/etc/ntp.conf |   49 -
 .../atngw100-expanded/target_skeleton/etc/passwd   |   18 -
 .../target_skeleton/etc/proftpd.conf               |   31 -
 .../target_skeleton/etc/protocols                  |  149 --
 .../target_skeleton/etc/resolv.conf                |    1 -
 .../target_skeleton/etc/samba/smb.conf             |  287 ---
 .../target_skeleton/etc/samba/smbpasswd            |    1 -
 .../atngw100-expanded/target_skeleton/etc/services | 2117 --------------------
 .../atngw100-expanded/target_skeleton/etc/shadow   |   18 -
 .../atngw100-expanded/target_skeleton/etc/shells   |    8 -
 .../usr/share/udhcpc/default.script                |   19 -
 60 files changed, 4 insertions(+), 10761 deletions(-)
 delete mode 100644 target/device/Atmel/atngw100-expanded/Makefile.in
 delete mode 100644 target/device/Atmel/atngw100-expanded/atngw100-expanded-linux-2.6.23.config
 delete mode 100644 target/device/Atmel/atngw100-expanded/atngw100-expanded-linux-2.6.24.config
 delete mode 100644 target/device/Atmel/atngw100-expanded/atngw100-expanded-linux-2.6.25.10.config
 delete mode 100644 target/device/Atmel/atngw100-expanded/atngw100-expanded_defconfig
 delete mode 100644 target/device/Atmel/atngw100-expanded/busybox-1.11.0.config
 delete mode 100644 target/device/Atmel/atngw100-expanded/busybox-1.9.1.config
 delete mode 100644 target/device/Atmel/atngw100-expanded/device_table.txt
 delete mode 100644 target/device/Atmel/atngw100-expanded/jffs2_partitions.txt
 delete mode 100644 target/device/Atmel/atngw100-expanded/kernel-patches/linux-2.6.24.4-100-atngw100-add-ac97.patch
 delete mode 100644 target/device/Atmel/atngw100-expanded/kernel-patches/linux-2.6.24.4-200-atngw100-video.patch
 delete mode 100644 target/device/Atmel/atngw100-expanded/kernel-patches/linux-2.6.24.4-300-avr32-psif-2.patch
 delete mode 100644 target/device/Atmel/atngw100-expanded/kernel-patches/linux-2.6.24.4-400-atngw100-unlock-uboot-flash.patch
 delete mode 100644 target/device/Atmel/atngw100-expanded/kernel-patches/linux-2.6.24.4-500-avr32-ac97-reset.patch
 delete mode 100644 target/device/Atmel/atngw100-expanded/kernel-patches/linux-2.6.24.4-600-atngw100-disable-psif1.patch
 delete mode 100644 target/device/Atmel/atngw100-expanded/target_skeleton/dev/.DEVICES
 delete mode 100644 target/device/Atmel/atngw100-expanded/target_skeleton/dev/.empty
 delete mode 100644 target/device/Atmel/atngw100-expanded/target_skeleton/etc/TZ
 delete mode 100644 target/device/Atmel/atngw100-expanded/target_skeleton/etc/default/ntpdate
 delete mode 100644 target/device/Atmel/atngw100-expanded/target_skeleton/etc/dnsmasq.conf
 delete mode 100644 target/device/Atmel/atngw100-expanded/target_skeleton/etc/fstab
 delete mode 100644 target/device/Atmel/atngw100-expanded/target_skeleton/etc/group
 delete mode 100644 target/device/Atmel/atngw100-expanded/target_skeleton/etc/hostname
 delete mode 100644 target/device/Atmel/atngw100-expanded/target_skeleton/etc/hosts
 delete mode 100644 target/device/Atmel/atngw100-expanded/target_skeleton/etc/hosts.dnsmasq
 delete mode 100644 target/device/Atmel/atngw100-expanded/target_skeleton/etc/httpd.conf
 delete mode 100644 target/device/Atmel/atngw100-expanded/target_skeleton/etc/inetd.conf
 delete mode 100755 target/device/Atmel/atngw100-expanded/target_skeleton/etc/init.d/K70sendsig
 delete mode 100755 target/device/Atmel/atngw100-expanded/target_skeleton/etc/init.d/K80netfs
 delete mode 100755 target/device/Atmel/atngw100-expanded/target_skeleton/etc/init.d/K85network
 delete mode 100755 target/device/Atmel/atngw100-expanded/target_skeleton/etc/init.d/K90localfs
 delete mode 100755 target/device/Atmel/atngw100-expanded/target_skeleton/etc/init.d/S00mountvirtfs
 delete mode 100755 target/device/Atmel/atngw100-expanded/target_skeleton/etc/init.d/S01hotplug
 delete mode 100755 target/device/Atmel/atngw100-expanded/target_skeleton/etc/init.d/S02hostname
 delete mode 100755 target/device/Atmel/atngw100-expanded/target_skeleton/etc/init.d/S08syslog
 delete mode 100755 target/device/Atmel/atngw100-expanded/target_skeleton/etc/init.d/S09klog
 delete mode 100755 target/device/Atmel/atngw100-expanded/target_skeleton/etc/init.d/S10modules-init
 delete mode 100755 target/device/Atmel/atngw100-expanded/target_skeleton/etc/init.d/S20network
 delete mode 100755 target/device/Atmel/atngw100-expanded/target_skeleton/etc/init.d/S41inetd
 delete mode 100755 target/device/Atmel/atngw100-expanded/target_skeleton/etc/init.d/S42httpd
 delete mode 100755 target/device/Atmel/atngw100-expanded/target_skeleton/etc/init.d/S43ntp
 delete mode 100755 target/device/Atmel/atngw100-expanded/target_skeleton/etc/init.d/S49netfs
 delete mode 100755 target/device/Atmel/atngw100-expanded/target_skeleton/etc/init.d/S90firstboot
 delete mode 100755 target/device/Atmel/atngw100-expanded/target_skeleton/etc/init.d/rcK
 delete mode 100755 target/device/Atmel/atngw100-expanded/target_skeleton/etc/init.d/rcS
 delete mode 100644 target/device/Atmel/atngw100-expanded/target_skeleton/etc/inittab
 delete mode 100644 target/device/Atmel/atngw100-expanded/target_skeleton/etc/modules
 delete mode 120000 target/device/Atmel/atngw100-expanded/target_skeleton/etc/mtab
 delete mode 100644 target/device/Atmel/atngw100-expanded/target_skeleton/etc/network/interfaces
 delete mode 100644 target/device/Atmel/atngw100-expanded/target_skeleton/etc/ntp.conf
 delete mode 100644 target/device/Atmel/atngw100-expanded/target_skeleton/etc/passwd
 delete mode 100644 target/device/Atmel/atngw100-expanded/target_skeleton/etc/proftpd.conf
 delete mode 100644 target/device/Atmel/atngw100-expanded/target_skeleton/etc/protocols
 delete mode 120000 target/device/Atmel/atngw100-expanded/target_skeleton/etc/resolv.conf
 delete mode 100644 target/device/Atmel/atngw100-expanded/target_skeleton/etc/samba/smb.conf
 delete mode 100644 target/device/Atmel/atngw100-expanded/target_skeleton/etc/samba/smbpasswd
 delete mode 100644 target/device/Atmel/atngw100-expanded/target_skeleton/etc/services
 delete mode 100644 target/device/Atmel/atngw100-expanded/target_skeleton/etc/shadow
 delete mode 100644 target/device/Atmel/atngw100-expanded/target_skeleton/etc/shells
 delete mode 100644 target/device/Atmel/atngw100-expanded/target_skeleton/sys/.empty
 delete mode 100644 target/device/Atmel/atngw100-expanded/target_skeleton/usr/share/udhcpc/default.script
