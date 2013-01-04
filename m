From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 4 Jan 2013 22:31:48 +0100
Subject: [Buildroot] [git commit] imlib2: fix imlib2-config
Message-ID: <20130104214903.48FDD9A619@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6ba5ac89f890b1dd515fc906bbd82cfdc373e5a2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: use a single sed invocation]
Signed-off-by: Stefan Fr??berg <stefan.froberg@petroprogram.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/imlib2/imlib2.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/imlib2/imlib2.mk b/package/imlib2/imlib2.mk
index fa0f578..c7029ae 100644
--- a/package/imlib2/imlib2.mk
+++ b/package/imlib2/imlib2.mk
@@ -57,7 +57,9 @@ endif
 
 # drop -L<dir> from linker flags
 define IMLIB2_FIXUP_IMLIB2_CONFIG
-	$(SED) 's/-L[^ ]*//g' \
+	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
+		-e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
+		-e  's/-L[^ ]*//g' \
 		$(STAGING_DIR)/usr/bin/imlib2-config
 endef
 
