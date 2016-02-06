From: Mauro Condarelli <mc5686@mclink.it>
Date: Sat,  6 Feb 2016 23:59:46 +0100
Subject: [Buildroot] [PATCH v4 00/17] changes needed for python-crossbar
	package (new)
Message-ID: <1454799603-5474-1-git-send-email-mc5686@mclink.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These are the python packeges needed to successfully comile, install and run python-crossbar.

Crossbar is is an open-source WAMP application router that allows to build advanced.
applications from loosely-coupled components that can talk in real-time with each other.

Further info about crossbar can be found at: http://crossbar.io/

I changed patches to accommdate suggestions by Y.Yefremov

Mauro Condarelli (16):
  python-characteristic: new package
  python-pycparser: python runtime added
  python-lmdb: new package
  python-pygments: new package
  python-pynacl: new package
  python-pytrie: new package
  python-service-identity: new package
  python-shutilwhich: new package
  python-treq: new package
  python-txaio: new package
  python-pyasn-modules: new package
  python-ujson: new package
  python-wsaccel: new package
  python-setproctitle: new package
  python-autobahn: new package
  python-crossbar: new package

Yegor Yefremov (1):
  python-cryptography: new package

 .gitignore                                         |  1 +
 package/Config.in                                  | 16 ++++++++++
 package/python-autobahn/Config.in                  |  8 +++++
 package/python-autobahn/python-autobahn.hash       |  3 ++
 package/python-autobahn/python-autobahn.mk         | 14 ++++++++
 package/python-characteristic/Config.in            |  6 ++++
 .../python-characteristic.hash                     |  3 ++
 .../python-characteristic/python-characteristic.mk | 14 ++++++++
 package/python-crossbar/Config.in                  | 37 ++++++++++++++++++++++
 package/python-crossbar/python-crossbar.hash       |  3 ++
 package/python-crossbar/python-crossbar.mk         | 14 ++++++++
 package/python-cryptography/Config.in              | 20 ++++++++++++
 .../python-cryptography/python-cryptography.hash   |  3 ++
 package/python-cryptography/python-cryptography.mk | 23 ++++++++++++++
 package/python-lmdb/Config.in                      |  7 ++++
 package/python-lmdb/python-lmdb.hash               |  3 ++
 package/python-lmdb/python-lmdb.mk                 | 14 ++++++++
 package/python-pyasn-modules/Config.in             | 11 +++++++
 .../python-pyasn-modules/python-pyasn-modules.hash |  3 ++
 .../python-pyasn-modules/python-pyasn-modules.mk   | 14 ++++++++
 package/python-pycparser/Config.in                 |  6 ++++
 package/python-pycparser/python-pycparser.mk       |  1 +
 package/python-pygments/Config.in                  |  6 ++++
 package/python-pygments/python-pygments.hash       |  3 ++
 package/python-pygments/python-pygments.mk         | 14 ++++++++
 package/python-pynacl/Config.in                    |  9 ++++++
 package/python-pynacl/python-pynacl.hash           |  3 ++
 package/python-pynacl/python-pynacl.mk             | 16 ++++++++++
 package/python-pytrie/Config.in                    |  6 ++++
 package/python-pytrie/python-pytrie.hash           |  3 ++
 package/python-pytrie/python-pytrie.mk             | 14 ++++++++
 package/python-service-identity/Config.in          | 10 ++++++
 .../python-service-identity.hash                   |  3 ++
 .../python-service-identity.mk                     | 15 +++++++++
 package/python-setproctitle/Config.in              |  6 ++++
 .../python-setproctitle/python-setproctitle.hash   |  3 ++
 package/python-setproctitle/python-setproctitle.mk | 14 ++++++++
 package/python-shutilwhich/Config.in               |  7 ++++
 package/python-shutilwhich/python-shutilwhich.hash |  3 ++
 package/python-shutilwhich/python-shutilwhich.mk   | 13 ++++++++
 package/python-treq/Config.in                      | 12 +++++++
 package/python-treq/python-treq.hash               |  3 ++
 package/python-treq/python-treq.mk                 | 14 ++++++++
 package/python-txaio/Config.in                     |  7 ++++
 package/python-txaio/python-txaio.hash             |  3 ++
 package/python-txaio/python-txaio.mk               | 14 ++++++++
 package/python-ujson/Config.in                     |  7 ++++
 package/python-ujson/python-ujson.hash             |  3 ++
 package/python-ujson/python-ujson.mk               | 13 ++++++++
 package/python-wsaccel/Config.in                   |  6 ++++
 package/python-wsaccel/python-wsaccel.hash         |  3 ++
 package/python-wsaccel/python-wsaccel.mk           | 13 ++++++++
 52 files changed, 470 insertions(+)
 create mode 100644 package/python-autobahn/Config.in
 create mode 100644 package/python-autobahn/python-autobahn.hash
 create mode 100644 package/python-autobahn/python-autobahn.mk
 create mode 100644 package/python-characteristic/Config.in
 create mode 100644 package/python-characteristic/python-characteristic.hash
 create mode 100644 package/python-characteristic/python-characteristic.mk
 create mode 100644 package/python-crossbar/Config.in
 create mode 100644 package/python-crossbar/python-crossbar.hash
 create mode 100644 package/python-crossbar/python-crossbar.mk
 create mode 100644 package/python-cryptography/Config.in
 create mode 100644 package/python-cryptography/python-cryptography.hash
 create mode 100644 package/python-cryptography/python-cryptography.mk
 create mode 100644 package/python-lmdb/Config.in
 create mode 100644 package/python-lmdb/python-lmdb.hash
 create mode 100644 package/python-lmdb/python-lmdb.mk
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
 create mode 100644 package/python-setproctitle/Config.in
 create mode 100644 package/python-setproctitle/python-setproctitle.hash
 create mode 100644 package/python-setproctitle/python-setproctitle.mk
 create mode 100644 package/python-shutilwhich/Config.in
 create mode 100644 package/python-shutilwhich/python-shutilwhich.hash
 create mode 100644 package/python-shutilwhich/python-shutilwhich.mk
 create mode 100644 package/python-treq/Config.in
 create mode 100644 package/python-treq/python-treq.hash
 create mode 100644 package/python-treq/python-treq.mk
 create mode 100644 package/python-txaio/Config.in
 create mode 100644 package/python-txaio/python-txaio.hash
 create mode 100644 package/python-txaio/python-txaio.mk
 create mode 100644 package/python-ujson/Config.in
 create mode 100644 package/python-ujson/python-ujson.hash
 create mode 100644 package/python-ujson/python-ujson.mk
 create mode 100644 package/python-wsaccel/Config.in
 create mode 100644 package/python-wsaccel/python-wsaccel.hash
 create mode 100644 package/python-wsaccel/python-wsaccel.mk

-- 
2.1.4
