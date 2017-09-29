From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 29 Sep 2017 08:24:34 +0000
Subject: [Buildroot] [Bug 10351] New: glibc missing in rootfs
Message-ID: <bug-10351-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10351

            Bug ID: 10351
           Summary: glibc missing in rootfs
           Product: buildroot
           Version: 2017.08
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: alex.theissen at me.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

I tried to create a rootfs with the attached defconfig (using buildroot
toolchain). In the resulting rootfs the glibc is missing. There are symlinks
but the actual library is missing. In the host directory everything is fine but
not in the resulting image. 

This is the case for the tar and the squashfs image. Other images I did not
test.


ls -l /lib
lrwxrwxrwx 1 root root     10 Sep 29 08:57 ld-linux.so.3 -> ld-2.25.so
lrwxrwxrwx 1 root root     14 Sep 29 08:57 libanl.so.1 -> libanl-2.25.so
lrwxrwxrwx 1 root root     18 Sep 29 08:57 libatomic.so -> libatomic.so.1.2.0
lrwxrwxrwx 1 root root     18 Sep 29 08:57 libatomic.so.1 -> libatomic.so.1.2.0
-rwxr-xr-x 1 root root  21652 Sep 28 17:16 libatomic.so.1.2.0
lrwxrwxrwx 1 root root     16 Sep 29 08:57 libcrypt.so.1 -> libcrypt-2.25.so
lrwxrwxrwx 1 root root     12 Sep 29 08:57 libc.so.6 -> libc-2.25.so
lrwxrwxrwx 1 root root     13 Sep 29 08:57 libdl.so.2 -> libdl-2.25.so
-rw-r--r-- 1 root root    132 Sep 28 17:01 libgcc_s.so
-rw-r--r-- 1 root root 124448 Sep 28 17:16 libgcc_s.so.1
lrwxrwxrwx 1 root root     12 Sep 29 08:57 libm.so.6 -> libm-2.25.so
lrwxrwxrwx 1 root root     14 Sep 29 08:57 libnsl.so.1 -> libnsl-2.25.so
lrwxrwxrwx 1 root root     18 Sep 29 08:57 libnss_dns.so.2 ->
libnss_dns-2.25.so
lrwxrwxrwx 1 root root     20 Sep 29 08:57 libnss_files.so.2 ->
libnss_files-2.25.so
lrwxrwxrwx 1 root root     18 Sep 29 08:57 libpthread.so.0 ->
libpthread-2.25.so
lrwxrwxrwx 1 root root     17 Sep 29 08:57 libresolv.so.2 -> libresolv-2.25.so
lrwxrwxrwx 1 root root     13 Sep 29 08:57 librt.so.1 -> librt-2.25.so
lrwxrwxrwx 1 root root     19 Sep 29 08:57 libthread_db.so.1 ->
libthread_db-1.0.so
lrwxrwxrwx 1 root root     15 Sep 29 08:57 libutil.so.1 -> libutil-2.25.so

-- 
You are receiving this mail because:
You are on the CC list for the bug.
