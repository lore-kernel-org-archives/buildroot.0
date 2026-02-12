Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11FF1EF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C968841E8F;
	Fri, 13 Feb 2026 19:35:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jyzXlB0AMLpn; Fri, 13 Feb 2026 19:35:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA84641E85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011351;
	bh=u0zLBEzOYL9Xv1+v5S4vIiFd0xoIRHqxvlmGGSd3Qto=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eVapADmM9I4ZxFSnKHyeGgF5L8ijydMEe2jmLtr9Y+3HlkeWw3RdfnE/s1ZfrLWEP
	 GqylVtqIfz8OTw+eZ8EtZ/KmwX/sBNl5/1DsXALQqg9xosE9P3S8Gjoi3tW/CRQ2M+
	 Rz/a/EYXQzkYCSnyHJ7iSTkolu/1XD39lp9aQyu5BANSXTphRE3uukkTSRfOB4s+1z
	 fMcAVRRc8ANbHSe5+J30y9DpWf0qFPwpZKXxZj1hUhww0g/w7fV1aSVJ1zt1DTS0W4
	 WfUC5bbRR3/TzUfHXIl6852RIOBCTtKzzhTdd8Ed9EJ7ARyBbz684prXi/auwvuzOw
	 ySLpe1zTVE9Cg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA84641E85;
	Fri, 13 Feb 2026 19:35:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AF1FEC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B249E844B9
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XSBRjEvXzC1i for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5157484520
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5157484520
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 468A98268D; Fri, 13 Feb 2026 19:35:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:31:16 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 393b2270c4d894d229d7e72724cb19bc88a97801
X-Git-Newrev: acce5714ed12b34b8673ae0e03e6d2dc0b073e21
X-Patchwork-Hint: ignore
Message-Id: <20260213193527.468A98268D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] boot/at91bootstrap3: fix
 help of BR2_TARGET_AT91BOOTSTRAP3_LICENSE_FILES
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/acce5714ed12b34b8673ae0e03e6d2dc0b073e21
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 12472fe6fff968b8fb17ad7c1c166706c696479d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 boot/at91bootstrap3/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/at91bootstrap3/Config.in b/boot/at91bootstrap3/Config.in
index 85cf66824d..1bf6e98ba3 100644
--- a/boot/at91bootstrap3/Config.in
+++ b/boot/at91bootstrap3/Config.in
@@ -74,7 +74,7 @@ config BR2_TARGET_AT91BOOTSTRAP3_LICENSE_FILES
 	default "LICENSES/MIT.txt"
 	help
 	  A space-separated list of license files related to the
-	  AT91Bootstrap3 kernel package.
+	  AT91Bootstrap3 package.
 
 config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_PATCH_DIR
 	string "custom patch dir"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
