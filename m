From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 15 May 2014 18:33:28 +0400
Subject: [Buildroot] [PATCH 0/2] gdb fixes for xtensa
Message-ID: <1400164410-13037-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this series replaces existing gdb-7.4.1 patches for xtensa with their
backported versions from binutils-gdb and adds same patches for gdb-7.5.1.

Max Filippov (2):
  gdb: replace xtensa patches with proper backports from binutils-gdb
  gdb: add xtensa fixes for 7.5.1

 .../gdb-100-xtensa-fix-linux-ptrace-includes.patch | 60 ++++++++++++++++++++++
 .../7.4.1/gdb-101-xtensa-fix-on-64-bit-hosts.patch | 34 ++++++++++++
 package/gdb/7.4.1/xtensa-asm-ptrace-h.patch        | 22 --------
 package/gdb/7.4.1/xtensa-gdb-regsize.patch         | 19 -------
 .../gdb-100-xtensa-fix-linux-ptrace-includes.patch | 60 ++++++++++++++++++++++
 .../7.5.1/gdb-101-xtensa-fix-on-64-bit-hosts.patch | 34 ++++++++++++
 6 files changed, 188 insertions(+), 41 deletions(-)
 create mode 100644 package/gdb/7.4.1/gdb-100-xtensa-fix-linux-ptrace-includes.patch
 create mode 100644 package/gdb/7.4.1/gdb-101-xtensa-fix-on-64-bit-hosts.patch
 delete mode 100644 package/gdb/7.4.1/xtensa-asm-ptrace-h.patch
 delete mode 100644 package/gdb/7.4.1/xtensa-gdb-regsize.patch
 create mode 100644 package/gdb/7.5.1/gdb-100-xtensa-fix-linux-ptrace-includes.patch
 create mode 100644 package/gdb/7.5.1/gdb-101-xtensa-fix-on-64-bit-hosts.patch

-- 
1.8.1.4
