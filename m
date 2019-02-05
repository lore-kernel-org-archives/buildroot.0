From: =?UTF-8?q?Adrien=20Gallou=C3=ABt?= <adrien@gallouet.fr>
Date: Tue,  5 Feb 2019 10:56:31 +0000
Subject: [Buildroot] [PATCH 1/1] package/bird: add a unprivileged user
Message-ID: <20190205105630.17008-1-adrien@gallouet.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit add a specific unprivileged user for BIRD
to avoid full root privileges while running.

Signed-off-by: Adrien Gallou?t <adrien@gallouet.fr>
---
 package/bird/bird.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/bird/bird.mk b/package/bird/bird.mk
index da2f868070..8091644108 100644
--- a/package/bird/bird.mk
+++ b/package/bird/bird.mk
@@ -17,4 +17,12 @@ else
 BIRD_CONF_OPTS += --disable-client
 endif
 
+define BIRD_USERS
+	bird -1 bird -1 * - - - BIRD unprivileged user
+endef
+
+define BIRD_PERMISSIONS
+	/etc/bird.conf r 600 bird bird - - - - -
+endef
+
 $(eval $(autotools-package))
-- 
2.19.1
