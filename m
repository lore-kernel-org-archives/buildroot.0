From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Oct 2020 09:03:30 +0200
Subject: [Buildroot] [git commit] package/lua: split hash files,
 add license hash for 5.3 / 5.4
Message-ID: <20201003065707.D9CB181262@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=036c41db1ad0132063eaf76701719ffffe3f973c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The content of the license file (doc/readme.html) differs between lua 5.3
and 5.4, so we cannot use a shared .hash file for all versions.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Peter: extend commit message]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lua/5.1.5/lua.hash |  6 ++++++
 package/lua/5.3.6/lua.hash |  6 ++++++
 package/lua/5.4.0/lua.hash |  6 ++++++
 package/lua/lua.hash       | 12 ------------
 4 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/package/lua/5.1.5/lua.hash b/package/lua/5.1.5/lua.hash
new file mode 100644
index 0000000000..22ff8b7dad
--- /dev/null
+++ b/package/lua/5.1.5/lua.hash
@@ -0,0 +1,6 @@
+# Hashes from: http://www.lua.org/ftp/
+md5  2e115fe26e435e33b0d5c022e4490567  lua-5.1.5.tar.gz
+sha1  b3882111ad02ecc6b972f8c1241647905cb2e3fc  lua-5.1.5.tar.gz
+
+# Locally computed
+sha256  ee5e3e82af1e1b543c4f216e399d7c8cfee797711913f349e385101c4ae60a79  COPYRIGHT
diff --git a/package/lua/5.3.6/lua.hash b/package/lua/5.3.6/lua.hash
new file mode 100644
index 0000000000..74849b3101
--- /dev/null
+++ b/package/lua/5.3.6/lua.hash
@@ -0,0 +1,6 @@
+# Hashes from: http://www.lua.org/ftp/
+md5  83f23dbd5230140a3770d5f54076948d  lua-5.3.6.tar.gz
+sha1  f27d20d6c81292149bc4308525a9d6733c224fa5  lua-5.3.6.tar.gz
+
+# Locally computed
+sha256  2ddff2161e0c4487d744943565538743c0721485873092f6809d072a983b06ef  doc/readme.html
diff --git a/package/lua/5.4.0/lua.hash b/package/lua/5.4.0/lua.hash
new file mode 100644
index 0000000000..ac8639c4ed
--- /dev/null
+++ b/package/lua/5.4.0/lua.hash
@@ -0,0 +1,6 @@
+# Hashes from: http://www.lua.org/ftp/
+md5  dbf155764e5d433fc55ae80ea7060b60  lua-5.4.0.tar.gz
+sha1  8cdbffa8a214a23d190d7c45f38c19518ae62e89  lua-5.4.0.tar.gz
+
+# Locally computed
+sha256  1a579d0a1b8c5d19acd034c97c03bacc928fc23a0d7fde88488c2d0e3241094a  doc/readme.html
diff --git a/package/lua/lua.hash b/package/lua/lua.hash
deleted file mode 100644
index 5ace44458f..0000000000
--- a/package/lua/lua.hash
+++ /dev/null
@@ -1,12 +0,0 @@
-# Hashes from: http://www.lua.org/ftp/
-md5 dbf155764e5d433fc55ae80ea7060b60           lua-5.4.0.tar.gz
-sha1 8cdbffa8a214a23d190d7c45f38c19518ae62e89  lua-5.4.0.tar.gz
-
-md5 83f23dbd5230140a3770d5f54076948d           lua-5.3.6.tar.gz
-sha1 f27d20d6c81292149bc4308525a9d6733c224fa5  lua-5.3.6.tar.gz
-
-md5 2e115fe26e435e33b0d5c022e4490567           lua-5.1.5.tar.gz
-sha1 b3882111ad02ecc6b972f8c1241647905cb2e3fc  lua-5.1.5.tar.gz
-
-# Locally computed
-sha256  ee5e3e82af1e1b543c4f216e399d7c8cfee797711913f349e385101c4ae60a79  COPYRIGHT
