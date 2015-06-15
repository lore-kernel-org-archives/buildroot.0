From: Denis THULIN <denis.thulin@openwide.fr>
Date: Mon, 15 Jun 2015 12:06:02 +0200
Subject: [Buildroot] [PATCH 0/3] [RFC] python-package-generator
Message-ID: <1434362765-1074-1-git-send-email-denis.thulin@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series:
* Add utility scanpypi.py
* Add package python-robotframework
* Add package python-magic

scanpypi.py is an utility intended to automatically generatepython packages 
for buildroot using metadata provided by the python package index 
(https://pypi.python.org).

python-robotframework and python magic are packages generated using
scanpypi.py

v0: original patch

v0 -> v1: modification done according to Thomas Petazzoni and 
          Arnout Vandecappelle's comments

Denis THULIN (3):
  scanpypi.py: new utility
  python-robotframework: New package
  python-magic: new package

 docs/manual/adding-packages-python.txt             |  36 ++
 package/Config.in                                  |   2 +
 package/python-magic/Config.in                     |   7 +
 package/python-magic/python-magic.hash             |   2 +
 package/python-magic/python-magic.mk               |  14 +
 package/python-robotframework/Config.in            |   9 +
 .../python-robotframework.hash                     |   2 +
 .../python-robotframework/python-robotframework.mk |  14 +
 support/scripts/scanpypi.py                        | 607 +++++++++++++++++++++
 9 files changed, 693 insertions(+)
 create mode 100644 package/python-magic/Config.in
 create mode 100644 package/python-magic/python-magic.hash
 create mode 100644 package/python-magic/python-magic.mk
 create mode 100644 package/python-robotframework/Config.in
 create mode 100644 package/python-robotframework/python-robotframework.hash
 create mode 100644 package/python-robotframework/python-robotframework.mk
 create mode 100755 support/scripts/scanpypi.py

-- 
2.4.3
