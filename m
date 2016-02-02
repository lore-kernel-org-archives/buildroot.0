From: Mauro Condarelli <mc5686@mclink.it>
Date: Tue,  2 Feb 2016 01:44:40 +0100
Subject: [Buildroot] [PATCH 00/19] Changes needed to compile crossbar
Message-ID: <1454373899-22481-1-git-send-email-mc5686@mclink.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All these new packages, along with two upgrades (python-jinja2 and python-msgpack) and
several packages from patchwork (python-cryptography, python-pyopenssl, python-pycparser,
python-cffi, libffi and python-cryptography), are needed to compile and run crossbar.
Please note this patch-set is not "standalone".

Crossbar is is an open-source WAMP application router that allows to build advanced 
applications from loosely-coupled components that can talk in real-time with each other.

Further info about crossbar can be found at: http://crossbar.io/

Mauro Condarelli (19):
  python-jinja2: bump to 2.8
  python-characteristic: new package
  python-cbor: new package
  python-click: new package
  python-lmdb: new package
  python-mistune: new package
  python-netaddr: new package
  python-pycparser: python runtime added
  python-pygments: new package
  python-pynacl: new package
  python-pytrie: new package
  python-service-identity: new package
  python-shutilwhich: new package
  python-treq: new package
  python-txaio: new package
  python-msgpack: bump to 0.4.7
  python-pyasn-modules: new package
  python-autobahn: new package
  python-crossbar: new package

 package/Config.in                                  | 17 +++++++++++++++
 package/python-autobahn/Config.in                  |  9 ++++++++
 package/python-autobahn/python-autobahn.hash       |  3 +++
 package/python-autobahn/python-autobahn.mk         | 15 ++++++++++++++
 package/python-cbor/Config.in                      |  7 +++++++
 package/python-cbor/python-cbor.hash               |  3 +++
 package/python-cbor/python-cbor.mk                 | 13 ++++++++++++
 package/python-characteristic/Config.in            |  7 +++++++
 .../python-characteristic.hash                     |  3 +++
 .../python-characteristic/python-characteristic.mk | 14 +++++++++++++
 package/python-click/Config.in                     |  7 +++++++
 package/python-click/python-click.hash             |  3 +++
 package/python-click/python-click.mk               | 14 +++++++++++++
 package/python-crossbar/Config.in                  | 24 ++++++++++++++++++++++
 package/python-crossbar/python-crossbar.hash       |  3 +++
 package/python-crossbar/python-crossbar.mk         | 17 +++++++++++++++
 package/python-jinja2/python-jinja2.hash           |  6 +++---
 package/python-jinja2/python-jinja2.mk             |  2 +-
 package/python-lmdb/Config.in                      |  8 ++++++++
 package/python-lmdb/python-lmdb.hash               |  3 +++
 package/python-lmdb/python-lmdb.mk                 | 14 +++++++++++++
 package/python-mistune/Config.in                   |  8 ++++++++
 package/python-mistune/python-mistune.hash         |  3 +++
 package/python-mistune/python-treq.mk              | 14 +++++++++++++
 package/python-msgpack/Config.in                   |  1 -
 package/python-msgpack/python-msgpack.hash         |  3 +++
 package/python-msgpack/python-msgpack.mk           |  2 +-
 package/python-netaddr/Config.in                   |  7 +++++++
 package/python-netaddr/python-netaddr.hash         |  3 +++
 package/python-netaddr/python-netaddr.mk           | 14 +++++++++++++
 package/python-pyasn-modules/Config.in             |  8 ++++++++
 .../python-pyasn-modules/python-pyasn-modules.hash |  3 +++
 .../python-pyasn-modules/python-pyasn-modules.mk   | 15 ++++++++++++++
 package/python-pycparser/Config.in                 |  6 ++++++
 package/python-pycparser/python-pycparser.mk       |  1 +
 package/python-pygments/Config.in                  |  7 +++++++
 package/python-pygments/python-pygments.hash       |  3 +++
 package/python-pygments/python-pygments.mk         | 14 +++++++++++++
 package/python-pynacl/Config.in                    |  9 ++++++++
 package/python-pynacl/python-pynacl.hash           |  3 +++
 package/python-pynacl/python-pynacl.mk             | 16 +++++++++++++++
 package/python-pytrie/Config.in                    |  7 +++++++
 package/python-pytrie/python-pytrie.hash           |  3 +++
 package/python-pytrie/python-pytrie.mk             | 14 +++++++++++++
 package/python-service-identity/Config.in          | 11 ++++++++++
 .../python-service-identity.hash                   |  3 +++
 .../python-service-identity.mk                     | 15 ++++++++++++++
 package/python-shutilwhich/Config.in               |  8 ++++++++
 package/python-shutilwhich/python-shutilwhich.hash |  3 +++
 package/python-shutilwhich/python-shutilwhich.mk   | 13 ++++++++++++
 package/python-treq/Config.in                      | 11 ++++++++++
 package/python-treq/python-treq.hash               |  3 +++
 package/python-treq/python-treq.mk                 | 15 ++++++++++++++
 package/python-txaio/Config.in                     |  8 ++++++++
 package/python-txaio/python-txaio.hash             |  3 +++
 package/python-txaio/python-txaio.mk               | 15 ++++++++++++++
 56 files changed, 458 insertions(+), 6 deletions(-)
 create mode 100644 package/python-autobahn/Config.in
 create mode 100644 package/python-autobahn/python-autobahn.hash
 create mode 100644 package/python-autobahn/python-autobahn.mk
 create mode 100644 package/python-cbor/Config.in
 create mode 100644 package/python-cbor/python-cbor.hash
 create mode 100644 package/python-cbor/python-cbor.mk
 create mode 100644 package/python-characteristic/Config.in
 create mode 100644 package/python-characteristic/python-characteristic.hash
 create mode 100644 package/python-characteristic/python-characteristic.mk
 create mode 100644 package/python-click/Config.in
 create mode 100644 package/python-click/python-click.hash
 create mode 100644 package/python-click/python-click.mk
 create mode 100644 package/python-crossbar/Config.in
 create mode 100644 package/python-crossbar/python-crossbar.hash
 create mode 100644 package/python-crossbar/python-crossbar.mk
 create mode 100644 package/python-lmdb/Config.in
 create mode 100644 package/python-lmdb/python-lmdb.hash
 create mode 100644 package/python-lmdb/python-lmdb.mk
 create mode 100644 package/python-mistune/Config.in
 create mode 100644 package/python-mistune/python-mistune.hash
 create mode 100644 package/python-mistune/python-treq.mk
 create mode 100644 package/python-msgpack/python-msgpack.hash
 create mode 100644 package/python-netaddr/Config.in
 create mode 100644 package/python-netaddr/python-netaddr.hash
 create mode 100644 package/python-netaddr/python-netaddr.mk
 create mode 100644 package/python-pyasn-modules/Config.in
 create mode 100644 package/python-pyasn-modules/python-pyasn-modules.hash
 create mode 100644 package/python-pyasn-modules/python-pyasn-modules.mk
 create mode 100644 package/python-pycparser/Config.in
 create mode 100644 package/python-pygments/Config.in
 create mode 100644 package/python-pygments/python-pygments.hash
 create mode 100644 package/python-pygments/python-pygments.mk
 create mode 100644 package/python-pynacl/Config.in
 create mode 100644 package/python-pynacl/python-pynacl.hash
 create mode 100644 package/python-pynacl/python-pynacl.mk
 create mode 100644 package/python-pytrie/Config.in
 create mode 100644 package/python-pytrie/python-pytrie.hash
 create mode 100644 package/python-pytrie/python-pytrie.mk
 create mode 100644 package/python-service-identity/Config.in
 create mode 100644 package/python-service-identity/python-service-identity.hash
 create mode 100644 package/python-service-identity/python-service-identity.mk
 create mode 100644 package/python-shutilwhich/Config.in
 create mode 100644 package/python-shutilwhich/python-shutilwhich.hash
 create mode 100644 package/python-shutilwhich/python-shutilwhich.mk
 create mode 100644 package/python-treq/Config.in
 create mode 100644 package/python-treq/python-treq.hash
 create mode 100644 package/python-treq/python-treq.mk
 create mode 100644 package/python-txaio/Config.in
 create mode 100644 package/python-txaio/python-txaio.hash
 create mode 100644 package/python-txaio/python-txaio.mk

-- 
2.1.4
