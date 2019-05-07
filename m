From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  7 May 2019 22:35:22 +0200
Subject: [Buildroot] [PATCH v1 02/28] package/ffmpeg: replace utf-8 space by
 ascii character
In-Reply-To: <20190507203548.10337-1-ps.report@gmx.net>
References: <20190507203548.10337-1-ps.report@gmx.net>
Message-ID: <20190507203548.10337-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Replace utf-8 NO-BREAK-SPACE (c2 a0) in comment line by simple
ascii space character.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/ffmpeg/ffmpeg.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 9a5a178a48..8c91b149f4 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -490,7 +490,7 @@ else
 FFMPEG_CONF_OPTS += --enable-mipsfpu
 endif

-#?Fix build failure on "addi opcode not supported"
+# Fix build failure on "addi opcode not supported"
 ifeq ($(BR2_mips_32r6)$(BR2_mips_64r6),y)
 FFMPEG_CONF_OPTS += --disable-asm
 endif
--
2.21.0
