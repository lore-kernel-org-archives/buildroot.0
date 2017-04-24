From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Apr 2017 16:00:15 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/mplayer: mmxext
	requires sse
Message-ID: <20170424193337.6AB77821A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=27ff183a9caa836aa89743657a7d1d4b05443bfb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

MPlayer contains mmxext code for which a SSE-enabled CPU is required,
for details see https://bugs.funtoo.org/browse/FL-2202

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 0d202de1dd3c801a3b5486605bc7b927a13439ed)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mplayer/mplayer.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index 8288dcb..38452ab 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -303,9 +303,9 @@ MPLAYER_CONF_OPTS += \
 endif
 
 ifeq ($(BR2_X86_CPU_HAS_SSE),y)
-MPLAYER_CONF_OPTS += --enable-sse
+MPLAYER_CONF_OPTS += --enable-mmxext --enable-sse
 else
-MPLAYER_CONF_OPTS += --disable-sse
+MPLAYER_CONF_OPTS += --disable-mmxext --disable-sse
 endif
 
 ifeq ($(BR2_X86_CPU_HAS_SSE2),y)
