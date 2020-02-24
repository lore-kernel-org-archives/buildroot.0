From: Vadim Kochan <vadim4j@gmail.com>
Date: Mon, 24 Feb 2020 19:26:50 +0200
Subject: [Buildroot] [PATCH 1/3] package/libyang: enable LYD_PRIV option
In-Reply-To: <20200224172652.30932-1-vadim4j@gmail.com>
References: <20200224172652.30932-1-vadim4j@gmail.com>
Message-ID: <20200224172652.30932-2-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This option is required by frr package, so enable it by default.

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---
 package/libyang/libyang.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libyang/libyang.mk b/package/libyang/libyang.mk
index 648ffeb6a3..e701c6f448 100644
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
-- 
2.17.1
