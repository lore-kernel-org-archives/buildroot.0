From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Fri,  4 Sep 2020 16:32:59 +0200
Subject: [Buildroot] [PATCH 0/2] Asynchronous OPC UP Python client
Message-ID: <20200904143301.6657-1-jugurtha.belkalem@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Even though OPC UA SDKs provide synchronous versions
(in addition to asynchronous APIs) for OPC UA operations;
these should not be used as they block until
timeout is reached or server's response reception arrives.

opcua-asyncio allows to create an asynchronous behaviour for
a python OPC UA client.

Jugurtha BELKALEM (2):
  package/python-aiofiles : new package
  package/python-opcua-asyncio : new package

 DEVELOPERS                                             |  2 ++
 package/Config.in                                      |  2 ++
 package/python-aiofiles/Config.in                      |  8 ++++++++
 package/python-aiofiles/python-aiofiles.hash           |  5 +++++
 package/python-aiofiles/python-aiofiles.mk             | 14 ++++++++++++++
 package/python-opcua-asyncio/Config.in                 | 14 ++++++++++++++
 package/python-opcua-asyncio/python-opcua-asyncio.hash |  3 +++
 package/python-opcua-asyncio/python-opcua-asyncio.mk   | 14 ++++++++++++++
 8 files changed, 62 insertions(+)
 create mode 100644 package/python-aiofiles/Config.in
 create mode 100644 package/python-aiofiles/python-aiofiles.hash
 create mode 100644 package/python-aiofiles/python-aiofiles.mk
 create mode 100644 package/python-opcua-asyncio/Config.in
 create mode 100644 package/python-opcua-asyncio/python-opcua-asyncio.hash
 create mode 100644 package/python-opcua-asyncio/python-opcua-asyncio.mk

-- 
2.11.0
