From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Oct 2017 21:59:48 +0200
Subject: [Buildroot] [git commit] msgpack: fix static build
Message-ID: <20171017201642.6111D7FD65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9c02f70a204ed3772950641aae349925afd7f6f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disabled shared libraries when building static only.

Fixes:
http://autobuild.buildroot.net/results/057/057d72bc84c467973ec3c076f5d8108e02d6e283/
http://autobuild.buildroot.net/results/499/499069f6821ddd2dcb83201b017a58eae00ebe16/
http://autobuild.buildroot.net/results/499/499069f6821ddd2dcb83201b017a58eae00ebe16/

Cc: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/msgpack/msgpack.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/msgpack/msgpack.mk b/package/msgpack/msgpack.mk
index 7b92f3f..38df8f5 100644
--- a/package/msgpack/msgpack.mk
+++ b/package/msgpack/msgpack.mk
@@ -11,4 +11,8 @@ MSGPACK_LICENSE_FILES = COPYING LICENSE_1_0.txt
 MSGPACK_INSTALL_STAGING = YES
 MSGPACK_CONF_OPTS = -DMSGPACK_BUILD_EXAMPLES=OFF
 
+ifeq ($(BR2_STATIC_LIBS),y)
+MSGPACK_CONF_OPTS += -DMSGPACK_ENABLE_SHARED=OFF
+endif
+
 $(eval $(cmake-package))
