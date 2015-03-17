From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 17 Mar 2015 21:34:56 +0100
Subject: [Buildroot] [PATCH v1] postgresql: uses fork(), needs mmu
Message-ID: <1426624496-16217-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes ([1]):
  postmaster/fork_process.o: In function `_fork_process':
  fork_process.c:(.text+0x22): undefined reference to `_fork'

[1] http://autobuild.buildroot.org/results/c9c/c9c93156fe64e89f35627aa592c47d8c5181ed7d

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/postgresql/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/postgresql/Config.in b/package/postgresql/Config.in
index 519b2a1..4c53703 100644
--- a/package/postgresql/Config.in
+++ b/package/postgresql/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_POSTGRESQL
 	bool "postgresql"
+	depends on BR2_USE_MMU # fork()
 	help
 	  PostgreSQL is a powerful, open source object-relational
 	  database system.
-- 
2.1.4
