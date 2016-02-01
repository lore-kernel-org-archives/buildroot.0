From: Mauro Condarelli <mc5686@mclink.it>
Date: Mon,  1 Feb 2016 15:05:19 +0100
Subject: [Buildroot] [PATCH 00/22] changes needed for python-crossbar
	package (new).
Message-ID: <1454335541-14224-1-git-send-email-mc5686@mclink.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is the second attempt to produce an acceptable set of patches.
I hope I got it right, this time.

All these new packages, along with a couple of change in existing ones
(python-jinja2 & python-cffi) are needed to compile and run crossbar.

Mauro Condarelli (22):
  package/python-jinja2: bump version to 2.8 (needed by
    python-crossbar).
  package/python-characteristic: new package.
  package/python-cbor: new package.
  package/python-click: new package.
  package/python-lmdb: new package.
  package/python-mistune: new package.
  package/python-netaddr: new package.
  package/python-pycparser: new package.
  package/python-pygments: new package.
  package/python-pynacl: new package.
  package/python-pyopenssl: new package.
  package/python-pytrie: new package.
  package/python-service-identity: new package.
  package/python-shutilwhich: new package.
  package/python-treq: new package.
  package/python-txaio: new package.
  package/python-msgpack-python: new package.
  package/python-pyasn1-modules: new package.
  package/python-cryptography: new package.
  package/python-autobahn: new package.
  package/python-crossbar: new package.
  package/python-cffi: host-package added (needs host-libffi).

 package/Config.in                                  | 20 +++++++++++++
 package/libffi/libffi.mk                           | 11 +++++++
 package/python-autobahn/Config.in                  |  8 +++++
 package/python-autobahn/python-autobahn.hash       |  3 ++
 package/python-autobahn/python-autobahn.mk         | 15 ++++++++++
 package/python-cbor/Config.in                      |  8 +++++
 package/python-cbor/python-cbor.hash               |  3 ++
 package/python-cbor/python-cbor.mk                 | 15 ++++++++++
 package/python-cffi/python-cffi.mk                 |  2 ++
 package/python-characteristic/Config.in            |  8 +++++
 .../python-characteristic.hash                     |  3 ++
 .../python-characteristic/python-characteristic.mk | 15 ++++++++++
 package/python-click/Config.in                     |  8 +++++
 package/python-click/python-click.hash             |  3 ++
 package/python-click/python-click.mk               | 15 ++++++++++
 package/python-crossbar/Config.in                  | 35 ++++++++++++++++++++++
 package/python-crossbar/python-crossbar.hash       |  9 ++++++
 package/python-crossbar/python-crossbar.mk         | 19 ++++++++++++
 package/python-cryptography/Config.in              | 20 +++++++++++++
 .../python-cryptography/python-cryptography.hash   |  6 ++++
 package/python-cryptography/python-cryptography.mk | 23 ++++++++++++++
 package/python-jinja2/python-jinja2.hash           |  7 +++--
 package/python-jinja2/python-jinja2.mk             |  2 +-
 package/python-lmdb/Config.in                      |  8 +++++
 package/python-lmdb/python-lmdb.hash               |  3 ++
 package/python-lmdb/python-lmdb.mk                 | 15 ++++++++++
 package/python-mistune/Config.in                   |  9 ++++++
 package/python-mistune/python-mistune.hash         |  3 ++
 package/python-mistune/python-treq.mk              | 15 ++++++++++
 package/python-msgpack-python/Config.in            |  8 +++++
 .../python-msgpack-python.hash                     |  3 ++
 .../python-msgpack-python/python-msgpack-python.mk | 15 ++++++++++
 package/python-netaddr/Config.in                   |  8 +++++
 package/python-netaddr/python-netaddr.hash         |  3 ++
 package/python-netaddr/python-netaddr.mk           | 15 ++++++++++
 package/python-pyasn1-modules/Config.in            |  8 +++++
 .../python-pyasn1-modules.hash                     |  3 ++
 .../python-pyasn1-modules/python-pyasn1-modules.mk | 15 ++++++++++
 package/python-pycparser/Config.in                 |  6 ++++
 package/python-pycparser/python-pycparser.hash     |  4 +++
 package/python-pycparser/python-pycparser.mk       | 15 ++++++++++
 package/python-pygments/Config.in                  |  8 +++++
 package/python-pygments/python-pygments.hash       |  3 ++
 package/python-pygments/python-pygments.mk         | 15 ++++++++++
 package/python-pynacl/Config.in                    |  9 ++++++
 package/python-pynacl/python-pynacl.hash           |  3 ++
 package/python-pynacl/python-pynacl.mk             | 16 ++++++++++
 package/python-pyopenssl/Config.in                 | 12 ++++++++
 package/python-pyopenssl/python-pyopenssl.hash     |  3 ++
 package/python-pyopenssl/python-pyopenssl.mk       | 14 +++++++++
 package/python-pytrie/Config.in                    |  8 +++++
 package/python-pytrie/python-pytrie.hash           |  3 ++
 package/python-pytrie/python-pytrie.mk             | 15 ++++++++++
 package/python-service-identity/Config.in          |  8 +++++
 .../python-service-identity.hash                   |  3 ++
 .../python-service-identity.mk                     | 15 ++++++++++
 package/python-shutilwhich/Config.in               |  8 +++++
 package/python-shutilwhich/python-shutilwhich.hash |  3 ++
 package/python-shutilwhich/python-shutilwhich.mk   | 15 ++++++++++
 package/python-treq/Config.in                      | 13 ++++++++
 package/python-treq/python-treq.hash               |  3 ++
 package/python-treq/python-treq.mk                 | 17 +++++++++++
 package/python-txaio/Config.in                     |  8 +++++
 package/python-txaio/python-txaio.hash             |  3 ++
 package/python-txaio/python-txaio.mk               | 15 ++++++++++
 65 files changed, 630 insertions(+), 4 deletions(-)
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
 create mode 100644 package/python-cryptography/Config.in
 create mode 100644 package/python-cryptography/python-cryptography.hash
 create mode 100644 package/python-cryptography/python-cryptography.mk
 create mode 100644 package/python-lmdb/Config.in
 create mode 100644 package/python-lmdb/python-lmdb.hash
 create mode 100644 package/python-lmdb/python-lmdb.mk
 create mode 100644 package/python-mistune/Config.in
 create mode 100644 package/python-mistune/python-mistune.hash
 create mode 100644 package/python-mistune/python-treq.mk
 create mode 100644 package/python-msgpack-python/Config.in
 create mode 100644 package/python-msgpack-python/python-msgpack-python.hash
 create mode 100644 package/python-msgpack-python/python-msgpack-python.mk
 create mode 100644 package/python-netaddr/Config.in
 create mode 100644 package/python-netaddr/python-netaddr.hash
 create mode 100644 package/python-netaddr/python-netaddr.mk
 create mode 100644 package/python-pyasn1-modules/Config.in
 create mode 100644 package/python-pyasn1-modules/python-pyasn1-modules.hash
 create mode 100644 package/python-pyasn1-modules/python-pyasn1-modules.mk
 create mode 100644 package/python-pycparser/Config.in
 create mode 100644 package/python-pycparser/python-pycparser.hash
 create mode 100644 package/python-pycparser/python-pycparser.mk
 create mode 100644 package/python-pygments/Config.in
 create mode 100644 package/python-pygments/python-pygments.hash
 create mode 100644 package/python-pygments/python-pygments.mk
 create mode 100644 package/python-pynacl/Config.in
 create mode 100644 package/python-pynacl/python-pynacl.hash
 create mode 100644 package/python-pynacl/python-pynacl.mk
 create mode 100644 package/python-pyopenssl/Config.in
 create mode 100644 package/python-pyopenssl/python-pyopenssl.hash
 create mode 100644 package/python-pyopenssl/python-pyopenssl.mk
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
