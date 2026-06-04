Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C1AFCD6E7D
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F418412DE;
	Fri,  5 Jun 2026 12:40:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5t03R-UIymIG; Fri,  5 Jun 2026 12:40:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D2CF41240
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663213;
	bh=zV55u2gpSC4TFntU7xeqTzjD3jZMpx0IzI8XvoRViVs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=R6Vkq3Lm3EUKXM7ga9wNU4iwzKYismcNRE1yLk2HMwb1uAnrnXS0DAr/Diohmj6i8
	 9Z29Css/pLHl98XY0lxl+eRs/zLi568ERZAmCqNIXSXVacDtqQ+bRFCFrZZpDNfY14
	 5F9J1cD54PgZGvytbGetnO42R482iaWoyLjXcqmm3tpOEzVPPbEeT+S7boCQWMu4Gv
	 HZMLFH++5PUPiYZzprgWtXpLMXrJzrECfL+vxOsf0hFd+bWSK4xiW93Ot4rio/ZeH/
	 CeL4TF0AlXDb7vBjF/MYMl2/5jV7Qm7qIuctXgPuQiUp3k3VCinTSsHSQGU5cqQ3S/
	 A3sB58zMBAkaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D2CF41240;
	Fri,  5 Jun 2026 12:40:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 023AF388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3817D82014
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ShfBd12ENmq8 for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87C5581FF6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87C5581FF6
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B127487B3B; Fri,  5 Jun 2026 12:38:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 11:52:21 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 746b5ecf8de7eaf88884525373a3c5561c2a6c6b
X-Git-Newrev: 6aeadf3b77bf9785d7c146ba4d9e024a7d791089
X-Patchwork-Hint: ignore
Message-Id: <20260605123836.B127487B3B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/jq: add CPE vendor
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6aeadf3b77bf9785d7c146ba4d9e024a7d791089
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
index b0776021fc..19a130b694 100644
--- a/package/jq/jq.mk
+++ b/package/jq/jq.mk
@@ -9,7 +9,7 @@ JQ_SITE = https://github.com/jqlang/jq/releases/download/jq-$(JQ_VERSION)
 JQ_LICENSE = MIT (code), ICU (decNumber), CC-BY-3.0 (documentation), \
 	BSD-2-Clause (strptime)
 JQ_LICENSE_FILES = COPYING
-JQ_CPE_ID_VALID = YES
+JQ_CPE_ID_VENDOR = jqlang
 JQ_INSTALL_STAGING = YES
 
 # uses c99 specific features
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
