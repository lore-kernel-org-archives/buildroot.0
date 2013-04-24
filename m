From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 24 Apr 2013 12:08:57 +0200
Subject: [Buildroot] [RFC 3/4] package: fix generic build for top-level
	parallel make
In-Reply-To: <1366798138-30722-1-git-send-email-fabio.porcedda@gmail.com>
References: <1366798138-30722-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1366798138-30722-4-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/pkg-generic.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 455d0ef..09ddd81 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -383,8 +383,8 @@ endif
 
 $(1)-install-host:      $(1)-build $$($(2)_TARGET_INSTALL_HOST)
 
-$(1)-build:		$(1)-configure \
-			$$($(2)_TARGET_BUILD)
+$$($(2)_TARGET_BUILD): $(1)-configure
+$(1)-build:		$$($(2)_TARGET_BUILD)
 
 $$($(2)_TARGET_CONFIGURE): $(1)-depends
 $(1)-configure:		$$($(2)_TARGET_CONFIGURE)
-- 
1.8.1.4
