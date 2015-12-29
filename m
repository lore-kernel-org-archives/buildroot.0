From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Dec 2015 00:10:39 +0100
Subject: [Buildroot] [PATCH 2/3] package/netbsd-queue: add Kconfig symbol
	like for all target packages
In-Reply-To: <cover.1451430505.git.yann.morin.1998@free.fr>
References: <cover.1451430505.git.yann.morin.1998@free.fr>
Message-ID: <bdbd50f9cea9eeeca54950f0cc9897156bb0ae0e.1451430505.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Select that package from musl, too, since it is a dependency.

Fixes:
    http://autobuild.buildroot.org/results/15c/15c9a80fb2754ed1866b59d5e62d02691b57834e/
    ... and numerous similar issues ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Sergio Prado <sergio.prado@e-labworks.com>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>

---
Conflicts:
	package/musl/Config.in
---
 package/musl/Config.in         | 1 +
 package/netbsd-queue/Config.in | 2 ++
 2 files changed, 3 insertions(+)
 create mode 100644 package/netbsd-queue/Config.in

diff --git a/package/musl/Config.in b/package/musl/Config.in
index 4f6cc51..f1a3150 100644
--- a/package/musl/Config.in
+++ b/package/musl/Config.in
@@ -3,3 +3,4 @@ config BR2_PACKAGE_MUSL
 	depends on BR2_TOOLCHAIN_USES_MUSL
 	default y
 	select BR2_PACKAGE_LINUX_HEADERS
+	select BR2_PACKAGE_NETBSD_QUEUE
diff --git a/package/netbsd-queue/Config.in b/package/netbsd-queue/Config.in
new file mode 100644
index 0000000..7837f4c
--- /dev/null
+++ b/package/netbsd-queue/Config.in
@@ -0,0 +1,2 @@
+config BR2_PACKAGE_NETBSD_QUEUE
+	bool
-- 
1.9.1
