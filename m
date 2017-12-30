From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Sat, 30 Dec 2017 11:02:00 +0100
Subject: [Buildroot] [PATCH v2 0/7] New infrastructure for golang packages
Message-ID: <1514628127-15938-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series add a new pkg-golang infrastructure and converts some of the
packages based on go.

Version 2:

* Completed the conversion of all golang packages to the new infrastructure
adding docker-engine

* Added a new package. mender


Angelo Compagnucci (7):
  package/pkg-golang: new package infrastructure
  docs/manual: adding documentation for the golang infrastructure
  package/flannel: converting to golang infrastructure
  package/runc: converting to golang infrastructure
  package/docker-containerd: converting to golang infrastructure
  package/docker-engine: converting to golang infrastructure
  package/mender: new package

 docs/manual/adding-packages-golang.txt         | 116 ++++++++++++++++++++++++
 docs/manual/adding-packages.txt                |   2 +
 package/Config.in                              |   1 +
 package/Makefile.in                            |   1 +
 package/docker-containerd/docker-containerd.mk |  37 +++-----
 package/docker-engine/docker-engine.mk         |  53 ++++-------
 package/flannel/flannel.mk                     |  32 +------
 package/mender/Config.in                       |  14 +++
 package/mender/mender-device-identity          |  52 +++++++++++
 package/mender/mender-inventory-hostinfo       |  21 +++++
 package/mender/mender-inventory-network        |  47 ++++++++++
 package/mender/mender.conf                     |  14 +++
 package/mender/mender.hash                     |   2 +
 package/mender/mender.mk                       |  31 +++++++
 package/mender/mender.service                  |  15 +++
 package/mender/server.crt                      |  22 +++++
 package/mender/tenant.conf                     |   0
 package/pkg-golang.mk                          | 121 +++++++++++++++++++++++++
 package/runc/runc.mk                           |  37 +-------
 19 files changed, 500 insertions(+), 118 deletions(-)
 create mode 100644 docs/manual/adding-packages-golang.txt
 create mode 100644 package/mender/Config.in
 create mode 100644 package/mender/mender-device-identity
 create mode 100644 package/mender/mender-inventory-hostinfo
 create mode 100644 package/mender/mender-inventory-network
 create mode 100644 package/mender/mender.conf
 create mode 100644 package/mender/mender.hash
 create mode 100644 package/mender/mender.mk
 create mode 100644 package/mender/mender.service
 create mode 100644 package/mender/server.crt
 create mode 100644 package/mender/tenant.conf
 create mode 100644 package/pkg-golang.mk

-- 
2.7.4
