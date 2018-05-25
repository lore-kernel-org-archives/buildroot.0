From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 25 May 2018 19:36:07 +0200
Subject: [Buildroot] [PATCH] poppler: fix sparc compilation error
Message-ID: <20180525173607.GA27418@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
  http://autobuild.buildroot.net/results/64a96663a48ab644bc03c9a3ec2d6a644119dee6
  http://autobuild.buildroot.net/results/82e85e12478fc1972b70ad728ed7c1554920c9e3

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/poppler/poppler.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index 5946cbe..6223bf1 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -94,6 +94,9 @@ POPPLER_CONF_OPTS += --enable-poppler-qt5
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 POPPLER_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
 endif
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+POPPLER_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -latomic"
+endif
 else
 POPPLER_CONF_OPTS += --disable-poppler-qt5
 endif
-- 
2.1.4
