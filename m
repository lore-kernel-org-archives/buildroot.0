Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C42C7CCD184
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 21:17:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6974D4111F;
	Thu,  9 Oct 2025 21:17:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4_9mPDNEFg0G; Thu,  9 Oct 2025 21:17:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 912BB41110
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 912BB41110;
	Thu,  9 Oct 2025 21:17:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DD387119
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 21:17:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D034083F8B
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 21:17:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qwD5ecfvz5G2 for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 21:17:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4CEB83F04
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4CEB83F04
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 21:17:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B31D086E60; Thu,  9 Oct 2025 21:17:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 Oct 2025 23:15:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b39d3d8f62182d734c368e9197e1089792f2f958
X-Git-Newrev: 4d88cc285dbd1a1ea379e4ca1f07f133fff3d46b
X-Patchwork-Hint: ignore
Message-Id: <20251009211752.B31D086E60@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rsyslog: fix hash file
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4d88cc285dbd1a1ea379e4ca1f07f133fff3d46b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit [1] introduced an extra empty line in the hash file
which makes check-package to report the error:

    package/rsyslog/rsyslog.hash:4: consecutive empty lines

This commit fixes that.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/b39d3d8f62182d734c368e9197e1089792f2f958

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/rsyslog/rsyslog.hash | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/rsyslog/rsyslog.hash b/package/rsyslog/rsyslog.hash
index d59eff7eed..546682c9f7 100644
--- a/package/rsyslog/rsyslog.hash
+++ b/package/rsyslog/rsyslog.hash
@@ -1,7 +1,6 @@
 # From http://www.rsyslog.com/downloads/download-v8-stable/
 sha256  c89b1e74d36d0ca4a95b74a1abe36ed0b1faac8b7c8be471a8415cfa776206fd  rsyslog-8.2508.0.tar.gz
 
-
 # Locally calculated
 sha256  054b3a047d9232376a46b87356b19b0c0c2924cb5e6911ab96a01fc4b515f083  COPYING
 sha256  8743ad560dea1229d4f46cd603e10874db41a27f3c74f64e958ef123f3943fab  COPYING.ASL20
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
