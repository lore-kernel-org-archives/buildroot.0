From: Norbert Lange <nolange79@gmail.com>
Date: Mon, 13 Jan 2020 16:35:15 +0100
Subject: [Buildroot] [PATCH 3/3] package/openssh: create system users
In-Reply-To: <20200113153516.486106-1-nolange79@gmail.com>
References: <20200113153516.486106-1-nolange79@gmail.com>
Message-ID: <20200113153516.486106-3-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/openssh/openssh.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 0411133bdc..6e29c3af7d 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -67,7 +67,7 @@ define OPENSSH_INSTALL_SYSTEMD_SYSUSERS
 endef
 else
 define OPENSSH_USERS
-	sshd -1 sshd -1 * /var/empty - - SSH drop priv user
+	sshd -2 sshd -2 * /var/empty - - SSH drop priv user
 endef
 endif
 
-- 
2.24.1
