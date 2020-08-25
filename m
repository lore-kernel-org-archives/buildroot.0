From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Aug 2020 23:02:07 +0200
Subject: [Buildroot] [git commit branch/next] package/libyang: enable
 LYD_PRIV option for frr package
Message-ID: <20200826210201.DE7648527D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d97e54747c83977da7f5c00408da3c18756915e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This option is required by frr package, so enable it by default as there
is no size difference with or without this option enabled.

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libyang/libyang.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libyang/libyang.mk b/package/libyang/libyang.mk
index 95185b1f9b..c1ca51c36e 100644
--- a/package/libyang/libyang.mk
+++ b/package/libyang/libyang.mk
@@ -15,7 +15,8 @@ HOST_LIBYANG_DEPENDENCIES = host-pcre
 
 LIBYANG_CONF_OPTS = \
 	-DENABLE_VALGRIND_TESTS=OFF \
-	-DGEN_PYTHON_BINDINGS=OFF
+	-DGEN_PYTHON_BINDINGS=OFF \
+	-DENABLE_LYD_PRIV=ON
 
 HOST_LIBYANG_CONF_OPTS = \
 	-DENABLE_VALGRIND_TESTS=OFF \
