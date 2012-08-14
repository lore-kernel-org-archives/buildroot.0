From: Dmitry <golubovsky@gmail.com>
Date: Mon, 13 Aug 2012 22:24:49 -0400
Subject: [Buildroot] [PATCH 2/2] Provide PAM configuration files in the fs
	skeleton
In-Reply-To: <1344911089-31197-1-git-send-email-golubovsky@gmail.com>
References: <1344911089-31197-1-git-send-email-golubovsky@gmail.com>
Message-ID: <1344911089-31197-2-git-send-email-golubovsky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The default PAM configuration file requires valid user accounts with
non-blank passwords.

The PAM configuration file for busybox login allows local authentication
with blank passwords thus emulating the non-PAM login configuration.

Signed-off-by: Dmitry <golubovsky@gmail.com>
---
 fs/skeleton/etc/pam.d/default |    8 ++++++++
 fs/skeleton/etc/pam.d/login   |    9 +++++++++
 2 files changed, 17 insertions(+), 0 deletions(-)
 create mode 100644 fs/skeleton/etc/pam.d/default
 create mode 100644 fs/skeleton/etc/pam.d/login

diff --git a/fs/skeleton/etc/pam.d/default b/fs/skeleton/etc/pam.d/default
new file mode 100644
index 0000000..0bd5ba0
--- /dev/null
+++ b/fs/skeleton/etc/pam.d/default
@@ -0,0 +1,8 @@
+#
+# default; standard UN*X access
+#
+auth     required       pam_unix.so
+account  required       pam_unix.so
+password required       pam_unix.so
+session  required       pam_unix.so
+
diff --git a/fs/skeleton/etc/pam.d/login b/fs/skeleton/etc/pam.d/login
new file mode 100644
index 0000000..d65a9d4
--- /dev/null
+++ b/fs/skeleton/etc/pam.d/login
@@ -0,0 +1,9 @@
+#
+# login: allow local logins to users with entries in /etc/passwd and
+# /etc/shadow even with null password
+#
+auth      required       pam_unix.so nullok
+account   required       pam_unix.so nullok
+password  required       pam_unix.so nullok
+session   required       pam_unix.so nullok
+
-- 
1.7.2.5
