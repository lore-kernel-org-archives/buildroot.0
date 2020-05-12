From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 12 May 2020 05:26:15 +0000
Subject: [Buildroot] [Bug 12891] QEMU , libvirt-bin,
 qemu-kvm Package Support required
In-Reply-To: <bug-12891-163@https.bugs.busybox.net/>
References: <bug-12891-163@https.bugs.busybox.net/>
Message-ID: <bug-12891-163-IMQito42iZ@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12891

--- Comment #1 from Tudor <tudor@tudorholton.com> ---
Package names are not consistent between projects.  Sometimes, additional
"packages" are just extra options or additional libraries which are shipped as
separate binaries.  Because buildroot builds the package from scratch they can
be shown as options and dependencies and therefore don't need additional
packages.

For example BR2_PACKAGE_QEMU_SYSTEM is the correct option for building what
other projects might call "qemu-system".

As such, we don't always need specific packages explicitly.  Is there something
specifically you need from libvirt?  From a buildroot perspective libvirt is a
bit redundant.  Since you know categorically you'll be running on QEMU, why do
you need an abstraction layer?  You don't need to jump from QEMU/KVM to Xen or
VMWare in a scratchbuilt environment like buildroot.  You get that benefit by
being the designer of the environment.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
