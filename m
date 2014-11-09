From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  9 Nov 2014 11:00:39 +0000 (UTC)
Subject: [Buildroot] [Bug 7568] musl buildroot-toolchain does not put
 libgcc_s.so.1 into place
In-Reply-To: <bug-7568-163@https.bugs.busybox.net/>
References: <bug-7568-163@https.bugs.busybox.net/>
Message-ID: <20141109110039.84E7CB1592@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7568

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-11-09 11:00:39 UTC ---
Humm, I'm not able to reproduce your problem. I've built the following
defconfig:

test at build:~/outputs/bug7568$ cat defconfig 
BR2_mipsel=y
BR2_TOOLCHAIN_BUILDROOT_MUSL=y

And there is definitely libgcc_s.so.1 installed in the target:

test at build:~/outputs/bug7568$ ls -l target/lib
total 976
lrwxrwxrwx 1 test test     12 Nov  9 10:54 ld-musl-mipsel-sf.so.1 ->
/lib/libc.so
-rwxr-xr-x 1 test test 778344 Nov  9 10:57 libc.so
lrwxrwxrwx 1 test test     13 Nov  9 10:57 libgcc_s.so -> libgcc_s.so.1
-rw-r--r-- 1 test test 216248 Nov  9 10:57 libgcc_s.so.1

Which version of Buildroot are you testing? I'm testing the latest master, as
of commit 44f89c38dc72e042d8190f4ca15b26abdb7e69b4.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
