From: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 18 May 2021 16:54:18 +0300
Subject: [Buildroot] [PATCH v2 0/5] Update Cage, wlroots, and wayland
In-Reply-To: <20210513163325.1775639-1-aperez@igalia.com>
References: <20210513163325.1775639-1-aperez@igalia.com>
Message-ID: <20210518135423.194507-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello!

This patch set updates Cage to 0.1.3, which by itself does not have functional
changes over the previous version, but it pulls in wlroots 0.13.0 which does
include a good number of improvements.

Last but not least, wlroots can now libseat to broker sessions, so three of
the patches deal with adding a package for it, installing the daemon init
scripts (if the daemon is enabled, as it is optional), and arranging for
wlroots to use libseat when available. It looks like libseat is gaining
momentum in the Wayland ecosystem and for example Weston can also use it
since half a year ago [1].

Best regards,
-Adrian

[1] https://gitlab.freedesktop.org/wayland/weston/-/commit/6c4a993a999048a2054ec97e71d32839b312c642


Adrian Perez de Castro (5):
  package/wlroots: bump to version 0.13.0
  package/seatd: new package
  package/seatd: install init scripts
  package/wlroots: use libseat when available
  package/cage: bump to version 0.1.3

 package/Config.in                             |  1 +
 package/cage/cage.hash                        |  2 +-
 package/cage/cage.mk                          |  7 +--
 ...pport-building-builtin-without-seatd.patch | 37 +++++++++++++
 package/seatd/Config.in                       | 22 ++++++++
 package/seatd/S70seatd                        | 38 ++++++++++++++
 package/seatd/seatd.hash                      |  5 ++
 package/seatd/seatd.mk                        | 52 +++++++++++++++++++
 package/wlroots/Config.in                     |  3 ++
 package/wlroots/wlroots.hash                  |  4 +-
 package/wlroots/wlroots.mk                    | 25 ++++-----
 11 files changed, 174 insertions(+), 22 deletions(-)
 create mode 100644 package/seatd/0001-meson-Support-building-builtin-without-seatd.patch
 create mode 100644 package/seatd/Config.in
 create mode 100755 package/seatd/S70seatd
 create mode 100644 package/seatd/seatd.hash
 create mode 100644 package/seatd/seatd.mk

-- 
2.31.1
