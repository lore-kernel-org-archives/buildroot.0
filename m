From: =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
Date: Sun, 19 Dec 2010 21:16:37 +0100
Subject: [Buildroot] [git commit master 1/1] linux: fix linux-% shortcut
	targets
Message-ID: <20101219201843.97AF38DC50@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=14c1a15fab52812c0932c8c5e26c50c794bcf5c6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

linux-% shortcut targets (short for linux26-%) ignores the ouput dir
$(O) so that 'make O=output.arm linux-menuconfig' is actually run in the
default $(O) directory output/ and not in output.arm/. Fix by passing on
$(O) if set.

[Peter: Use EXTRAMAKEARGS]
Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/linux.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 6636a35..f2c6fd5 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -200,4 +200,4 @@ endif
 endif
 
 linux-%:
-	$(MAKE) $(subst linux-,linux26-,$@)
+	$(MAKE) $(EXTRAMAKEARGS) $(subst linux-,linux26-,$@)
-- 
1.7.2.2
