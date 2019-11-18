From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 18 Nov 2019 19:06:45 +0000
Subject: [Buildroot] [Bug 12326] New: network-manager build fails with
 missing glib error
Message-ID: <bug-12326-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12326

            Bug ID: 12326
           Summary: network-manager build fails with missing glib error
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: christian at paral.in
                CC: buildroot at uclibc.org
  Target Milestone: ---

Buildroot 2019.11-rc1
Network Manager 1.20.4
Ubuntu 16.04.6 LTS Virtual Machine (on DigitalOcean)

Build fails on network manager with:

configure: error: Package requirements (gio-unix-2.0 >= 2.40 gmodule-2.0) were
not met:

Package 'gio-unix-2.0', required by 'virtual:world', not found
Package 'gmodule-2.0', required by 'virtual:world', not found

Consider adjusting the PKG_CONFIG_PATH environment variable if you
installed software in a non-standard prefix.

Reproduced on a colleague's desktop Ubuntu setup as well. Issue does not occur
on earlier versions of Buildroot.

Defconfig:

BR2_x86_64=y
BR2_x86_corei7=y
BR2_CCACHE=y
BR2_OPTIMIZE_2=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_KERNEL_HEADERS_5_3=y
BR2_BINUTILS_VERSION_2_32_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_GCC_ENABLE_LTO=y
BR2_GCC_ENABLE_GRAPHITE=y
BR2_INIT_SYSTEMD=y
BR2_SYSTEM_BIN_SH_BASH=y
BR2_ENABLE_LOCALE_WHITELIST="C en_US en_US.UTF-8"
BR2_GENERATE_LOCALE="en_US.UTF-8"
BR2_PACKAGE_NETWORK_MANAGER=y

-- 
You are receiving this mail because:
You are on the CC list for the bug.
