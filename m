From: Francois Perrad <fperrad@gmail.com>
Date: Thu,  2 Jul 2020 22:22:25 +0200
Subject: [Buildroot] [PATCH 06/11] package/luaossl: add support of Lua 5.4
In-Reply-To: <20200702202230.1531929-1-francois.perrad@gadz.org>
References: <20200702202230.1531929-1-francois.perrad@gadz.org>
Message-ID: <20200702202230.1531929-7-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luaossl/0001-add-support-Lua54.patch | 25 ++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 package/luaossl/0001-add-support-Lua54.patch

diff --git a/package/luaossl/0001-add-support-Lua54.patch b/package/luaossl/0001-add-support-Lua54.patch
new file mode 100644
index 000000000..9dd9bddb8
--- /dev/null
+++ b/package/luaossl/0001-add-support-Lua54.patch
@@ -0,0 +1,25 @@
+add support of Lua 5.4
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+diff --git a/vendor/compat53/c-api/compat-5.3.h b/vendor/compat53/c-api/compat-5.3.h
+index 8e10893..4f8e58e 100644
+--- a/luaossl-rel-20190731/vendor/compat53/c-api/compat-5.3.h
++++ b/luaossl-rel-20190731/vendor/compat53/c-api/compat-5.3.h
+@@ -397,11 +397,11 @@
+ 
+ 
+ /* other Lua versions */
+-#if !defined(LUA_VERSION_NUM) || LUA_VERSION_NUM < 501 || LUA_VERSION_NUM > 503
++#if !defined(LUA_VERSION_NUM) || LUA_VERSION_NUM < 501 || LUA_VERSION_NUM > 504
+ 
+-#  error "unsupported Lua version (i.e. not Lua 5.1, 5.2, or 5.3)"
++#  error "unsupported Lua version (i.e. not Lua 5.1, 5.2, 5.3 or 5.4)"
+ 
+-#endif /* other Lua versions except 5.1, 5.2, and 5.3 */
++#endif /* other Lua versions except 5.1, 5.2, 5.3 and 5.4 */
+ 
+ 
+ 
+-- 
+
-- 
2.25.1
