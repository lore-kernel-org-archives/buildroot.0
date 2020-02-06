From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 06 Feb 2020 09:36:47 +0000
Subject: [Buildroot] [Bug 11926] Cross compiled Qt applications aren't
 working anymore
In-Reply-To: <bug-11926-163@https.bugs.busybox.net/>
References: <bug-11926-163@https.bugs.busybox.net/>
Message-ID: <bug-11926-163-DpAoNoaoqe@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11926

--- Comment #8 from Martin <martinv1985@gmail.com> ---
Created attachment 8361
  --> https://bugs.busybox.net/attachment.cgi?id=8361&action=edit
defconfig file to reproduce bug

See the attached custom_qt_link_bug_defconfig for a minimal configuration for
this bug.

I used buildroot master (cloned on Tue Feb 4, commit
4fb3c69854b01fd8f6483a8dbbb73d05ef26e96a) with 2 patches i found on patchwork.
The patches are '[RFC,v3,1/2] package/qt5: bump latest version to 5.13.2' and
'[RFC,v3,2/2] package/qt5: bump latest version to 5.14.1'. I did need to
slightly adjust the patches to get them working with that specific commit. I
still need to look up the best way to give the feedback on those patches, but
for now i will mention it here.
I had to change the patch for the files
'package/qt5/qt5x11extras/5.13.2/qt5serialport.hash' and
'package/qt5/qt5x11extras/5.13.2/qt5x11extras.hash'. These
files where changed in master after the patch was created. The first line in
each files where changed, ending in '.sha256' instead of '.mirrorlist'.

I used a toolchain that buildroot compiled. I did change the host dir to an
out-of-tree folder.

With buildroot-2019.11.1 qtdiag did not work. The output of 'readelf -d'
already showed that libGLES is linked using absolute paths and on the target
device i also got the "no such file or directory" errors. Using the
buildroot-master & qt5.14 patches readelf did not show absolute paths and
qtdiag worked on the target device.

I hope this is enough information. I am still learning to use buildroot etc.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
