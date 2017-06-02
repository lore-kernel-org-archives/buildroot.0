From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Fri,  2 Jun 2017 16:56:42 -0700
Subject: [Buildroot] [PATCH v3 00/11] Update IPython's dependencies
Message-ID: <20170602235653.4655-1-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,

It took me a while, but I was finally able to cut v3 of my IPython
related patchset. I did my best to try to test basic "importability"
of each new package for both Python 2 and Python 3 and I apologize if
I missed something there.

Change history can be found below.

Changes since [v2]:

	- Add fix for setup type for 'enum34'

	- Add fix for 'simplegeneric' to avoid dependency on zlib
          support in Python (missed that in my original patch)

	- Convert all of the URL to point to PyPI

	- Add MD5 sums from PyPI to all new packages

	- Add patch to bump IPython to 5.4.0

	- Fix package run-time dependencies to match with what they
          specify in thier JSON info on PyPI

Changes since [v1]:

	- Remove all <pkg>_DEPENDENCIES build-time dependencies from
          package files

	- Use SPDX license names

	- Address warnings produced by check-package

Let me know if I missed anything or if there any more issues that need
to be addressed.

Thanks,
Andrey Smirnov

[v2] http://lists.busybox.net/pipermail/buildroot/2017-April/190587.html
[v1] http://lists.busybox.net/pipermail/buildroot/2017-April/190423.html

Andrey Smirnov (11):
  DEVELOPERS: Add missing closing angle bracket to my e-mail
  package/python-enum34: Switch setup type to 'setuptools'
  package/python-simplegeneric: Switch setup type to 'setuptools'
  package/python-ipython-genutils: New package
  package/python-traitlets: New package
  package/python-scandir: New package
  package/python-pathlib2: New package
  package/python-pickleshare: New package
  package/python-backports-shutil-get-terminal-size: New package
  package/python-ipython: Add dependecy list
  python-ipython: bump to version 5.4.0

 DEVELOPERS                                              |  8 +++++++-
 package/Config.in                                       |  6 ++++++
 .../python-backports-shutil-get-terminal-size/Config.in |  9 +++++++++
 .../python-backports-shutil-get-terminal-size.hash      |  3 +++
 .../python-backports-shutil-get-terminal-size.mk        | 13 +++++++++++++
 package/python-enum34/python-enum34.mk                  |  2 +-
 package/python-ipython-genutils/Config.in               |  6 ++++++
 .../python-ipython-genutils.hash                        |  3 +++
 .../python-ipython-genutils/python-ipython-genutils.mk  | 13 +++++++++++++
 package/python-ipython/Config.in                        |  9 +++++++++
 package/python-ipython/python-ipython.hash              |  4 ++--
 package/python-ipython/python-ipython.mk                |  4 ++--
 package/python-pathlib2/Config.in                       | 14 ++++++++++++++
 package/python-pathlib2/python-pathlib2.hash            |  3 +++
 package/python-pathlib2/python-pathlib2.mk              | 13 +++++++++++++
 package/python-pickleshare/Config.in                    |  7 +++++++
 package/python-pickleshare/python-pickleshare.hash      |  3 +++
 package/python-pickleshare/python-pickleshare.mk        | 15 +++++++++++++++
 package/python-scandir/Config.in                        |  6 ++++++
 package/python-scandir/python-scandir.hash              |  3 +++
 package/python-scandir/python-scandir.mk                | 17 +++++++++++++++++
 package/python-simplegeneric/python-simplegeneric.mk    |  8 +++++++-
 package/python-traitlets/Config.in                      | 10 ++++++++++
 package/python-traitlets/python-traitlets.hash          |  3 +++
 package/python-traitlets/python-traitlets.mk            | 13 +++++++++++++
 25 files changed, 188 insertions(+), 7 deletions(-)
 create mode 100644 package/python-backports-shutil-get-terminal-size/Config.in
 create mode 100644 package/python-backports-shutil-get-terminal-size/python-backports-shutil-get-terminal-size.hash
 create mode 100644 package/python-backports-shutil-get-terminal-size/python-backports-shutil-get-terminal-size.mk
 create mode 100644 package/python-ipython-genutils/Config.in
 create mode 100644 package/python-ipython-genutils/python-ipython-genutils.hash
 create mode 100644 package/python-ipython-genutils/python-ipython-genutils.mk
 create mode 100644 package/python-pathlib2/Config.in
 create mode 100644 package/python-pathlib2/python-pathlib2.hash
 create mode 100644 package/python-pathlib2/python-pathlib2.mk
 create mode 100644 package/python-pickleshare/Config.in
 create mode 100644 package/python-pickleshare/python-pickleshare.hash
 create mode 100644 package/python-pickleshare/python-pickleshare.mk
 create mode 100644 package/python-scandir/Config.in
 create mode 100644 package/python-scandir/python-scandir.hash
 create mode 100644 package/python-scandir/python-scandir.mk
 create mode 100644 package/python-traitlets/Config.in
 create mode 100644 package/python-traitlets/python-traitlets.hash
 create mode 100644 package/python-traitlets/python-traitlets.mk

-- 
2.9.4
