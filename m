From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 14 Sep 2011 14:56:13 +0200
Subject: [Buildroot] [PATCH 0 of 2 v2] Add Xenomai real-time framework
Message-ID: <patchbomb.1316004973@localhost6.localdomain6>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

v1: original patch by Beno?t Mauduit
v2: slight modifications, mainly to support other architectures and SMP.
