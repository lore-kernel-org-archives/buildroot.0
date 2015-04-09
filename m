From: Romain Naour <romain.naour@openwide.fr>
Date: Thu,  9 Apr 2015 22:23:39 +0200
Subject: [Buildroot] [PATCH 2/3] package/boost: disable boost-log with bfin
	uClibc 2013R1 toolchain
In-Reply-To: <1428611020-9329-1-git-send-email-romain.naour@openwide.fr>
References: <1428611020-9329-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1428611020-9329-2-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/boost/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 8e99324..1c51a8b 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -89,6 +89,7 @@ comment "boost-locale needs a toolchain w/ wchar"
 
 config BR2_PACKAGE_BOOST_LOG
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1 # missing pthread_spin_* in uClibc.
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 # missing pthread_spin_* in uClibc.
 	bool "boost-log"
 
 config BR2_PACKAGE_BOOST_MATH
-- 
1.9.3
