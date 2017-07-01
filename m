From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 15:01:01 +0200
Subject: [Buildroot] [git commit] core: simplify the condition to set the
	strip command
Message-ID: <20170701130455.5C1E381D32@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4480d40cc9a0d63da0bdf8ddf5dfc257c673de34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since BR2_STRIP_strip and BR2_STRIP_noine are mutually exclusive (being
part of a choice), we can simplify the logic.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index c1dc714..8087bde 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -205,8 +205,7 @@ ifeq ($(BR2_STRIP_strip),y)
 STRIP_STRIP_DEBUG := --strip-debug
 TARGET_STRIP = $(TARGET_CROSS)strip
 STRIPCMD = $(TARGET_CROSS)strip --remove-section=.comment --remove-section=.note
-endif
-ifeq ($(BR2_STRIP_none),y)
+else
 TARGET_STRIP = /bin/true
 STRIPCMD = $(TARGET_STRIP)
 endif
