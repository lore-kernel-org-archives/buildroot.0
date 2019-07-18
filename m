From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Thu, 18 Jul 2019 12:06:33 +0200
Subject: [Buildroot] [PATCH 0/3] Update package mosquitto
Message-ID: <20190718100636.27290-1-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patchset extend the mosquitto integration with Buildroot's
build system and other packages, thanks to configuration options
that have been introduced in mosquitto 1.5; and bump mosquitto
to the latest version (1.6.3).

Interesting new features in mosquitto 1.6 include:
* Explicit support for TLS v1.3 (and drop support for TLS v1.0)
* Support for new mqttv5 protocol
* Remove dependency on libuuid

Titouan Christophe (3):
  package/mosquitto: allow to build as static lib
  package/mosquitto: Switch systemd unit to Type=notify and depend on
    network
  package/mosquitto: bump to v1.6.3

 package/mosquitto/Config.in         |  4 ----
 package/mosquitto/mosquitto.hash    |  2 +-
 package/mosquitto/mosquitto.mk      | 19 +++++++++++--------
 package/mosquitto/mosquitto.service |  3 +++
 4 files changed, 15 insertions(+), 13 deletions(-)

-- 
2.21.0
