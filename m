From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 02 May 2016 20:46:26 +0000
Subject: [Buildroot] [Bug 8901] gcc failes to build if fortran is enabled
In-Reply-To: <bug-8901-163@https.bugs.busybox.net/>
References: <bug-8901-163@https.bugs.busybox.net/>
Message-ID: <bug-8901-163-FgcBJFJprF@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8901

--- Comment #2 from Thijs Vermeir <thijsvermeir@gmail.com> ---
This works for x86_64, but does not work for qemu_arm_versatile_defconfig.

---
for i in  libgfortran libquadmath ; do cp -dpf
/home/tvermeir/buildroot/bug-fortran/output/host/usr/arm-buildroot-linux-uclibcgnueabi/lib*/${i}.a
/home/tvermeir/buildroot/bug-fortran/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/
; done
cp: cannot stat
?/home/tvermeir/buildroot/bug-fortran/output/host/usr/arm-buildroot-linux-uclibcgnueabi/lib*/libquadmath.a?:
No such file or directory
package/pkg-generic.mk:205: recipe for target
'/home/tvermeir/buildroot/bug-fortran/output/build/host-gcc-final-4.9.3/.stamp_host_installed'
failed
make[1]: ***
[/home/tvermeir/buildroot/bug-fortran/output/build/host-gcc-final-4.9.3/.stamp_host_installed]
Error 1
Makefile:36: recipe for target '_all' failed
make: *** [_all] Error 2
---

-- 
You are receiving this mail because:
You are on the CC list for the bug.
