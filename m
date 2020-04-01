From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 01 Apr 2020 18:09:00 +0000
Subject: [Buildroot] [Bug 12726] systemctl preset-all failed for
 ctrl-alt-del.target
In-Reply-To: <bug-12726-163@https.bugs.busybox.net/>
References: <bug-12726-163@https.bugs.busybox.net/>
Message-ID: <bug-12726-163-00YJcc8keR@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12726

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yann.morin.1998 at free.fr

--- Comment #1 from Yann E. MORIN <yann.morin.1998@free.fr> ---
M?lanie, All,

Sorry, I could not reproduce the failure with this defconfig, enither on
2020.02, nor on master:

    BR2_arm=y
    BR2_cortex_a7=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_INIT_SYSTEMD=y

This is during a make from scratch:
    $ make
    [...]
    /home/ymorin/dev/buildroot/O/host/bin/systemctl
--root=/home/ymorin/dev/buildroot/O/target preset-all
    Created symlink
/home/ymorin/dev/buildroot/O/target/etc/systemd/system/ctrl-alt-del.target ?
/usr/lib/systemd/system/reboot.target.
    Created symlink
/home/ymorin/dev/buildroot/O/target/etc/systemd/system/getty.target.wants/console-getty.service
? /usr/lib/systemd/system/console-getty.service.
    Created symlink
/home/ymorin/dev/buildroot/O/target/etc/systemd/system/boot-complete.target.requires/systemd-boot-check-no-failures.service
? /usr/lib/systemd/system/systemd-boot-check-no-failures.service.
    Created symlink
/home/ymorin/dev/buildroot/O/target/etc/systemd/system/dbus-org.freedesktop.resolve1.service
? /usr/lib/systemd/system/systemd-resolved.service.
    Created symlink
/home/ymorin/dev/buildroot/O/target/etc/systemd/system/multi-user.target.wants/systemd-resolved.service
? /usr/lib/systemd/system/systemd-resolved.service.
    Created symlink
/home/ymorin/dev/buildroot/O/target/etc/systemd/system/multi-user.target.wants/remote-fs.target
? /usr/lib/systemd/system/remote-fs.target.
    Created symlink
/home/ymorin/dev/buildroot/O/target/etc/systemd/system/sockets.target.wants/systemd-networkd.socket
? /usr/lib/systemd/system/systemd-networkd.socket.
    Created symlink
/home/ymorin/dev/buildroot/O/target/etc/systemd/system/sysinit.target.wants/systemd-time-wait-sync.service
? /usr/lib/systemd/system/systemd-time-wait-sync.service.
    Created symlink
/home/ymorin/dev/buildroot/O/target/etc/systemd/system/network-pre.target.wants/systemd-network-generator.service
? /usr/lib/systemd/system/systemd-network-generator.service.
    Created symlink
/home/ymorin/dev/buildroot/O/target/etc/systemd/system/network-online.target.wants/systemd-networkd-wait-online.service
? /usr/lib/systemd/system/systemd-networkd-wait-online.service.
    Created symlink
/home/ymorin/dev/buildroot/O/target/etc/systemd/system/systemd-remount-fs.service.wants/systemd-pstore.service
? /usr/lib/systemd/system/systemd-pstore.service.
    Created symlink
/home/ymorin/dev/buildroot/O/target/etc/systemd/system/dbus-org.freedesktop.network1.service
? /usr/lib/systemd/system/systemd-networkd.service.
    Created symlink
/home/ymorin/dev/buildroot/O/target/etc/systemd/system/multi-user.target.wants/systemd-networkd.service
? /usr/lib/systemd/system/systemd-networkd.service.
    Created symlink
/home/ymorin/dev/buildroot/O/target/etc/systemd/system/dbus-org.freedesktop.timesync1.service
? /usr/lib/systemd/system/systemd-timesyncd.service.
    Created symlink
/home/ymorin/dev/buildroot/O/target/etc/systemd/system/sysinit.target.wants/systemd-timesyncd.service
? /usr/lib/systemd/system/systemd-timesyncd.service.
    rm -f /home/ymorin/dev/buildroot/O/build/locales.nopurge
    [...]

Then a subsequent make would yield:
    $ make
    [...]
    /home/ymorin/dev/buildroot/O/host/bin/systemctl
--root=/home/ymorin/dev/buildroot/O/target preset-all
    rm -f /home/ymorin/dev/buildroot/O/build/locales.nopurge
    [...]

As you can see, neither the first nor the the second invocation cause any
issue.

Care to share a bit more info about your config and your host, please?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
