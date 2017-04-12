From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Apr 2017 22:45:03 +0200
Subject: [Buildroot] [git commit] package/mplayer: mmxext requires sse
Message-ID: <20170412204705.8A731802B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d202de1dd3c801a3b5486605bc7b927a13439ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

MPlayer contains mmxext code for which a SSE-enabled CPU is required,
for details see https://bugs.funtoo.org/browse/FL-2202

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mplayer/mplayer.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index 14ab8ac..21faccc 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -306,9 +306,9 @@ MPLAYER_CONF_OPTS += \
 endif
 
 ifeq ($(BR2_X86_CPU_HAS_SSE),y)
-MPLAYER_CONF_OPTS += --enable-sse
+MPLAYER_CONF_OPTS += --enable-mmxext --enable-sse
 else
-MPLAYER_CONF_OPTS += --disable-sse
+MPLAYER_CONF_OPTS += --disable-mmxext --disable-sse
 endif
 
 ifeq ($(BR2_X86_CPU_HAS_SSE2),y)
