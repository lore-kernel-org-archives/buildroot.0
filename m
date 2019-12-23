From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Dec 2019 09:10:00 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/syslog-ng: remove
 bogus select
Message-ID: <20191223080113.4B3428DEDC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ffc70002883cbed3cf2920c6aa6e45e85caee0f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

The eventlog package was removed as part of commit
5e0b1f9c2386e9184256b10ca19a6a7e4f4865cc ("package/eventlog: remove
package"). It used to be a separate package, but it is now part of
syslog-ng itself, which is why the eventlog package was removed.

But commit 5e0b1f9c2386e9184256b10ca19a6a7e4f4865cc forgot to drop the
select BR2_PACKAGE_EVENTLOG, so let's fix this.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 03a0f08720d2a8c107af06e58666d929c88ab26f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/syslog-ng/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/syslog-ng/Config.in b/package/syslog-ng/Config.in
index fbc236221a..a537115616 100644
--- a/package/syslog-ng/Config.in
+++ b/package/syslog-ng/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_SYSLOG_NG
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-	select BR2_PACKAGE_EVENTLOG
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_OPENSSL
