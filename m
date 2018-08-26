From: Mirza Krak <mirza.krak@northern.tech>
Date: Sun, 26 Aug 2018 23:41:43 +0200
Subject: [Buildroot] [PATCH 0/3] mender-artifact support
Message-ID: <20180826214146.28328-1-mirza.krak@northern.tech>
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

Third patch adds the mender-artifact package to Mirza Krak in DEVELOPERS.

Patch 2-3 depend on:

    package/pkg-golang: add support for host target

Mirza Krak (3):
  package/pkg-golang: add support for host target
  package/mender-artifact: initial support
  DEVELOPERS: add mender-artifact to Mirza Krak

 DEVELOPERS                                   |  1 +
 package/Config.in.host                       |  1 +
 package/mender-artifact/Config.in.host       |  7 +++++
 package/mender-artifact/mender-artifact.hash | 29 +++++++++++++++++++++
 package/mender-artifact/mender-artifact.mk   | 21 +++++++++++++++
 package/pkg-golang.mk                        | 38 ++++++++++++++++++++++++----
 6 files changed, 92 insertions(+), 5 deletions(-)
 create mode 100644 package/mender-artifact/Config.in.host
 create mode 100644 package/mender-artifact/mender-artifact.hash
 create mode 100644 package/mender-artifact/mender-artifact.mk

--
2.11.0
