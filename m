From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 30 Mar 2021 13:40:44 +0000
Subject: [Buildroot] [Bug 13681] New: syslinux build install tools
Message-ID: <bug-13681-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13681

            Bug ID: 13681
           Summary: syslinux build install tools
           Product: buildroot
           Version: 2021.02
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: moelzerjens at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

The way the syslinux install tools are currently built doesn't make a lot of
sense imho: The only tool that's installed is extlinux and that is only built
for the host. That's not really useful as extlinux needs root, so it can't
cleanly be used to automatically generate disk images on the host. The
syslinux/mtools-syslinux tools that could be used for disk image generation
without root on the host are only built for the target and not installed (they
can be found in the build folder).

Therefore I propose the following improvements:

1) Provide an option to build extlinux for the target like the grub2 package
"install tools" option (BR2_TARGET_GRUB2_INSTALL_TOOLS).

2) Build the syslinux/mtools-syslinux installer for the host to facilitate
scripted disk image generation. It might be beneficial to integrate the
syslinux patches from Yocto Project [1] that extend syslinux support to
ext2/3/4 as well.

[1]
http://git.yoctoproject.org/cgit.cgi/poky/plain/meta/recipes-devtools/syslinux/syslinux/

-- 
You are receiving this mail because:
You are on the CC list for the bug.
