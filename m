From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 20 Sep 2014 22:07:22 +0200
Subject: [Buildroot] [PATCH 3/3] package/gnupg2: add readline optional
	dependency
In-Reply-To: <1411243642-17955-1-git-send-email-romain.naour@openwide.fr>
References: <1411243642-17955-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1411243642-17955-3-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/gnupg2/gnupg2.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index e0c130b..2863618 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -33,4 +33,8 @@ else
 GNUPG2_CONF_OPT += --disable-bzip2
 endif
 
+ifeq ($(BR2_PACKAGE_READLINE),y)
+GNUPG2_DEPENDENCIES += readline
+endif
+
 $(eval $(autotools-package))
-- 
1.9.3
