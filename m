From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 30 May 2017 19:49:47 +0000
Subject: [Buildroot] [Bug 9906] genimage: Disk full
In-Reply-To: <bug-9906-163@https.bugs.busybox.net/>
References: <bug-9906-163@https.bugs.busybox.net/>
Message-ID: <bug-9906-163-KQWJ85eMBn@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9906

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> ---
With what configuration and Buildroot version is this? Presumably with a big
initramfs? I just did a test build with 2017.05-rc3 here and
raspberrypi3_64_defconfig, and I end up with ~15 MB used in the fat partition:

sudo mount -o loop,ro images/boot.vfat /tmp/mp

df -h /tmp/mp
Filesystem      Size  Used Avail Use% Mounted on
/dev/loop0       32M   15M   18M  47% /tmp/mp

ls -lahS /tmp/mp
total 15M
-rwxr-xr-x  1 root root  12M May 30  2017 Image
-rwxr-xr-x  1 root root 2.8M May 30  2017 start.elf
drwxrwxrwt 30 root root  60K May 30 21:45 ..
-rwxr-xr-x  1 root root  50K May 30  2017 bootcode.bin
drwxr-xr-x  2 root root  16K Jan  1  1970 .
-rwxr-xr-x  1 root root  15K May 30  2017 bcm2710-rpi-3-b.dtb
-rwxr-xr-x  1 root root 8.2K May 30  2017 bcm2837-rpi-3-b.dtb
-rwxr-xr-x  1 root root 6.6K May 30  2017 fixup.dat
-rwxr-xr-x  1 root root  774 May 30  2017 config.txt
-rwxr-xr-x  1 root root   65 May 30  2017 cmdline.txt

If you change the configuration significantly then it isn't surprising that you
may need to tweak other things, so this IMHO isn't a bug.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
