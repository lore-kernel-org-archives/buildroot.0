Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B79E7070E
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 10:31:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B2DD83C66;
	Thu, 21 Sep 2023 10:31:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B2DD83C66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9aQG22I3EZNp; Thu, 21 Sep 2023 10:31:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3D0E83C68;
	Thu, 21 Sep 2023 10:31:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3D0E83C68
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 112A51BF3C2
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 10:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 789BD83C51
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 10:31:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 789BD83C51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K6ZHe9Ow1ftd for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 10:31:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37F8581FC9
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 10:31:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37F8581FC9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2768F87421; Thu, 21 Sep 2023 10:31:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Sep 2023 12:30:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 38f39a603167148476684254a57372a5f4ac8e09
X-Git-Newrev: a01a6b8dc840eb99528d3c876d18e1f8952d2a58
X-Patchwork-Hint: ignore
Message-Id: <20230921103102.2768F87421@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fail2ban: drop CVE-2021-32749 from
 IGNORE_CVES
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a01a6b8dc840eb99528d3c876d18e1f8952d2a58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CVE-2021-32749 affects fail2ban <= 0.9.7, 0.10.0 through 0.10.6, and
0.11.0 through 0.11.2.
The mentioned patch was removed in 76853089 when bumping to 1.0.1.

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fail2ban/fail2ban.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/fail2ban/fail2ban.mk b/package/fail2ban/fail2ban.mk
index 828dfdd6e1..0c1208c6fe 100644
--- a/package/fail2ban/fail2ban.mk
+++ b/package/fail2ban/fail2ban.mk
@@ -12,9 +12,6 @@ FAIL2BAN_CPE_ID_VENDOR = fail2ban
 FAIL2BAN_SELINUX_MODULES = fail2ban
 FAIL2BAN_SETUP_TYPE = setuptools
 
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
