From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Dec 2018 11:26:37 +0100
Subject: [Buildroot] [git commit] system cfg: set mkpasswd default to SHA256
Message-ID: <20181215103019.26B60842A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9cf2280846b60ba081ed21339b407e2c761b599d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch changes the default mkpasswd method to SHA256 from MD5.
The change both improves the quality of the hash used and prepares
for eventually removing MD5 as a option.

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 system/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/system/Config.in b/system/Config.in
index e33568f7ed..65c92a8409 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -61,7 +61,7 @@ endif
 
 choice
 	bool "Passwords encoding"
-	default BR2_TARGET_GENERIC_PASSWD_MD5
+	default BR2_TARGET_GENERIC_PASSWD_SHA256
 	help
 	  Choose the password encoding scheme to use when Buildroot
 	  needs to encode a password (eg. the root password, below).
