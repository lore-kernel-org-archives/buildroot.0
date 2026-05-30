Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A06ECD6E4A
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 09:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A1D542E57;
	Sat, 30 May 2026 09:04:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MdTonjWrpt3U; Sat, 30 May 2026 09:04:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29E6742E02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780131877;
	bh=Y8us2SN+9mUMtKdboRexosFzQRyqi+1BGoFtxC1ipJ8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YcgikNvisD3wzTLIm1DPndDQoOrip0svCmRJGhJwPahwlsXyii3FpclfGDCnYBJHS
	 Kew/m5lnA3cAMlGl10NTzM97K24r/SolDWbyeQRTIfgYkf/j2MvbIPt6CgXMg5MTGN
	 ctq1AVaS20Je596JzAIWd13iwtTvVn+DDSGbJXGeKXS9rxC4ftRiBKb0ABOuWhMrxV
	 1wYVRHK9/haAte4G1Sho3i1u/beT/sGkuzJwagLHAh/9O7czrDPoVz8K9i7xFe2yZq
	 Z1cPWM/rn4hZsCCZpSMjZ1dv7xtTrPRMPHiCY9ixiFcz8lty5xE8keXbyggQ5C3RXz
	 apto5HGYIMmxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29E6742E02;
	Sat, 30 May 2026 09:04:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D9E1F218
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D342D408CE
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:04:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jLhhI9mZ8ZCO for <buildroot@buildroot.org>;
 Sat, 30 May 2026 09:04:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 270B9407EC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 270B9407EC
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:04:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2DF1886C8A; Sat, 30 May 2026 09:04:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 10:57:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3dad008858f656c30d7b7040aaed46786f370493
X-Git-Newrev: 88b575a9206b009ddb584ae3ef65947dcaf86857
X-Patchwork-Hint: ignore
Message-Id: <20260530090421.2DF1886C8A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hiredis: add CPE vendor
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/88b575a9206b009ddb584ae3ef65947dcaf86857
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The CPE "cpe:2.3:a:redis:hiredis:*:*:*:*:*:*:*:*" is valid for this
package.

See the GHSA [1] and the associated CVE [2].

[1] https://github.com/redis/hiredis/security/advisories/GHSA-hfm9-39pp-55p2
[2] https://nvd.nist.gov/vuln/detail/CVE-2021-32765

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/hiredis/hiredis.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/hiredis/hiredis.mk b/package/hiredis/hiredis.mk
index f7acb2f131..33a87e7780 100644
--- a/package/hiredis/hiredis.mk
+++ b/package/hiredis/hiredis.mk
@@ -9,7 +9,7 @@ HIREDIS_VERSION = $(HIREDIS_VERSION_MAJOR).0
 HIREDIS_SITE = $(call github,redis,hiredis,v$(HIREDIS_VERSION))
 HIREDIS_LICENSE = BSD-3-Clause
 HIREDIS_LICENSE_FILES = COPYING
-HIREDIS_CPE_ID_VENDOR = redislabs
+HIREDIS_CPE_ID_VENDOR = redis
 HIREDIS_INSTALL_STAGING = YES
 
 # The package is a dependency to ccache so ccache cannot be a dependency
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
