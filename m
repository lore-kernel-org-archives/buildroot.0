From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 29 Mar 2016 11:38:59 -0300
Subject: [Buildroot] [PATCH v3 00/11] Weston package enhancements
Message-ID: <1459262350-10974-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changes for v3:
* Explicitly disable EGL if not available
* EGL requires mesa as provider
* libva can in fact be disabled/enabled
* Add explicit dbus support
* Add explicit lcms support
* Add explicit webp support
* Add explicit systemd support
* Add explicit libxml2 support

Changes for v2:
* Add libdrm dependency for DRM compositor
* Add weston-launch support
* Drop useless --disable-xwayland-test

Gustavo Zacarias (11):
  weston: add EGL support
  weston: set default backend for fbdev
  weston: add DRM compoitor support
  weston: handle optional libva support
  weston: add weston-launch support
  weston: drop --disable-xwayland-test
  weston: handle dbus dependency
  weston: handle lcms dependecy
  weston: handle webp dependency
  weston: handle systemd dependency
  weston: handle libxml2 dependency

 package/weston/Config.in | 10 ++++++
 package/weston/weston.mk | 82 ++++++++++++++++++++++++++++++++++++++++++------
 2 files changed, 83 insertions(+), 9 deletions(-)

-- 
2.7.3
