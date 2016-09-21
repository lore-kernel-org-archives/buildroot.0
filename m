From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu, 22 Sep 2016 01:31:42 +0200
Subject: [Buildroot] [PATCH 2/3] package/ola: disable fatal warnings for
	host variant
In-Reply-To: <20160921233143.28149-1-joerg.krause@embedded.rocks>
References: <20160921233143.28149-1-joerg.krause@embedded.rocks>
Message-ID: <20160921233143.28149-2-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By default the build system of OLA passes '-Werror' to GCC. The aborts
compilation with GCC 6:

'''
error: ?template<class> class std::auto_ptr? is deprecated
[-Werror=deprecated-declarations]
'''

The target variant already passes the option "-disable-fatal-warnings"
to the build system to disable '-Werror'. Do it for the host variant to
to fix build with host GCC 6.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/ola/ola.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/ola/ola.mk b/package/ola/ola.mk
index 6f62a17..75ab25e 100644
--- a/package/ola/ola.mk
+++ b/package/ola/ola.mk
@@ -40,7 +40,8 @@ HOST_OLA_CONF_OPTS = \
 	--disable-examples \
 	--disable-unittests \
 	--disable-doxygen-html \
-	--disable-doxygen-doc
+	--disable-doxygen-doc \
+	--disable-fatal-warnings
 
 # On the host side, we only need ola_protoc_plugin, so build and install this
 # only.
-- 
2.10.0
