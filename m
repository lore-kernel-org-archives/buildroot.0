From: Vadim Kochan <vadim4j@gmail.com>
Date: Mon, 16 Sep 2019 19:50:51 +0300
Subject: [Buildroot] [PATCH 1/1] docs/manual: add missing external toolchain
 *.mk inclusion in sample
Message-ID: <20190916165051.23838-1-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If follow through the customize-outside-br.txt with how to add external
toolchain in br-ext tree then one thing is missing - inclusion of
*.mk file with external toolchain package description.

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---
 docs/manual/customize-outside-br.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/manual/customize-outside-br.txt b/docs/manual/customize-outside-br.txt
index 6ab01bcb1f..7d3e2b1714 100644
--- a/docs/manual/customize-outside-br.txt
+++ b/docs/manual/customize-outside-br.txt
@@ -246,6 +246,7 @@ illustration, of course):
   |
   |- external.mk
   |     |include $(sort $(wildcard $(BR2_EXTERNAL_BAR_42_PATH)/package/*/*.mk))
+  |     |include $(sort $(wildcard $(BR2_EXTERNAL_BAR_42_PATH)/toolchain/*/*.mk))
   |     |
   |     |flash-my-board:
   |     |    $(BR2_EXTERNAL_BAR_42_PATH)/board/my-board/flash-image \
-- 
2.22.0
