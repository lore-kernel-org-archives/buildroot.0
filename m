From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Nov 2013 23:18:25 +0100
Subject: [Buildroot] [PATCH 2/2] ola: disable -Werror
In-Reply-To: <1385072305-9127-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1385072305-9127-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1385072305-9127-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By default, the ola build uses -Werror, so let's pass
--disable-fatal-warnings to remove this and avoid build failures
caused by warnings.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ola/ola.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/ola/ola.mk b/package/ola/ola.mk
index 835ca4e..bc7de24 100644
--- a/package/ola/ola.mk
+++ b/package/ola/ola.mk
@@ -19,7 +19,8 @@ OLA_CONF_OPT = \
 	--disable-tcmalloc \
 	--disable-unittests \
 	--disable-root-check \
-	--disable-java-libs
+	--disable-java-libs \
+	--disable-fatal-warnings
 
 # sets where to find python libs built for target and required by ola
 OLA_CONF_ENV = PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
-- 
1.8.1.2
