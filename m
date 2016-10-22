From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] 4th: use $(TARGET_MAKE_ENV) when calling
	$(MAKE)
Message-ID: <20161022132037.C159B7F9EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=330dd92423c49692b21dbe90dabba34866fd6913
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/4th/4th.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/4th/4th.mk b/package/4th/4th.mk
index 071c2d4..7828592 100644
--- a/package/4th/4th.mk
+++ b/package/4th/4th.mk
@@ -17,9 +17,9 @@
 4TH_CFLAGS = $(TARGET_CFLAGS) -DUNIX -fsigned-char
 
 ifeq ($(BR2_STATIC_LIBS),y)
-4TH_MAKE_ENV = STATIC=1
+4TH_MAKE_ENV = $(TARGET_MAKE_ENV) STATIC=1
 else
-4TH_MAKE_ENV = SHARED=1
+4TH_MAKE_ENV = $(TARGET_MAKE_ENV) SHARED=1
 4TH_CFLAGS += -fPIC
 endif
 
