From: Mirza Krak <mirza.krak@northern.tech>
Date: Mon, 27 Aug 2018 13:37:26 +0200
Subject: [Buildroot] [[PATCH v2 0/2] mender-artifact support
Message-ID: <20180827113728.20856-1-mirza.krak@northern.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

First patch adds "host" support in pkg-golang.mk.

Second patch adds a new package, mender-artifact. This is a host tool
to generate update images in Mender Artifact format compatible with
Mender client and the Mender server. More information about the Mender
artifact format can be found here:

    https://github.com/mendersoftware/mender-artifact/blob/master/Documentation/artifact-format.md

Patch 2 depends on:

    package/pkg-golang: add support for building host packages

All changes are based on review from Thomas Petazzoni, thank you for the review!

Changes in v2:
    - "fixup" patch 3 (DEVELOPERS update) in to patch 2.

See individual patches for more info on updates from v1 -> v2

Mirza Krak (2):
  package/pkg-golang: add support for building host packages
  package/mender-artifact: initial support

 DEVELOPERS                                   |  1 +
 docs/manual/adding-packages-golang.txt       |  5 ++--
 package/Config.in.host                       |  1 +
 package/mender-artifact/Config.in.host       | 20 +++++++++++++++
 package/mender-artifact/mender-artifact.hash | 28 +++++++++++++++++++++
 package/mender-artifact/mender-artifact.mk   | 21 ++++++++++++++++
 package/pkg-golang.mk                        | 37 +++++++++++++++++++++++++---
 7 files changed, 108 insertions(+), 5 deletions(-)
 create mode 100644 package/mender-artifact/Config.in.host
 create mode 100644 package/mender-artifact/mender-artifact.hash
 create mode 100644 package/mender-artifact/mender-artifact.mk

--
2.11.0
