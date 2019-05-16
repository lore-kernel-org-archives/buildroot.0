From: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 17 May 2019 01:08:34 +0300
Subject: [Buildroot] [RFC PATCH/next 0/2] Add Cage and wlroots packages
Message-ID: <20190516220836.24543-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This is a RFC patch series which adds the Cage Wayland compositor, and the
wlroots library which is a dependency.

I find Cage well suited for kiosks and in general "single-application,
fullscreen" use cases. I find it particularly suitable to use in combination
with Cog (the WPE WebKit launcher), for many cases in which a full-fledged
compositor like Weston is not really needed.  A typical example is generating
a small image to run a single Web application from a Raspberry Pi right after
bootup.

I am considering adding one additional patch which enables installation of
a systemd unit for Cage, if there is interest in that.

Cheers,
?Adri?n


Adrian Perez de Castro (2):
  package/wlroots: new package
  package/cage: new package

 package/Config.in                             |   2 +
 .../cage/0001-Updates-for-wlroots-0.6.0.patch | 264 ++++++++++++++++++
 package/cage/Config.in                        |  24 ++
 package/cage/cage.hash                        |   5 +
 package/cage/cage.mk                          |  19 ++
 package/wlroots/Config.in                     |  65 +++++
 package/wlroots/wlroots.hash                  |   5 +
 package/wlroots/wlroots.mk                    |  80 ++++++
 8 files changed, 464 insertions(+)
 create mode 100644 package/cage/0001-Updates-for-wlroots-0.6.0.patch
 create mode 100644 package/cage/Config.in
 create mode 100644 package/cage/cage.hash
 create mode 100644 package/cage/cage.mk
 create mode 100644 package/wlroots/Config.in
 create mode 100644 package/wlroots/wlroots.hash
 create mode 100644 package/wlroots/wlroots.mk

-- 
2.21.0
