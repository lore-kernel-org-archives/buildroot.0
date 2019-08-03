From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 3 Aug 2019 20:30:48 +0200
Subject: [Buildroot] [git commit] package/dcron: add patch to fix error
 message
Message-ID: <20190803182839.2ACEC88694@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e3b90fb545582a7c24e0d34c4274777c1288475
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The error message issued when the creation of the log file fails lacks
an ending newline. Add a patch already submitted upstream[1] to fix it.

1. https://github.com/dubiousjim/dcron/pull/22

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...newline-to-logfile-openning-error-message.patch | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/package/dcron/0001-main.c-add-newline-to-logfile-openning-error-message.patch b/package/dcron/0001-main.c-add-newline-to-logfile-openning-error-message.patch
new file mode 100644
index 0000000000..c838063e03
--- /dev/null
+++ b/package/dcron/0001-main.c-add-newline-to-logfile-openning-error-message.patch
@@ -0,0 +1,26 @@
+From 2710bc67cd920323da9b23a3d60193577bd43d71 Mon Sep 17 00:00:00 2001
+From: Carlos Santos <unixmania@gmail.com>
+Date: Sat, 20 Jul 2019 00:27:31 -0300
+Subject: [PATCH] main.c: add newline to logfile openning error message
+
+Signed-off-by: Carlos Santos <unixmania@gmail.com>
+---
+ main.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/main.c b/main.c
+index 0eba280..2606db8 100644
+--- a/main.c
++++ b/main.c
+@@ -261,7 +261,7 @@ main(int ac, char **av)
+ 				dup2(fd, 2);
+ 			} else {
+ 				int n = errno;
+-				fdprintf(2, "failed to open logfile '%s', reason: %s", LogFile, strerror(n));
++				fdprintf(2, "failed to open logfile '%s', reason: %s\n", LogFile, strerror(n));
+ 				exit(n);
+ 			}
+ 		}
+-- 
+2.18.1
+
