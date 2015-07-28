From: Denis THULIN <denis.thulin@openwide.fr>
Date: Tue, 28 Jul 2015 14:43:27 +0200
Subject: [Buildroot] [PATCH 0/2] python-package-generator
Message-ID: <1438087409-16621-1-git-send-email-denis.thulin@openwide.fr>
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

v1 -> v3: Fixed bugs, added better support for some packages

Denis THULIN (2):
  scanpypi: new utility
  python-robotframework: New package

 docs/manual/adding-packages-python.txt             |  43 ++
 package/Config.in                                  |   1 +
 package/python-robotframework/Config.in            |   9 +
 .../python-robotframework.hash                     |   4 +
 .../python-robotframework/python-robotframework.mk |  14 +
 support/scripts/scanpypi                           | 653 +++++++++++++++++++++
 6 files changed, 724 insertions(+)
 create mode 100644 package/python-robotframework/Config.in
 create mode 100644 package/python-robotframework/python-robotframework.hash
 create mode 100644 package/python-robotframework/python-robotframework.mk
 create mode 100755 support/scripts/scanpypi

-- 
2.4.6
