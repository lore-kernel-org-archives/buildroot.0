Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 947C4D0D14B
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A2DD40D97;
	Wed,  7 Jan 2026 18:02:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jn5RdeX_DB8y; Wed,  7 Jan 2026 18:02:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C8BD414C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808963;
	bh=v73LGlSc+uPrvMA/tOyMQYWSf0JW5JROTSQhmA7pNfM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IP3Ta5FOXWdlZ4Bn1ZzxvIrEvRfj89XbkwHOIUkp29P6ljTPCFXWM/YS2Gngzgsxu
	 XGrzX2hr8zAsxS3twdYlm6tDQQ1YLwZ2LiQG21N2TlAdQfvyAu+hR1e0kQ4E6T805A
	 cwZ1CVJ9kN3Kobh/TQteOUiBkaXwrzCbqcHmRNSehFEvGUjLMPm4rtwnlcTcDrzz5M
	 eHJ0VYLesrLNPMNqIYXy/Ihgc5RIMcDW7ORElj4o5uC0LUOD1cHI9LbW2tNdR7yRbQ
	 5eScqlUU93MHY9t6W7d3IXFpj9lFAV8DrieBxXt3UTMAd4mVWAUWyOaRMXjljfaGjm
	 CJAha6CLKPX9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C8BD414C8;
	Wed,  7 Jan 2026 18:02:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 107DBA58
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA23C40A48
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hjz4TDJ4aENc for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE24C40A36
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE24C40A36
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CD2F981340; Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:57:16 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 7db91bf950cf2e6134df8ce39882282561cfc70c
X-Git-Newrev: 5bf3e72b57b480d712b2f3e153931898cf278cab
X-Patchwork-Hint: ignore
Message-Id: <20260107180113.CD2F981340@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/jbig2dec: add CVE
 trailer in patch
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
Content-Type: multipart/mixed; boundary="===============1740188106695149851=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1740188106695149851==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=5bf3e72b57b480d712b2f3e153931898cf278cab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 51a3cb5db4b4c1be51e7572028555b5a53055752)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0001-Bug-705041-jbig2dec-Avoid-uninitialized-allocator-in.patch      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/jbig2dec/0001-Bug-705041-jbig2dec-Avoid-uninitialized-allocator-in.patch b/package/jbig2dec/0001-Bug-705041-jbig2dec-Avoid-uninitialized-allocator-in.patch
index 8331d5f2a4..dd96c45ebd 100644
--- a/package/jbig2dec/0001-Bug-705041-jbig2dec-Avoid-uninitialized-allocator-in.patch
+++ b/package/jbig2dec/0001-Bug-705041-jbig2dec-Avoid-uninitialized-allocator-in.patch
@@ -4,6 +4,7 @@ Date: Sun, 5 Nov 2023 12:21:52 +0100
 Subject: [PATCH] Bug 705041: jbig2dec: Avoid uninitialized allocator in
  command-line tool.
 
+CVE: CVE-2023-46361
 Upstream: https://github.com/ArtifexSoftware/jbig2dec/commit/ee53a7e4bc7819d32e8c0b2057885bcc97586bf3
 Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
 ---

--===============1740188106695149851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1740188106695149851==--
