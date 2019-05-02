From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Thu,  2 May 2019 10:20:03 +0200
Subject: [Buildroot] [PATCH 0/7] bcc front end tool for eBPF
Message-ID: <1556785210-18237-1-git-send-email-jugurtha.belkalem@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

eBPF is the lastest Linux tracer and considered to
be a modern systemTap. However, eBPF programs are
written in a flavour of C language (which is tedious).
BCC allows to write eBPF scripts in Python and C which
makes troubleshooting a system and identifying
bottelenecks easier.
More information is available at : 
https://github.com/iovisor/bcc/blob/master/README.md.

Jugurtha BELKALEM (6):
  package/luajit: bump to version 2.1.x developpment version for aarch64
  package/bcc: new package
  package/python-pytest: new package
  package/python-pytest-runner: new package
  package/python-traittypes: new package
  package/python-bcc: new package

Romain Naour (1):
  package/llvm: add BPF backend

 package/Config.in                                  |  5 +++
 ...CMake-Allow-to-disable-building-man-pages.patch | 35 +++++++++++++++
 .../bcc/0001-package-bcc-luajit-for-aarch64.patch  | 25 +++++++++++
 package/bcc/Config.in                              | 51 ++++++++++++++++++++++
 package/bcc/bcc.hash                               |  3 ++
 package/bcc/bcc.mk                                 | 23 ++++++++++
 package/llvm/Config.in                             |  6 +++
 package/llvm/llvm.mk                               |  5 +++
 package/luajit/Config.in                           |  2 +-
 package/luajit/luajit.hash                         |  1 +
 package/luajit/luajit.mk                           |  8 +++-
 package/python-bcc/Config.in                       | 11 +++++
 package/python-bcc/python-bcc.hash                 |  3 ++
 package/python-bcc/python-bcc.mk                   | 15 +++++++
 package/python-pytest-runner/Config.in             |  9 ++++
 .../python-pytest-runner/python-pytest-runner.hash |  3 ++
 .../python-pytest-runner/python-pytest-runner.mk   | 16 +++++++
 package/python-pytest/Config.in                    |  8 ++++
 package/python-pytest/python-pytest.hash           |  5 +++
 package/python-pytest/python-pytest.mk             | 15 +++++++
 package/python-traittypes/Config.in                |  7 +++
 package/python-traittypes/python-traittypes.hash   |  5 +++
 package/python-traittypes/python-traittypes.mk     | 14 ++++++
 23 files changed, 272 insertions(+), 3 deletions(-)
 create mode 100644 package/bcc/0001-CMake-Allow-to-disable-building-man-pages.patch
 create mode 100644 package/bcc/0001-package-bcc-luajit-for-aarch64.patch
 create mode 100644 package/bcc/Config.in
 create mode 100644 package/bcc/bcc.hash
 create mode 100644 package/bcc/bcc.mk
 create mode 100644 package/python-bcc/Config.in
 create mode 100644 package/python-bcc/python-bcc.hash
 create mode 100644 package/python-bcc/python-bcc.mk
 create mode 100644 package/python-pytest-runner/Config.in
 create mode 100644 package/python-pytest-runner/python-pytest-runner.hash
 create mode 100644 package/python-pytest-runner/python-pytest-runner.mk
 create mode 100644 package/python-pytest/Config.in
 create mode 100644 package/python-pytest/python-pytest.hash
 create mode 100644 package/python-pytest/python-pytest.mk
 create mode 100644 package/python-traittypes/Config.in
 create mode 100644 package/python-traittypes/python-traittypes.hash
 create mode 100644 package/python-traittypes/python-traittypes.mk

-- 
2.7.4
