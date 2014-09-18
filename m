From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Date: Thu, 18 Sep 2014 12:00:50 +0200
Subject: [Buildroot] [PATCH v2 0/5] targetcli-fb: new package
Message-ID: <1411034455-19670-1-git-send-email-cvubrugier@fastmail.fm>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is version 2 of my patch serie that adds targetcli-fb to
Buildroot. It fixes issues spotted by Thomas and Jerzy.

Changes v1 -> v2:
 - rename python-rtslib.mk to python-rtslib-fb.mk (as suggested by Jerzy)
 - Merge "targetcli-fb: add sysv initscript" (as suggested by Thomas)
 - Use TARGETCLI_FB_INSTALL_INIT_SYSV (as suggested by Thomas)
 - Describe the purpose of creating "/etc/target/" (as suggested by Thomas)

Christophe Vu-Brugier (5):
  python, python3: add patch to prevent distutils from adjusting the
    shebang
  python-urwid: new package
  python-rtslib-fb: new package
  python-configshell-fb: new package
  targetcli-fb: new package

 package/Config.in                                  |  4 ++
 package/python-configshell-fb/Config.in            | 11 ++++++
 .../python-configshell-fb/python-configshell-fb.mk | 14 +++++++
 package/python-rtslib-fb/Config.in                 |  9 +++++
 package/python-rtslib-fb/python-rtslib-fb.mk       | 13 ++++++
 package/python-urwid/Config.in                     |  7 ++++
 package/python-urwid/python-urwid.mk               | 14 +++++++
 ...017-distutils-scripts-dont-adjust-shebang.patch | 25 ++++++++++++
 ...015-distutils-scripts-dont-adjust-shebang.patch | 25 ++++++++++++
 package/targetcli-fb/Config.in                     | 14 +++++++
 package/targetcli-fb/S50target                     | 46 ++++++++++++++++++++++
 package/targetcli-fb/targetcli-fb.mk               | 26 ++++++++++++
 12 files changed, 208 insertions(+)
 create mode 100644 package/python-configshell-fb/Config.in
 create mode 100644 package/python-configshell-fb/python-configshell-fb.mk
 create mode 100644 package/python-rtslib-fb/Config.in
 create mode 100644 package/python-rtslib-fb/python-rtslib-fb.mk
 create mode 100644 package/python-urwid/Config.in
 create mode 100644 package/python-urwid/python-urwid.mk
 create mode 100644 package/python/python-017-distutils-scripts-dont-adjust-shebang.patch
 create mode 100644 package/python3/python3-015-distutils-scripts-dont-adjust-shebang.patch
 create mode 100644 package/targetcli-fb/Config.in
 create mode 100755 package/targetcli-fb/S50target
 create mode 100644 package/targetcli-fb/targetcli-fb.mk

-- 
2.1.0
