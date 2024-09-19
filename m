Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F402CF3963
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 20:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00EF64335A;
	Thu, 19 Sep 2024 20:01:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RLQEyZxvlLiJ; Thu, 19 Sep 2024 20:01:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E16284335E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E16284335E;
	Thu, 19 Sep 2024 20:01:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 76F811BF215
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 19:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D837E42B20
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 19:59:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ts5cpbCysHKa for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 19:59:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C667442B29
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C667442B29
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 19:59:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C0A02821B9; Thu, 19 Sep 2024 19:59:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 13:56:05 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: b4c08cf4700cb05c5593bd9a60d90609d6f3130a
X-Git-Newrev: 48ab6da3ef03515fed48269bd990fffea874caa7
X-Patchwork-Hint: ignore
Message-Id: <20240919195949.C0A02821B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/libpam-nfc: fix
 typo in help text
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

commit: https://git.buildroot.net/buildroot/commit/?id=48ab6da3ef03515fed48269bd990fffea874caa7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 415542a23536e9a1db7ae7daf13c068352af4a2a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpam-nfc/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libpam-nfc/Config.in b/package/libpam-nfc/Config.in
index ce3a3eeb19..3dce8d8e4a 100644
--- a/package/libpam-nfc/Config.in
+++ b/package/libpam-nfc/Config.in
@@ -2,6 +2,6 @@ config BR2_PACKAGE_LIBPAM_NFC
 	bool "libpam-nfc"
 	select BR2_PACKAGE_LIBNFC
 	help
-	  NFC-based PAM authentification module.
+	  NFC-based PAM authentication module.
 
 	  https://github.com/nfc-tools/pam_nfc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
