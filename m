From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 29 Mar 2016 18:06:50 -0300
Subject: [Buildroot] [PATCH v2 0/3] Webkitgtk 2.12.x bump
Message-ID: <1459285613-6784-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series bumps webkitgtk from the current 2.4.x series to 2.12.x and
midori to match as well.

It's a major bump that deprecates the 2.4.x series since it isn't 100%
security supported by upstream.

Changes for v2:
 * webkitgtk: dedup/group x11 dependencies
 * webkitgtk: spin GLES handling outside wayland
 * midori: it's available for libgtk3 in general (any backend)
 * defer demo config until it get more polish

Gustavo Zacarias (3):
  webkitgtk: new package
  midori: bump to version 0.5.11
  webkitgtk24: mark as deprecated

 package/Config.in                            |  1 +
 package/midori/0001-disable-libnotify.patch  | 43 --------------
 package/midori/0001-fix-bug-1492932.patch    | 44 ++++++++++++++
 package/midori/0002-gcr-for-x11-only.patch   | 32 ++++++++++
 package/midori/0002-new-vala.patch           | 26 --------
 package/midori/Config.in                     | 36 ++++-------
 package/midori/midori.hash                   |  2 +-
 package/midori/midori.mk                     | 36 +++--------
 package/{webkitgtk24 => webkitgtk}/Config.in | 46 +++++++-------
 package/webkitgtk/webkitgtk.hash             |  4 ++
 package/webkitgtk/webkitgtk.mk               | 89 ++++++++++++++++++++++++++++
 package/webkitgtk24/Config.in                |  2 +
 12 files changed, 215 insertions(+), 146 deletions(-)
 delete mode 100644 package/midori/0001-disable-libnotify.patch
 create mode 100644 package/midori/0001-fix-bug-1492932.patch
 create mode 100644 package/midori/0002-gcr-for-x11-only.patch
 delete mode 100644 package/midori/0002-new-vala.patch
 copy package/{webkitgtk24 => webkitgtk}/Config.in (60%)
 create mode 100644 package/webkitgtk/webkitgtk.hash
 create mode 100644 package/webkitgtk/webkitgtk.mk

-- 
2.7.3
