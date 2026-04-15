Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 774E0F436B9
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 15:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A4B48174C;
	Fri, 17 Apr 2026 15:20:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0mbS9le5cogt; Fri, 17 Apr 2026 15:20:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4752280F5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776439227;
	bh=hKOHMtmj8/kOCvkEWAmY6byvdtYyVF3Lq2ezryZ+D+s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pGFSa2rAyU6uCOhc/iEHanQzNwcxIOAVh5ZtoUFcBgUb6ekAwQB7GjFSfBS5BhTae
	 ajBFHO6+4HVQUGii3/fWetOPgje3Lw8SUdcKuwBndI/O7DkDrvkShcZBm+gYNxq24a
	 Cwe+yTbc+1x0ebcBbz/m0+8M3ONj5H0I1vXb4l/sQntstRxSjqbMROqI6anMPXClNw
	 2eW4KZPSq9ElD2Nsb8EWK/QKq8E7sVaslOy6IiAQ+0do1n3Q2yP6ZV6Agz/ycUNECp
	 2v1wrmys/cGcBNoshCCu4/19fqI41Uz1R5kszsShEcXCh3qoQEZV28ytlu3izPkrf7
	 BAj2oaAgr+ZnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4752280F5C;
	Fri, 17 Apr 2026 15:20:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1139E4E0
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:20:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35D264054F
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:20:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QAKXV-uQ8cXX for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 15:20:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 693C040561
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 693C040561
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:20:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1AD12819B7; Fri, 17 Apr 2026 15:20:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 15 Apr 2026 12:51:47 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 474c124db19c84b0609d52acdd10c1ad4f6f9fcf
X-Git-Newrev: d2e7e6cb654dbd489ece1351d06308c0dc3347ee
X-Patchwork-Hint: ignore
Message-Id: <20260417152008.1AD12819B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] .b4-config: automatically
 add 2025.02.x prefix
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d2e7e6cb654dbd489ece1351d06308c0dc3347ee
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

This avoids having to run b4 prep --set-prefixes 2025.02.x to add the
2025.02.x prefix to the patch subject.

You do need b4 0.11+ to make use of that.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .b4-config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.b4-config b/.b4-config
index d568669864..0c6966c0c8 100644
--- a/.b4-config
+++ b/.b4-config
@@ -1,6 +1,7 @@
 # Configuration for the `b4` tool
 # See https://b4.docs.kernel.org/en/latest/config.html
 [b4]
+    send-prefixes = 2025.02.x
     send-series-to = buildroot@buildroot.org
     send-auto-cc-cmd = "./utils/get-developers -e -"
     prep-perpatch-check-cmd = "./utils/check-package -q -p -"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
