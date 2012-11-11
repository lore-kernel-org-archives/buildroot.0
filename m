From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 11 Nov 2012 14:14:38 +0100
Subject: [Buildroot] [PATCH 00/23] Pull request for branch for-2012/doc
Message-ID: <1352639701-27829-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi folks,

Here is another round of the documentation refactoring, that, as we agreed
during the last Buildroot developer Days, aims to be merged to move forward on
this topic.

This series has been rebased on the commit:
234fe4433489bca81b79311239569525cc008d9d

and can be fetched from:
https://github.com/tSed/buildroot.git for-2012.11/doc

In addition to the new sections and random updates added since the last
subimission of this patch series, the manual has grown quite a lot, especially
since the last Buildroot developer Days.

In details:

* Added few tips when using Buildroot.

* FAQ: Explanation why compiler/dev. files/documentation is not supported on the
  target.

* Start some explanation when 'make clean all' is necessary.

* Added few tips for adding package.

* Describe the sub-target of a package build.

* Add few tips about how to use generated images.

* Add a bunch of information about the Buildroot project community
  (how to get help, how to contribute, ...)

* Update the appendices:
  - add the list of the deprecated stuff
  - add the list of the packages integrated in Buildroot (which make a lot of
    noise in the diff stat :P)


Previous submission:
- http://lists.busybox.net/pipermail/buildroot/2012-March/051952.html
- http://lists.busybox.net/pipermail/buildroot/2012-May/053803.html

Happy review!

As always, looking forward to read your comments, suggestions, critics, blames...


Samuel Martin (23):
  dependencies.sh: remove makeinfo (texinfo) from the requirement list
  manual: make clean target consistent with others in buildroot
  manual: set toc depth to 4 for html outputs
  manual: rework the whole documentation stub
  manual: rework introduction.txt and add embedded-basics.txt
  manual: rework using.txt and update common-usage.txt
  manual: customize-rootfs.txt: refactoring, misc. fixes and update
  manual: update rebuilding-packages.txt
  manual: adding-package-directory.txt: update, cleanup and typo fixes
  manual: add prerequisite.txt
  manual: add make-tips.txt
  manual: faq.txt: rework and update
  manual: add writing-rules.txt
  manual: add get-involved.txt
  manual: add contribute.txt
  manual: add package-make-target.txt
  manual: add download-infra.txt
  manual: add patch-policy.txt
  manual: add adding-package-tips.txt
  manual: add legal-info.txt
  manual: add pkg-list.txt (generated list of available packages)
  manual: add deprecated-list.txt
  manual: add beyond-buildroot.txt

 docs/manual/adding-packages-autotools.txt  |   8 +-
 docs/manual/adding-packages-cmake.txt      |   8 +-
 docs/manual/adding-packages-conclusion.txt |   4 +-
 docs/manual/adding-packages-directory.txt  |  42 +-
 docs/manual/adding-packages-generic.txt    |  66 ++-
 docs/manual/adding-packages-gettext.txt    |   4 +-
 docs/manual/adding-packages-tips.txt       |  54 ++
 docs/manual/adding-packages.txt            |   8 +-
 docs/manual/advanced.txt                   |  14 +
 docs/manual/appendix.txt                   |  15 +
 docs/manual/beyond-buildroot.txt           |  38 ++
 docs/manual/board-support.txt              |   5 +-
 docs/manual/ccache-support.txt             |   5 +-
 docs/manual/common-usage.txt               | 101 ++++
 docs/manual/contribute.txt                 | 126 +++++
 docs/manual/customize-busybox-config.txt   |   8 +-
 docs/manual/customize-kernel-config.txt    |   5 +-
 docs/manual/customize-rootfs.txt           |  35 +-
 docs/manual/customize-toolchain.txt        |  12 +-
 docs/manual/customize-uclibc-config.txt    |   6 +-
 docs/manual/customize.txt                  |   4 +-
 docs/manual/deprecated-list.txt            |  46 ++
 docs/manual/developer-guide.txt            |  14 +
 docs/manual/download-infra.txt             |   8 +
 docs/manual/download-location.txt          |   4 +-
 docs/manual/embedded-basics.txt            | 110 ++++
 docs/manual/external-toolchain.txt         |   6 +-
 docs/manual/faq-troubleshooting.txt        | 134 +++++
 docs/manual/faq.txt                        |  59 --
 docs/manual/get-involved.txt               | 101 ++++
 docs/manual/getting.txt                    |   5 +-
 docs/manual/going-further.txt              |  10 +
 docs/manual/how-buildroot-works.txt        |   4 +-
 docs/manual/introduction.txt               |  72 +--
 docs/manual/legal-notice.txt               | 136 +++++
 docs/manual/make-tips.txt                  |  58 ++
 docs/manual/makedev-syntax.txt             |   2 +
 docs/manual/manual.mk                      |  10 +-
 docs/manual/manual.txt                     |  24 +-
 docs/manual/package-make-target.txt        |  88 +++
 docs/manual/patch-policy.txt               | 128 +++++
 docs/manual/pkg-list.txt                   | 870 +++++++++++++++++++++++++++++
 docs/manual/prerequisite.txt               |  84 +++
 docs/manual/rebuilding-packages.txt        |  73 ++-
 docs/manual/starting-up.txt                |  11 +
 docs/manual/using-buildroot-toolchain.txt  |   4 +-
 docs/manual/using.txt                      | 237 +-------
 docs/manual/working-with.txt               |  23 +
 docs/manual/writing-rules.txt              | 125 +++++
 support/dependencies/dependencies.sh       |   6 +-
 50 files changed, 2547 insertions(+), 473 deletions(-)
 create mode 100644 docs/manual/adding-packages-tips.txt
 create mode 100644 docs/manual/advanced.txt
 create mode 100644 docs/manual/beyond-buildroot.txt
 create mode 100644 docs/manual/common-usage.txt
 create mode 100644 docs/manual/contribute.txt
 create mode 100644 docs/manual/deprecated-list.txt
 create mode 100644 docs/manual/developer-guide.txt
 create mode 100644 docs/manual/download-infra.txt
 create mode 100644 docs/manual/embedded-basics.txt
 create mode 100644 docs/manual/faq-troubleshooting.txt
 delete mode 100644 docs/manual/faq.txt
 create mode 100644 docs/manual/get-involved.txt
 create mode 100644 docs/manual/going-further.txt
 create mode 100644 docs/manual/legal-notice.txt
 create mode 100644 docs/manual/make-tips.txt
 create mode 100644 docs/manual/package-make-target.txt
 create mode 100644 docs/manual/patch-policy.txt
 create mode 100644 docs/manual/pkg-list.txt
 create mode 100644 docs/manual/prerequisite.txt
 create mode 100644 docs/manual/starting-up.txt
 create mode 100644 docs/manual/working-with.txt
 create mode 100644 docs/manual/writing-rules.txt

--
1.8.0
