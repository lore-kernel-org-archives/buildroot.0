From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 22 Apr 2017 13:59:45 +0200
Subject: [Buildroot] [PATCH v8 02/12] e2fsprogs: add missing arch depends to
	comment
In-Reply-To: <20170422115955.22718-1-arnout@mind.be>
References: <20170422115955.22718-1-arnout@mind.be>
Message-ID: <20170422115955.22718-3-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <casantos@datacom.ind.br>

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/e2fsprogs/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
index da6aacf2fd..c83f84530d 100644
--- a/package/e2fsprogs/Config.in
+++ b/package/e2fsprogs/Config.in
@@ -51,6 +51,7 @@ config BR2_PACKAGE_E2FSPROGS_E4DEFRAG
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # sync_file_range not impl
 
 comment "e4defrag needs a glibc or musl toolchain"
+	depends on !BR2_nios2
 	depends on BR2_TOOLCHAIN_USES_UCLIBC
 
 config BR2_PACKAGE_E2FSPROGS_FILEFRAG
-- 
2.11.0
