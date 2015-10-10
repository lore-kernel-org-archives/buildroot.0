From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 10 Oct 2015 12:03:15 +0200
Subject: [Buildroot] [PATCH v3 10/37] package/efl: add harfbuzz dependency
In-Reply-To: <1444471422-15118-1-git-send-email-romain.naour@openwide.fr>
References: <1444471422-15118-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1444471422-15118-11-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/efl/efl.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index ffe3f06..2637bbb 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -116,6 +116,13 @@ endif
 # There is no alsa support yet in Ecore_Audio.
 # configure will disable alsa support even if alsa-lib is selected.
 
+ifeq ($(BR2_PACKAGE_HARFBUZZ),y)
+EFL_DEPENDENCIES += harfbuzz
+EFL_CONF_OPTS += --enable-harfbuzz=yes
+else
+EFL_CONF_OPTS += --enable-harfbuzz=no
+endif
+
 ifeq ($(BR2_PACKAGE_TSLIB),y)
 EFL_DEPENDENCIES += tslib
 EFL_CONF_OPTS += --enable-tslib
-- 
2.4.3
