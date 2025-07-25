Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5268DC87FCA
	for <buildroot@archiver.kernel.org>; Fri, 25 Jul 2025 20:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20FEC83DA3;
	Fri, 25 Jul 2025 20:46:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lE_mrWvpcJnE; Fri, 25 Jul 2025 20:46:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40C6783DF2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40C6783DF2;
	Fri, 25 Jul 2025 20:46:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D4DC909
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 20:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E27883E03
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 20:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id otI6vQfYmrTl for <buildroot@buildroot.org>;
 Fri, 25 Jul 2025 20:46:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7A40B83DA3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A40B83DA3
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7A40B83DA3
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 20:46:45 +0000 (UTC)
Received: from eos.home.n621.de (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id AEFD8E000D9;
 Fri, 25 Jul 2025 22:46:42 +0200 (CEST)
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Ignacy=20Gaw=C4=99dzki?=
 <ignacy.gawedzki@green-communications.fr>, Florian Larysch <fl@n621.de>
Date: Fri, 25 Jul 2025 22:45:38 +0200
Message-ID: <20250725204540.11530-2-fl@n621.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1753476402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=44hoR993iH2asSwUddLP0UsnnvBKzlJWr6Ql9Ueybjk=;
 b=Yolx/mrv5wHzLSoqFjgA3FyotkuHswJIEvPrTOFSraWNX0IZyAcvSydxBLgPqbTA6BDJSc
 68QL2AzR5WfkmdQuiT16XJJ1CfslQM2SvxuhOGgEWKvCj318mXACCVGhPDq7if/ddqin6a
 FNy3ElFkx4+AVl+YPP8fq5Iw50kAUMw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=Yolx/mrv
Subject: [Buildroot] [PATCH 1/1] package/chartjs: fix license path
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit a954d39a58 ("package/chartjs: bump to version 3.9.1") updated the
package version and the license file hash, but also changed the path to
the license file in the hash file. However, the path to the license file
hasn't changed, causing an error during "make legal-info". Revert the
path change.

Signed-off-by: Florian Larysch <fl@n621.de>
---
 package/chartjs/chartjs.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/chartjs/chartjs.hash b/package/chartjs/chartjs.hash
index 3f8da92715..0f97d0a4a2 100644
--- a/package/chartjs/chartjs.hash
+++ b/package/chartjs/chartjs.hash
@@ -1,3 +1,3 @@
 # Locally computed:
 sha256  111e0751796f087a51e94dfed910ccfb1278fd30e584a6e48514dba9ae7e72c6  chart.js-3.9.1.tgz
-sha256  5a0877ad6d818529be4f33009d0942cdf7e2ed7656156f4aba7308459a546030  package/LICENSE.md
+sha256  5a0877ad6d818529be4f33009d0942cdf7e2ed7656156f4aba7308459a546030  LICENSE.md
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
