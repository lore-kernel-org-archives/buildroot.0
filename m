From: Denis THULIN <denis.thulin@openwide.fr>
Date: Thu,  9 Jul 2015 15:31:55 +0200
Subject: [Buildroot] [PATCH 0/2] python-package-generator
Message-ID: <1436448717-6088-1-git-send-email-denis.thulin@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series:
* Add utility scanpypi
* Add package python-robotframework

scanpypi is an utility intended to automatically generatepython packages for 
buildroot using metadata provided by the python package index 
https://pypi.python.org.

python-robotframework is a package generated using scanpypi

v0: original patch

v0 -> v1: modification done according to Thomas Petazzoni and 
          Arnout Vandecappelle's comments

v1 -> v2: Made a class for packages in scanpypi. Also removed python-magic from
          patch because I have no need for it and it is not working for now. 


Denis THULIN (2):
  scanpypi: new utility
  python-robotframework: New package

 docs/manual/adding-packages-python.txt             |  32 ++
 package/Config.in                                  |   1 +
 package/python-robotframework/Config.in            |  10 +
 .../python-robotframework.hash                     |   3 +
 .../python-robotframework/python-robotframework.mk |  14 +
 support/scripts/scanpypi                           | 620 +++++++++++++++++++++
 6 files changed, 680 insertions(+)
 create mode 100644 package/python-robotframework/Config.in
 create mode 100644 package/python-robotframework/python-robotframework.hash
 create mode 100644 package/python-robotframework/python-robotframework.mk
 create mode 100755 support/scripts/scanpypi

-- 
2.4.4
