From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Apr 2017 22:45:22 +0200
Subject: [Buildroot] [git commit] package/mplayer: disable inline mmx
Message-ID: <20170412204705.ADF11802B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=58b6135e2f2e14f5e11c967b8a5e76662b3fbe3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/642/6422adeef19ec547c7bc3f8ad3b0d51702015240/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mplayer/mplayer.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index 21faccc..166394c 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -288,6 +288,8 @@ endif
 define MPLAYER_DISABLE_INLINE_ASM
 	$(SED) 's,#define HAVE_INLINE_ASM 1,#define HAVE_INLINE_ASM 0,g' \
 		$(@D)/config.h
+	$(SED) 's,#define HAVE_MMX_INLINE 1,#define HAVE_MMX_INLINE 0,g' \
+		$(@D)/config.h
 endef
 
 ifeq ($(BR2_i386),y)
