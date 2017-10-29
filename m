From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 29 Oct 2017 14:10:50 +0100
Subject: [Buildroot] [PATCH v4 0/2] Add support for Meson build
Message-ID: <20171029131052.18850-1-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This small patch series provides a new build system: Meson.

v4 -> v3:

- update documentation with verbosity, configuration and staging installation
  details.
- update cross-compilation configuration creation to take into account
  $(TARGET_CFLAGS) and friends.
- add reference to release signature in hash file.
- re-use explicit tarball release instead of github helper.
- various stylistic changes (suggested by Arnout).

v2 -> v3:

- bump version to 0.43.0
- re-use github helper
- reword comments in cross-compilation.conf.in
- use $(FOO_CONF_OPTS) in package documentation

v1 -> v2: (J?rg Krause)

- bump to version 0.41.2
- use explicit tarball release instead of github helper
- use explicit sed
- pass BR2_GCC_TARGET_CPU to cross file

Eric Le Bihan (2):
  meson: new package
  docs/manual: document meson-based packages

 docs/manual/adding-packages-meson.txt   | 101 ++++++++++++++++++++++++++++++++
 docs/manual/adding-packages.txt         |   2 +
 package/meson/cross-compilation.conf.in |  23 ++++++++
 package/meson/meson.hash                |   3 +
 package/meson/meson.mk                  |  35 +++++++++++
 5 files changed, 164 insertions(+)
 create mode 100644 docs/manual/adding-packages-meson.txt
 create mode 100644 package/meson/cross-compilation.conf.in
 create mode 100644 package/meson/meson.hash
 create mode 100644 package/meson/meson.mk

--
2.13.6
