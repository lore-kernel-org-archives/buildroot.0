From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 10 Aug 2011 00:12:34 +0200
Subject: [Buildroot] [PATCH 01/22] Makefile: auto-target automatically pass
	--program-prefix=""
Message-ID: <1312927975-15543-1-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When cross-compiled, some packages incorrectly prefix their executables
with the target tuple.

Fix that by forcing the program prefix to the empty string when calling
./configure, but only when compiling for target, not for host.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 package/Makefile.autotools.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index 46ab861..7f04c36 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -100,6 +100,7 @@ define $(2)_CONFIGURE_CMDS
 		--prefix=/usr \
 		--exec-prefix=/usr \
 		--sysconfdir=/etc \
+		--program-prefix="" \
 		$$(DISABLE_DOCUMENTATION) \
 		$$(DISABLE_NLS) \
 		$$(DISABLE_LARGEFILE) \
-- 
1.7.2.5
