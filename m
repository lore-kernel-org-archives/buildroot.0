From: Adrian Perez de Castro <aperez@igalia.com>
Date: Sun, 10 Nov 2019 22:06:36 +0200
Subject: [Buildroot] [PATCH v3 0/2] Add cage and wlroots packages
Message-ID: <20191110200638.3570497-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a patch series which adds the Cage Wayland compositor, and the
wlroots library which is a dependency.

I find Cage well suited for kiosks and in general "single-application,
fullscreen" use cases. I find it particularly suitable to use in combination
with Cog (the WPE WebKit launcher), for many cases in which a full-fledged
compositor like Weston is not really needed.  A typical example is generating
a small image to run a single Web application from a Raspberry Pi right after
bootup.

Cheers,
?Adri?n


Adrian Perez de Castro (2):
  package/wlroots: new package
  package/cage: new package

 DEVELOPERS                                    |  2 +
 package/Config.in                             |  2 +
 package/cage/Config.in                        | 17 +++++
 package/cage/cage.hash                        |  5 ++
 package/cage/cage.mk                          | 18 +++++
 ...onfig-to-find-wayland-scanner-when-c.patch | 45 ++++++++++++
 package/wlroots/Config.in                     | 52 +++++++++++++
 package/wlroots/wlroots.hash                  |  5 ++
 package/wlroots/wlroots.mk                    | 73 +++++++++++++++++++
 9 files changed, 219 insertions(+)
 create mode 100644 package/cage/Config.in
 create mode 100644 package/cage/cage.hash
 create mode 100644 package/cage/cage.mk
 create mode 100644 package/wlroots/0001-Do-not-use-pkg-config-to-find-wayland-scanner-when-c.patch
 create mode 100644 package/wlroots/Config.in
 create mode 100644 package/wlroots/wlroots.hash
 create mode 100644 package/wlroots/wlroots.mk

-- 
2.24.0
