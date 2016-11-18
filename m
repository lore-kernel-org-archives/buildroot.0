From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri, 18 Nov 2016 10:10:19 +0100
Subject: [Buildroot] [PATCH v2 10/15] reproducible: enable fakedate
In-Reply-To: <1479460224-6119-1-git-send-email-jezz@sysmic.org>
References: <1479460224-6119-1-git-send-email-jezz@sysmic.org>
Message-ID: <1479460224-6119-11-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable fakedate for whole build process.

This work was sponsored by `BA Robotic Systems'.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 toolchain/toolchain/toolchain.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/toolchain/toolchain/toolchain.mk b/toolchain/toolchain/toolchain.mk
index d317e91..b88dd94 100644
--- a/toolchain/toolchain/toolchain.mk
+++ b/toolchain/toolchain/toolchain.mk
@@ -10,6 +10,10 @@ else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
 TOOLCHAIN_DEPENDENCIES += toolchain-external
 endif
 
+ifeq ($(BR2_REPRODUCIBLE),y)
+TOOLCHAIN_DEPENDENCIES += host-fakedate
+endif
+
 TOOLCHAIN_ADD_TOOLCHAIN_DEPENDENCY = NO
 
 # Apply a hack that Rick Felker suggested[1] to avoid conflicts between libc
-- 
1.9.1
