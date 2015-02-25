From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 25 Feb 2015 10:06:26 -0300
Subject: [Buildroot] [PATCH 3/3] sox: add optional opus file support
In-Reply-To: <1424869586-9033-1-git-send-email-gustavo@zacarias.com.ar>
References: <1424869586-9033-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1424869586-9033-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sox/sox.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/sox/sox.mk b/package/sox/sox.mk
index ac89691..cd5fbb6 100644
--- a/package/sox/sox.mk
+++ b/package/sox/sox.mk
@@ -78,6 +78,12 @@ else
 SOX_CONF_OPTS += --without-amrwb --without-amrnb
 endif
 
+ifeq ($(BR2_PACKAGE_OPUSFILE),y)
+SOX_DEPENDENCIES += opusfile
+else
+SOX_CONF_OPTS += --without-opus
+endif
+
 ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
 SOX_DEPENDENCIES += pulseaudio
 else
-- 
2.0.5
