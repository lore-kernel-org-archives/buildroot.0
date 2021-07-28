Return-Path: <SRS0=nMnf=MU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31E87C4338F
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 19:42:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E082160234
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 19:42:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E082160234
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B17DA834B9;
	Wed, 28 Jul 2021 19:42:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xRU96VFujXmp; Wed, 28 Jul 2021 19:42:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 191D182F37;
	Wed, 28 Jul 2021 19:42:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D75CA1C1135
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 19:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE52240575
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 19:41:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iOY8BoHKVN2w for <buildroot@lists.busybox.net>;
 Wed, 28 Jul 2021 19:41:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DBB064054E
 for <buildroot@buildroot.org>; Wed, 28 Jul 2021 19:41:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 81FB289106; Wed, 28 Jul 2021 19:07:08 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 28 Jul 2021 21:41:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 489cbfd7df1650a8790b3bdbcd69a2357f19764b
X-Git-Newrev: 1b830de9bcdf138738c6364b764f1becf8c88618
X-Patchwork-Hint: ignore
Message-Id: <20210728190708.81FB289106@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nginx-modsecurity: fix static build
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=1b830de9bcdf138738c6364b764f1becf8c88618
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix static build which has been enabled since bump of libmodsecurity to
version 3.0.5 in commit 464d0be380c84ac7c3f1684e49153c3868280d7e

Fixes:
 - http://autobuild.buildroot.org/results/e5a9eb8448980f1c5cafe97180b7d1f48ddf02ca

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-config-use-pkg-config.patch               | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/nginx-modsecurity/0001-config-use-pkg-config.patch b/package/nginx-modsecurity/0001-config-use-pkg-config.patch
new file mode 100644
index 0000000000..3c74fa4b59
--- /dev/null
+++ b/package/nginx-modsecurity/0001-config-use-pkg-config.patch
@@ -0,0 +1,29 @@
+From 2907dcd628242eb29920321fb3a744915d11888f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 26 Jul 2021 08:29:21 +0200
+Subject: [PATCH] config: use pkg-config
+
+Change to using pkg-config to find the path to modsecurity and its
+dependencies.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ config | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/config b/config
+index c6e7467..e20190f 100644
+--- a/config
++++ b/config
+@@ -50,7 +50,7 @@ END
+ else
+     # auto-discovery
+     ngx_feature="ModSecurity library"
+-    ngx_feature_libs="-lmodsecurity"
++    ngx_feature_libs="$(${PKG_CONFIG:=pkg-config} --libs modsecurity)"
+ 
+     . auto/feature
+ 
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
