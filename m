Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8E6C433F5
	for <buildroot@archiver.kernel.org>; Tue, 30 Nov 2021 16:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6AC8C40486;
	Tue, 30 Nov 2021 16:14:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kE-Rqo2I4sTe; Tue, 30 Nov 2021 16:14:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95C1740465;
	Tue, 30 Nov 2021 16:14:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 70A0B1BF2F0
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 16:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 679CE61BBA
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 16:11:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gh3oRpunRU4Z for <buildroot@lists.busybox.net>;
 Tue, 30 Nov 2021 16:11:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E880761BAE
 for <buildroot@buildroot.org>; Tue, 30 Nov 2021 16:11:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8B55E920D9; Tue, 30 Nov 2021 16:07:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 30 Nov 2021 17:07:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d17e8563644c5f847330b982e2a0884ccd9a5b7a
X-Git-Newrev: de97e3ca6774133783b593e99fbac8d3f38d4db6
X-Patchwork-Hint: ignore
Message-Id: <20211130160702.8B55E920D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/open62541: drop spurious space
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

commit: https://git.buildroot.net/buildroot/commit/?id=de97e3ca6774133783b593e99fbac8d3f38d4db6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop spurious space added by commit
b36ea68b5ad0f89ffd92cac3f91654e180683b1c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/open62541/open62541.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
index 671ec3b2dc..66777ce501 100644
--- a/package/open62541/open62541.mk
+++ b/package/open62541/open62541.mk
@@ -27,7 +27,7 @@ OPEN62541_CONF_OPTS += -DUA_NAMESPACE_ZERO=MINIMAL
 else ifeq ($(BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_REDUCED),y)
 OPEN62541_CONF_OPTS += -DUA_NAMESPACE_ZERO=REDUCED
 else ifeq ($(BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_FULL),y)
-OPEN62541_CONF_OPTS +=  -DUA_NAMESPACE_ZERO=FULL
+OPEN62541_CONF_OPTS += -DUA_NAMESPACE_ZERO=FULL
 endif
 
 ifeq ($(BR2_PACKAGE_OPEN62541_JSON_ENCODING),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
