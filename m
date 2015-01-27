From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Jan 2015 22:41:45 +0100
Subject: [Buildroot] [RFC 0/8] Add a per-package help text
Message-ID: <1422394913-13257-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This commit implements one item of our TODO-list, which I believe we
added at the latest Buildroot meeting: adding a per-package help text
to document the available make targets for this package.

This idea came after a long discussion about which per-package make
targets should be documented under "make help", and which should
not. The idea is that the only per-package make target that now gets
documented in the global "make help" is "make <pkg>-help", and that
this per-package help text gives detailed information about which make
targets are available for this package.

The first patch adds support for <pkg>-help in generic-package, which
documents the generic targets.

The second patch extends the help text in the kconfig-package
infrastructure with the kconfig specific targets.

The three next patches (3, 4, 5) update the linux, barebox and ccache
packages to also document their own custom make targets using this new
mechanism.

The two next patches (6, 7) update the main "make help" text to take
into account those changes.

The last patch updates the manual.

Let me know what you think about this, and if the idea is worth
pursuing.

Thanks,

Thomas

Thomas Petazzoni (8):
  package: core support for per-package help text
  pkg-kconfig: extend per-package help text with kconfig targets
  linux: add custom per-package help text contents
  barebox: add custom help entries
  ccache: add custom help entries
  Makefile: remove uclibc, barebox, linux, busybox specific help
  Makefile: point users to the per-package help text
  docs/manual: update manual about <pkg>-help tagret

 Makefile                            | 15 +--------------
 boot/barebox/barebox.mk             | 10 ++++++++++
 docs/manual/make-tips.txt           | 11 -----------
 docs/manual/package-make-target.txt |  2 ++
 linux/linux.mk                      | 10 ++++++++++
 package/ccache/ccache.mk            |  7 +++++++
 package/pkg-generic.mk              | 24 ++++++++++++++++++++++++
 package/pkg-kconfig.mk              |  8 ++++++++
 package/pkg-utils.mk                |  4 ++++
 9 files changed, 66 insertions(+), 25 deletions(-)

-- 
2.1.0
