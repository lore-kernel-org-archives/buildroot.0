From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Jan 2020 08:38:55 +0100
Subject: [Buildroot] [git commit] package/xen: add upstream security fix for
 XSA-312
Message-ID: <20200120072915.4A8DB82AB7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=76d56fe7690dfafbcf885f645436104a0c34e14c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issue:

XSA-312: arm: a CPU may speculate past the ERET instruction

For further details, see the advisory:

https://xenbits.xenproject.org/xsa/advisory-312.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xen/xen.hash | 1 +
 package/xen/xen.mk   | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/xen/xen.hash b/package/xen/xen.hash
index ad6220d94b..672ba5cb8d 100644
--- a/package/xen/xen.hash
+++ b/package/xen/xen.hash
@@ -1,3 +1,4 @@
 # Locally computed
 sha256 1c75cbe728dfabf02b7f9a17ce96ee7d202d2fd4b4689490018d3a28b63f9fa3 xen-4.12.2.tar.gz
+sha256 9b2078d448e4815c9ddc6554bf869d64412dc787b1b94830a24e47df6a9f30e7 xsa312.patch
 sha256 dba0d79260259c013c52e5d4daeaea564a2fbb9ff7fc6778c377a401ec3898de COPYING
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index 7eb2643343..d0c6bebe9d 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -6,6 +6,8 @@
 
 XEN_VERSION = 4.12.2
 XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
+XEN_PATCH = \
+	https://xenbits.xenproject.org/xsa/xsa312.patch
 XEN_LICENSE = GPL-2.0
 XEN_LICENSE_FILES = COPYING
 XEN_DEPENDENCIES = host-acpica host-python
