From: udmd-eric wann <udmderic@gmail.com>
Date: Thu, 26 Jun 2008 13:38:26 +0800
Subject: [Buildroot] ARM926t EABI issue?
Message-ID: <46361d9e0806252238s70363e95raf0f491a88af7cea@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all:

        I am newbie to linux and build.

        I use buildroot-20080624 to build my toolchain.
        I select arm /926t/ EABI and all other setting by default.
        (My BR2_GNU_TARGET_SUFFIX is default linux-uclibcgnueabi !)

        (My linux kernel build as CONFIG_AEABI=y, CONFIG_OABI_COMPAT=y)

        After a long time to build the toolchain, I got an image.

        I set the inittab as

        null::sysinit:/bin/mount -o remount,rw /
        null::sysinit:/bin/mount -t proc proc /proc
        null::sysinit:/bin/mount -a
        null::sysinit:/bin/hostname -F /etc/hostname
        ::askfirst:/sbin/getty 115200 ttyS0

        then I can see the output like this

        RAMDISK: Compressed image found at block 0
        VFS: Mounted root (ext2 filesystem).
        Freeing init memory: 72K

        Please press Enter to activate this console.

        Welcome.
        968 login: root

        Dec 31 17:00:05 login[20]: root login on 'ttyS0'

        Please press Enter to activate this console.


        Welcome.
        968 login: root

        Dec 31 17:00:15 login[21]: root login on 'ttyS0'

        Please press Enter to activate this console.


        Welcome.
        968 login:

        Ok... I don't know why it can not login by root...

        so I change the line "::askfirst:/sbin/getty 115200 ttyS0"
        to ttyS0::respawn:-/bin/sh

        now I got init hang.... I don't see anything message .....
        (In fact if I use OABI, I can see the console output...)

        What's wrong with my setting?
        Does anybody has any suggestions?

        Thanks for your kindly help.

        Best Regrads

        Eric Wann
