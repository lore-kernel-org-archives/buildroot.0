From: =?UTF-8?q?Gon=C3=A7alo=20Salazar?= <glbsalazar@gmail.com>
Date: Mon, 29 May 2017 19:29:35 +0100
Subject: [Buildroot] [PATCH 1/1] Added notes to the mosh package help to
	clarify run time issues.
Message-ID: <1496082575-24450-1-git-send-email-glbsalazar@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added notes to the mosh package help to clarify some
issues related with it to ensure mosh will work properly after adding it.
This includes adding a proper LOCALE on the host and an extra flag when using
mosh with dropbear.

Signed-off-by: Gon?alo Salazar <glbsalazar@gmail.com>
---
 package/mosh/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mosh/Config.in b/package/mosh/Config.in
index e0ff2cf..9f09b4f 100644
--- a/package/mosh/Config.in
+++ b/package/mosh/Config.in
@@ -25,3 +25,7 @@ config BR2_PACKAGE_MOSH
 	  of user keystrokes.
 
 	  https://mosh.mit.edu
+
+          Mosh requires a host LOCALE matching the client provided LOCALE.
+          When using mosh with dropbear, a version with the --no-ssh-pty option on
+          the client is required.
-- 
2.7.4
