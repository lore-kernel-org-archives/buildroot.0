From: heiko.thiery at gmail.com <heiko.thiery@gmail.com>
Date: Thu, 24 Oct 2019 09:46:39 +0200
Subject: [Buildroot] [PATCH v4 0/5] Add netopeer2 package (and dependencies)
Message-ID: <20191024074644.10442-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Thiery <heiko.thiery@kontron.com>

This patchset contains the netopeer2 package and the required
dependencies. Netopeer2 is a set of tools implementing network
configuration tools based on the NETCONF Protocol.

This includes the packages for sysrepo,
netopeer2-server, netopeer2-cli, netopeer2-keystored.

Also add the host target support for libev. This is needed
for the install steps of sysrepo, netopeer2-server and
netopeer2-keystored.

Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>

---
Changes v1 -> v2:
  - replace libredblack with libavl because this is also supported by
    debian.
  - changes all over the place to integrate review comments.

Changes v2 -> v3:
  - download the netopeer2 sources only once for the packages
    netopeer2-cli, netopeer2-keystored and netopeer2-server.
    Use the same value in <pkg>_DL_SUBDIR and <pkg>_SOURCE for
	all 3 packages.
  - add sysv init scripts for netopeer-server, sysrepod and
    syrepo-plugind.
  - changes all over the place to integrate review comments.

Changes v3 -> v4:
  - add config option for sysrepo examples
  - remove select of BR2_PACKAGE_NETOPEER2_SERVER_TLS in
    netopeer2-server because it creates a recursive dependency.
  - fix check-package warnings


Heiko Thiery (5):
  package/libev: use host-autotools-package macro
  package/sysrepo: add package
  package/netopeer2-keystored: add package
  package/netopeer2-server: add package
  package/netopeer2-cli: add package

 DEVELOPERS                                    |  4 +
 package/Config.in                             |  4 +
 package/libev/libev.mk                        |  1 +
 package/netopeer2-cli/Config.in               | 21 +++++
 package/netopeer2-cli/netopeer2-cli.hash      |  1 +
 package/netopeer2-cli/netopeer2-cli.mk        | 17 ++++
 package/netopeer2-keystored/Config.in         | 17 ++++
 .../netopeer2-keystored.hash                  |  2 +
 .../netopeer2-keystored.mk                    | 32 +++++++
 package/netopeer2-server/Config.in            | 51 +++++++++++
 package/netopeer2-server/S52netopeer2-server  | 90 +++++++++++++++++++
 .../netopeer2-server/netopeer2-server.hash    |  1 +
 package/netopeer2-server/netopeer2-server.mk  | 33 +++++++
 ...espect-CMAKE_INSTALL_PREFIX-and-DEST.patch | 33 +++++++
 ...t-make-systemd-unit-dir-configurable.patch | 40 +++++++++
 package/sysrepo/Config.in                     | 35 ++++++++
 package/sysrepo/S50sysrepod                   | 44 +++++++++
 package/sysrepo/S51sysrepo-plugind            | 49 ++++++++++
 package/sysrepo/sysrepo.hash                  |  2 +
 package/sysrepo/sysrepo.mk                    | 52 +++++++++++
 20 files changed, 529 insertions(+)
 create mode 100644 package/netopeer2-cli/Config.in
 create mode 120000 package/netopeer2-cli/netopeer2-cli.hash
 create mode 100644 package/netopeer2-cli/netopeer2-cli.mk
 create mode 100644 package/netopeer2-keystored/Config.in
 create mode 100644 package/netopeer2-keystored/netopeer2-keystored.hash
 create mode 100644 package/netopeer2-keystored/netopeer2-keystored.mk
 create mode 100644 package/netopeer2-server/Config.in
 create mode 100644 package/netopeer2-server/S52netopeer2-server
 create mode 120000 package/netopeer2-server/netopeer2-server.hash
 create mode 100644 package/netopeer2-server/netopeer2-server.mk
 create mode 100644 package/sysrepo/0001-CMakeLists.txt-respect-CMAKE_INSTALL_PREFIX-and-DEST.patch
 create mode 100644 package/sysrepo/0002-CMakeLists.txt-make-systemd-unit-dir-configurable.patch
 create mode 100644 package/sysrepo/Config.in
 create mode 100644 package/sysrepo/S50sysrepod
 create mode 100644 package/sysrepo/S51sysrepo-plugind
 create mode 100644 package/sysrepo/sysrepo.hash
 create mode 100644 package/sysrepo/sysrepo.mk

-- 
2.20.1
