From: Joachim Wiberg <troglobit@gmail.com>
Date: Sun, 24 Jan 2021 20:49:07 +0100
Subject: [Buildroot] [PATCH v2 0/1] package/ssdp-responder: new package
In-Reply-To: <20210124095108.GL926565@scaer>
Message-ID: <20210124194908.1762833-1-troglobit@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

This is a respin of my first patch, with fixes to comments by Yann.

Changes v1 -> v2:
 - Fix whitespace in ssdp-responder/Config.in
 - Add host-pkg-config to build deps., used by package to check for
   systemd and create a unit file with correct paths from configure
 - Package has native systemd unit file, add systemd to build deps.,
   but only if systemd is enabled in buildroot
 - Use _INSTALL_INIT_SYSTEMD to install unit file

Regards
 /Joachim

Joachim Wiberg (1):
  package/ssdp-responder: new package

 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/ssdp-responder/Config.in           | 20 +++++++++++
 package/ssdp-responder/S50ssdpd            | 42 ++++++++++++++++++++++
 package/ssdp-responder/ssdp-responder.hash |  3 ++
 package/ssdp-responder/ssdp-responder.mk   | 31 ++++++++++++++++
 6 files changed, 98 insertions(+)
 create mode 100644 package/ssdp-responder/Config.in
 create mode 100755 package/ssdp-responder/S50ssdpd
 create mode 100644 package/ssdp-responder/ssdp-responder.hash
 create mode 100644 package/ssdp-responder/ssdp-responder.mk

-- 
2.25.1
