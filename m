Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0623D2502E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE72882E95;
	Tue, 13 Jan 2026 19:36:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F0FL93YEKF2j; Tue, 13 Jan 2026 19:36:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A067482F0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768332989;
	bh=NkHqCfAp24uHmLyuTaMm9fFij16bOwU2RZZL/Qm8Z0A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pLUNROHBF9UWxJDI9QMgRUuJvz4fQR6pED9tQP59JT9UKKff9ocnVUuJDTdC1JHTg
	 xNAHEReiob3k86z3BWv22DJDfgn8S7A8qQKJ5mDQbeEFUwYw8luWYAvcU91pTnoHZh
	 grsLdp/kMJa2tsa5eklaOCPSwqljyAunoA+rE85msFC4v+p/u/HFenFFu6pxKEzg6f
	 JccFPFt+3cB2HYvfC9AYdoJW3De7oQAKnmJ6VRxTDL7uBPP8Ijoz9eHU9ZdiieyoV2
	 I4xHsmsCeND7Xyn/Zox7NLKUdTFPdhtGXGwRAQNj3pcghWtdWRqoHU3145U4PMxrnR
	 wZhKypxlCfK5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A067482F0F;
	Tue, 13 Jan 2026 19:36:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AC691231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 617C460BCF
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LEKBWbvlAaQJ for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA23F60BD0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA23F60BD0
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AC1138197D; Tue, 13 Jan 2026 19:36:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:23:39 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 1e177c568cbc29e61ec83fd96340defda897f6ba
X-Git-Newrev: 55a3240a9efd3af4b69fcd5db1bdb7500a6f4820
X-Patchwork-Hint: ignore
Message-Id: <20260113193618.AC1138197D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] DEVELOPERS: add Giulio
 Benetti to Putty package
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

commit: https://git.buildroot.net/buildroot/commit/?id=55a3240a9efd3af4b69fcd5db1bdb7500a6f4820
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 5c6552cd60b82cbfac6918de296772b2f37c35a1)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f70c91d27f..aff9f6668b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1289,6 +1289,7 @@ F:	package/minicom/
 F:	package/mongoose/
 F:	package/mmc-utils/
 F:	package/nfs-utils/
+F:	package/putty/
 F:	package/python-libconf/
 F:	package/python-uvloop/
 F:	package/qt5/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
