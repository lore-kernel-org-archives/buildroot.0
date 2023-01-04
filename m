Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9763AC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32C4E4F0CD;
	Tue, 21 Feb 2023 00:12:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32C4E4F0CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nCTMR6BsID86; Tue, 21 Feb 2023 00:12:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 237454F0DA;
	Tue, 21 Feb 2023 00:12:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 237454F0DA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 879731BF27E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 979CF6FA9C
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 979CF6FA9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SvfBQ89dH_2i for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CDA3E6F9EC
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDA3E6F9EC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BDB218648F; Mon, 20 Feb 2023 20:52:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Jan 2023 23:08:34 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 41aa369d01a4dd6646390066f44135d99f926fe4
X-Git-Newrev: eae97036f34e69e2ca197cd31fd87c673f2ebe37
X-Patchwork-Hint: ignore
Message-Id: <20230220205225.BDB218648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/rhash: drop dangling
 RHASH_ADDLDFLAGS
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

commit: https://git.buildroot.net/buildroot/commit/?id=eae97036f34e69e2ca197cd31fd87c673f2ebe37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit "ead2afda13 package/rhash: bump version to 1.4.0" dropped the
only usage of this define but the define itself was left dangling.

Drop it now.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rhash/rhash.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/rhash/rhash.mk b/package/rhash/rhash.mk
index 8c33de1862..1f7456e4e7 100644
--- a/package/rhash/rhash.mk
+++ b/package/rhash/rhash.mk
@@ -12,7 +12,6 @@ RHASH_LICENSE_FILES = COPYING
 RHASH_CPE_ID_VENDOR = rhash_project
 RHASH_INSTALL_STAGING = YES
 RHASH_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
-RHASH_ADDLDFLAGS = $(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
 RHASH_CONF_OPTS += --enable-gettext
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
