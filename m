From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Oct 2017 08:47:22 +0200
Subject: [Buildroot] [git commit] ipset: fix musl build
Message-ID: <20171017064003.B72E07FA88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d7f3d4381761d18eebbf7dd461b06d9140b097e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add upstream patch removing use of non-standard u_int8_t type.

Fixes:
http://autobuild.buildroot.net/results/126/126c97db87cd3bdc6d222982a53d871387cc9b50/
http://autobuild.buildroot.net/results/22d/22dcb72e75d1844828ba344f5ed126de06d2ab82/
http://autobuild.buildroot.net/results/b56/b56a6e3b5036c10f2f2b74e36c130d751b2c1312/

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...e-last-reference-to-u_int8_t-with-uint8_t.patch | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/ipset/0001-Replace-the-last-reference-to-u_int8_t-with-uint8_t.patch b/package/ipset/0001-Replace-the-last-reference-to-u_int8_t-with-uint8_t.patch
new file mode 100644
index 0000000..84863e6
--- /dev/null
+++ b/package/ipset/0001-Replace-the-last-reference-to-u_int8_t-with-uint8_t.patch
@@ -0,0 +1,28 @@
+From a4212bf911026740afc7fce98d9100e2ef5dcea0 Mon Sep 17 00:00:00 2001
+From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
+Date: Tue, 26 Sep 2017 07:00:13 +0200
+Subject: [PATCH] Replace the last reference to u_int8_t with uint8_t.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: commit a4212bf911026740
+
+ src/ipset.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/ipset.c b/src/ipset.c
+index 79f56b869ea7..df0778a92d8b 100644
+--- a/src/ipset.c
++++ b/src/ipset.c
+@@ -282,7 +282,7 @@ call_parser(int *argc, char *argv[], const struct ipset_type *type,
+ 	const struct ipset_arg *arg;
+ 	const char *optstr;
+ 	const struct ipset_type *t = type;
+-	u_int8_t revision = type->revision;
++	uint8_t revision = type->revision;
+ 	int ret = 0, i = 1;
+ 
+ 	/* Currently CREATE and ADT may have got additional arguments */
+-- 
+2.14.2
+
