From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Wed,  5 Feb 2020 15:11:46 +0100
Subject: [Buildroot] [PATCH 0/3] package/crudini: make it Python3 compatible
Message-ID: <20200205141149.20749-1-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This small series bumps the version of crudini and its dependency iniparse,
such as it can now run on Python3 based systems.

It also adds a runtime test that performs a basic use-case run of the
crudini tool, for both Python2 and Python3.

Titouan Christophe (3):
  package/python-iniparse: bump to version 0.5
  package/crudini: bump to version 0.9.3
  support/testing: add runtime test for Crudini (py2 and py3)

 .gitlab-ci.yml                                |  2 +
 package/crudini/Config.in                     |  2 +-
 package/crudini/crudini.hash                  |  5 +--
 package/crudini/crudini.mk                    |  4 +-
 package/python-iniparse/Config.in             |  3 +-
 package/python-iniparse/python-iniparse.hash  |  6 +--
 package/python-iniparse/python-iniparse.mk    |  4 +-
 support/testing/tests/package/test_crudini.py | 40 +++++++++++++++++++
 8 files changed, 53 insertions(+), 13 deletions(-)
 create mode 100644 support/testing/tests/package/test_crudini.py

-- 
2.24.1
