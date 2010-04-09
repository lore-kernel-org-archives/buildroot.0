From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  9 Apr 2010 10:42:29 +0000 (UTC)
Subject: [Buildroot] [Bug 1213] Move .config into output directory
In-Reply-To: <bug-1213-163@https.bugs.busybox.net/>
References: <bug-1213-163@https.bugs.busybox.net/>
Message-ID: <20100409104229.F151499B7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1213


Nick Leverton <nick@leverton.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |nick at leverton.org




--- Comment #6 from Nick Leverton <nick@leverton.org>  2010-04-09 10:42:29 UTC ---
Good work, thanks !  Works for make menuconfig; make; make clean.  There still
seems to be a cross-device issue with "make oldconfig" though.  I'd like to be
able to check out a project's .config file into an empty directory, and just do
something like "make O=directory_name oldconfig && make O=directory_name ".

3737  11:32:19.501549 open("/var/tmp/buildroot.test/.config", O_RDONLY) = 3
3737  11:32:19.501760 fstat64(3, {st_mode=S_IFREG|0644, st_size=18954, ...}) =
0
3737  11:32:19.501906 mmap2(NULL, 4096, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40020000
3737  11:32:19.502030 read(3, "#\n# Automatically generated make "..., 4096) =
4096
3737  11:32:19.502265 read(3, "ERSION_4_3_3 is not set\n# BR2_GCC"..., 4096) =
4096
3737  11:32:19.502470 read(3, "\n# BR2_PACKAGE_ARGUS is not set\n#"..., 4096) =
4096
3737  11:32:19.502649 read(3, "NT is not set\n# BR2_PACKAGE_USBUT"..., 4096) =
4096
3737  11:32:19.502878 read(3, "not set\n# BR2_TARGET_ROOTFS_INITR"..., 4096) =
2570
3737  11:32:19.503029 read(3, ""..., 4096) = 0
3737  11:32:19.505067 close(3)          = 0
3737  11:32:19.505182 munmap(0x40020000, 4096) = 0
3737  11:32:19.506235 getpid()          = 3737
3737  11:32:19.506343 open(".tmpconfig.3737", O_WRONLY|O_CREAT|O_TRUNC, 0666) =
3
3737  11:32:19.506523 time(NULL)        = 1270809139

...snips....

3737  11:32:19.510083 write(3, "#\n# Automatically generated make "..., 4096) =
4096
3737  11:32:19.510371 write(3, "ERSION_4_3_3 is not set\n# BR2_GCC"..., 4096) =
4096
3737  11:32:19.510633 write(3, "\n# BR2_PACKAGE_ARGUS is not set\n#"..., 4096)
= 4096
3737  11:32:19.511038 write(3, "NT is not set\n# BR2_PACKAGE_USBUT"..., 4096) =
4096
3737  11:32:19.511275 write(3, "not set\n# BR2_TARGET_ROOTFS_INITR"..., 2570) =
2570
3737  11:32:19.511410 close(3)          = 0
3737  11:32:19.511538 munmap(0x40027000, 4096) = 0
3737  11:32:19.511657 rename("/var/tmp/buildroot.test/.config",
"/var/tmp/buildroot.test/.config.old") = 0
3737  11:32:19.511900 rename(".tmpconfig.3737",
"/var/tmp/buildroot.test/.config") = -1 EXDEV (Invalid cross-device link)
3737  11:32:19.512050 write(2, "\n*** Error during writing of the "..., 59) =
59
3737  11:32:19.512202 exit_group(1)     = ?
3711  11:32:19.512471 <... wait4 resumed> [{WIFEXITED(s) && WEXITSTATUS(s) ==
1}], 0, NULL) = 3737


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
