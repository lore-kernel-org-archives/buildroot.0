From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Thu, 27 Apr 2017 14:33:30 -0700
Subject: [Buildroot] [PATCH v2 00/10] Update IPython's dependencies
Message-ID: <20170427213340.26917-1-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,

This is second verion of my IPython patch series originally submitted in [v1].

Changes since v1:

	- Remove all <pkg>_DEPENDENCIES build-time dependencies from
          package files

	- Use SPDX license names

	- Address warnings produced by check-package

Let me know if I missed anything or if there any more issues that need
to be addressed.

Thanks,
Andrey Smirnov

[v1] http://lists.busybox.net/pipermail/buildroot/2017-April/190423.html

Andrey Smirnov (10):
  package/python-decorator: New package
  package/python-traitlets: New package
  package/python-simplegeneric: New package
  package/python-ipython-genutils: New package
  package/python-scandir: New package
  package/python-pathlib2: New package
  package/python-pickleshare: New package
  package/python-backports-shutil-get-terminal-size: New package
  package/python-ipython: Reformat help text to avoid warnings
  package/python-ipython: Add dependecy list

 package/Config.in                                     |  8 ++++++++
 .../Config.in                                         |  9 +++++++++
 .../python-backports-shutil-get-terminal-size.hash    |  2 ++
 .../python-backports-shutil-get-terminal-size.mk      | 13 +++++++++++++
 package/python-decorator/Config.in                    |  6 ++++++
 package/python-decorator/python-decorator.mk          | 13 +++++++++++++
 package/python-ipython-genutils/Config.in             |  6 ++++++
 .../python-ipython-genutils.hash                      |  3 +++
 .../python-ipython-genutils.mk                        | 13 +++++++++++++
 package/python-ipython/Config.in                      | 19 +++++++++++++++----
 package/python-pathlib2/Config.in                     | 14 ++++++++++++++
 package/python-pathlib2/python-pathlib2.hash          |  2 ++
 package/python-pathlib2/python-pathlib2.mk            | 13 +++++++++++++
 package/python-pickleshare/Config.in                  |  7 +++++++
 package/python-pickleshare/python-pickleshare.hash    |  2 ++
 package/python-pickleshare/python-pickleshare.mk      | 13 +++++++++++++
 package/python-scandir/Config.in                      |  6 ++++++
 package/python-scandir/python-scandir.hash            |  2 ++
 package/python-scandir/python-scandir.mk              | 13 +++++++++++++
 package/python-simplegeneric/Config.in                |  6 ++++++
 .../python-simplegeneric/python-simplegeneric.hash    |  3 +++
 package/python-simplegeneric/python-simplegeneric.mk  | 19 +++++++++++++++++++
 package/python-traitlets/Config.in                    |  8 ++++++++
 package/python-traitlets/python-traitlets.hash        |  2 ++
 package/python-traitlets/python-traitlets.mk          | 13 +++++++++++++
 25 files changed, 211 insertions(+), 4 deletions(-)
 create mode 100644 package/python-backports-shutil-get-terminal-size/Config.in
 create mode 100644 package/python-backports-shutil-get-terminal-size/python-backports-shutil-get-terminal-size.hash
 create mode 100644 package/python-backports-shutil-get-terminal-size/python-backports-shutil-get-terminal-size.mk
 create mode 100644 package/python-decorator/Config.in
 create mode 100644 package/python-decorator/python-decorator.mk
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
 create mode 100644 package/python-simplegeneric/Config.in
 create mode 100644 package/python-simplegeneric/python-simplegeneric.hash
 create mode 100644 package/python-simplegeneric/python-simplegeneric.mk
 create mode 100644 package/python-traitlets/Config.in
 create mode 100644 package/python-traitlets/python-traitlets.hash
 create mode 100644 package/python-traitlets/python-traitlets.mk

-- 
2.9.3
