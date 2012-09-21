From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 21 Sep 2012 02:53:45 +0200
Subject: [Buildroot] [PATCH 00/10] Clean up improper dependencies on gettext
	without LOCALE
Message-ID: <20120921004927.11838.37292.stgit@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series cleans up redundant dependencies on gettext, in packages that
select gettext when LOCALE is not enabled.

The first 7 patches really remove the gettext dependency.  The last three
are in fact a NOP, because libglib2 selects gettext unconditionally.
I have kept the NEEDS_GETTEXT_IF_LOCALE dependency for these packages,
because they do have i18n code and do require libintl.  But the
dependency adds nothing, because libglib2 does the same already.

Regards,
Arnout

PS sorry for my earlier unfinished cover letter: I though I could
still cancel its sending...

---

Arnout Vandecappelle (Essensium/Mind) (10):
      diffutils: only needs gettext if locale is selected
      flex: only needs gettext if locale is selected
      ndisc6: only needs gettext if locale is selected
      util-linux: only needs gettext if locale is selected
      lshw: fix build with no LOCALE support
      avahi: remove double dependency on gettext
      pulseaudio: remove dependency on gettext
      gdk-pixbuf: remove dependency on gettext
      glib-networking: remove redundant dependency on gettext
      libsoup: remove redundant dependency on gettext


 package/avahi/avahi.mk                      |    5 +----
 package/diffutils/Config.in                 |    1 +
 package/diffutils/diffutils.mk              |    3 +--
 package/flex/Config.in                      |    1 +
 package/flex/flex.mk                        |    3 +--
 package/gdk-pixbuf/Config.in                |    1 -
 package/gdk-pixbuf/gdk-pixbuf.mk            |    1 -
 package/glib-networking/Config.in           |    2 +-
 package/libsoup/Config.in                   |    2 +-
 package/lshw/Config.in                      |    2 +-
 package/lshw/lshw.mk                        |   12 +++++++++---
 package/multimedia/pulseaudio/Config.in     |    2 +-
 package/multimedia/pulseaudio/pulseaudio.mk |    2 +-
 package/ndisc6/Config.in                    |    1 +
 package/ndisc6/ndisc6.mk                    |    2 +-
 package/util-linux/Config.in                |    1 +
 package/util-linux/util-linux.mk            |    2 +-
 17 files changed, 23 insertions(+), 20 deletions(-)

-- 
Signature
