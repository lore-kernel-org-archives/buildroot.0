From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed,  5 Dec 2018 20:06:28 -0600
Subject: [Buildroot] [PATCH v2 2/3] system cfg: set mkpasswd default to
 SHA256
In-Reply-To: <1544061989-7450-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1544061989-7450-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1544061989-7450-2-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch changes the default mkpasswd method to SHA256 from MD5.
The change both improves the quality of the hash used and prepares
for eventually removing MD5 as a option.

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
Changes
v2 - New patch
---
 system/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/system/Config.in b/system/Config.in
index e33568f..65c92a8 100644
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
-- 
1.9.1
