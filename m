From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 30 Jul 2007 22:39:46 +0200
Subject: [Buildroot] cross-cxx support
Message-ID: <20070730203946.GE29064@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

If you want to build lzma for the target, you need a working
cross-compiler for C++.

The patch referenced below does add BR2_GCC_CROSS_* compilers, adds a
variable that points to the auto-generated files that can be used for
dependency-tracking (somebody, i think it was sjhill broke this by
moving the former toplevel "include" dir to
package/config/buildroot-config/*) and adjusts accordingly.

This is just a theory of operation and not yet tested.
Comments (or testers) welcome..

http://uclibc.org/~aldot/buildroot/br2.gcc_cross_cxx.00.diff

cheers,
Bernhard

PS: re: theory. Toggling stuff in (menu)config is supposed to update the
timestamp of the files in BR2_DEPENDS_DIR, so we transparently can
recompile if a prerequisite changes. Other examples would be e.g. LFS
support for both the cross- as well as an eventual target compiler (and
uClibc et al). If the cross-compiler/libc changed, we have to recompile
everything, ultimately.
