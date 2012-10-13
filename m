From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 13 Oct 2012 22:22:17 +0200
Subject: [Buildroot] [git commit] Disable database support in linux-pam
Message-ID: <20121013202736.BAC7399849@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=26e73ecb4540a4e78e92abaa9855e816b6dbf77f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Due to the conflicts with default Berkeley DB configuration, disable
database support in linux-pam: pam_userdb is not built.

Signed-off-by: Dmitry <golubovsky@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/linux-pam/linux-pam.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index 1a2e7f6..be51049 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -12,6 +12,7 @@ LINUX_PAM_CONF_OPT = \
 	--disable-prelude \
 	--disable-isadir \
 	--disable-nis \
+	--disable-db \
 	--disable-regenerate-docu \
 	--enable-securedir=/lib/security \
 	--libdir=/lib
