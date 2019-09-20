From: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 20 Sep 2019 18:31:03 +0300
Subject: [Buildroot] [PATCH 0/3] Add option to enable WebKitGTK's sandboxing
 support
Message-ID: <20190920153106.2274596-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This patch series allows using a new security hardening feature added in
WebKitGTK 2.26: sandboxing of WebKit's Web content rendering and network/disk
access processes (WebKitWebProcess and WebKitNetworkProcess, respectively).

The sandboxing feature uses the new bubblewrap and xdg-dbus-proxy packages,
as well as libseccomp (which already had a package in in Buildroot).

Feedback and question on the patch series are welcome, as always :)

Cheers,

Adrian Perez de Castro (3):
  package/bubblewrap: new package
  package/xdg-dbus-proxy: new package
  package/webkitgtk: add option to enable sandboxing support

 DEVELOPERS                                    |  2 +
 package/Config.in                             |  2 +
 package/bubblewrap/Config.in                  |  7 ++
 package/bubblewrap/bubblewrap.hash            |  5 ++
 package/bubblewrap/bubblewrap.mk              | 40 +++++++++
 ...un-the-Bubblewrap-executable-when-co.patch | 87 +++++++++++++++++++
 package/webkitgtk/Config.in                   | 15 ++++
 package/webkitgtk/webkitgtk.mk                | 12 ++-
 package/xdg-dbus-proxy/Config.in              | 14 +++
 package/xdg-dbus-proxy/xdg-dbus-proxy.hash    |  5 ++
 package/xdg-dbus-proxy/xdg-dbus-proxy.mk      | 17 ++++
 11 files changed, 205 insertions(+), 1 deletion(-)
 create mode 100644 package/bubblewrap/Config.in
 create mode 100644 package/bubblewrap/bubblewrap.hash
 create mode 100644 package/bubblewrap/bubblewrap.mk
 create mode 100644 package/webkitgtk/0002-GTK-WPE-Do-not-run-the-Bubblewrap-executable-when-co.patch
 create mode 100644 package/xdg-dbus-proxy/Config.in
 create mode 100644 package/xdg-dbus-proxy/xdg-dbus-proxy.hash
 create mode 100644 package/xdg-dbus-proxy/xdg-dbus-proxy.mk

-- 
2.23.0
