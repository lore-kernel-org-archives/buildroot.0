From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 19 Dec 2019 20:28:00 +0100
Subject: [Buildroot] [PATCH 2/3] package/pipewire: add libva optional
 dependency
In-Reply-To: <20191219192801.1264354-1-fontaine.fabrice@gmail.com>
References: <20191219192801.1264354-1-fontaine.fabrice@gmail.com>
Message-ID: <20191219192801.1264354-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libva is an optional dependency of spa, see:
https://github.com/PipeWire/pipewire/blob/0.2.7/spa/meson.build

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pipewire/pipewire.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index ed98ff7f3b..aa3fdc489d 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -15,6 +15,10 @@ ifeq ($(BR2_PACKAGE_FFMPEG),y)
 PIPEWIRE_DEPENDENCIES += ffmpeg
 endif
 
+ifeq ($(BR2_PACKAGE_LIBVA),y)
+PIPEWIRE_DEPENDENCIES += libva
+endif
+
 ifeq ($(BR2_PACKAGE_SBC),y)
 PIPEWIRE_DEPENDENCIES += sbc
 endif
-- 
2.24.0
