From: Van Beveren David <David.VanBeveren@technicolor.com>
Date: Sun, 18 Sep 2011 23:07:19 -0400
Subject: [Buildroot] Qt 4.8 experience
Message-ID: <31287C6734E2244F990C9D2929CD549A29850DFA@INDYSMAILMB04.am.thmulti.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Has anyone tried to build Qt 4.8 beta? I have modified the qt.mk file and have it nearly working.

There is an unexplainable error on my platform (x86-linux (x64) host, x86-linux (atom) target, different kernel revisions). I am getting unresolved symbol errors when building the several libraries. The symbols in question are clearly exported from libraries referenced with -l in the link line (e.g.  QUrl::isLocalFile() const).  It builds just fine native.

Using CT-NG toolchain, 2.6.35.10, binutils 2.20.1, GCC 4.5.2, glibc 2.12.2,  GMP 5.0.1, MPFR 3.8.0, PPL 0.11, CLOOG 0.15.10, MPC 0.8.2, LIBELF 0.8.23

I am running 2011.02. I edited the qt.mk config from this version first.
Then I dropped the qt package folder from 2011.08 in place of the 2011.02 folder. Made approximately similar changes and had the same result.

Patching qt.mk to invoke sed to comment out the -Wl,--no-unresolved line from mkspecs/common/g++-unix.conf enables a clean compile (Examples / Demos not included).

Just wondering if anyone else has had a similar experience with the Qt 4.8 beta1 tarball.


David Van Beveren
Advanced Products Team

[cid:image001.jpg at 01CC763D.100E7F90]




-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110918/3c17c1e5/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: image001.jpg
Type: image/jpeg
Size: 16662 bytes
Desc: image001.jpg
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110918/3c17c1e5/attachment-0001.jpg>
