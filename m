From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 18 Mar 2020 14:37:36 +0530
Subject: [Buildroot] [PATCH v6 0/4] package/python-scipy: new package
Message-ID: <20200318090740.4973-1-jagan@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is v6 changes for last version changes[1] from 
Esben Haabendal.

This new work is done based on the communication with
Esben Haabendal.

Changes for v6:
- bump to numpy latest version
- drop python2 dependecy on numpy seelcted packages
- update numpy cross compilation changes
- add pybind11 package
- add latest python-scipy

Any inputs?
Jagan.

[1] https://patchwork.ozlabs.org/patch/1169181

Esben Haabendal (1):
  package/python-numpy: fixup numpy distutils for cross compilation

Jagan Teki (3):
  package/python-numpy: Bump to version 1.18.1
  package/python-pybind11: Add new host package
  package/python-scipy: Add new package

 DEVELOPERS                                   |  2 +
 package/Config.in                            |  1 +
 package/Config.in.host                       |  1 +
 package/gnuradio/Config.in                   |  2 +-
 package/opencv3/Config.in                    |  2 +-
 package/python-numpy/Config.in               |  2 +
 package/python-numpy/python-numpy.hash       | 14 +++---
 package/python-numpy/python-numpy.mk         | 21 ++++++++-
 package/python-pybind11/Config.in.host       |  7 +++
 package/python-pybind11/python-pybind11.hash |  5 +++
 package/python-pybind11/python-pybind11.mk   | 14 ++++++
 package/python-scipy/Config.in               | 23 ++++++++++
 package/python-scipy/python-scipy.hash       |  9 ++++
 package/python-scipy/python-scipy.mk         | 46 ++++++++++++++++++++
 14 files changed, 139 insertions(+), 10 deletions(-)
 create mode 100644 package/python-pybind11/Config.in.host
 create mode 100644 package/python-pybind11/python-pybind11.hash
 create mode 100644 package/python-pybind11/python-pybind11.mk
 create mode 100644 package/python-scipy/Config.in
 create mode 100644 package/python-scipy/python-scipy.hash
 create mode 100644 package/python-scipy/python-scipy.mk

-- 
2.17.1
