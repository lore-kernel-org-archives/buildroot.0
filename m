From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 21 Sep 2011 08:55:34 +0200
Subject: [Buildroot] [PATCH 4 of 5] tar: create a host version
In-Reply-To: <patchbomb.1316588130@localhost6.localdomain6>
References: <patchbomb.1316588130@localhost6.localdomain6>
Message-ID: <d39fc3b10b4e926a83a7.1316588134@localhost6.localdomain6>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some systems, like RedHat/CentOS, are even today shipped with ancient versions
of GNU tar, like 1.15. This can cause trouble, for example when unpacking
archives containing hardlinks with the --strip-components option.

To avoid such problems, let buildroot create a host-tar that can be used when
unpacking.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---

 package/tar/tar.mk |  3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/tar/tar.mk b/package/tar/tar.mk
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -8,3 +8,6 @@
 TAR_SITE = $(BR2_GNU_MIRROR)/tar
 
 $(eval $(call AUTOTARGETS,package,tar))
+$(eval $(call AUTOTARGETS,package,tar,host))
+
+HOST_TAR = $(HOST_DIR)/usr/bin/tar
