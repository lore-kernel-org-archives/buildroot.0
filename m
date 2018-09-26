From: Asaf Kahlon <asafka7@gmail.com>
Date: Wed, 26 Sep 2018 18:34:42 +0300
Subject: [Buildroot] [PATCH 00/23] Fix python-crossbar to work with python
 3.7
Message-ID: <20180926153505.3411-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following series of patches contains version bumps and new
packages that are needed for bumping python-crossbar to 18.9.2
and make it work with Python 3.7.

Asaf Kahlon (23):
  python-attrs: bump to version 18.2.0
  python-autobahn: bump to version 18.9.2
  python-automat: bump to version 0.7.0
  python-hyperlink: bump to version 18.0.0
  python-incremental: bump to version 17.5.0
  python-jinja2: bump to version 2.10
  python-lmdb: bump to version 0.94
  python-psutil: bump to version 5.4.7
  python-pycparser: bump to version 2.19
  python-pynacl: bump to version 1.2.1
  python-pyopenssl: bump to version 18.0.0
  python-sdnotify: bump to version 0.3.2
  python-sortedcontainers: bump to version 2.0.5
  python-txaio: bump to version 18.8.1
  python-txtorcon: bump to version 18.0.2
  python-u-msgpack: bump to version 2.5.0
  python-zope-interface: bump to version 4.5.0
  python-pytrie: bump to version 0.3.1
  python-passlib: new package
  python-pyasn1-modules: new package
  python-pyhamcrest: new package
  python-twisted: bump to version 18.7.0
  python-crossbar: bump to version 18.9.2

 DEVELOPERS                                    |   3 +
 package/Config.in                             |   3 +
 package/python-attrs/python-attrs.hash        |   8 +-
 package/python-attrs/python-attrs.mk          |   4 +-
 package/python-autobahn/python-autobahn.hash  |   8 +-
 package/python-autobahn/python-autobahn.mk    |   4 +-
 package/python-automat/python-automat.hash    |   8 +-
 package/python-automat/python-automat.mk      |   4 +-
 .../0002-Remove-idna-requirement.patch        |  26 +++
 .../0002-Rework-runtime-dependencies.patch    |  37 ----
 package/python-crossbar/Config.in             |  19 +--
 package/python-crossbar/python-crossbar.hash  |   7 +-
 package/python-crossbar/python-crossbar.mk    |   4 +-
 package/python-hyperlink/Config.in            |   1 +
 .../python-hyperlink/python-hyperlink.hash    |   8 +-
 package/python-hyperlink/python-hyperlink.mk  |   4 +-
 .../python-incremental.hash                   |   8 +-
 .../python-incremental/python-incremental.mk  |   4 +-
 package/python-jinja2/python-jinja2.hash      |   8 +-
 package/python-jinja2/python-jinja2.mk        |   4 +-
 package/python-lmdb/python-lmdb.hash          |   7 +-
 package/python-lmdb/python-lmdb.mk            |   5 +-
 package/python-passlib/Config.in              |   7 +
 package/python-passlib/python-passlib.hash    |   5 +
 package/python-passlib/python-passlib.mk      |  14 ++
 package/python-psutil/python-psutil.hash      |   8 +-
 package/python-psutil/python-psutil.mk        |   4 +-
 package/python-pyasn1-modules/Config.in       |   7 +
 .../python-pyasn1-modules.hash                |   5 +
 .../python-pyasn1-modules.mk                  |  14 ++
 .../python-pycparser/python-pycparser.hash    |   8 +-
 package/python-pycparser/python-pycparser.mk  |   4 +-
 package/python-pyhamcrest/Config.in           |   8 +
 .../python-pyhamcrest/python-pyhamcrest.hash  |   5 +
 .../python-pyhamcrest/python-pyhamcrest.mk    |  14 ++
 package/python-pynacl/python-pynacl.hash      |   8 +-
 package/python-pynacl/python-pynacl.mk        |   4 +-
 .../python-pyopenssl/python-pyopenssl.hash    |   8 +-
 package/python-pyopenssl/python-pyopenssl.mk  |   4 +-
 package/python-pytrie/Config.in               |   1 +
 package/python-pytrie/python-pytrie.hash      |   8 +-
 package/python-pytrie/python-pytrie.mk        |   8 +-
 package/python-sdnotify/python-sdnotify.hash  |   9 +-
 package/python-sdnotify/python-sdnotify.mk    |   4 +-
 .../python-sortedcontainers.hash              |   8 +-
 .../python-sortedcontainers.mk                |   4 +-
 .../0001-Fix-syntax-for-python3.7.patch       | 160 ++++++++++++++++++
 package/python-twisted/Config.in              |   2 +
 package/python-twisted/python-twisted.hash    |   8 +-
 package/python-twisted/python-twisted.mk      |   4 +-
 package/python-txaio/python-txaio.hash        |   9 +-
 package/python-txaio/python-txaio.mk          |   4 +-
 package/python-txtorcon/python-txtorcon.hash  |   9 +-
 package/python-txtorcon/python-txtorcon.mk    |   4 +-
 .../python-u-msgpack/python-u-msgpack.hash    |   8 +-
 package/python-u-msgpack/python-u-msgpack.mk  |   4 +-
 .../python-zope-interface.hash                |   9 +-
 .../python-zope-interface.mk                  |   4 +-
 58 files changed, 425 insertions(+), 153 deletions(-)
 create mode 100644 package/python-crossbar/0002-Remove-idna-requirement.patch
 delete mode 100644 package/python-crossbar/0002-Rework-runtime-dependencies.patch
 create mode 100644 package/python-passlib/Config.in
 create mode 100644 package/python-passlib/python-passlib.hash
 create mode 100644 package/python-passlib/python-passlib.mk
 create mode 100644 package/python-pyasn1-modules/Config.in
 create mode 100644 package/python-pyasn1-modules/python-pyasn1-modules.hash
 create mode 100644 package/python-pyasn1-modules/python-pyasn1-modules.mk
 create mode 100644 package/python-pyhamcrest/Config.in
 create mode 100644 package/python-pyhamcrest/python-pyhamcrest.hash
 create mode 100644 package/python-pyhamcrest/python-pyhamcrest.mk
 create mode 100644 package/python-twisted/0001-Fix-syntax-for-python3.7.patch

-- 
2.17.1
