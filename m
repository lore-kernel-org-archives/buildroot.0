From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu, 16 Feb 2017 09:26:29 +0100
Subject: [Buildroot] [PATCH] package/mpd: use proper
	BR2_PACKAGE_MPD_VERSION_0_19 symbol
Message-ID: <20170216082629.2296-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 9244ad854 [1] adds a hidden choice between version 0.19 and 0.20. The
Makefile now uses a wrong symbol introduced by this commit. Fix by:
s/BR2_MPD_VERSION_0_19/BR2_PACKAGE_MPD_VERSION_0_19.

[1] https://git.buildroot.net/buildroot/commit/?id=9244ad854d30e8c942460646ef6f6194ee44942d

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
Note, that this patch is targeted for the master branch.
---
 package/mpd/mpd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 8869176d2..8e71ae214 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -17,7 +17,7 @@ MPD_LICENSE = GPLv2+
 MPD_LICENSE_FILES = COPYING
 MPD_AUTORECONF = YES
 
-ifeq ($(BR2_MPD_VERSION_0_19),y)
+ifeq ($(BR2_PACKAGE_MPD_VERSION_0_19),y)
 MPD_DEPENDENCIES += libglib2
 endif
 
-- 
2.11.1
