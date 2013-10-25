From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Oct 2013 09:22:21 +0200
Subject: [Buildroot] [git commit] libedit: needs mmu
Message-ID: <20131025073057.E722C9BB82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c96a0cc9077001b4bdea20c3fcf2e03b69aeb30a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/211/2116ffb8e74073fd415bfdea748731b5b8a876d7/
(Not just the examples, also vi.c)

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libedit/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libedit/Config.in b/package/libedit/Config.in
index 5158744..683eb6b 100644
--- a/package/libedit/Config.in
+++ b/package/libedit/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBEDIT
 	bool "libedit"
 	depends on BR2_USE_WCHAR
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_NCURSES
 	help
 	  The editline library (from BSD) provides generic line editing
