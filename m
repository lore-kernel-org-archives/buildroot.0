From: Mauro Condarelli <mc5686@mclink.it>
Date: Mon,  1 Feb 2016 02:25:29 +0100
Subject: [Buildroot] [PATCH 0/7] crossbar package and its dependencies.
Message-ID: <1454289936-10654-1-git-send-email-mc5686@mclink.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These are essentially the changes needed to compile a(n apparently) working crossbar package.
Information about crossbar can be found at: http://crossbar.io/

Mauro Condarelli (6):
  Additions necessary to compile Crossbar.io
  croosbar moved to buildroot.
  croosbar moved to buildroot (2).
  update of .hash files.
  Dependencies added to package python-crossbar.
  Further dependencies installed.

Peter Korsgaard (1):
  Update for 2015.11.1

 CHANGES                                            | 10 +++++++
 package/Config.in                                  | 20 +++++++++++++
 package/libffi/libffi.mk                           | 11 +++++++
 package/libsodium/libsodium.hash                   |  2 ++
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
 package/python-jinja2/python-jinja2.hash           |  5 ++++
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
 package/python-pygments/python-pygments.mk         | 15 ++++++++++
 package/python-pynacl/Config.in                    |  9 ++++++
 package/python-pynacl/python-pynacl.hash           |  3 ++
 package/python-pynacl/python-pynacl.mk             | 16 ++++++++++
 package/python-pyopenssl/Config.in                 | 12 ++++++++
 package/python-pyopenssl/python-pyopenssl.hash     |  3 ++
 package/python-pyopenssl/python-pyopenssl.mk       | 14 +++++++++
 package/python-pytrie/Config.in                    |  8 +++++
 package/python-pytrie/python-pytrie.mk             | 15 ++++++++++
 package/python-service-identity/Config.in          |  8 +++++
 .../python-service-identity.mk                     | 15 ++++++++++
 package/python-shutilwhich/Config.in               |  8 +++++
 package/python-shutilwhich/python-shutilwhich.mk   | 15 ++++++++++
 package/python-treq/Config.in                      | 13 ++++++++
 package/python-treq/python-treq.mk                 | 17 +++++++++++
 package/python-txaio/Config.in                     |  8 +++++
 package/python-txaio/python-txaio.mk               | 15 ++++++++++
 61 files changed, 625 insertions(+), 1 deletion(-)
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
 create mode 100644 package/python-pygments/python-pygments.mk
 create mode 100644 package/python-pynacl/Config.in
 create mode 100644 package/python-pynacl/python-pynacl.hash
 create mode 100644 package/python-pynacl/python-pynacl.mk
 create mode 100644 package/python-pyopenssl/Config.in
 create mode 100644 package/python-pyopenssl/python-pyopenssl.hash
 create mode 100644 package/python-pyopenssl/python-pyopenssl.mk
 create mode 100644 package/python-pytrie/Config.in
 create mode 100644 package/python-pytrie/python-pytrie.mk
 create mode 100644 package/python-service-identity/Config.in
 create mode 100644 package/python-service-identity/python-service-identity.mk
 create mode 100644 package/python-shutilwhich/Config.in
 create mode 100644 package/python-shutilwhich/python-shutilwhich.mk
 create mode 100644 package/python-treq/Config.in
 create mode 100644 package/python-treq/python-treq.mk
 create mode 100644 package/python-txaio/Config.in
 create mode 100644 package/python-txaio/python-txaio.mk

-- 
2.1.4
