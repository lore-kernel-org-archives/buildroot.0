From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Sep 2010 22:52:22 +0200
Subject: [Buildroot] [git commit master 1/1] Clean up our patches against
	kconfig
Message-ID: <20100905213832.C75998A4A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7c524dd0b683e1e8fac4e4084ac7678576bfbe07
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Our kconfig-to-buildroot2.patch hasn't been kept up to date with all
the changes made into package/config, and a single patch wasn't very
practical to maintain all our changes. Therefore, this commit adds a
package/config/patches directory, which contains a Quilt series of
patches that correspond to our modifications to the kconfig mechanism.

The huge kconfig-to-buildroot2.patch has been split into 16 smaller
patches. The purpose of some of the modifications has been clearly
identified, while some others were not identified.

The 16 patches together do match exactly the old
kconfig-to-buildroot2.patch. We have been very careful in making sure
that we wouldn't loose any of our modifications.

The only modifications made are :

 * Instead of renaming the kernel Makefile to Makefile.kconfig and
   naming the Buildroot Makefile just 'Makefile', we instead keep the
   original package/config/Makefile from the kernel
   scripts/kconfig/Makefile and name the Buildroot Makefile
   package/config/Makefile.br. The main Buildroot Makefile is modified
   accordingly.

 * The documentation README.buildroot2 is updated to explain how to
   upgrade to a newer version of scripts/kconfig.

 * The kconfig-language.txt documentation is removed, as anybody can
   easily find it in the kernel sources so there's no need to
   duplicate it here.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Patch is too large, so refusing to show it
