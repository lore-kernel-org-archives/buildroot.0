From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 21 Sep 2012 02:41:38 +0200
Subject: [Buildroot] [PATCH 0/8] Clean up improper dependencies on gettext
	without LOCALE
Message-ID: <20120921003010.8623.50568.stgit@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series cleans up redundant dependencies on gettext, in packages that
select gettext when LOCALE is not enabled.

Patches 1-6 fix the dependency for packages that don't have to
be linked with gettext if LOCALE is not selected.

Patch 7 and 8 are examples of packages that depend on libglib2,

---

Arnout Vandecappelle (Essensium/Mind) (8):
      diffutils: only needs gettext if locale is selected
      flex: only needs gettext if locale is selected
      ndisc6: only needs gettext if locale is selected
      util-linux: only needs gettext if locale is selected
      lshw: fix build with no LOCALE support
      avahi: remove double dependency on gettext
      gdk-pixbuf: remove dependency on gettext
      pulseaudio: remove dependency on gettext


 package/avahi/avahi.mk                      |    5 +----
 package/diffutils/Config.in                 |    1 +
 package/diffutils/diffutils.mk              |    3 +--
 package/flex/Config.in                      |    1 +
 package/flex/flex.mk                        |    3 +--
 package/gdk-pixbuf/Config.in                |    2 +-
 package/lshw/Config.in                      |    2 +-
 package/lshw/lshw.mk                        |   12 +++++++++---
 package/multimedia/pulseaudio/Config.in     |    1 -
 package/multimedia/pulseaudio/pulseaudio.mk |    1 -
 package/ndisc6/Config.in                    |    1 +
 package/ndisc6/ndisc6.mk                    |    2 +-
 package/util-linux/Config.in                |    1 +
 package/util-linux/util-linux.mk            |    2 +-
 14 files changed, 20 insertions(+), 17 deletions(-)
