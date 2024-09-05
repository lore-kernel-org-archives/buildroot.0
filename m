Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650D1CD6E74
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 17:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0313A401D3;
	Thu,  5 Sep 2024 17:26:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cCM92ob5mX49; Thu,  5 Sep 2024 17:26:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D11A74013D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D11A74013D;
	Thu,  5 Sep 2024 17:26:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3E6891BF3E9
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 17:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3857B81585
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 17:26:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fp3V_zPFP5jg for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 17:26:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=163.172.193.142;
 helo=mail0.insia.net; envelope-from=guillaume.chaye@zeetim.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3BDC381414
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BDC381414
Received: from mail0.insia.net (mail0.insia.net [163.172.193.142])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3BDC381414
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 17:26:41 +0000 (UTC)
Received: from smtp.insia.net (unknown [192.168.1.24])
 by mail0.insia.net (Postfix) with ESMTP id DB8361FBA8;
 Thu,  5 Sep 2024 19:26:35 +0200 (CEST)
Received: from sb-dev-build.insia.net. (gw-servers.insia.net [192.168.1.1])
 by smtp.insia.net (Postfix) with ESMTP id 18CC65F497;
 Thu,  5 Sep 2024 19:23:04 +0200 (CEST)
From: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>
To: buildroot@buildroot.org
Date: Thu,  5 Sep 2024 19:26:06 +0200
Message-Id: <20240905172607.1322733-1-guillaume.chaye@zeetim.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=zeetim.com; s=mail0; t=1725557195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=b3lmbR+2mHoY9pbDMdvrPuz1dEdnZVrinixQRT3k9h0=;
 b=LbIYv1ZxGTyMA8119JBDXeqoAyuitpvn/F1Yknqobd2paPmtfhLy83ztNVbAG7WC5sgzb2
 XQWZigbd49/KPukHYgDvJNZ9FO0lxJ/EGRXFY1jhhHd0QncJjiT+o3g2ZW34vKQCMTh3HK
 gIYPhKO0jaX7wmwCb7AziaG3VbR6uuLgTQE2q+W+PBSSqI6/r52g93kYk3Obj/lmJK9OLO
 ZkE8rGKvgVFJDyxRJlscQ7djxQzWvJ3c5ibY28fDty4hmkrKCbLh+gauAzYSlde+fCctjk
 1512tEtlqQSGRWw0qcBxOZTyPA+LzvVPY+g33e1dM9l3FsUFx+LPw5FcgN0G4w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=zeetim.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=zeetim.com header.i=@zeetim.com header.a=rsa-sha256
 header.s=mail0 header.b=LbIYv1Zx
Subject: [Buildroot] [PATCHv2 1/2] package/perl-file-slurp: add host package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Christopher McCrory <chrismcc@gmail.com>,
 "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Some project like efitools requires host version of this package to build properly.

Signed-off-by: Guillaume GC. Chaye <guillaume.chaye@zeetim.com>
---
 package/perl-file-slurp/perl-file-slurp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/perl-file-slurp/perl-file-slurp.mk b/package/perl-file-slurp/perl-file-slurp.mk
index 0d4ab94034..910d50d3c4 100644
--- a/package/perl-file-slurp/perl-file-slurp.mk
+++ b/package/perl-file-slurp/perl-file-slurp.mk
@@ -12,3 +12,4 @@ PERL_FILE_SLURP_LICENSE_FILES = README.md
 PERL_FILE_SLURP_DISTNAME = File-Slurp
 
 $(eval $(perl-package))
+$(eval $(host-perl-package))
\ No newline at end of file
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
