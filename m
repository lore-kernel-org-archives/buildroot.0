From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Fri, 24 Jun 2016 21:22:26 +0200
Subject: [Buildroot] [Patch v3 0/3] Ninja, Meson: new build systems
Message-ID: <1466796149-25218-1-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This small patch series provides two new build systems: Ninja and Meson.

v2 -> v3:

 - bump meson to 0.3.2
 - fix cross-compilation configuration template
 - fix dependency on host-ninja

v1 -> v2:

 - only provide host variants of ninja and python-meson.
 - document integration of meson-based packages.
 - drop removal of mesongui.py.

Eric Le Bihan (3):
  ninja: new package
  python-meson: new package
  docs/manual: document meson-based packages

 docs/manual/adding-packages-meson.txt          | 84 ++++++++++++++++++++++++++
 docs/manual/adding-packages.txt                |  2 +
 package/ninja/ninja.hash                       |  2 +
 package/ninja/ninja.mk                         | 22 +++++++
 package/python-meson/cross-compilation.conf.in | 20 ++++++
 package/python-meson/meson-exe-wrapper.in      |  3 +
 package/python-meson/python-meson.hash         |  2 +
 package/python-meson/python-meson.mk           | 41 +++++++++++++
 8 files changed, 176 insertions(+)
 create mode 100644 docs/manual/adding-packages-meson.txt
 create mode 100644 package/ninja/ninja.hash
 create mode 100644 package/ninja/ninja.mk
 create mode 100644 package/python-meson/cross-compilation.conf.in
 create mode 100755 package/python-meson/meson-exe-wrapper.in
 create mode 100644 package/python-meson/python-meson.hash
 create mode 100644 package/python-meson/python-meson.mk

--
2.4.11
