From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Mon, 12 Jun 2017 16:42:09 -0700
Subject: [Buildroot] [PATCH v4 0/7] Update IPython's dependencies
Message-ID: <20170612234216.902-1-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,

Here's v4 of my IPython related patchset with, hopefully, all of the
v3 feedback incorporated.

Change history can be found below.

Changes since [v3]:

	- Rebase on latest master, dropping all of the applied patches
          in the process

	- Add *_LICENSE_FILE information to all new packages

	- Alphabetize lines added to Config.in as well as DEVELOPERS

	- Add # runtime tags where appropriate

	- Collect Reviewed-by from Yegor

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

[v3] http://lists.busybox.net/pipermail/buildroot/2017-June/193529.html
[v2] http://lists.busybox.net/pipermail/buildroot/2017-April/190587.html
[v1] http://lists.busybox.net/pipermail/buildroot/2017-April/190423.html

Andrey Smirnov (7):
  package/python-traitlets: New package
  package/python-scandir: New package
  package/python-pathlib2: New package
  package/python-pickleshare: New package
  package/python-backports-shutil-get-terminal-size: New package
  package/python-ipython: Add dependecy list
  python-ipython: Bump to version 5.4.0

 DEVELOPERS                                                 |  5 +++++
 package/Config.in                                          |  5 +++++
 .../python-backports-shutil-get-terminal-size/Config.in    |  9 +++++++++
 .../python-backports-shutil-get-terminal-size.hash         |  3 +++
 .../python-backports-shutil-get-terminal-size.mk           | 14 ++++++++++++++
 package/python-ipython/Config.in                           |  9 +++++++++
 package/python-ipython/python-ipython.hash                 |  4 ++--
 package/python-ipython/python-ipython.mk                   |  4 ++--
 package/python-pathlib2/Config.in                          | 14 ++++++++++++++
 package/python-pathlib2/python-pathlib2.hash               |  3 +++
 package/python-pathlib2/python-pathlib2.mk                 | 14 ++++++++++++++
 package/python-pickleshare/Config.in                       |  7 +++++++
 package/python-pickleshare/python-pickleshare.hash         |  3 +++
 package/python-pickleshare/python-pickleshare.mk           | 14 ++++++++++++++
 package/python-scandir/Config.in                           |  6 ++++++
 package/python-scandir/python-scandir.hash                 |  3 +++
 package/python-scandir/python-scandir.mk                   | 14 ++++++++++++++
 package/python-traitlets/Config.in                         | 10 ++++++++++
 package/python-traitlets/python-traitlets.hash             |  3 +++
 package/python-traitlets/python-traitlets.mk               | 14 ++++++++++++++
 20 files changed, 154 insertions(+), 4 deletions(-)
 create mode 100644 package/python-backports-shutil-get-terminal-size/Config.in
 create mode 100644 package/python-backports-shutil-get-terminal-size/python-backports-shutil-get-terminal-size.hash
 create mode 100644 package/python-backports-shutil-get-terminal-size/python-backports-shutil-get-terminal-size.mk
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
