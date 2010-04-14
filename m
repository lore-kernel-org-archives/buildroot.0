From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Wed, 14 Apr 2010 15:30:43 +0300
Subject: [Buildroot] [PATCH 0/2] Couple fixes for X11 Intel driver
	compilation
Message-ID: <20100414122805.17586.64124.stgit@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

X11 Intel driver compilation was broken since libdrm had no
support for Intel driver enabled. It was disabled because libdrm
needs libatomic_ops library.

---

Paulius Zaleckas (2):
      libdrm: enable/disable features according to driver selection
      Add libatomic_ops 1.2 needed by libdrm Intel support


 package/Config.in                      |    1 +
 package/libatomic_ops/Config.in        |    4 ++++
 package/libatomic_ops/libatomic_ops.mk |   12 ++++++++++++
 package/libdrm/Config.in               |    1 +
 package/libdrm/libdrm.mk               |   13 +++++++++++--
 5 files changed, 29 insertions(+), 2 deletions(-)
 create mode 100644 package/libatomic_ops/Config.in
 create mode 100644 package/libatomic_ops/libatomic_ops.mk
