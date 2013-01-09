From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 9 Jan 2013 09:14:27 +0100
Subject: [Buildroot] [git commit] enlightenment: fix efl dependency
Message-ID: <20130109081812.014439A6F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8cc76ff19d7d9482592881bfdeb802a23e810c26
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The efl libraries depends on BR2_PACKAGE_EFL, so ensure enlightenment
selects it as well, otherwise kconfig complains.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/enlightenment/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/enlightenment/Config.in b/package/enlightenment/Config.in
index c2944b9..357c72b 100644
--- a/package/enlightenment/Config.in
+++ b/package/enlightenment/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_ENLIGHTENMENT
 	bool "enlightenment"
+	select BR2_PACKAGE_EFL
 	select BR2_PACKAGE_LIBECORE
 	select BR2_PACKAGE_LIBECORE_X
 	select BR2_PACKAGE_LIBEINA
