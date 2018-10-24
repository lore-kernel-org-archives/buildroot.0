From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 14:33:56 +0200
Subject: [Buildroot] [git commit branch/2018.08.x] package/ca-certificates:
 create ca-certificates.crt reproducibly
Message-ID: <20181024123213.149EC815FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a33cfffc458aa5fc0145e9203d29c23a021ca1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

Sort the certificates into alphabetical order so the contents of
ca-certificates.crt can be built reproducibly.

Note: The certificates are sorted uppercase then lowercase filenames
so the contents of ca-certificates.crt matches the source debian package.

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit c61b49e5b5c83237c8895d8caf76a9c448c41241)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ca-certificates/ca-certificates.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index 1df9543e03..5c259aa3ab 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -31,7 +31,7 @@ define CA_CERTIFICATES_INSTALL_TARGET_CMDS
 	# Create symlinks to certificates under /etc/ssl/certs
 	# and generate the bundle
 	cd $(TARGET_DIR) ;\
-	for i in `find usr/share/ca-certificates -name "*.crt"` ; do \
+	for i in `find usr/share/ca-certificates -name "*.crt" | LC_COLLATE=C sort` ; do \
 		ln -sf ../../../$$i etc/ssl/certs/`basename $${i} .crt`.pem ;\
 		cat $$i ;\
 	done >$(@D)/ca-certificates.crt
