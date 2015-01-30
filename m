From: Alex Suykov <alex.suykov@gmail.com>
Date: Fri, 30 Jan 2015 11:49:59 +0200
Subject: [Buildroot] [PATCH] benejson: use -std=c99
Message-ID: <20150130094959.GA13536@vostro>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/d6a3c21938dddde45a427b42a7e0e37aa2426306/
http://autobuild.buildroot.net/results/bd138fc9cee13da850c81e8f9407f098a6a69c69/

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/benejson/0001-c-std.patch | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 package/benejson/0001-c-std.patch

diff --git a/package/benejson/0001-c-std.patch b/package/benejson/0001-c-std.patch
new file mode 100644
index 0000000..2330b79
--- /dev/null
+++ b/package/benejson/0001-c-std.patch
@@ -0,0 +1,22 @@
+Some older toolchains do not recognize c11 as a valid standard.
+Since the code actually builds well with c99, use that instead.
+
+The only two non-standard features used are // comments
+and for(int i ...) declarations in C.
+
+Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
+
+--- a/SConstruct
++++ b/SConstruct
+@@ -9,9 +9,8 @@ mydir = os.getcwd()
+ #Set default C++ building flags for both libraries and executables
+ default_env = Environment(ENV = os.environ)
+ default_env.Append(CPPPATH = [mydir + '/include'])
+-default_env.Append(CCFLAGS = ' -Wall -pedantic')
+-default_env.Append(CFLAGS = ' -std=c11')
+-default_env.Append(CXXFLAGS = ' -std=c++11')
++default_env.Append(CFLAGS = ' -Wall')
++default_env.Append(CFLAGS = ' -std=c99')
+ #default_env.Append(CCFLAGS = ' -O2 -fomit-frame-pointer')
+ default_env.Append(CCFLAGS = ' -O0 -g')
+ 
-- 
2.0.3
