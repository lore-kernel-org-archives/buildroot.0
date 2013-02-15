From: Patrick Gerber <kpa_info@yahoo.fr>
Date: Fri, 15 Feb 2013 11:00:07 +0100
Subject: [Buildroot] [PATCH v4 0/5] Python 3, simple,
	external package support
Message-ID: <1360922412-32559-1-git-send-email-kpa_info@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series refactor python support in buildroot to enable the 
use of external package with both; python2 and python3. The packages
python-bottle and python-serial have been adapted as examples.

To support others external package more work is needed as they are
based on python setuptools. It's no more supported by python3 and
should be replaced by "Distribute". This should be done in another
patch series.

Changes between v3 and v4:

* Remove the python-common.mk file and move the PYTHON variable
  declaration into python.mk and python3.mk (Requested by Maxime 
  Ripard)

Changes between v2 and v3:

* Same new menu organisation as v2 but with less modifications in 
  package/Config.in (Requested by Thomas Petazzoni)

* New directory called python-common instead of python generic.  
  (Requested by Thomas Petazzoni)

* No more symlink from python to python3 in staging (Requested by 
  Samuel Martin)

Patrick Gerber (5):
  Python menu reorganization
  Add python3 config directory simlink
  Add PYTHON variable to ease the support of both version
  python-bottle: Convert package to be used with python2 or python3
  python-serial: Convert package to be used with python2 or python3

 package/Config.in                      |    3 ++-
 package/python-bottle/python-bottle.mk |    6 +++---
 package/python-common/Config.in        |   35 ++++++++++++++++++++++++++++++++
 package/python-serial/Config.in        |    1 -
 package/python-serial/python-serial.mk |    6 +++---
 package/python/Config.in               |   14 -------------
 package/python/python.mk               |    6 ++++++
 package/python3/Config.in              |   14 -------------
 package/python3/python3.mk             |   15 ++++++++++++++
 9 files changed, 64 insertions(+), 36 deletions(-)
 create mode 100644 package/python-common/Config.in

-- 
1.7.9.5
