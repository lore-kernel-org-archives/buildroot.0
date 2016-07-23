From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jul 2016 23:06:47 +0200
Subject: [Buildroot] [git commit] zeromq: disable documentation
Message-ID: <20160723210654.C7C0A81D43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4b5926d30408be53c38c4819741c9af10f0fe9d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If asciidoc and xmlto are around it will automatically enable the
documentation build which is pointless.
Build time on i5-3330 with docs = 37s, without docs 25s.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/zeromq/zeromq.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index 4891e59..5c99983 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -8,6 +8,7 @@ ZEROMQ_VERSION = 4.1.5
 ZEROMQ_SITE = https://github.com/zeromq/zeromq4-1/releases/download/v$(ZEROMQ_VERSION)
 ZEROMQ_INSTALL_STAGING = YES
 ZEROMQ_DEPENDENCIES = util-linux
+ZEROMQ_CONF_OPTS = --without-documentation
 ZEROMQ_LICENSE = LGPLv3+ with exceptions
 ZEROMQ_LICENSE_FILES = COPYING COPYING.LESSER
 # For 0001-acinclude.m4-make-kernel-specific-flags-cacheable.patch
