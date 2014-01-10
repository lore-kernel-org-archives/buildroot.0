From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Jan 2014 15:37:37 +0100
Subject: [Buildroot] [git commit] system: clarify issue/hostname settings
Message-ID: <20140110144314.5C73D9C43B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dec1a14687ec6b064147e978b25287df71ca15bf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A custom skeleton may include /etc/issue and/or /etc/hostname, in
which case we do not want to override them.

But those files could also be missing from the custom skeleton, or
the user may want to override their content.

Update the documentation to make it clear that the user can set these to the
empty string to make buildroot not create/overwrite these files.

[Peter: drop the different default values depending on skeleton]
Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
[yann.morin.1998 at free.fr: change from hiding it behind SKELETON_DEFAULT
    to use conditional default values; move below the skeleton choice;
    improve help entries]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 system/Config.in |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index 54c196c..8288335 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -6,12 +6,18 @@ config BR2_TARGET_GENERIC_HOSTNAME
 	help
 	  Select system hostname to be stored in /etc/hostname.
 
+	  Leave empty to not create /etc/hostname, or to keep the
+	  one from a custom skeleton.
+
 config BR2_TARGET_GENERIC_ISSUE
 	string "System banner"
 	default "Welcome to Buildroot"
 	help
 	  Select system banner (/etc/issue) to be displayed at login.
 
+	  Leave empty to not create /etc/issue, or to keep the
+	  one from a custom skeleton.
+
 choice
 	bool "Passwords encoding"
 	default BR2_TARGET_GENERIC_PASSWD_MD5
