Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DCF510ED650
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 09:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFF45612CF;
	Fri, 27 Mar 2026 09:59:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UHqLWtWy-b-D; Fri, 27 Mar 2026 09:59:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B654612AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774605563;
	bh=dzirbEjK1BcpZA8Q2GtCWPoFjAVKfCM/JEcTp5uEGac=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CI8H6Mq+2rNVDzlLa5oEQQiGTUf/uLDPSj7eS52DWJ44edyQX1zQiSotwTNNZ3OTn
	 1OCykJl6Db47gDobRt0gZ/lCsiWohfT6PHdcZDLysrmjiLT3cz7LSYsTsUP5L78FsO
	 VoXqClEPsmLZf8fZjTRob6//LzHc3k7qPmLfUVlJkJ8p6toOx1GN1hDzkdbS6PIAjX
	 N0F+bT8JI9o/1mPWnx/LM4Z5sXoxE31iH9z+odGWOePVF5zuMoRiGI/ekjfUP5mxNL
	 rsK/2ZQfXsPBd/ubqc70tQAfj1fxc7lluBQLC3Xj5SW/LaKUuEs3uEeMdMwoL5QnoX
	 5VZWSJCH1/dDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B654612AC;
	Fri, 27 Mar 2026 09:59:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B92D249
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 09:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5298A83D7F
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 09:59:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 85z2RZVw0SLm for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 09:59:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1260C83D62
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1260C83D62
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 09:59:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 642987FBBB; Fri, 27 Mar 2026 09:59:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 27 Mar 2026 10:57:15 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: b2c698886f9046c4ea37a34f6ccc5f0c20c93ec5
X-Git-Newrev: 470edc2923f285669e34a57cd223fd37ef25d9a2
X-Patchwork-Hint: ignore
Message-Id: <20260327095916.642987FBBB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/wireshark:
 security bump to v4.2.14
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/470edc2923f285669e34a57cd223fd37ef25d9a2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

For more information on the version bump, see:

- https://www.wireshark.org/docs/relnotes/wireshark-4.2.14.html

Fixes the following vulnerability:

- CVE-2025-11626:
    MONGO dissector infinite loop in Wireshark 4.4.0 to 4.4.9 and 4.2.0 to
    4.2.13 allows denial of service

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-11626

(cherry picked from commit 2aaeb10bce055d63ea0855914a8fbac4f6390611)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index f1f2f58442..521fea662c 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.2.13.txt
-sha1  e5a08396a98d5dfba4078c66677aacd50d47ec90  wireshark-4.2.13.tar.xz
-sha256  2454aa650276264d23aca28e1b62eb5d4bd12b64aa261d38c06b33f97b8fa3dd  wireshark-4.2.13.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.2.14.txt
+sha1  e972062abc0d15db34c3a0186c39511efb29ea34  wireshark-4.2.14.tar.xz
+sha256  098177f021951638f5bdca5b01f284c14fcc3f6c804f7aa2ca00fdcb99c7a166  wireshark-4.2.14.tar.xz
 
 # Locally calculated
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index bd81224ae7..3a92c4cfa4 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 4.2.13
+WIRESHARK_VERSION = 4.2.14
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
