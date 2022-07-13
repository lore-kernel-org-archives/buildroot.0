Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9072CC43334
	for <buildroot@archiver.kernel.org>; Wed, 13 Jul 2022 10:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1977F6109D;
	Wed, 13 Jul 2022 10:54:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1977F6109D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fLq7HuaiWZoI; Wed, 13 Jul 2022 10:54:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3082A60C08;
	Wed, 13 Jul 2022 10:54:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3082A60C08
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EFADB1C116E
 for <buildroot@lists.busybox.net>; Wed, 13 Jul 2022 10:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA51742309
 for <buildroot@lists.busybox.net>; Wed, 13 Jul 2022 10:54:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA51742309
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r5D86VHWNdLK for <buildroot@lists.busybox.net>;
 Wed, 13 Jul 2022 10:54:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0326422EA
 for <buildroot@buildroot.org>; Wed, 13 Jul 2022 10:54:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0326422EA
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id F12C283879; Wed, 13 Jul 2022 10:41:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Jul 2022 12:52:54 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 1dfaf41d9d25acc451fe2e83d8125af405ba44fa
X-Git-Newrev: d1e88798c14b3aed9bf1bd178ec660a3ebd2733a
X-Patchwork-Hint: ignore
Message-Id: <20220713104108.F12C283879@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/apache: add
 brotli as optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=d1e88798c14b3aed9bf1bd178ec660a3ebd2733a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fixes:
http://autobuild.buildroot.net/results/90e/90e3a2aaf0ce0451b80c71743209797abeb83d0a/
http://autobuild.buildroot.net/results/006/006f94bb216a77f073a5670fa2f393c43f15a977/
http://autobuild.buildroot.net/results/dd6/dd69e665e51ce6b30e303a4d4670e9edbb159aea/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 0eadc83b9f20de6dfd24ae02ddf174e947dbb331)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apache/apache.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index b2c855aa36..a6fb59d26b 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -45,6 +45,13 @@ APACHE_CONF_OPTS = \
 	--with-mpm=$(APACHE_MPM) \
 	--disable-luajit
 
+ifeq ($(BR2_PACKAGE_BROTLI),y)
+APACHE_CONF_OPTS += --enable-brotli
+APACHE_DEPENDENCIES += brotli
+else
+APACHE_CONF_OPTS += --disable-brotli
+endif
+
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
 APACHE_DEPENDENCIES += libxml2
 # Apache wants the path to the header file, where it can find
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
