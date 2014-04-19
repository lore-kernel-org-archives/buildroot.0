From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 19 Apr 2014 11:47:33 +0200
Subject: [Buildroot] [PATCH 5/5] lttng-libust: add python as optional
	dependency
In-Reply-To: <1397900853-7235-1-git-send-email-romain.naour@openwide.fr>
References: <1397900853-7235-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1397900853-7235-5-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/lttng-libust/lttng-libust.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index b6d1911..f3d40ae 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -15,4 +15,12 @@ LTTNG_LIBUST_DEPENDENCIES    = liburcu util-linux
 
 LTTNG_LIBUST_AUTORECONF = YES
 
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+LTTNG_LIBUST_DEPENDENCIES += python
+else ifeq ($(BR2_PACKAGE_PYTHON3),y)
+LTTNG_LIBUST_DEPENDENCIES += python3
+else
+LTTNG_LIBUST_CONF_ENV=am_cv_pathless_PYTHON="none"
+endif
+
 $(eval $(autotools-package))
-- 
1.9.0
