Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC1BD0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:02:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4E878145A;
	Wed,  7 Jan 2026 18:02:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5A4BCbsKl9L5; Wed,  7 Jan 2026 18:02:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D29F982E19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808929;
	bh=bbxeJxZxFZRFEmQTyB0nQAsDoIVe68u6P28F/wenQHw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XgHdC62KQN4kI+1OHrIKo5FzuYnfZQJ0Jhn17ZaqI6AKj9rH7qPv6kZeolt9ESqnW
	 7yR2PieQf95icitr+PH4P6DqfyQ3aIp+NyaMAlclwk4gw5AkpD7bImgFmSPaaBMSFQ
	 ZyGBqRjtnpmpn3ht/B6sjAgu7uSRbYyCBN8+FTGyYbW3suPeFwmpeEs2Shn4HAtln1
	 l1tdz1oRkiEU6e99tCFVLqpmMspDCzl36WenztCGqX3BrS7CaLWH1/0CQHnSI1hdei
	 WcjRscbP4p0zfGKzSU9DlXsqfhosJRWnkxddcEVI4aTTyHt+CgTvQNAI+2Z9aIDZm/
	 62ZBPnlzl9ldA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D29F982E19;
	Wed,  7 Jan 2026 18:02:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 670AA25B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD649608AD
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j4OzNZvk5rXn for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 319DB607FC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 319DB607FC
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 300C180333; Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:02:02 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 930866069681edc1dad82a1943da71e27fc92f87
X-Git-Newrev: 0315fd3d1fc17f88b41aa125bd4567df5960fb6e
X-Patchwork-Hint: ignore
Message-Id: <20260107180115.300C180333@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/kvmtool: remove
 unneeded KVMTOOL_EXTRA_LDFLAGS
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

commit: https://git.buildroot.net/buildroot/commit/?id=0315fd3d1fc17f88b41aa125bd4567df5960fb6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Buildroot commit [1] "kvmtool: bump to f77d646ba0" removed the
definition of KVMTOOL_EXTRA_LDFLAGS but forgot to remove its usage
in KVMTOOL_MAKE_OPTS.

This commit removes it since it is no longer needed.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/f20615b53e83d6263346cb038d59df8e8d6b2b74

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 443307ef50e0a5b14b095178b7c8d59ad3639ab4)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/kvmtool/kvmtool.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kvmtool/kvmtool.mk b/package/kvmtool/kvmtool.mk
index 7fec6643f8..6d94c41aaf 100644
--- a/package/kvmtool/kvmtool.mk
+++ b/package/kvmtool/kvmtool.mk
@@ -22,7 +22,7 @@ KVMTOOL_CPE_ID_VALID = YES
 # Disable -Werror, otherwise musl is not happy
 KVMTOOL_MAKE_OPTS = \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
-	LDFLAGS="$(TARGET_LDFLAGS) $(KVMTOOL_EXTRA_LDFLAGS)" \
+	LDFLAGS="$(TARGET_LDFLAGS)" \
 	WERROR=0
 
 define KVMTOOL_BUILD_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
