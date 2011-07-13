From: benoit.mauduit at gmail.com <benoit.mauduit@gmail.com>
Date: Wed, 13 Jul 2011 17:52:58 +0200
Subject: [Buildroot] =?utf-8?q?=5BPATCH_0/2=5D_Add_Xenomai_real-time_frame?=
	=?utf-8?q?work?=
Message-ID: <1310572380-26403-1-git-send-email-benoit.mauduit@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Benoit Mauduit <benoit.mauduit@openwide.fr>

These two patches are an initial add for Xenomai in buildroot.

"Xenomai is a real-time development framework cooperating with the
Linux kernel, in order to provide a pervasive, interface-agnostic,
hard real-time support to user-space applications, seamlessly
integrated into the GNU/Linux environment."
[http://www.xenomai.org]

Xenomai comes with a Linux Kernel and user-space part.
I added a Linux extensions sub-menu (The first patch) which handles
the kernel modification provided by Adeos/Xenomai. The advantage of
this way is for maintenance purpose. (Xenomai do not provide a full
kernel patch, but use a script called "prepare-kernel.sh")
Also, this split the user-space from the kernel in a nice way instead
of adding a serie of patches.

The Xenomai user-space part can be built separately with an external
real-time Kernel.

I have tested on both x86 and Arm with buildroot toolchains (uclibc).

Any feedback is welcome, especially for the first patch.

Regards,
-- 
Beno?t Mauduit

---

Benoit Mauduit (2):
  linux: Add Linux Kernel extensions menu
  Add xenomai real-time Framework to buildroot for Arm and x86

 Makefile                                           |    2 +-
 linux/Config.ext.in                                |   20 ++++
 linux/Config.in                                    |    4 +
 linux/xenomai.mk                                   |   29 ++++++
 package/Config.in                                  |    4 +
 package/xenomai/Config.in                          |   81 +++++++++++++++++
 package/xenomai/README                             |   48 ++++++++++
 .../xenomai/xenomai-do-not-install-devices.patch   |   11 +++
 package/xenomai/xenomai.mk                         |   95 ++++++++++++++++++++
 target/generic/device_table_dev.txt                |    5 +
 10 files changed, 298 insertions(+), 1 deletions(-)
 create mode 100644 linux/Config.ext.in
 create mode 100644 linux/xenomai.mk
 create mode 100644 package/xenomai/Config.in
 create mode 100644 package/xenomai/README
 create mode 100644 package/xenomai/xenomai-do-not-install-devices.patch
 create mode 100644 package/xenomai/xenomai.mk

-- 
1.7.6
