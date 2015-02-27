From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 27 Feb 2015 10:19:17 +0100
Subject: [Buildroot] [PATCH 0/7]  Various fixes
Message-ID: <1425028764-1146-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,
this patch set fix:
- some build failures
- some error messages
- some optional dependencies

Best regards

Fabio Porcedda (7):
  shared-mime-info: host variant requires libxml2 and libglib2
  libxmlrpc: add missing braces for variable CURL_CONFIG in patch 4
  x11r7/xcb-util-keysyms: depends on host-pkgconf and libxcb
  package/civetweb: fix build error on a host with make v4.0
  freetype: host-freetype-patch requires host-automake
  package/efl/libevas: add optional dependency libfribidi
  package/libfribidi: add optional dependency libglib2

 ...ua-fix-a-typo-changing-LFS_DIR-to-LFS_DIR.patch | 27 ++++++++++++++++++++++
 package/efl/libevas/libevas.mk                     |  7 ++++++
 package/freetype/freetype.mk                       |  7 +++---
 package/libfribidi/libfribidi.mk                   |  6 +++++
 .../libxmlrpc/0004-use-correct-curl-config.patch   |  8 +++----
 package/shared-mime-info/shared-mime-info.mk       |  5 ++--
 package/x11r7/xcb-util-keysyms/Config.in           |  1 +
 package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk |  2 ++
 8 files changed, 54 insertions(+), 9 deletions(-)
 create mode 100644 package/civetweb/0001-Lua-fix-a-typo-changing-LFS_DIR-to-LFS_DIR.patch

-- 
2.3.0
