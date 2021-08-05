Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB901C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 10:08:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97460610A8
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 10:08:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 97460610A8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66ADE4036D;
	Thu,  5 Aug 2021 10:08:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5lye2u5VnL0f; Thu,  5 Aug 2021 10:08:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7CCCC40327;
	Thu,  5 Aug 2021 10:08:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F1DD21BF298
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 10:07:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1A538376B
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 10:07:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QprYvOMJCfcD for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 10:07:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B86D837BC
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 10:07:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B23BA8B768; Thu,  5 Aug 2021 10:07:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 5 Aug 2021 11:54:44 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 8e5db811fcf724a0e1ef31dfc6f39e97cf827095
X-Git-Newrev: 85a83452c15203a13a78f0b7ca730849588d5474
X-Patchwork-Hint: ignore
Message-Id: <20210805100700.B23BA8B768@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/audit: replace
 deprecated matchpathcon calls from init script
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
Content-Type: multipart/mixed; boundary="===============4947076632686391120=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============4947076632686391120==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=85a83452c15203a13a78f0b7ca730849588d5474
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

This patch replace matchpathcon calls in the auditd init script by
calls to selabel_lookup. Indeed, matchpathcon is now deprecated, and
this causes warning during the boot process.

Signed-off-by: José Pekkarinen <jose.pekkarinen@unikie.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 90dd1d6178b01f6da3e59e43d0c7efdf984a72d8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/audit/S02auditd | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/audit/S02auditd b/package/audit/S02auditd
index 2ecf0f1df9..0eef881cee 100644
--- a/package/audit/S02auditd
+++ b/package/audit/S02auditd
@@ -18,9 +18,9 @@ start(){
 
 	# Create dir to store log files in if one doesn't exist. Create
 	# the directory with SELinux permissions if possible
-	command -v matchpathcon >/dev/null 2>&1
+	command -v selabel_lookup >/dev/null 2>&1
 	if [ $? = 0 ]; then
-		mkdir -p /var/log/audit -Z `matchpathcon -n /var/log/audit`
+		mkdir -p /var/log/audit -Z `selabel_lookup -b file -k /var/log/audit`
 	else
 		mkdir -p /var/log/audit
 	fi

--===============4947076632686391120==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============4947076632686391120==--
