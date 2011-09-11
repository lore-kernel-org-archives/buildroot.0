From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 12 Sep 2011 00:08:17 +0200
Subject: [Buildroot] [git commit] Makefile: auto-target automatically pass
	--program-prefix=""
Message-ID: <20110912052631.EF0D08D58C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a8d6e2cc70e1532efea7aba791625a8cb68a10e4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When cross-compiled, some packages incorrectly prefix their executables
with the target tuple.

Fix that by forcing the program prefix to the empty string when calling
./configure, but only when compiling for target, not for host.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
1.7.3.4
