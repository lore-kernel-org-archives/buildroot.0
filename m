From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Mar 2015 19:21:00 -0300
Subject: [Buildroot] [PATCH] glibc: disable eglibc 2.18 for sparc
Message-ID: <1426630860-2813-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's broken as well, wants to emit v9 asm.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/glibc/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 53cd958..8cc8cce 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -11,6 +11,8 @@ choice
 
 config BR2_EGLIBC_VERSION_2_18
 	bool "2.18-svnr23787"
+	# Build breakage
+	depends on !BR2_sparc
 
 config BR2_EGLIBC_VERSION_2_19
 	bool "2.19-svnr25243"
-- 
2.0.5
