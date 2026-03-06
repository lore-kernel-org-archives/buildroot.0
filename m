Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D77EFCC062
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37ECD41E66;
	Fri,  6 Mar 2026 19:52:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7jPtkcsI8xI2; Fri,  6 Mar 2026 19:52:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54E3541FEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826776;
	bh=uW6QeiKeocZILrk+4TXU/mmVicCMJL3FYfUKIuMiooI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Z5OCTZc+aeMgSIYxSSL+7/2PHOk0J6eW0TWQrzaVOS0qUSsjOP3RvkjXcwjZdzhB2
	 Forh2mk7tSy6c2/X6mNFY5l3q1HthUI3+3DjxCBgp5wVK0iibgEUp85y/QorGdgrKK
	 5p53UX3Ao3cQWmCsBeLPa0gJfhXlmKm3PW5Kk3msKZdihaUYBXrglkc8MbqjS/1Zhq
	 T6BFIvCW1gjJNT0T5M/xU0WVVMY28xhKahOAMcyUV5k6xD4ky0NR7u0UUQGGRfUtFS
	 +xECiltW+fRcw/9s/WJ2ZeNx+PVBEkw3JeoIwOwX1QZhlSc5opMPQQh85INiUWZXBw
	 GAt5mkR8NMb+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54E3541FEF;
	Fri,  6 Mar 2026 19:52:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DCAC25B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77FF041EB5
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uvwx8wybVSE4 for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:52:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E18A41E53
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E18A41E53
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 92F8686834; Fri,  6 Mar 2026 19:52:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 14:15:18 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f05d9ba5c998d778a2c6afe484d35f7516641914
X-Git-Newrev: 456ecca0acc79412d3ceb3110284c99d44e5cfa3
X-Patchwork-Hint: ignore
Message-Id: <20260306195223.92F8686834@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/freerdp: add
 CVE-2025-68118 to IGNORE_CVES
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/456ecca0acc79412d3ceb3110284c99d44e5cfa3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Only affects Windows platform. See [1] for more information.

[1] https://security-tracker.debian.org/tracker/CVE-2025-68118

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit dc8fc4b80367a64eaa36712d67e1795df3baa415)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/freerdp/freerdp.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index f240d789dd..a043557828 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -17,6 +17,10 @@ FREERDP_CPE_ID_VENDOR = freerdp
 # https://security-tracker.debian.org/tracker/CVE-2024-32662
 FREERDP_IGNORE_CVES += CVE-2024-32662
 
+# Windows only
+# https://security-tracker.debian.org/tracker/CVE-2025-68118
+FREERDP_IGNORE_CVES += CVE-2025-68118
+
 FREERDP_INSTALL_STAGING = YES
 
 FREERDP_CONF_OPTS = -DWITH_MANPAGES=OFF -Wno-dev -DWITH_GSTREAMER_0_10=OFF
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
