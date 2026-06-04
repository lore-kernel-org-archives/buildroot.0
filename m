Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70315CD8C80
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 483A840F8D;
	Fri,  5 Jun 2026 12:38:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cdi95Bjby62G; Fri,  5 Jun 2026 12:38:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3FF440F85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663104;
	bh=x370uyjs/lhESfKeIQNc8Pol3lRf0QLMtnLZgr/rGvo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=m6eBN1trgBvosVfiGruXRm5ZzRRyYsAlQhIuUvM0i8MC27+g/llNC04D93RCU9Dgr
	 SV0qvm1SOqWu1rp4tjLbFeNInUYnbWGqkP6CCLBnsHi4Jbg9BJ567v/QxfQ2oyQ3CD
	 Zmvjzb94Azi0a/e9BviLunHT6QOUiB1in3JX5HXfrxAiJ9uIJ3uedfXW/3ZhLjoZvQ
	 ggJQ/mZ7suckdlX54iAgZJzAHbxsn1JS4TnEKhM867oQA6LUaVra0+3TfPf9oPQhFW
	 aQl6fnEQcFLxC88vqrPKdjyKoYZ5UdMFXzwnXvdp7kyVx699KkD1kRJltNw57QMNDg
	 jdBSMWpgGnKmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3FF440F85;
	Fri,  5 Jun 2026 12:38:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 01555388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D87581E7B
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mmu5aZrgDDi8 for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:37:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28F5F81E4F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28F5F81E4F
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 527F787B3F; Fri,  5 Jun 2026 12:37:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 11:52:18 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: afe1b9c0acae6a33c26b6d0ca897ab7dbd9e6630
X-Git-Newrev: 60a1e76b4ba98a68332b135b2ffdcfc542e42f62
X-Patchwork-Hint: ignore
Message-Id: <20260605123712.527F787B3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/jq: add CPE vendor
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/60a1e76b4ba98a68332b135b2ffdcfc542e42f62
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The CPE "cpe:2.3:a:jqlang:jq:*:*:*:*:*:*:*:*" is valid for this package.

See the GHSA [1] and the associated CVE [2].

[1] https://github.com/jqlang/jq/security/advisories/GHSA-rmpv-jgvr-wpr9
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-44777

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3dad008858f656c30d7b7040aaed46786f370493)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/jq/jq.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/jq/jq.mk b/package/jq/jq.mk
index e21e4376ea..ad3b97ea4b 100644
--- a/package/jq/jq.mk
+++ b/package/jq/jq.mk
@@ -8,7 +8,7 @@ JQ_VERSION = 1.7.1
 JQ_SITE = https://github.com/jqlang/jq/releases/download/jq-$(JQ_VERSION)
 JQ_LICENSE = MIT (code), ICU (decNumber), CC-BY-3.0 (documentation)
 JQ_LICENSE_FILES = COPYING
-JQ_CPE_ID_VALID = YES
+JQ_CPE_ID_VENDOR = jqlang
 JQ_INSTALL_STAGING = YES
 
 # 0001-CVE-2024-23337.patch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
