From: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
Date: Fri, 22 Apr 2016 16:57:04 -0400
Subject: [Buildroot] [PATCH v1 0/4]
Message-ID: <1461358628-9352-1-git-send-email-patrick.keroulas@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patchset provides a new package: ring-daemon and its dependencies.
Ring is a secure and distributed voice, video and chat communication
platform that requires no centralized server. It relies on SIP stack
provided by libpjsip and OpenDHT for the distributed phone directory.
Since no UI hasn't been ported to embedded targets yet, an optional
Python client is supplied to interact with the daemon through D-Bus.

Patrick Keroulas (4):
  libpjsip: add gnutls support and fix various things
  msgpack: bump to version 1.4.0
  openDHT: new package
  ring-daemon: new package

 package/Config.in                                  |    2 +
 package/libpjsip/0003-Add-gnutls-support.patch     | 3373 ++++++++++++++++++++
 package/libpjsip/0004-Add-eagain-errno.patch       |   13 +
 .../libpjsip/0005-Support-multiple-listeners.patch |   66 +
 package/libpjsip/0006-Tune-ice-config.patch        |   23 +
 package/libpjsip/0007-Add-ice-session-getter.patch |   22 +
 package/libpjsip/0008-Fix-ARM-endianness.patch     |   19 +
 package/msgpack/msgpack.hash                       |    2 +-
 package/msgpack/msgpack.mk                         |   10 +-
 package/opendht/Config.in                          |   21 +
 package/opendht/opendht.hash                       |    2 +
 package/opendht/opendht.mk                         |   26 +
 package/ring-daemon/Config.in                      |   47 +
 package/ring-daemon/dring.yml                      |  118 +
 package/ring-daemon/ring-client.init               |   38 +
 package/ring-daemon/ring-daemon.hash               |    2 +
 package/ring-daemon/ring-daemon.init               |   47 +
 package/ring-daemon/ring-daemon.mk                 |   66 +
 18 files changed, 3892 insertions(+), 5 deletions(-)
 create mode 100644 package/libpjsip/0003-Add-gnutls-support.patch
 create mode 100644 package/libpjsip/0004-Add-eagain-errno.patch
 create mode 100644 package/libpjsip/0005-Support-multiple-listeners.patch
 create mode 100644 package/libpjsip/0006-Tune-ice-config.patch
 create mode 100644 package/libpjsip/0007-Add-ice-session-getter.patch
 create mode 100644 package/libpjsip/0008-Fix-ARM-endianness.patch
 create mode 100644 package/opendht/Config.in
 create mode 100644 package/opendht/opendht.hash
 create mode 100644 package/opendht/opendht.mk
 create mode 100644 package/ring-daemon/Config.in
 create mode 100644 package/ring-daemon/dring.yml
 create mode 100644 package/ring-daemon/ring-client.init
 create mode 100644 package/ring-daemon/ring-daemon.hash
 create mode 100644 package/ring-daemon/ring-daemon.init
 create mode 100644 package/ring-daemon/ring-daemon.mk

-- 
1.9.1
