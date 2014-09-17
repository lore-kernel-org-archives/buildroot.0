From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Date: Wed, 17 Sep 2014 13:39:53 +0200
Subject: [Buildroot] [PATCH 0/6] targetcli-fb: new package
Message-ID: <1410953999-16520-1-git-send-email-cvubrugier@fastmail.fm>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This patch serie adds a new package to Buildroot: targetcli-fb.

Targetcli is a CLI used to configure the Linux "SCSI target"
driver. For instance, it allows to export a device with iSCSI or Fibre
Channel.

Targetcli is written in Python and depends on the following packages:
pyparsing, urwid, rtslib-fb, and configshell-fb. It should run on both
Python 2.7 and Python 3, but so far I had troubles with Python 3: it
seems that `2to3` is not invoked during a build for Python 3. As a
consequence targetcli-fb is currently not available when Python 3 is
selected.

Christophe Vu-Brugier (6):
  python, python3: add patch to prevent distutils from adjusting the
    shebang
  python-urwid: new package
  python-rtslib-fb: new package
  python-configshell-fb: new package
  targetcli-fb: new package
  targetcli-fb: add sysv initscript

 package/Config.in                                  |  4 ++
 package/python-configshell-fb/Config.in            | 11 ++++++
 .../python-configshell-fb/python-configshell-fb.mk | 14 +++++++
 package/python-rtslib-fb/Config.in                 |  9 +++++
 package/python-rtslib-fb/python-rtslib.mk          | 13 ++++++
 package/python-urwid/Config.in                     |  7 ++++
 package/python-urwid/python-urwid.mk               | 14 +++++++
 ...017-distutils-scripts-dont-adjust-shebang.patch | 25 ++++++++++++
 ...015-distutils-scripts-dont-adjust-shebang.patch | 25 ++++++++++++
 package/targetcli-fb/Config.in                     | 14 +++++++
 package/targetcli-fb/S50target                     | 46 ++++++++++++++++++++++
 package/targetcli-fb/targetcli-fb.mk               | 25 ++++++++++++
 12 files changed, 207 insertions(+)
 create mode 100644 package/python-configshell-fb/Config.in
 create mode 100644 package/python-configshell-fb/python-configshell-fb.mk
 create mode 100644 package/python-rtslib-fb/Config.in
 create mode 100644 package/python-rtslib-fb/python-rtslib.mk
 create mode 100644 package/python-urwid/Config.in
 create mode 100644 package/python-urwid/python-urwid.mk
 create mode 100644 package/python/python-017-distutils-scripts-dont-adjust-shebang.patch
 create mode 100644 package/python3/python3-015-distutils-scripts-dont-adjust-shebang.patch
 create mode 100644 package/targetcli-fb/Config.in
 create mode 100755 package/targetcli-fb/S50target
 create mode 100644 package/targetcli-fb/targetcli-fb.mk

-- 
2.1.0
