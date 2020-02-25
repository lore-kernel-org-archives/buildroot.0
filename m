From: Vadim Kochan <vadim4j@gmail.com>
Date: Tue, 25 Feb 2020 04:58:49 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/libyang: enable LYD_PRIV option
 for frr package
In-Reply-To: <20200225025850.17209-1-vadim4j@gmail.com>
References: <20200225025850.17209-1-vadim4j@gmail.com>
Message-ID: <20200225025850.17209-2-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This option is required by frr package, so enable it only if frr is
selected.

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---
 package/libyang/libyang.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libyang/libyang.mk b/package/libyang/libyang.mk
index 648ffeb6a3..9d7f5df696 100644
--- a/package/libyang/libyang.mk
+++ b/package/libyang/libyang.mk
@@ -17,6 +17,10 @@ LIBYANG_CONF_OPTS = \
 	-DENABLE_VALGRIND_TESTS=OFF \
 	-DGEN_PYTHON_BINDINGS=OFF
 
+ifeq ($(BR2_PACKAGE_FRR),y)
+LIBYANG_CONF_OPTS += -DENABLE_LYD_PRIV=ON
+endif
+
 HOST_LIBYANG_CONF_OPTS = \
 	-DENABLE_VALGRIND_TESTS=OFF \
 	-DGEN_PYTHON_BINDINGS=OFF
-- 
2.17.1
