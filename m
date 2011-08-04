From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  4 Aug 2011 23:23:18 +0200
Subject: [Buildroot] [RFC] Using AsciiDoc for the Buildroot manual
Message-ID: <cover.1312492948.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The Buildroot documentation was started by myself in December 2004
(see commit 32fcf718f82c241e890af8c7ccc10ef6c438331a), and at that
time the amount of documentation was relatively light, so the single
HTML file was seen as an appropriate solution to write the
documentation.

Since then, the documentation has expanded quite a bit, and I intend
to do some more important additions to the documentation in the near
future, but I feel like the hand-written HTML format is a bit
annoying.

Therefore, this set of patches proposes to switch the documentation
over to the AsciiDoc format [1]. It is a very simple text-baseda
format, from which you can generate HTML (single page or splitted),
PDF, text, and more.

I have done an initial conversion of the Buildroot documentation to
AsciiDoc and the result can be seen at :

 * http://free-electrons.com/~thomas/buildroot/manual/manual.pdf for
   the PDF version

 * http://free-electrons.com/~thomas/buildroot/manual/manual.text for
   the text version

 * http://free-electrons.com/~thomas/buildroot/manual/manual.html for
   the single page HTML version

 * http://free-electrons.com/~thomas/buildroot/manual/html/ for
   the multiple pages HTML version

Some more improvements can quite certainly be made to the converted
document. However, I'd prefer not to maintain it for a too long time
together with the current documentation, so if the solution of
AsciiDoc gets the attention of the Buildroot community, it'd be nice
to have this merged relatively soon, or at least to not do too many
changes to the current documentation.

Best regards,

Thomas

[1] http://www.methods.co.nz/asciidoc/

The following changes since commit 55cea3b5ef3bd5464420fd610c73e150443d0e67:

  util-linux: add option for libmount (2011-07-29 13:38:49 +0200)

are available in the git repository at:
  http://free-electrons.com/~thomas/buildroot.git asciidoc-manual

Thomas Petazzoni (5):
      manual: convert existing documentation to the asciidoc format
      manual: provide make targets to build the documentation
      remove the old buildroot.html documentation
      remove Glibc_vs_uClibc document
      manual: ignore generated files

 Makefile                                     |   40 +-
 docs/Glibc_vs_uClibc.html                    |  240 ----
 docs/buildroot.html                          | 1819 --------------------------
 docs/manual/.gitignore                       |    4 +
 docs/manual/adding-packages-autotargets.txt  |  167 +++
 docs/manual/adding-packages-cmaketargets.txt |  140 ++
 docs/manual/adding-packages-conclusion.txt   |   10 +
 docs/manual/adding-packages-directory.txt    |   76 ++
 docs/manual/adding-packages-gentargets.txt   |  303 +++++
 docs/manual/adding-packages-gettext.txt      |   44 +
 docs/manual/adding-packages-handwritten.txt  |  165 +++
 docs/manual/adding-packages.txt              |   21 +
 docs/manual/board-support.txt                |   35 +
 docs/manual/ccache-support.txt               |   21 +
 docs/manual/customize-busybox-config.txt     |   24 +
 docs/manual/customize-kernel-config.txt      |   12 +
 docs/manual/customize-rootfs.txt             |   36 +
 docs/manual/customize-uclibc-config.txt      |   32 +
 docs/manual/customize.txt                    |   10 +
 docs/manual/download-location.txt            |   26 +
 docs/manual/external-toolchain.txt           |   84 ++
 docs/manual/getting.txt                      |   23 +
 docs/manual/how-buildroot-works.txt          |   59 +
 docs/manual/introduction.txt                 |   69 +
 docs/manual/manual.txt                       |   32 +
 docs/manual/rebuilding-packages.txt          |   62 +
 docs/manual/using-buildroot-toolchain.txt    |   20 +
 docs/manual/using.txt                        |  183 +++
 28 files changed, 1697 insertions(+), 2060 deletions(-)
 delete mode 100644 docs/Glibc_vs_uClibc.html
 delete mode 100644 docs/buildroot.html
 create mode 100644 docs/manual/.gitignore
 create mode 100644 docs/manual/adding-packages-autotargets.txt
 create mode 100644 docs/manual/adding-packages-cmaketargets.txt
 create mode 100644 docs/manual/adding-packages-conclusion.txt
 create mode 100644 docs/manual/adding-packages-directory.txt
 create mode 100644 docs/manual/adding-packages-gentargets.txt
 create mode 100644 docs/manual/adding-packages-gettext.txt
 create mode 100644 docs/manual/adding-packages-handwritten.txt
 create mode 100644 docs/manual/adding-packages.txt
 create mode 100644 docs/manual/board-support.txt
 create mode 100644 docs/manual/ccache-support.txt
 create mode 100644 docs/manual/customize-busybox-config.txt
 create mode 100644 docs/manual/customize-kernel-config.txt
 create mode 100644 docs/manual/customize-rootfs.txt
 create mode 100644 docs/manual/customize-uclibc-config.txt
 create mode 100644 docs/manual/customize.txt
 create mode 100644 docs/manual/download-location.txt
 create mode 100644 docs/manual/external-toolchain.txt
 create mode 100644 docs/manual/getting.txt
 create mode 100644 docs/manual/how-buildroot-works.txt
 create mode 100644 docs/manual/introduction.txt
 create mode 100644 docs/manual/manual.txt
 create mode 100644 docs/manual/rebuilding-packages.txt
 create mode 100644 docs/manual/using-buildroot-toolchain.txt
 create mode 100644 docs/manual/using.txt

Thanks,
-- 
Thomas Petazzoni
