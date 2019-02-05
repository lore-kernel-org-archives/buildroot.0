From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue,  5 Feb 2019 16:51:09 +0100
Subject: [Buildroot] [PATCH 00/10] Adding mender-artifact
Message-ID: <1549381879-2207-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch tries to resurrect an effort of Mizra from August to porting
the mender-artifact tool to buildroot
(https://patchwork.ozlabs.org/cover/962487/).
 
Mender artifact is a tool to generate artifacts for the mender software,
it is therefore an host tool and it's the last piece to add to have mender
available on buildroot.
To have it compiled as an host tool, we need to enable support for host
packages in go.
So the intent of this patch is:
* Enabling host golang packages
* Refactoring dependencies to distinguish between host packages and
  target packages
* Adding mender-artifact

The initial patch for mender-artifact was from Mizra but I completely
rewrote it, so I removed the signoff.

Angelo Compagnucci (9):
  package/go: refactor host/target dependencies
  package/docker-cli: using BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
  package/docker-containerd: using
    BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
  package/docker-engine: using BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
  package/docker-proxy: using BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
  package/flannel: using BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
  package/mender: using BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
  package/runc: using BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
  package/mender-artifact: initial support

Mirza Krak (1):
  package/pkg-golang: add support for building host packages

 DEVELOPERS                                   |  1 +
 docs/manual/adding-packages-golang.txt       |  5 ++--
 package/Config.in.host                       |  1 +
 package/docker-cli/Config.in                 |  6 ++---
 package/docker-containerd/Config.in          |  6 ++---
 package/docker-engine/Config.in              |  6 ++---
 package/docker-proxy/Config.in               |  6 ++---
 package/flannel/Config.in                    |  6 ++---
 package/go/Config.in.host                    | 12 ++++++---
 package/mender-artifact/Config.in.host       | 18 ++++++++++++++
 package/mender-artifact/mender-artifact.hash | 28 +++++++++++++++++++++
 package/mender-artifact/mender-artifact.mk   | 30 ++++++++++++++++++++++
 package/mender/Config.in                     |  6 ++---
 package/pkg-golang.mk                        | 37 +++++++++++++++++++++++++---
 package/runc/Config.in                       |  6 ++---
 15 files changed, 138 insertions(+), 36 deletions(-)
 create mode 100644 package/mender-artifact/Config.in.host
 create mode 100644 package/mender-artifact/mender-artifact.hash
 create mode 100644 package/mender-artifact/mender-artifact.mk

-- 
2.7.4
