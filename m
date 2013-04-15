From: Victor Hiairrassary <victor.hiairrassary.ml@gmail.com>
Date: Mon, 15 Apr 2013 19:43:10 +0200
Subject: [Buildroot] [PATCH] boost: fix bug introduced in latest change
In-Reply-To: <1366047790-20346-1-git-send-email-victor.hiairrassary.ml@gmail.com>
References: <1366047790-20346-1-git-send-email-victor.hiairrassary.ml@gmail.com>
Message-ID: <1366047790-20346-2-git-send-email-victor.hiairrassary.ml@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Victor Hiairrassary <victor.hiairrassary.ml@gmail.com>
---
 package/boost/boost.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 68b6316..d11f378 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -20,7 +20,7 @@ BOOST_FLAGS =
 BOOST_WITHOUT_FLAGS = python atomic
 
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CHRONO),,chrono)
-BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CHRONO),,context)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTEXT),,context)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_DATE_TIME),,date_time)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_EXCEPTION),,exception)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_FILESYSTEM),,filesystem)
-- 
1.8.2.1
