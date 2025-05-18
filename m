Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48EAFC3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1395684A0B;
	Mon, 19 May 2025 11:05:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qEER5rEj51io; Mon, 19 May 2025 11:05:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3854584A0C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3854584A0C;
	Mon, 19 May 2025 11:05:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FE33E4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02FEF41E8E
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VOw-rDKam-Kf for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C57B941213
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C57B941213
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BABD0872E7; Mon, 19 May 2025 10:40:09 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 14:15:50 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e3a15862fbfc49a22f7cc94ef1fdd11abc701d7d
X-Git-Newrev: 913ca297dc6bbf2a082680aaf467e730ae075c06
X-Patchwork-Hint: ignore
Message-Id: <20250519104009.BABD0872E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/sox: add ignore CVE
 entry for CVE-2019-1010004
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=913ca297dc6bbf2a082680aaf467e730ae075c06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This CVE is a duplicate of CVE-2017-18189, according to
https://security-tracker.debian.org/tracker/CVE-2019-1010004, and
https://security-tracker.debian.org/tracker/CVE-2019-1010004 also
points to the commit that also fixed CVE-2017-18189.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sox/sox.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/sox/sox.mk b/package/sox/sox.mk
index 8922f98d5c..d8a0d7d1df 100644
--- a/package/sox/sox.mk
+++ b/package/sox/sox.mk
@@ -41,7 +41,8 @@ SOX_IGNORE_CVES += CVE-2017-15372
 SOX_IGNORE_CVES += CVE-2017-15642
 
 # sox-14.4.2-13-g09d7388c
-SOX_IGNORE_CVES += CVE-2017-18189
+# CVE-2019-1010004 is a duplicate of CVE-2017-18189
+SOX_IGNORE_CVES += CVE-2017-18189 CVE-2019-1010004
 
 # sox-14.4.2-38-gf7091126
 SOX_IGNORE_CVES += CVE-2019-8354
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
