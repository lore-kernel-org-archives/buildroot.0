From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Mar 2017 23:53:20 +0200
Subject: [Buildroot] Patchwork cleanup, 10 patches to look at
Message-ID: <20170326235320.448e802a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'd like to again restart the patchwork cleanup effort. There are
numerous patches in patchwork that I'm not sure what we want to do
with.

Here is a list of 10 patches that we need to take a decision on. If no
decision is taken in the next 2 weeks, I'll mark them as Rejected.

 * avahi: link with libintl if libglib2 is enabled
   https://patchwork.ozlabs.org/patch/683732/

   My plan is to enable the stub libintl in uClibc-ng and stop having
   all those linking issues with libintl from gettext. The only
   drawback would be that there would no longer be "translation"
   support with uClibc: the libintl implementation in uClibc-ng is
   really just a stub.

   Thoughts ?

 * qemu: allow to build statically
   https://patchwork.ozlabs.org/patch/692667/

   We normally don't want to have special options for each package to
   build them statically. Should we make an exception for Qemu?

 * infra: fix 'packages-file-list.txt' with TLP
   https://patchwork.ozlabs.org/patch/694519/

   Adds a lock around the installation step of packages, to make
   top-level parallel build still generate a correct list of files per
   package.

   Gustavo, what is your plan regarding this?

   Others: should we merge this?

 * e2fsprogs: keep util-linux's fsck if chosen
   https://patchwork.ozlabs.org/patch/696634/

   This fixes a real bug, but even Maxime who submitted the patch is
   not too happy with the proposal. Could someone look into this?

 * linux-headers: Account for LINUX_OVERRIDE_SRCDIR
   https://patchwork.ozlabs.org/patch/713927/

   I think I am against this patch, because if the user sets
   LINUX_OVERRIDE_SRCDIR, then suddenly he will see his kernel headers
   being rebuilt as well.

   Arnout ?

 * python-lxml: allow build as host package
   https://patchwork.ozlabs.org/patch/722644/

   Host package not used anywhere. Discussed at length during the
   previous BR meeting. What do we do?

 * fakedate: simplify logic
   https://patchwork.ozlabs.org/patch/725396/

 * linux-tools/perf: fix build for MIPS by using the right emulation on
   LD
   https://patchwork.ozlabs.org/patch/729154/

 * package/pkg-download.mk: add gitlab helper
   https://patchwork.ozlabs.org/patch/736382/

 * linux: Add CIP SLTS easy selection option
   https://patchwork.ozlabs.org/patch/736383/

Please help taking decisions about those patches.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
