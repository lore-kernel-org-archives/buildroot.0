From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Oct 2013 23:40:15 +0200
Subject: [Buildroot] [git commit] oprofile: needs mmu
Message-ID: <20131009214149.F259F9B9AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6d34f6bdbb27f26c87b164310eaea89b8b91c208
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/oprofile/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/oprofile/Config.in b/package/oprofile/Config.in
index 0fbc87c..0d43782 100644
--- a/package/oprofile/Config.in
+++ b/package/oprofile/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_OPROFILE
 	bool "oprofile"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_BINUTILS
 	select BR2_PACKAGE_LIBPFM4 if BR2_powerpc
