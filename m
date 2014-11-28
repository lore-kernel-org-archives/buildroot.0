From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat, 29 Nov 2014 00:19:18 +0100
Subject: [Buildroot] [PATCH] package/mono: force host-mono to use internal
	mono bootstrap compiler
Message-ID: <1417216758-17468-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch forces the use of internal compiler for building mono,
for more information please refer to mono official documentation
(README.md)

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/mono/mono.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index 23d16f1..df67c33 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -55,6 +55,8 @@ HOST_MONO_CONF_OPTS += \
 	--with-profile4=$(if $(BR2_PACKAGE_MONO_40),yes,no) \
 	--with-profile4_5=$(if $(BR2_PACKAGE_MONO_45),yes,no)
 
+HOST_MONO_MAKE_OPTS += EXTERNAL_MCS="$(@D)/mcs/class/lib/monolite/basic.exe"
+
 HOST_MONO_DEPENDENCIES = host-monolite host-gettext
 
 define HOST_MONO_SETUP_MONOLITE
-- 
1.9.1
