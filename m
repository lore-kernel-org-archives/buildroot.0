Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E1C2EB64DC
	for <buildroot@archiver.kernel.org>; Mon, 17 Jul 2023 14:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1751181E9F;
	Mon, 17 Jul 2023 14:34:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1751181E9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 05hGxpHXtWFa; Mon, 17 Jul 2023 14:34:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 364A081E9A;
	Mon, 17 Jul 2023 14:34:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 364A081E9A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E65801BF304
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 14:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDE3880FA7
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 14:33:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDE3880FA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O-LpiJrh9fs6 for <buildroot@lists.busybox.net>;
 Mon, 17 Jul 2023 14:33:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C287E80E83
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 14:33:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C287E80E83
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF20187321; Mon, 17 Jul 2023 14:33:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 17 Jul 2023 16:32:34 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: f445c6355817e7aedc8bdea1263d5cd74c54c789
X-Git-Newrev: 50ceb24bb6cf133fb61d534dc633cef5cd443a5c
X-Patchwork-Hint: ignore
Message-Id: <20230717143353.AF20187321@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/dahdi-linux: fix
 build with kernel < 6.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=50ceb24bb6cf133fb61d534dc633cef5cd443a5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Buildroot commit 840b5527466502f02b86c95f9bf95557d35c8571 added a patch
from upstream bug tracker which fixes build with kernel >= 6.3 but broke
the build with earlier kernels.

This patch adds additional code for compatibility with kernel < 6.3.

Fixes:
http://autobuild.buildroot.net/results/c8c/c8c51153d3a61842d57a2a4be3dc75ec9964e41c/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 353c06849bc9f9549f0cabefa74c915ce98ae528)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-16.patch => 0005-Fix-build-on-Linux-6.3.patch} | 40 ++++++++++++++--------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/package/dahdi-linux/0005-drivers-dahdi-fix-build-with-clang-16.patch b/package/dahdi-linux/0005-Fix-build-on-Linux-6.3.patch
similarity index 75%
rename from package/dahdi-linux/0005-drivers-dahdi-fix-build-with-clang-16.patch
rename to package/dahdi-linux/0005-Fix-build-on-Linux-6.3.patch
index 535e1628c9..f2ac4d2dc3 100644
--- a/package/dahdi-linux/0005-drivers-dahdi-fix-build-with-clang-16.patch
+++ b/package/dahdi-linux/0005-Fix-build-on-Linux-6.3.patch
@@ -1,4 +1,4 @@
-From d51c10dae5a06709983b929fc6f9fb18eec41951 Mon Sep 17 00:00:00 2001
+From c4969d756eac041758856b99a1084158c06beb7e Mon Sep 17 00:00:00 2001
 From: Brahmajit Das <brahmajit.xyz@gmail.com>
 Date: Thu, 22 Jun 2023 15:52:18 +0000
 Subject: [PATCH] drivers/dahdi: fix build with clang-16
@@ -31,15 +31,16 @@ Signed-off-by: Brahmajit Das <brahmajit.xyz@gmail.com>
 
 Upstream: https://github.com/asterisk/dahdi-linux/pull/21
 
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Bernd: updated patch for compatibility with kernel < 6.3]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
- drivers/dahdi/dahdi-sysfs.c    | 8 ++++----
- drivers/dahdi/wctc4xxp/base.c  | 2 +-
- drivers/dahdi/xpp/xbus-sysfs.c | 2 +-
- 3 files changed, 6 insertions(+), 6 deletions(-)
+ drivers/dahdi/dahdi-sysfs.c    | 12 ++++++++++--
+ drivers/dahdi/wctc4xxp/base.c  |  2 +-
+ drivers/dahdi/xpp/xbus-sysfs.c |  4 ++++
+ 3 files changed, 15 insertions(+), 3 deletions(-)
 
 diff --git a/drivers/dahdi/dahdi-sysfs.c b/drivers/dahdi/dahdi-sysfs.c
-index ca29ddba..0c5bd982 100644
+index ca29ddba..38236929 100644
 --- a/drivers/dahdi/dahdi-sysfs.c
 +++ b/drivers/dahdi/dahdi-sysfs.c
 @@ -47,7 +47,7 @@ static int span_match(struct device *dev, struct device_driver *driver)
@@ -51,16 +52,19 @@ index ca29ddba..0c5bd982 100644
  {
  	return dev_get_drvdata(dev);
  }
-@@ -68,7 +68,7 @@ static inline struct dahdi_span *dev_to_span(struct device *dev)
+@@ -68,7 +68,11 @@ static inline struct dahdi_span *dev_to_span(struct device *dev)
  			return err;				\
  	} while (0)
  
--static int span_uevent(struct device *dev, struct kobj_uevent_env *kenv)
++#if LINUX_VERSION_CODE < KERNEL_VERSION(6, 3, 0)
+ static int span_uevent(struct device *dev, struct kobj_uevent_env *kenv)
++#else
 +static int span_uevent(const struct device *dev, struct kobj_uevent_env *kenv)
++#endif
  {
  	struct dahdi_span *span;
  
-@@ -415,7 +415,7 @@ static struct {
+@@ -415,7 +419,7 @@ static struct {
  	unsigned int clean_chardev:1;
  } should_cleanup;
  
@@ -69,12 +73,15 @@ index ca29ddba..0c5bd982 100644
  {
  	return container_of(dev, struct dahdi_device, dev);
  }
-@@ -438,7 +438,7 @@ static inline struct dahdi_device *to_ddev(struct device *dev)
+@@ -438,7 +442,11 @@ static inline struct dahdi_device *to_ddev(struct device *dev)
  			return err;				\
  	} while (0)
  
--static int device_uevent(struct device *dev, struct kobj_uevent_env *kenv)
++#if LINUX_VERSION_CODE < KERNEL_VERSION(6, 3, 0)
+ static int device_uevent(struct device *dev, struct kobj_uevent_env *kenv)
++#else
 +static int device_uevent(const struct device *dev, struct kobj_uevent_env *kenv)
++#endif
  {
  	struct dahdi_device *ddev;
  
@@ -92,15 +99,18 @@ index ec6fc436..db70ea7e 100644
  #	ifdef HAVE_NET_DEVICE_OPS
  	netdev->netdev_ops = &wctc4xxp_netdev_ops;
 diff --git a/drivers/dahdi/xpp/xbus-sysfs.c b/drivers/dahdi/xpp/xbus-sysfs.c
-index d8c11dc3..29ad3619 100644
+index d8c11dc3..11b3ed3e 100644
 --- a/drivers/dahdi/xpp/xbus-sysfs.c
 +++ b/drivers/dahdi/xpp/xbus-sysfs.c
-@@ -418,7 +418,7 @@ static int astribank_match(struct device *dev, struct device_driver *driver)
+@@ -418,7 +418,11 @@ static int astribank_match(struct device *dev, struct device_driver *driver)
  			return err;				\
  	} while (0)
  
--static int astribank_uevent(struct device *dev, struct kobj_uevent_env *kenv)
++#if LINUX_VERSION_CODE < KERNEL_VERSION(6, 3, 0)
+ static int astribank_uevent(struct device *dev, struct kobj_uevent_env *kenv)
++#else
 +static int astribank_uevent(const struct device *dev, struct kobj_uevent_env *kenv)
++#endif
  {
  	xbus_t *xbus;
  	extern char *initdir;
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
