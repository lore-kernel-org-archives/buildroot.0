Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B57AFC72C4
	for <buildroot@archiver.kernel.org>; Sun, 22 Mar 2026 16:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FC9F83ED1;
	Sun, 22 Mar 2026 16:45:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ehgV06uQ93i6; Sun, 22 Mar 2026 16:45:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EED383EC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774197912;
	bh=ZMIghPId9LIlrlOl7JQ2/GpPC2gIGUqYcWTL7GZuetw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nlLM7FaiHpJblOoOUdyEs09z6hqOMCwX9ms+TCN65LjGnLuc8b5Qi1El7cqr4Uix9
	 zljlHGVQJlRBWPdijmV+DzBLDYVUyPN90Uc2ZDdD9F394pJWaF/Tqjy0851dhP/e4S
	 gAndGYwlyfBGswvTQ9FN/SwNHD0wyw1Ctb4InbPMPILeC9yi4T4UG/GUXw2smrR1Bb
	 IR8OzmRfKYF1u75RjCTmUJwhnzPYTFdXZk+Ivszta/nFFfYSOH4ETa7DDQF6QygnYf
	 FhTAZ8v3B6tqcjCGLxQ5Uj5o+DGTGNkN9mC/yo1w7W5Gy/zqWc6HR7lCFLdrmdTetb
	 pVztk0NuHCvNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EED383EC0;
	Sun, 22 Mar 2026 16:45:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 85EC425C
 for <buildroot@buildroot.org>; Sun, 22 Mar 2026 16:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 77C6283EC0
 for <buildroot@buildroot.org>; Sun, 22 Mar 2026 16:45:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UYAeXt8UIk9J for <buildroot@buildroot.org>;
 Sun, 22 Mar 2026 16:45:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9461883EBF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9461883EBF
 for <buildroot@buildroot.org>; Sun, 22 Mar 2026 16:45:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 69DC484D86; Thu, 19 Mar 2026 20:57:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 19 Mar 2026 21:47:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 039c1ae13ec12f7cebddf86f37080d0a1fee28e6
X-Git-Newrev: 01a5a8be468db1489d97b77380ef56ff842dbb33
X-Patchwork-Hint: ignore
Message-Id: <20260319205709.69DC484D86@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: Add Chen Pei to ndctl
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/01a5a8be468db1489d97b77380ef56ff842dbb33
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6f5008ab89..0c51a1db03 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -612,6 +612,7 @@ F:	package/qoriq-cadence-dp-firmware/
 
 N:	Chen Pei <cp0613@linux.alibaba.com>
 F:	package/iniparser/
+F:	package/ndctl/
 
 N:	Chris Packham <judge.packham@gmail.com>
 F:	package/coremark/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
