From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 25 May 2020 14:46:11 +0000
Subject: [Buildroot] [Bug 12946] New: Grub: Decompressor is too big.
Message-ID: <bug-12946-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12946

            Bug ID: 12946
           Summary: Grub: Decompressor is too big.
           Product: buildroot
           Version: 2020.02.2
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: stefan.walter at iml.fraunhofer.de
                CC: buildroot at uclibc.org
  Target Milestone: ---

I'm using grub-mkimage from a Buildroot SDK built with "make sdk" to create a
boot loader image that is later combined with a home partition image (using
genimage). After updating (from 2018.02.12) to 2020.02.2, when running

grub-mkimage --config="$grub_early.cfg" --directory="$GRUB_DIR" -o
"$OUTPUT_PATH"/grub_core.img --format=i386-pc --prefix==/boot/grub
${GRUB_MODULES}

I'm now seeing this:

grub-mkimage: error: Decompressor is too big.

I'm building on Ubuntu 19.10 with GCC 9.2.1. The problem itself seems to be
known with the Grub developers:
https://lists.gnu.org/archive/html/grub-devel/2020-03/msg00217.html

Is it possible to integrate the fix mentioned there for 2020.02.3?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
