From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Sep 2019 14:09:46 +0200
Subject: [Buildroot] [git commit branch/2019.08.x] docs/manual: add missing
 external toolchain *.mk inclusion in sample
Message-ID: <20190930121741.01E3F82B66@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b77d2909935a5b998e76983bb3837c74727963da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

If follow through the customize-outside-br.txt with how to add external
toolchain in br-ext tree then one thing is missing - inclusion of
*.mk file with external toolchain package description.

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 392b60f1768fa0ef4520a7f7b261092ad51d75c3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
