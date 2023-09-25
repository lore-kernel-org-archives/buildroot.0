Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E03EECE7A97
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 12:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9878860757;
	Mon, 25 Sep 2023 12:05:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9878860757
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HQJ7wYV1Mq4t; Mon, 25 Sep 2023 12:05:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFF32611B1;
	Mon, 25 Sep 2023 12:05:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFF32611B1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7E7F51BF2C9
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 12:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57C06418F0
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 12:04:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57C06418F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pp02RW8FD6r6 for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 12:04:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5870440864
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 12:04:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5870440864
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 44CED8776F; Mon, 25 Sep 2023 12:04:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Sep 2023 13:53:41 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 3ab385d89cffead9184f2278e4702ab196665dce
X-Git-Newrev: 0f94ba0ff3e5221434fe39dcccd1e5ed055c44c3
X-Patchwork-Hint: ignore
Message-Id: <20230925120415.44CED8776F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/fail2ban: drop
 CVE-2021-32749 from IGNORE_CVES
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

commit: https://git.buildroot.net/buildroot/commit/?id=0f94ba0ff3e5221434fe39dcccd1e5ed055c44c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

CVE-2021-32749 affects fail2ban <= 0.9.7, 0.10.0 through 0.10.6, and
0.11.0 through 0.11.2.
The mentioned patch was removed in 76853089 when bumping to 1.0.1.

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a01a6b8dc840eb99528d3c876d18e1f8952d2a58)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fail2ban/fail2ban.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/fail2ban/fail2ban.mk b/package/fail2ban/fail2ban.mk
index 7ad22d02d1..34f2341d33 100644
--- a/package/fail2ban/fail2ban.mk
+++ b/package/fail2ban/fail2ban.mk
@@ -12,9 +12,6 @@ FAIL2BAN_CPE_ID_VENDOR = fail2ban
 FAIL2BAN_SELINUX_MODULES = fail2ban
 FAIL2BAN_SETUP_TYPE = distutils
 
-# 0001-fixed-possible-RCE-vulnerability-unset-escape-variable.patch
-FAIL2BAN_IGNORE_CVES += CVE-2021-32749
-
 define FAIL2BAN_PYTHON_2TO3
 	$(HOST_DIR)/bin/2to3 --write --nobackups --no-diffs $(@D)/bin/* $(@D)/fail2ban
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
