Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 645F6D0D150
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3961640AC0;
	Wed,  7 Jan 2026 17:47:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kxo0fYVaXd32; Wed,  7 Jan 2026 17:47:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18DF340AA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808060;
	bh=2515p39EamxcocImQpQ0evL74ARFkGMTUtLyMD7R55c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=No/PJkBXzJjhxKW9F4nC3Odax00FI0kqItxhXs/5ygtKcQPqqoXJGzRPuL0vDkG52
	 PsA0rEsET+uS/nwErw58ACh9pH+PMFWvNHDOHRmD/p74NdpEv1QtzM++O64J8eciux
	 b3lVeZ+72FaxJ8vRl5NKk3TXRCtlMRE8MrDwxsccfKEs6Bh7odJ6EukCtNb1BjJctQ
	 SvqsmtP7DY0tJD2fr+txzvOpp+d3LIOiCRiQ53G6ik7fVC9hKg4bSHH0vcapDhMP+7
	 qfU5hIOlzJsh0XRedvZGA5XKomRgeQ6nPD9vSLO44eFHHAgzc2MT1WX6oythwq0HcV
	 7pILS2kLe3MyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18DF340AA5;
	Wed,  7 Jan 2026 17:47:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BAC5A58
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F037C408DC
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h3RXCjS-pE-Q for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6147940898
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6147940898
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5F04788367; Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:19:26 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 3f3185e0608c7848dcbae902a05858365ee48677
X-Git-Newrev: 41af7465004d3db8db6f6c43f515ef9a562f8190
X-Patchwork-Hint: ignore
Message-Id: <20260107174644.5F04788367@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/opusfile: add CVE
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=41af7465004d3db8db6f6c43f515ef9a562f8190
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0b76139aa90828b3d58adc5853e1fddbe102b2a7)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0001-Propagate-allocation-failure-from-ogg_sync_buffer.patch         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/opusfile/0001-Propagate-allocation-failure-from-ogg_sync_buffer.patch b/package/opusfile/0001-Propagate-allocation-failure-from-ogg_sync_buffer.patch
index 2ef08502ab..8e3be36cdf 100644
--- a/package/opusfile/0001-Propagate-allocation-failure-from-ogg_sync_buffer.patch
+++ b/package/opusfile/0001-Propagate-allocation-failure-from-ogg_sync_buffer.patch
@@ -15,6 +15,7 @@ Thanks to https://github.com/xiph/opusfile/issues/36 for reporting.
 Signed-off-by: Timothy B. Terriberry <tterribe@xiph.org>
 Signed-off-by: Mark Harris <mark.hsj@gmail.com>
 
+CVE: CVE-2022-47021
 [Retrieved from:
 https://github.com/xiph/opusfile/commit/0a4cd796df5b030cb866f3f4a5e41a4b92caddf5]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
