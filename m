From: Romain Naour <romain.naour@openwide.fr>
Date: Tue, 23 Sep 2014 23:57:37 +0200
Subject: [Buildroot] [PATCH v2 3/3] package/gnupg2: add readline optional
	dependency
In-Reply-To: <1411509457-8182-1-git-send-email-romain.naour@openwide.fr>
References: <1411509457-8182-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1411509457-8182-3-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is to improve build reproducibility.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v2: improve commit log

 package/gnupg2/gnupg2.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 3fce998..b78f825 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -36,4 +36,8 @@ else
 GNUPG2_CONF_OPT += --disable-bzip2
 endif
 
+ifeq ($(BR2_PACKAGE_READLINE),y)
+GNUPG2_DEPENDENCIES += readline
+endif
+
 $(eval $(autotools-package))
-- 
1.9.3
