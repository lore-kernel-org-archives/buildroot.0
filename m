Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3141B606A324
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 12:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cRbAjqQP;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dC4HH0d/
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3C2B4070B;
	Mon,  2 Nov 2026 12:30:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wKGMbx24cGyr; Mon,  2 Nov 2026 12:30:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6314C40719
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793622655;
	b=b6POc2c0/l9oVYy6DRN/9R+FnKv8jms3E2b/tnawpUE5tiI9wcqftxaRKfWunVfD2pGV
	 xJPqT7g7Nvb7icPar5dUm9ggD2o4TWK+dfPsdtGsdtelOOMFOIfRWHD22mGCcozPZ1Ii5
	 G3LrYmlEOEi3liAcSGiKSBsKf0PVJPIt24gLm2gCTKGVIWIWgOFYOwE8qEzg3TYJCFPTc
	 XU/pMUKtQBLf5dTVUUBGXNOaH5omVkmwlhz4wo/C3Pcm30htSh5fVo4fqdeF+PsNl7HHP
	 3f1UhjJo7tU3FXvml1UyqBW+1M81BuhiOeGV0Tr7K0gpEmS6stjDEuyDyQyeFEz9XSw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793622655;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Mailman-Approved-At:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=CkM6qNn/BhDImXCkQV7pSIYfTWdBZ09PqFtR4XJ5vKI=;
	b=lV7MknWuHbZ5vIlEZgW9oEp5420tCwnLJjHJ2hpocB5B7yg7HJp07PX33Jfht/oVoCSx
	 HiYiWp3hu2Z0tnGhg/bufRSdVUeiFWmWpYniYb2PusH6etOKIPmC5lIbfHXdWUhEqKOWf
	 Z6AMDxYTsiA4NY20uOGfqpuTleP2ZjzS5gZMvWJmdC+HTR8aA8GyFT9vFLQaB4Onzl+RX
	 97mCwQMT3wNU1mbhTNZVJ1c0SU5WUAleaYYVU71d6IbYm3FgmKay5f287QAY+E9cKk+0s
	 /VJlaZgieAjjmcW6OJ4sRioRay4DpnRUimVWMASI2KrAkM6UMEAUE794//+Wcz/wuAw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="dC4HH0d/";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793622655;
	bh=CkM6qNn/BhDImXCkQV7pSIYfTWdBZ09PqFtR4XJ5vKI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cRbAjqQPTavNZyO6jLNUnZ/t0nyNDwd4Gaz/zDJDtAf7F792o/Y/Kx9JiTJTyZBtn
	 rB0oSAVWMLtoifzXfJk4J4Jp0f5cmBNnMVgCDfFUnJSyE4r3EBi9L0LlT0zO5r+UOu
	 oFRuZ6z62Fgn7NrWiizNJ7W6kNMVBEjwVoTUgIEor4J3TqRk8TVshPa/QVyQOMdXNg
	 kjglzriAIEqkbgXPzpvu+PhX55pzswQmde9wv1o+yoWYrACTax6i49d1Oy+bqFaLAo
	 oEYz4Y5Ylj25cyjyPBmGFfpOBg/+4XQbRPbW3Bd0QgcGHF4vQupzGNP+VzmjBGBP78
	 o+lM7b+Kv3ozw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6314C40719;
	Mon,  2 Nov 2026 12:30:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B34EF2FE
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 14:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E198407F8
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 14:44:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yC6_46RXqRYN for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 14:44:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 52920407C9
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793285068;
 b=UZqHCnOl8JUOLd2hNR+1Ci7FZBaQ87ebv4YsM35mlZPZ2TEkgPkiQcXU2bLZK0IjlVcl
 NQz/Vk0LirlutLl59u7eJ75lXe+VasomrptUTlSisNyztdaX06YOSo6C5iggk3T0833s4
 iSZzYrw9TfaIF0dbHbbiQD0mT+lDcnLVw9WsTjKfKtQNd+g7wmbxYKay6/zkOUpJkKRuo
 VyipeONivkAhlT8rLK6QPkwrZp/AU7eZOksf3ZKG20rQeBruHudbOFl0XwYSt3XxuBbEs
 gFJwgzhIUP1m1+CcwTd6Mktc5c4luimmck/IZVJCdY0wtavBLl/oQZkjzettEse6R7Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793285068;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=Ktl6dRuznxkyOGDkNB+9o/sXqA9X8UEW3x0qDiVi4JE=;
 b=Jb/5gSzebaCPtTX6qBxRduGNKlJHOaR268wE7Aqgy6nEbssB7RdZFbZSAlrloi+7vc4v
 6PG1XztiQx4uOL6PaqMpLjz4ffvpQ56uqaLM3gHqIyofu3gGFetnFhbDF0lsAZCpWxCnx
 R4CWvmkDuywzz4gZhYlSLhQ8vduQLdf56iN2k6w/ih+U0rctLFbTgzT7O+TfcIVusSKLe
 aUOPrukoAf5e2kx9Llv2YeiXNf6Ee8bftuXVOQ1/52c0knGrgCQk+6a2qe5NfsVL841aY
 EqMh5IK+EHYSB9yOxfNvNzCbk+AS0UIwIRp2VrIacxXDg4q3nBWht8kUHDoG+D3KEdg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b="dC4HH0d/"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=dC4HH0d/
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 52920407C9
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 14:44:25 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4a214c5c4c0so19898915e9.3
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 07:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793285063; x=1793889863; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Ktl6dRuznxkyOGDkNB+9o/sXqA9X8UEW3x0qDiVi4JE=;
 b=dC4HH0d/8IwfZ/b2voYlIL7RBEn/LXCa169ktpHCt3yB02+8SUHB44R1GcNFr8wtBJ
 EixaNjBz9r0gdKyzvwZwumJUcPquJ8Ftf/X4BwFCfMYPS15PREUqO53BvkLoOH8wKl82
 KPWpST4DUuxchgU7U3rtWw7hCRoLQBgerp3PQ6Z17x1i5rMTRPTbTJeIbkrbIbKCAdYk
 H7+HWhNi/dwlpMY3pQb+VwctgzgDGdeIcUAKUuLPBZSJSPOummriXAS6IMP3LTZ3m5om
 KBDsEv9ZQSUphS2hnaJ9ObsuLZqJqbVBSS9eVkuoB0mT0uXXB2r5LPeTeHmFO7ZIITSe
 aemQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793285063; x=1793889863;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Ktl6dRuznxkyOGDkNB+9o/sXqA9X8UEW3x0qDiVi4JE=;
 b=Vd5AcDIONZ8+Th8aZ9ZTiznUTm/91/W02DHXDgGWl9ptCmSacvBb3FY69PgnUWpWEw
 ct0VNQSax3w6HZ7cpCJ0Fbiy3bsZbug/E+MHAy46RZS34uVlIt2Y9EQEvuvQrkCmbrIb
 pmSZdZ1Dn3hLxw1S4mSz6UupbYoDGXV+cOKvcMJkOu7tux41MqMoyXQam2y2GeUR7YHx
 R4bjivzi5H3761Ck3xu2ZtsI+qfXrO5iZt2R/Wp5eOaCLET4KkbTZD2dLBv3bXSEwfHM
 PlFV+9hQx4aIpCO7Uwsen8aN9FI5o7H6rij268e7E/BLqK3weRkmQsJZZxt+Q/BTdjCi
 JMtw==
X-Gm-Message-State: AFq9FYJNHct4yB8bv7RKlW/sDmTYsAsl2Oc+aAp0rWGghy7oQmdj5hJx
 i1LQ6RJVpo/wPt4F3TXBYUSELvucHbIU6tLYTW9R67hY7UMtJNaWKa19aGq1ng==
X-Gm-Gg: AYBFou2VWk2JA+VYaVmADeaqo0n5sTZWMX3SeZBXhM4qp1Bifn+TdkRQxowkZ/v277z
 i7qY1XYRpvq+Rrf8UsMg9lGP3N7EGvaDpWz938OEJKcqfJ56t6iKtajPucMdA8MWt0YKDByU8NR
 B070IJw6+GWfziBybtC0LP9fqPlfOU0+wgsUptdbNfbAEzMx6oXqRaj/zr5H2HOv1S95hjiFn+d
 zSQg8sqXO+AsVQLTXBUjII+vnIOWzNMnApaKQFUQpIm/phtMnknywFZS1KjQfUrexPwt34PcYf9
 KNeEg09BAQf+2qht0xc6tnBjAygpYrAJGTdV1M0tZM1X0iwSG0QQA714quxaFdTX6ZdZZ9Km2og
 YmRT5zmsdI9Keqm8YK5+OVZhQkd0sbXziEv/aTfRajil2ZnBRDLCy8bENcIxMlS7UFGm8x2HXBH
 xS3BblP6ZCIcJtsDtFtggj3jFOYqbn+RqJuNAa19zNvyWo9DTEUapdK9/7jICtAisV+cQ5Re1lN
 t/02TPLmMk9w/pImslA1kfMXfpXa24QHIsOGjoaJrprTy+dc8t9v/oGKewuSYkfcqw+2+pLnMm7
 yLhCGZMlThJBf4O2uWAOyx6oPWAUBs1cwQ5WA0E=
X-Received: by 2002:a05:6000:2c13:b0:48e:64e2:4883 with SMTP id
 ffacd0b85a97d-48e64e24b04mr6370306f8f.8.1793285061108; 
 Thu, 29 Oct 2026 07:44:21 -0700 (PDT)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3eb8f387sm34699011f8f.4.2026.10.29.07.44.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 07:44:20 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 29 Oct 2026 15:43:55 +0100
Message-Id: <20261029144400.2972217-4-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029144400.2972217-1-angelo.compagnucci@gmail.com>
References: <20261029144400.2972217-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 02 Nov 2026 12:30:54 +0000
Subject: [Buildroot] [PATCH 4/9] website: switch to Bootstrap 5 and the
 Bootswatch Materia theme
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The website uses Bootstrap 3.3.7 with the Bootswatch Paper theme, which
are unmaintained and affected by known vulnerabilities. Paper is not
available for newer Bootstrap versions, so switch to Bootstrap 5.3.8
with the Bootswatch Materia theme, which provides the same material
design look.

Glyphicons are not shipped anymore with Bootstrap 5, so use Bootstrap
Icons 1.13.1 instead.

Migrate the markup accordingly:
- rewrite the navigation bar as a sticky bar, collapsing it below
  1200px
- replace panels with Materia cards, the news timeline entries and LTS
  charts included
- use the new grid offset, image, float and button classes
- rewrite the carousel and the git URL input group
- adapt the tooltip and active menu entry selectors in buildroot.js

Also drop most of the custom styles in favor of the Bootstrap utility
classes and the Materia defaults: typography, page headers, spacing
helpers, the LTS numbered lists and the sponsors grid.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 docs/website/association.html |   28 +-
 docs/website/contribute.html  |   20 +-
 docs/website/css/lts.css      |  277 +--
 docs/website/css/main.css     |  212 +--
 docs/website/css/sponsors.css |   40 -
 docs/website/css/timeline.css |    7 -
 docs/website/docs.html        |   52 +-
 docs/website/download.html    |   34 +-
 docs/website/footer.html      |    2 +-
 docs/website/header.html      |   69 +-
 docs/website/index.html       |  138 +-
 docs/website/js/buildroot.js  |    4 +-
 docs/website/lts.html         |  425 +++--
 docs/website/news.html        | 3020 ++++++++++++++++-----------------
 docs/website/sponsors.html    |  466 ++---
 docs/website/support.html     |   46 +-
 16 files changed, 2219 insertions(+), 2621 deletions(-)
 delete mode 100644 docs/website/css/sponsors.css

diff --git a/docs/website/association.html b/docs/website/association.html
index 0c2306f348..11c4d59e84 100644
--- a/docs/website/association.html
+++ b/docs/website/association.html
@@ -1,11 +1,11 @@
 <!--#include file="header.html" -->
 
 <div class="container">
-  <div class="row nh"><!-- current sponsor row -->
-    <div class="col-lg-10 col-lg-offset-1 col-md-12 col-sm-12 col-xs-12">
-      <div class="panel panel-primary">
-	<div class="panel-heading">Association</div>
-	<div class="panel-body">
+  <div class="row my-4"><!-- current sponsor row -->
+    <div class="col-lg-10 offset-lg-1 col-md-12 col-sm-12 col-12">
+      <div class="card mb-4">
+	<div class="card-header text-bg-primary rounded-top">Association</div>
+	<div class="card-body">
 
 	  <p>The Buildroot open-source project is supported by a
 	  non-profit organization called the <strong>Buildroot
@@ -41,7 +41,7 @@
 	  official <a href="https://gitlab.com/buildroot.org/buildroot-association/-/raw/master/pdf/Recepisse_CR.pdf">receipt</a>
 	  from the French authorities.</p>
 
-	  <p>Our accounting is fully public, including the bank
+	  <p class="mb-0">Our accounting is fully public, including the bank
 	  account summaries,
 	  see <a href="https://gitlab.com/buildroot.org/buildroot-association/-/tree/master/accounting">accounting</a>. Numerous
 	  other administrative documents related to the association
@@ -51,9 +51,9 @@
 	</div>
       </div>
 
-      <div class="panel panel-primary">
-	<div class="panel-heading">Becoming a member</div>
-	<div class="panel-body">
+      <div class="card mb-4">
+	<div class="card-header text-bg-primary rounded-top">Becoming a member</div>
+	<div class="card-body">
 
 	  <p>To become a member, an individual or a company simply has
 	  to pay its yearly membership. For an individual, the minimum
@@ -76,7 +76,7 @@
 	  <p>There are two possibilities to pay the membership
 	  fee:</p>
 
-	  <ul>
+	  <ul class="mb-0">
 
 	    <li>A direct wire-transfer to the association bank
 	    account. Since the bank account is located in France, this
@@ -94,9 +94,9 @@
 	</div>
       </div>
 
-      <div class="panel panel-primary">
-	<div class="panel-heading">Sponsoring the project</div>
-	<div class="panel-body">
+      <div class="card mb-4">
+	<div class="card-header text-bg-primary rounded-top">Sponsoring the project</div>
+	<div class="card-body">
 
 	  <p>Companies willing to help the Buildroot project can do so
 	  by making a donation to the <em>Buildroot
@@ -108,7 +108,7 @@
 	  registered in France, it is able to deliver a bill and/or
 	  receipt.</p>
 
-	  <p>Please
+	  <p class="mb-0">Please
 	  contact <a href="mailto:buildroot-association@buildroot.org">buildroot-association@buildroot.org</a>
 	  if you are a company interested in making a donation.</p>
 
diff --git a/docs/website/contribute.html b/docs/website/contribute.html
index 8da371cf01..be86e639f3 100644
--- a/docs/website/contribute.html
+++ b/docs/website/contribute.html
@@ -1,12 +1,12 @@
 <!--#include file="header.html" -->
 
 <div class="container">
-<div class="row nh">
-<div class="col-lg-10 col-lg-offset-1 col-md-12 col-sm-12 col-xs-12">
+<div class="row my-4">
+<div class="col-lg-10 offset-lg-1 col-md-12 col-sm-12 col-12">
 
-  <div class="panel panel-primary">
-    <div class="panel-heading">Contribute</div>
-    <div class="panel-body">
+  <div class="card mb-4">
+    <div class="card-header text-bg-primary rounded-top">Contribute</div>
+    <div class="card-body">
       <p>Buildroot is an open source project and we warmly welcome your
         contributions.<br />
 	There are different ways you can get involved:</p>
@@ -32,14 +32,14 @@
 	<a href="https://buildroot.org/manual.html#_contributing_to_buildroot">
 	  Contributing to buildroot</a> chapter in the Buildroot manual. Thanks for your help!</p>
 
-      <p>If you need any support yourself, have a look at <a href="./support.html">
+      <p class="mb-0">If you need any support yourself, have a look at <a href="./support.html">
 	  Support</a>.</p>
     </div>
   </div>
 
-  <div class="panel panel-primary">
-    <div class="panel-heading">Sponsor</div>
-    <div class="panel-body">
+  <div class="card mb-4">
+    <div class="card-header text-bg-primary rounded-top">Sponsor</div>
+    <div class="card-body">
       <p>Besides technical contributions, you can also support the project
         financially.<br />
 	There are various ways make a financial contribution:</p>
@@ -56,7 +56,7 @@
 	  branch of Buildroot.</li>
       </ul>
 
-      <p>All of these sponsors are thanked by listing them on the <a
+      <p class="mb-0">All of these sponsors are thanked by listing them on the <a
         href="./sponsors.html">sponsors page</a>.</p>
     </div>
   </div>
diff --git a/docs/website/css/lts.css b/docs/website/css/lts.css
index deee73eee3..5804e76c28 100644
--- a/docs/website/css/lts.css
+++ b/docs/website/css/lts.css
@@ -1,278 +1,3 @@
-:root {
-    --br-blue: #3498db;
-    --br-grid: #dceeff;
-    --br-yellow: #dcb045;
-}
-
-@keyframes slideDownFade {
-    0% {
-        opacity: 0;
-        transform: translateY(-30px);
-    }
-    100% {
-        opacity: 1;
-        transform: translateY(0);
-    }
-}
-
-@keyframes growBar {
-    from { transform: scaleX(0); opacity: 0.5; }
-    to { transform: scaleX(1); opacity: 1; }
-}
-
-/**
- * Header, based on the website #headerwrap
- */
-.br-lts-header {
-    display: flex;
-    align-items: center;
-    padding-top: 80px;
-    padding-bottom: 40px;
-}
-
-#headerwrap.br-lts-header h1 {
-    font-size: 90px;
-    opacity: 0;
-    animation: slideDownFade 0.8s cubic-bezier(0.34, 1.56, 0.64, 1) forwards;
-}
-
-.br-lts-header h1 small {
-    display: block;
-    margin-top: 20px;
-    font-size: 39px;
-}
-
-@media screen and (max-width: 768px) {
-    #headerwrap.br-lts-header h1 {
-        font-size: 56px;
-    }
-
-    .br-lts-header h1 small {
-        font-size: 26px;
-    }
-}
-
-/**
- * Content wrapper.
- */
-.br-lts-main {
-    margin-top: 40px;
-    margin-bottom: 40px;
-}
-
-.br-lts-main .panel {
+.br-lts-main .card {
     scroll-margin-top: 80px; /* Offset for jump to anchor */
 }
-
-/**
- * Numbered titled list.
- * The number is a round badge on the left.
- * The content is on this right.
- */
-.br-lts-item-row {
-    display: flex;
-    gap: 20px;
-    padding: 15px 0;
-}
-
-.br-lts-item-row + .br-lts-item-row {
-    border-top: 1px solid #eee;
-}
-
-.br-lts-item-number {
-    flex-shrink: 0;
-    width: 48px;
-    height: 48px;
-    border-radius: 50%;
-    background-color: var(--br-blue);
-    color: #fff;
-    font-size: 24px;
-    font-weight: 400;
-    line-height: 48px;
-    text-align: center;
-    user-select: none;
-}
-
-.br-lts-item-title {
-    margin-top: 8px;
-}
-
-/**
- * 'timeline' grid to represent how tasks are expanding across time.
- */
-.br-lts-chart {
-    --br-lts-label-width: 120px;
-    display: grid;
-    grid-template-columns: var(--br-lts-label-width) repeat(12, minmax(45px, 1fr));
-    gap: 0;
-    width: 100%;
-    background-color: #fff;
-    border: 1px solid #ddd;
-    border-radius: 2px;
-    box-shadow: 0 1px 4px rgba(0, 0, 0, 0.3);
-    margin: 20px 0;
-    position: relative;
-    overflow-x: auto;
-}
-
-.br-lts-chart:last-child {
-    margin-bottom: 0;
-}
-
-.br-lts-chart::before {
-    content: "";
-    position: absolute;
-    top: 45px;
-    left: var(--br-lts-label-width);
-    right: 0;
-    bottom: 0;
-    background-size: calc(100% / 12) 100%;
-    z-index: 0;
-    pointer-events: none;
-}
-
-.br-lts-chart-head {
-    grid-column: 1 / -1;
-    display: grid;
-    grid-template-columns: var(--br-lts-label-width) repeat(12, minmax(45px, 1fr));
-    border-bottom: 2px solid var(--br-blue);
-    background-color: color-mix(in srgb, var(--br-blue) 6%, white);
-    font-weight: bold;
-    position: relative;
-    z-index: 2;
-}
-
-.br-lts-chart-head-label {
-    text-align: center;
-    padding: 10px;
-    border-left: 1px solid var(--br-grid);
-    font-size: 18px;
-    font-weight: 400;
-    color: var(--br-blue);
-}
-
-.br-lts-span-year { grid-column: span 4; }
-.br-lts-span-day { grid-column: span 2; }
-.br-lts-head-spacer { grid-column: span 1; border-right: 2px solid var(--br-blue); }
-
-.br-lts-chart-row {
-    grid-column: 1 / -1;
-    display: grid;
-    grid-template-columns: var(--br-lts-label-width) repeat(12, minmax(45px, 1fr));
-    align-items: center;
-    height: 50px;
-    border-bottom: 1px dashed #ddd;
-    position: relative;
-    z-index: 1;
-    transition: background-color 0.2s ease;
-}
-
-.br-lts-chart-row:last-child { border-bottom: none; }
-
-.br-lts-chart--wide-labels {
-    --br-lts-label-width: 240px;
-}
-
-@media screen and (max-width: 768px) {
-    .br-lts-chart--wide-labels {
-        --br-lts-label-width: 140px;
-    }
-}
-
-.br-lts-chart-row--tall {
-    height: 64px;
-}
-
-.br-lts-chart-row--faded {
-    color: #999;
-    font-style: italic;
-}
-
-.br-lts-chart-row:hover {
-    background-color: color-mix(in srgb, var(--br-blue) 8%, transparent);
-    z-index: 2;
-}
-
-.br-lts-chart-label {
-    padding: 0 15px;
-    font-weight: bold;
-    color: #555;
-    border-right: 2px solid var(--br-blue);
-    height: 100%;
-    display: flex;
-    align-items: center;
-    background-color: #fff;
-    font-size: 14px;
-    line-height: 1.3;
-    transition: color 0.2s ease, background-color 0.2s ease;
-}
-
-.br-lts-chart-row:hover .br-lts-chart-label {
-    background-color: transparent;
-    color: var(--br-blue);
-}
-
-.br-lts-bar {
-    height: 24px;
-    margin: 0 4px;
-    border-radius: 4px;
-    display: flex;
-    align-items: center;
-    padding-left: 10px;
-    font-size: 12px;
-    color: white;
-    font-weight: bold;
-    box-shadow: 2px 2px 0 rgba(0,0,0,0.1);
-    white-space: nowrap;
-    overflow: hidden;
-    position: relative;
-    background-color: var(--br-blue);
-    grid-column-end: span 1;
-    cursor: default;
-
-    transform-origin: left center;
-    animation: growBar 0.8s cubic-bezier(0.16, 1, 0.3, 1) forwards;
-    opacity: 0;
-
-    transition: transform 0.2s cubic-bezier(0.175, 0.885, 0.32, 1.275),
-                box-shadow 0.2s ease,
-                filter 0.2s ease;
-}
-
-.br-lts-chart-row:nth-child(2) .br-lts-bar { animation-delay: 100ms; }
-.br-lts-chart-row:nth-child(3) .br-lts-bar { animation-delay: 200ms; }
-.br-lts-chart-row:nth-child(4) .br-lts-bar { animation-delay: 300ms; }
-.br-lts-chart-row:nth-child(5) .br-lts-bar { animation-delay: 400ms; }
-.br-lts-chart-row:nth-child(6) .br-lts-bar { animation-delay: 500ms; }
-.br-lts-chart-row:nth-child(7) .br-lts-bar { animation-delay: 600ms; }
-.br-lts-chart-row:nth-child(8) .br-lts-bar { animation-delay: 700ms; }
-.br-lts-chart-row:nth-child(9) .br-lts-bar { animation-delay: 800ms; }
-.br-lts-chart-row:nth-child(10) .br-lts-bar { animation-delay: 900ms; }
-.br-lts-chart-row:nth-child(11) .br-lts-bar { animation-delay: 1000ms; }
-
-.br-lts-bar:hover {
-    transform: scale(1.05) translateY(-2px);
-    box-shadow: 4px 6px 12px rgba(0,0,0,0.2);
-    z-index: 10;
-    filter: brightness(1.1);
-}
-
-.br-lts-bar--long {
-    background-color: var(--br-yellow);
-    color: color-mix(in srgb, var(--br-yellow), black 45%);
-    grid-column-end: span 12;
-    border: 2px solid color-mix(in srgb, var(--br-yellow), white 20%);
-}
-
-.br-lts-bar--span-2 { grid-column-end: span 2; }
-.br-lts-bar--span-6 { grid-column-end: span 6; }
-
-.br-lts-col-start-2 { grid-column-start: 2; }
-.br-lts-col-start-3 { grid-column-start: 3; }
-.br-lts-col-start-4 { grid-column-start: 4; }
-.br-lts-col-start-5 { grid-column-start: 5; }
-.br-lts-col-start-6 { grid-column-start: 6; }
-.br-lts-col-start-7 { grid-column-start: 7; }
-.br-lts-col-start-8 { grid-column-start: 8; }
-.br-lts-col-start-9 { grid-column-start: 9; }
-.br-lts-col-start-10 { grid-column-start: 10; }
diff --git a/docs/website/css/main.css b/docs/website/css/main.css
index 81bcd2c4b6..28d13d2fa3 100644
--- a/docs/website/css/main.css
+++ b/docs/website/css/main.css
@@ -7,205 +7,26 @@
  * URL: http://blacktie.co
  */
 
-body {
-  background-color: #f2f2f2;
-	font-family: 'Roboto', sans-serif;
-	font-weight: 300;
-	font-size: 16px;
-	color: #555;
-
-	-webkit-font-smoothing: antialiased;
-	-webkit-overflow-scrolling: touch;
-}
-
-/* Titles */
-h1, h2, h3, h4, h5, h6 {
-	font-family: 'Roboto', sans-serif;
-	font-weight: 300;
-	color: #333;
-}
-
-h1 {
-	font-size: 40px;
-}
-
-h3 {
-	color: #95a5a6;
-	font-weight: 400;
-}
-
-h4 {
-	color: #95a5a6;
-	font-weight: 400;
-	font-size: 20px;
-}
-
-.ellipsis p {
-	margin-bottom:10px;
-	white-space: nowrap;
-	overflow: hidden;
-	text-overflow: ellipsis;
-}
-
-.centered {
-	text-align: center;
-}
-
-/* Links */
 a {
-	color: #3498db;
-	word-wrap: break-word;
-
-	-webkit-transition: color 0.1s ease-in, background 0.1s ease-in;
-	-moz-transition: color 0.1s ease-in, background 0.1s ease-in;
-	-ms-transition: color 0.1s ease-in, background 0.1s ease-in;
-	-o-transition: color 0.1s ease-in, background 0.1s ease-in;
-	transition: color 0.1s ease-in, background 0.1s ease-in;
-}
-
-a:hover,
-a:focus {
-	color: #7b7b7b;
 	text-decoration: none;
-	outline: 0;
-}
-
-a:before,
-a:after {
-	-webkit-transition: color 0.1s ease-in, background 0.1s ease-in;
-	-moz-transition: color 0.1s ease-in, background 0.1s ease-in;
-	-ms-transition: color 0.1s ease-in, background 0.1s ease-in;
-	-o-transition: color 0.1s ease-in, background 0.1s ease-in;
-	transition: color 0.1s ease-in, background 0.1s ease-in;
-}
-
- hr {
-	display: block;
-	height: 1px;
-	border: 0;
-	border-top: 1px solid #ccc;
-	margin: 1em 0;
-	padding: 0;
-}
-
-.navbar-default {
-	background-color: #3498db;
-	border-color: transparent;
-}
-
-.navbar-default .navbar-brand {
-	color: white;
-}
-
-.navbar-default .navbar-nav > li > a {
-	color: white;
 }
 
-/* Helpers */
-
-.mt {
-	margin-top: 40px;
-	margin-bottom: 40px;
+.navbar[data-bs-theme=dark] {
+	--bs-gradient: none;
+	--bs-navbar-color: #fff;
+	--bs-navbar-hover-color: var(--bs-dark);
+	--bs-navbar-active-color: var(--bs-dark);
 }
 
-.nh {
-	margin-top: 80px;
-	margin-bottom: 40px;
+.navbar .nav-link {
+	padding-top: 10px;
+	padding-bottom: 10px;
 }
 
-.form-control {
-	height: 42px;
-	font-size: 18px;
-	width: 280px;
-}
-
-i {
-	margin: 8px;
-	color: #3498db;
-}
-
-
-/* HeaderWrap */
-#headerwrap {
-	/* background: url(../img/bg01.jpg) no-repeat center top; */
-	background-color: #3498db;
-	margin-top: -20px;
-	padding-top:120px;
-	background-attachment: relative;
-	background-position: center center;
-	min-height: 400px;
-	max-height: 800px;
-	width: 100%;
-
-	-webkit-background-size: 100%;
-	-moz-background-size: 100%;
-	-o-background-size: 100%;
-	background-size: 100%;
-
-	-webkit-background-size: cover;
-	-moz-background-size: cover;
-	-o-background-size: cover;
-	background-size: cover;
-}
-
-#headerwrap h1 {
-	color: white;
-	font-size: 60px;
-	font-weight: bold;
-	letter-spacing: 1px;
-}
-
-#menubutton {
-	max-height: 50px;
-	margin-top: 6px;
-	padding-top: 15px;
-	margin-left: 10px;
-}
-
-.panel-sponsor {
-	min-height: 350px;
-	text-align: justify;
-	text-justify: inter-word;
-}
-
-.panel-lts-sponsor {
-	min-height: 200px;
-	text-align: justify;
-	text-justify: inter-word;
-}
-
-@media (min-width: 768px) and (max-width: 991px) {
-	.navbar-collapse.collapse {
-		display: none !important;
-	}
-	.navbar-collapse.collapse.in {
-		display: block !important;
-	}
-	.navbar-header .collapse, .navbar-toggle {
-		display:block !important;
-	}
-	.navbar-header {
-		float:none;
-	}
-	.navbar-collapse {
-		overflow:hidden;
-	}
-	#menubutton {
-		margin-right: 40px;
-		width: 45px;
-	}
-	.text-shrink {
-		visibility: hidden;
-	}
-}
-
-@media (max-width:767px) {
-	#menubutton {
-		max-height: 50px;
-		margin-top: 6px;
-		padding-top: 15px;
-		margin-left: 15px;
-		margin-right: 15px;
+@media (min-width: 1200px) {
+	.navbar .nav-link {
+		padding-top: 20px;
+		padding-bottom: 20px;
 	}
 }
 
@@ -261,6 +82,13 @@ i {
 	-ms-filter: "FlipH";
 }
 
+.ellipsis p {
+	margin-bottom: 10px;
+	white-space: nowrap;
+	overflow: hidden;
+	text-overflow: ellipsis;
+}
+
 .panel-box p {
-    height: 1.5em;
+	height: 1.5em;
 }
diff --git a/docs/website/css/sponsors.css b/docs/website/css/sponsors.css
deleted file mode 100644
index 889737eabd..0000000000
--- a/docs/website/css/sponsors.css
+++ /dev/null
@@ -1,40 +0,0 @@
-.sponsors-container {
-  display: flex;
-  flex-wrap: wrap;
-  gap: 15px;
-  align-items: stretch;
-}
-
-.sponsor-entry {
-  flex: 0 0 calc(33.333% - 10px);
-  display: flex;
-  flex-direction: column;
-  min-width: 250px;
-}
-
-.sponsor-entry .panel {
-  flex: 1;
-  display: flex;
-  flex-direction: column;
-}
-
-.sponsor-entry .panel-body {
-  flex: 1;
-  display: flex;
-  flex-direction: column;
-}
-
-.sponsor-title {
-  display: flex;
-  align-items: center;
-  justify-content: center;
-  min-height: 150px;
-}
-
-.sponsor-title img {
-  max-height: 120px;
-}
-
-.sponsor-body {
-  flex: 1;
-}
diff --git a/docs/website/css/timeline.css b/docs/website/css/timeline.css
index df58461ae2..4f33522fca 100644
--- a/docs/website/css/timeline.css
+++ b/docs/website/css/timeline.css
@@ -43,13 +43,6 @@
 .timeline > li > .timeline-panel {
 	width: 46%;
 	float: left;
-	border: 1px solid #d4d4d4;
-	border-radius: 2px;
-	padding: 20px;
-	position: relative;
-	-webkit-box-shadow: 0 1px 6px rgba(0, 0, 0, 0.175);
-	box-shadow: 0 1px 6px rgba(0, 0, 0, 0.175);
-	background-color: white;
 }
 
 .timeline > li > .timeline-panel:before {
diff --git a/docs/website/docs.html b/docs/website/docs.html
index ee3eb3d065..036fe10b74 100644
--- a/docs/website/docs.html
+++ b/docs/website/docs.html
@@ -1,19 +1,19 @@
 <!--#include file="header.html" -->
 
 <div class="container">
-<div class="row nh">
-<div class="col-lg-10 col-lg-offset-1 col-md-12 col-sm-12 col-xs-12">
+<div class="row my-4">
+<div class="col-lg-10 offset-lg-1 col-md-12 col-sm-12 col-12">
 
-  <div class="panel panel-primary">
-    <div class="panel-heading">Documentation</div>
-    <div class="panel-body">
+  <div class="card mb-4">
+    <div class="card-header text-bg-primary rounded-top">Documentation</div>
+    <div class="card-body">
       <p>The Buildroot user manual is where you want to start reading if you
 	wish to understand how Buildroot works, or wish to change/extend/fix
 	things. It is available as:</p>
 
-      <div class="row mt centered">
+      <div class="row my-5 text-center">
 	<div class="col-sm-4">
-	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
+	  <div class="flip-container mx-auto" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
 		<a href="/manual.html"><img src="images/browser.png" width="180" alt=""></a>
@@ -24,7 +24,7 @@
 	    </div>
 	  </div>
 
-	  <h3>HTML <br>
+	  <h3 class="mt-3 fw-normal text-body-secondary">HTML <br>
 	    <a href="/manual.html">Stable</a> |
 	    <a href="https://nightly.buildroot.org/manual.html">Nightly</a>
 	  </h3>
@@ -32,7 +32,7 @@
 	</div>
 
 	<div class="col-sm-4">
-	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
+	  <div class="flip-container mx-auto" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
 		<img src="images/pdf-icon.png" width="180" alt="">
@@ -43,7 +43,7 @@
 	    </div>
 	  </div>
 
-	  <h3>PDF <br>
+	  <h3 class="mt-3 fw-normal text-body-secondary">PDF <br>
 	    <a href="/downloads/manual/manual.pdf">Stable</a> |
 	    <a href="https://nightly.buildroot.org/manual.pdf">Nightly</a>
 	  </h3>
@@ -51,7 +51,7 @@
 	</div>
 
 	<div class="col-sm-4">
-	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
+	  <div class="flip-container mx-auto" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
 		<img src="images/text.png" width="180" alt="">
@@ -62,7 +62,7 @@
 	    </div>
 	  </div>
 
-	  <h3>ASCII <br>
+	  <h3 class="mt-3 fw-normal text-body-secondary">ASCII <br>
 	    <a href="/downloads/manual/manual.text">Stable</a> |
 	    <a href="https://nightly.buildroot.org/manual.text">Nightly</a>
 	  </h3>
@@ -70,14 +70,14 @@
 	</div>
       </div>
 
-      <p>If you find any errors (factual, grammatical, whatever) please
+      <p class="mb-0">If you find any errors (factual, grammatical, whatever) please
 	report them to us.</p>
     </div>
   </div>
 
-  <div class="panel panel-primary">
-    <div class="panel-heading">Training</div>
-    <div class="panel-body">
+  <div class="card mb-4">
+    <div class="card-header text-bg-primary rounded-top">Training</div>
+    <div class="card-body">
       <p><a href="http://www.bootlin.com">Bootlin</a> (formerly Free Electrons)
 	offers a complete <a href="http://bootlin.com/training/buildroot/">3-days
 	  training course on Buildroot</a>. They also make the training
@@ -85,9 +85,9 @@
 
       <div class="row">
 	<div class="col-sm-8">
-	  <div class="panel panel-success">
-	    <div class="panel-heading">Slides preview</div>
-	    <div class="panel-body">
+	  <div class="card mb-4 mb-sm-0">
+	    <div class="card-header text-bg-success rounded-top">Slides preview</div>
+	    <div class="card-body">
 	      <div id="slides" style="width: 100%; padding-bottom: 75%; position: relative">
 		<a href="http://bootlin.com/doc/training/buildroot/buildroot-slides.pdf"><img src="images/buildroot-slides.png" alt="buildroot slides" style="position:absolute; width:100%; height:100%; top:0; left:0;"></a>
 	      </div>
@@ -96,10 +96,10 @@
 	</div>
 
 	<div class="col-sm-4">
-	  <div class="panel panel-default	">
-	    <div class="panel-heading">Training materials</div>
-	    <div class="panel-body">
-	      <ul>
+	  <div class="card mb-4">
+	    <div class="card-header rounded-top">Training materials</div>
+	    <div class="card-body">
+	      <ul class="mb-0">
 		<li><a href="http://bootlin.com/doc/training/buildroot/buildroot-slides.pdf">slides (PDF)</a></li>
 		<li><a href="http://bootlin.com/doc/training/buildroot/buildroot-labs.pdf">practical labs (PDF)</a></li>
 		<li><a href="http://bootlin.com/doc/training/buildroot/buildroot-labs.tar.xz">practical labs data (.tar.xz)</a></li>
@@ -107,9 +107,9 @@
 	    </div>
 	  </div>
 
-	  <div class="panel panel-default">
-	    <div class="panel-heading">Public online training course</div>
-	    <div class="panel-body">
+	  <div class="card">
+	    <div class="card-header rounded-top">Public online training course</div>
+	    <div class="card-body">
 	      Regular online training courses, available to individual
 	      registration, are proposed by Bootlin, with Thomas
 	      Petazzoni as
diff --git a/docs/website/download.html b/docs/website/download.html
index c51d58444e..6bbb7c8a1d 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -1,12 +1,12 @@
 <!--#include file="header.html" -->
 
 <div class="container">
-<div class="row nh">
-<div class="col-lg-10 col-lg-offset-1 col-md-12 col-sm-12 col-xs-12">
+<div class="row my-4">
+<div class="col-lg-10 offset-lg-1 col-md-12 col-sm-12 col-12">
 
-  <div class="panel panel-primary">
-    <div class="panel-heading">Download</div>
-    <div class="panel-body">
+  <div class="card mb-4">
+    <div class="card-header text-bg-primary rounded-top">Download</div>
+    <div class="card-body">
       <table class="table">
         <tr>
           <td></td>
@@ -129,24 +129,22 @@
     </div>
   </div>
 
-  <div class="panel panel-primary">
-    <div class="panel-heading">Git repository</div>
-    <div class="panel-body">
+  <div class="card mb-4">
+    <div class="card-header text-bg-primary rounded-top">Git repository</div>
+    <div class="card-body">
 
       <p>The buildroot repository can be browsed online at
 	<a href="https://gitlab.com/buildroot.org/buildroot/">https://gitlab.com/buildroot.org/buildroot/</a>.</p>
 
       <p>To grab a copy of the repository use</p>
 
-      <div class="input-group" style="width: 100%;">
-	<input class="form-control" style="width: 85%;" id="giturl"
-	       value="git clone https://gitlab.com/buildroot.org/buildroot.git" type="text" readonly></input>
-	<span class="input-group-button">
-	  <button class="btn pull-right" type="button" data-clipboard-target="#giturl"
-		  data-toggle="tooltip" data-placement="bottom" data-trigger="manual" title="Copied!">
-	    <img class="clippy" src="images/clippy.svg" alt="Copy to clipboard" width="13">
-	  </button>
-	</span>
+      <div class="input-group">
+	<input class="form-control" id="giturl"
+	       value="git clone https://gitlab.com/buildroot.org/buildroot.git" type="text" readonly>
+	<button class="btn btn-secondary" type="button" data-clipboard-target="#giturl"
+		data-bs-toggle="tooltip" data-bs-placement="bottom" data-bs-trigger="manual" data-bs-title="Copied!">
+	  <img class="clippy" src="images/clippy.svg" alt="Copy to clipboard" width="13">
+	</button>
       </div><br>
 
       <p>If you are not already familiar with using Git, we recommend
@@ -160,7 +158,7 @@
 
       <pre>git pull</pre>
 
-      <p>Because you've only been granted anonymous access to the
+      <p class="mb-0">Because you've only been granted anonymous access to the
 	tree, you won't be able to push your changes to the
 	repo. Changes can instead be submitted for inclusion by
 	posting them to the buildroot mailing list.</p>
diff --git a/docs/website/footer.html b/docs/website/footer.html
index b93fa46ebb..44ef5db17e 100644
--- a/docs/website/footer.html
+++ b/docs/website/footer.html
@@ -1,5 +1,5 @@
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
-	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha256-U5ZEeKfGNOja007MMD3YBI0A3OSZOQbeG6z2f2Y0hu8=" crossorigin="anonymous"></script>
+	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.8/js/bootstrap.bundle.min.js" integrity="sha512-HvOjJrdwNpDbkGJIG2ZNqDlVqMo77qbs4Me4cah0HoDrfhrbA+8SBlZn1KrvAQw7cILLPFJvdwIgphzQmMm+Pw==" crossorigin="anonymous"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/1.7.1/clipboard.min.js" integrity="sha256-Daf8GuI2eLKHJlOWLRR/zRy9Clqcj4TUSumbxYH9kGI=" crossorigin="anonymous"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/x2js/1.2.0/xml2json.min.js" integrity="sha256-RbFvov4fXA9DW/RzOAcIC0ZHIDmghGdsoug5slJHMMI=" crossorigin="anonymous"></script>
 	<script type="text/javascript" src="js/buildroot.js"></script>
diff --git a/docs/website/header.html b/docs/website/header.html
index 0219ea18b4..366bc8f525 100644
--- a/docs/website/header.html
+++ b/docs/website/header.html
@@ -17,47 +17,42 @@
 
 	<title>Buildroot - Making Embedded Linux Easy</title>
 
-	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/3.3.7/paper/bootstrap.min.css" integrity="sha256-LxKiHTQko0DUCUSgrIK23SYMymvfuj8uxXmblBvVWm0=" crossorigin="anonymous">
+	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.3.8/materia/bootstrap.min.css" integrity="sha512-lR3pptsOFflVTuIszkLNcibNkPReN2dEA/t1U1++B3/wPEZL4pysMdYsQfaMefLI/X2fjvk5AeaHVBcFoVO2mA==" crossorigin="anonymous">
+	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.13.1/font/bootstrap-icons.min.css" integrity="sha512-t7Few9xlddEmgd3oKZQahkNI4dS6l80+eGEzFQiqtyVYdvcSG2D3Iub77R20BdotfRPA9caaRkg1tyaJiPmO0g==" crossorigin="anonymous">
 	<link href="css/main.css" rel="stylesheet">
-
-	<!--[if lt IE 9]>
-	  <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.0/html5shiv.js" integrity="sha256-jHqcBHBWM2erADB7T7m7MFLQon8LlOY7ncC7jDaUScs=" crossorigin="anonymous"></script>
-	  <script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.3.0/respond.min.js" integrity="sha256-g2lnLPqUkGXj7GDW+Zy47+O2ph+Ur1cmtdklVqkj+kg=" crossorigin="anonymous"></script>
-	<![endif]-->
 </head>
 
-<body>
+<body class="bg-body-tertiary">
 	<!-- Fixed navbar -->
-	<div class="navbar navbar-default navbar-fixed-top">
+	<nav class="navbar navbar-expand-xl bg-primary sticky-top py-0" data-bs-theme="dark">
 		<div class="container">
-		<div class="navbar-header">
-		  <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
-			<span class="icon-bar"></span>
-			<span class="icon-bar"></span>
-			<span class="icon-bar"></span>
-		  </button>
-		  <a class="navbar-brand" href="/"><b>Buildroot</b></a>
-		</div>
-		<div class="navbar-collapse collapse">
-			<ul class="nav navbar-nav navbar-right">
-				<li><a href="/news.html">
-					<span class="glyphicon glyphicon-star"></span> News</a></li>
-				<li><a href="/docs.html">
-					<span class="glyphicon glyphicon-book"></span> Documentation</a></li>
-				<li><a href="/support.html">
-					<span class="glyphicon glyphicon-question-sign"></span> Support</a></li>
-				<li><a href="/contribute.html">
-					<span class="glyphicon glyphicon-share"></span> Contribute</a></li>
-				<li><a href="/lts.html">
-					<span class="glyphicon glyphicon-send"></span> LTS</a></li>
-				<li><a href="/sponsors.html">
-					<span class="glyphicon glyphicon-usd"></span> Sponsors</a></li>
-				<li><a href="/association.html">
-					<span class="glyphicon glyphicon-resize-small"></span> Association</a></li>
-				<li><a id="menubutton" class="btn btn-success btn-shrink" href="/download.html">
-					<span class="glyphicon glyphicon-cloud-download"></span>
-					<span class="text-shrink" >Download</span></a></li>
+		<div class="row flex-grow-1 justify-content-center g-0">
+		<div class="col-xxl-10 d-flex flex-wrap align-items-center justify-content-between">
+		<a class="navbar-brand py-2" href="/"><b>Buildroot</b></a>
+		<button class="navbar-toggler border-0 shadow-none" type="button" data-bs-toggle="collapse" data-bs-target="#navbar-main" aria-controls="navbar-main" aria-expanded="false" aria-label="Toggle navigation">
+			<span class="navbar-toggler-icon"></span>
+		</button>
+		<div class="collapse navbar-collapse" id="navbar-main">
+			<ul class="navbar-nav ms-auto">
+				<li class="nav-item"><a class="nav-link fw-light px-2" href="/news.html">
+					<span class="bi bi-star-fill"></span> News</a></li>
+				<li class="nav-item"><a class="nav-link fw-light px-2" href="/docs.html">
+					<span class="bi bi-book-fill"></span> Documentation</a></li>
+				<li class="nav-item"><a class="nav-link fw-light px-2" href="/support.html">
+					<span class="bi bi-question-circle-fill"></span> Support</a></li>
+				<li class="nav-item"><a class="nav-link fw-light px-2" href="/contribute.html">
+					<span class="bi bi-share-fill"></span> Contribute</a></li>
+				<li class="nav-item"><a class="nav-link fw-light px-2" href="/lts.html">
+					<span class="bi bi-send-fill"></span> LTS</a></li>
+				<li class="nav-item"><a class="nav-link fw-light px-2" href="/sponsors.html">
+					<span class="bi bi-currency-dollar"></span> Sponsors</a></li>
+				<li class="nav-item"><a class="nav-link fw-light px-2" href="/association.html">
+					<span class="bi bi-arrows-angle-contract"></span> Association</a></li>
+				<li class="nav-item align-self-xl-center"><a class="btn btn-success ms-xl-3 my-2 my-xl-0" href="/download.html">
+					<span class="bi bi-cloud-download-fill"></span> Download</a></li>
 			</ul>
-		</div><!--/.nav-collapse -->
+		</div><!--/.navbar-collapse -->
+		</div>
+		</div>
 		</div>
-	</div>
+	</nav>
diff --git a/docs/website/index.html b/docs/website/index.html
index 027fd485e0..17bf092abb 100644
--- a/docs/website/index.html
+++ b/docs/website/index.html
@@ -1,37 +1,45 @@
 <!--#include file="header.html" -->
 
-<div id="headerwrap">
+<div class="bg-primary py-5">
   <div class="container">
-    <div class="row">
-      <div class="col-sm-6">
-	<img class="img-responsive center-block" src="images/logo.png" alt="" style="max-width:300px">
+<div class="row justify-content-center">
+<div class="col-xxl-10">
+    <div class="row align-items-center">
+      <div class="col-md-6">
+	<img class="img-fluid mx-auto d-block" src="images/logo.png" alt="" style="max-width:300px">
       </div><!-- /col-lg-6 -->
-      <div class="col-sm-6">
-	<h1>Buildroot<br>
-	  <small>Making Embedded Linux Easy</small></h1>
-	<div class="col-sm-6" style="margin-top:1em; padding-left:0px;">
-	  <a class="btn btn-default btn-lg" style="width:100%;" href="#about"><span class="glyphicon glyphicon-info-sign"></span>&nbsp; Learn more</a>
-	</div>
-	<div class="col-sm-6" style="margin-top:1em; padding-left:0px;">
-	  <a class="btn btn-default btn-lg" style="width:100%; margin-bottom: 20px;" href="/download.html"><span class="glyphicon glyphicon-cloud-download"></span>&nbsp; Download</a>
+      <div class="col-md-6">
+	<h1 class="display-3 fw-bold text-white">Buildroot<br>
+	  <small class="d-block mt-2 fs-2 fw-normal text-white-50">Making Embedded Linux Easy</small></h1>
+	<div class="row g-3 mt-1">
+	  <div class="col-lg-6">
+	    <a class="btn btn-secondary btn-lg w-100" href="#about"><span class="bi bi-info-circle-fill"></span>&nbsp; Learn more</a>
+	  </div>
+	  <div class="col-lg-6">
+	    <a class="btn btn-secondary btn-lg w-100" href="/download.html"><span class="bi bi-cloud-download-fill"></span>&nbsp; Download</a>
+	  </div>
 	</div>
       </div><!-- /col-lg-6 -->
     </div><!-- /row -->
-  </div><!-- /container -->
-</div><!-- /headerwrap -->
+  </div>
+</div>
+</div><!-- /container -->
+</div>
 
 <a name="about"></a>
 <div class="container">
-  <div class="row mt centered">
-    <div class="col-lg-8 col-lg-offset-2">
-      <h1>Buildroot is a simple, efficient and easy-to-use tool to
+<div class="row justify-content-center">
+<div class="col-xxl-10">
+  <div class="row my-5 text-center">
+    <div class="col-lg-8 offset-lg-2">
+      <h1 class="fw-light">Buildroot is a simple, efficient and easy-to-use tool to
 	generate embedded Linux systems through cross-compilation.</h1>
     </div>
   </div><!-- /row -->
 
-  <div class="row mt centered">
+  <div class="row my-5 text-center">
     <div class="col-md-4">
-      <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
+      <div class="flip-container mx-auto" ontouchstart="this.classList.toggle('hover');">
 	<div class="flipper">
 	  <div class="front">
 	    <img src="images/tux-flat.png" width="180" alt="">
@@ -42,13 +50,13 @@
 	</div>
       </div>
 
-      <h4>Can handle everything</h4>
+      <h4 class="mt-3 text-body-secondary">Can handle everything</h4>
       <p>Cross-compilation toolchain, root filesystem generation,
 	kernel image compilation and bootloader compilation.</p>
     </div><!--/col-lg-4 -->
 
     <div class="col-md-4">
-      <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
+      <div class="flip-container mx-auto" ontouchstart="this.classList.toggle('hover');">
 	<div class="flipper">
 	  <div class="front">
 	    <img src="images/hammer.png" width="180" alt="">
@@ -59,7 +67,7 @@
 	</div>
       </div>
 
-      <h4>Is very easy</h4>
+      <h4 class="mt-3 text-body-secondary">Is very easy</h4>
       <p>Thanks to its kernel-like menuconfig, gconfig and
 	xconfig configuration interfaces, building a basic system with
 	Buildroot is easy and typically takes 15-30 minutes.</p>
@@ -67,7 +75,7 @@
     </div><!--/col-lg-4 -->
 
     <div class="col-md-4">
-      <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
+      <div class="flip-container mx-auto" ontouchstart="this.classList.toggle('hover');">
 	<div class="flipper">
 	  <div class="front">
 	    <img src="images/gift.png" width="180" alt="">
@@ -78,85 +86,103 @@
 	</div>
       </div>
 
-      <h4>Supports several thousand packages</h4>
+      <h4 class="mt-3 text-body-secondary">Supports several thousand packages</h4>
       <p>X.org stack, Gtk3, Qt 5, GStreamer, Webkit, Kodi, a large number of network-related and system-related utilities are supported.</p>
 
     </div><!--/col-lg-4 -->
   </div><!-- /row -->
   <hr>
+</div>
+</div>
 </div><!-- /container -->
 
 <div class="container">
-  <div class="row mt centered">
-    <div class="col-lg-6 col-lg-offset-3">
-      <h1>Buildroot is for Everyone.</h1>
-      <h3>Has a simple structure that makes it easy to understand and extend. It relies only on the well-known Makefile language.</h3>
+<div class="row justify-content-center">
+<div class="col-xxl-10">
+  <div class="row my-5 text-center">
+    <div class="col-lg-6 offset-lg-3">
+      <h1 class="fw-light">Buildroot is for Everyone.</h1>
+      <h3 class="text-body-secondary">Has a simple structure that makes it easy to understand and extend. It relies only on the well-known Makefile language.</h3>
     </div>
   </div><!-- /row -->
 
-  <div class="row mt centered">
-    <div class="col-lg-8 col-lg-offset-2">
-      <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
+  <div class="row my-5 text-center">
+    <div class="col-lg-8 offset-lg-2">
+      <div id="carousel-example-generic" class="carousel carousel-dark slide" data-bs-ride="carousel">
 	<!-- Wrapper for slides -->
 	<div class="carousel-inner">
-	  <div class="item active">
-	    <img src="images/nconfig.png" alt="">
+	  <div class="carousel-item active">
+	    <img class="d-block mx-auto img-fluid" src="images/nconfig.png" alt="">
 	  </div>
-	  <div class="item">
-	    <img src="images/menuconfig.png" alt="">
+	  <div class="carousel-item">
+	    <img class="d-block mx-auto img-fluid" src="images/menuconfig.png" alt="">
 	  </div>
-	  <div class="item">
-	    <img src="images/xconfig.png" alt="">
+	  <div class="carousel-item">
+	    <img class="d-block mx-auto img-fluid" src="images/xconfig.png" alt="">
 	  </div>
 	</div>
 	<!-- Indicators -->
-	<ol class="carousel-indicators" style="margin-top:10px">
-	  <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
-	  <li data-target="#carousel-example-generic" data-slide-to="1"></li>
-	  <li data-target="#carousel-example-generic" data-slide-to="2"></li>
-	</ol>
+	<div class="carousel-indicators">
+	  <button type="button" data-bs-target="#carousel-example-generic" data-bs-slide-to="0" class="active" aria-current="true" aria-label="nconfig"></button>
+	  <button type="button" data-bs-target="#carousel-example-generic" data-bs-slide-to="1" aria-label="menuconfig"></button>
+	  <button type="button" data-bs-target="#carousel-example-generic" data-bs-slide-to="2" aria-label="xconfig"></button>
+	</div>
       </div>
     </div><!-- /col-lg-8 -->
   </div><!-- /row -->
+</div>
+</div>
 </div><!-- /container -->
 
 <div class="container">
-  <div class="row mt centered">
-    <div class="col-lg-6 col-lg-offset-3">
-      <h1>Our recent activity.</h1>
-      <h3>Buildroot is an open source project: many developers contribute to it daily.</h3>
+<div class="row justify-content-center">
+<div class="col-xxl-10">
+  <div class="row my-5 text-center">
+    <div class="col-lg-6 offset-lg-3">
+      <h1 class="fw-light">Our recent activity.</h1>
+      <h3 class="text-body-secondary">Buildroot is an open source project: many developers contribute to it daily.</h3>
     </div>
   </div><!-- /row -->
+</div>
+</div>
 </div><!-- /container -->
 
 <div class="container">
+<div class="row justify-content-center">
+<div class="col-xxl-10">
   <div class="row">
     <div class="col-sm-6">
-      <div class="panel panel-primary">
-	<div class="panel-heading"><a href="https://gitlab.com/buildroot.org/buildroot/"><h5>Recent commits</h5></a></div>
-	<div class="panel-box panel-body ellipsis" id="commit-activity">
+      <div class="card mb-4">
+	<div class="card-header text-bg-primary rounded-top"><a class="link-light" href="https://gitlab.com/buildroot.org/buildroot/">Recent commits</a></div>
+	<div class="panel-box card-body ellipsis" id="commit-activity">
 	</div>
       </div>
     </div>
     <div class="col-sm-6" >
-      <div class="panel panel-primary">
-	<div class="panel-heading"><a href="https://lore.kernel.org/buildroot/"><h5>Recent discussions</h5></a></div>
-	<div class="panel-box panel-body ellipsis" id="mailing-list-activity">
+      <div class="card mb-4">
+	<div class="card-header text-bg-primary rounded-top"><a class="link-light" href="https://lore.kernel.org/buildroot/">Recent discussions</a></div>
+	<div class="panel-box card-body ellipsis" id="mailing-list-activity">
 	</div>
       </div>
     </div>
   </div>
+</div>
+</div>
 </div><!-- /container -->
 
 <div class="container">
-  <div class="row mt centered">
-    <div class="col-lg-6 col-lg-offset-3">
-      <h1>Security</h1>
-      <h3>To report a security vulnerability, please send an email to
+<div class="row justify-content-center">
+<div class="col-xxl-10">
+  <div class="row my-5 text-center">
+    <div class="col-lg-6 offset-lg-3">
+      <h1 class="fw-light">Security</h1>
+      <h3 class="text-body-secondary">To report a security vulnerability, please send an email to
 	<a href="mailto:security@buildroot.org">security@buildroot.org</a>.</h3>
     </div>
   </div><!-- /row -->
   <hr>
+</div>
+</div>
 </div><!-- /container -->
 
 <!--#include file="footer.html" -->
diff --git a/docs/website/js/buildroot.js b/docs/website/js/buildroot.js
index b2975fb609..9b2d8e1f89 100644
--- a/docs/website/js/buildroot.js
+++ b/docs/website/js/buildroot.js
@@ -70,7 +70,7 @@ function showTooltip(elem, msg) {
 let clipboard = new Clipboard('.btn');
 
 $(function () {
-  $('[data-toggle="tooltip"]').tooltip()
+  $('[data-bs-toggle="tooltip"]').tooltip()
 });
 
 clipboard.on('success', function(e) {
@@ -97,7 +97,7 @@ jQuery(document).ready(function($) {
     let url = window.location.href;
     // Get the basename of the URL
     url = url.split(/[\\/]/).pop();
-    $('.nav a[href="/' + url + '"]').parent().addClass('active');
+    $('.navbar-nav a.nav-link[href="/' + url + '"]').addClass('active bg-light');
 
     load_activity("/new.atom");
 
diff --git a/docs/website/lts.html b/docs/website/lts.html
index 2ecafceef0..4308a37a4d 100644
--- a/docs/website/lts.html
+++ b/docs/website/lts.html
@@ -2,45 +2,45 @@
 
 <link href="css/lts.css" rel="stylesheet">
 
-<div id="headerwrap" class="br-lts-header">
-  <div class="container">
+<div class="bg-primary py-5">
+  <div class="container py-5">
     <div class="row">
-      <div class="col-sm-12 centered">
-	<h1>Buildroot LTS<br>
-	  <small>3-year long-term support with security fixes</small></h1>
+      <div class="col-sm-12 text-center">
+	<h1 class="display-1 fw-bold text-white">Buildroot LTS<br>
+	  <small class="d-block mt-3 display-6 text-white-50">3-year long-term support with security fixes</small></h1>
       </div>
     </div>
   </div>
 </div>
 
-<div class="container br-lts-main">
+<div class="container br-lts-main my-5">
 <div class="row">
-<div class="col-lg-10 col-lg-offset-1 col-md-12 col-sm-12 col-xs-12">
+<div class="col-lg-10 offset-lg-1 col-md-12 col-sm-12 col-12">
 
-    <div id="objectives" class="panel panel-primary">
-    <div class="panel-heading">LTS Objectives</div>
-    <div class="panel-body">
+    <div id="objectives" class="card mb-4">
+    <div class="card-header text-bg-primary rounded-top">LTS Objectives</div>
+    <div class="card-body">
 
-    <div class="br-lts-item-row">
-        <div class="br-lts-item-number">1</div>
-        <div class="br-lts-item-content">
-            <h3 class="br-lts-item-title">
+    <div class="list-group list-group-flush">
+    <div class="list-group-item d-flex gap-3 py-3">
+        <span class="badge rounded-pill text-bg-primary fs-5 align-self-start">1</span>
+        <div>
+            <h3 class="h4 text-body-secondary">
                 3-year LTS support
             </h3>
-            <p>
+            <p class="mb-0">
             Starting with version <code>2025.02</code>, the LTS support has been extended to
             <strong>3 years</strong>, replacing the previous 1-year cycle.
             </p>
         </div>
     </div>
-
-    <div class="br-lts-item-row">
-        <div class="br-lts-item-number">2</div>
-        <div class="br-lts-item-content">
-            <h3 class="br-lts-item-title">
+    <div class="list-group-item d-flex gap-3 py-3">
+        <span class="badge rounded-pill text-bg-primary fs-5 align-self-start">2</span>
+        <div>
+            <h3 class="h4 text-body-secondary">
                 Vulnerability tracking & reporting
             </h3>
-            <p>
+            <p class="mb-0">
             Tracking of the vulnerabilities affecting Buildroot
             is available at
             <a href="https://security.buildroot.org/">security.buildroot.org</a>.
@@ -50,41 +50,39 @@
             </p>
         </div>
     </div>
-
-    <div class="br-lts-item-row">
-        <div class="br-lts-item-number">3</div>
-        <div class="br-lts-item-content">
-            <h3 class="br-lts-item-title">
+    <div class="list-group-item d-flex gap-3 py-3">
+        <span class="badge rounded-pill text-bg-primary fs-5 align-self-start">3</span>
+        <div>
+            <h3 class="h4 text-body-secondary">
                 Sponsored LTS stewards
             </h3>
-            <p>
+            <p class="mb-0">
             To ensure a consistent release cadence and maintenance
             workflow, paid LTS stewards are assigned to the weekly LTS
             maintenance tasks.
             </p>
         </div>
     </div>
-
-    <div class="br-lts-item-row">
-        <div class="br-lts-item-number">4</div>
-        <div class="br-lts-item-content">
-            <h3 class="br-lts-item-title">
+    <div class="list-group-item d-flex gap-3 py-3">
+        <span class="badge rounded-pill text-bg-primary fs-5 align-self-start">4</span>
+        <div>
+            <h3 class="h4 text-body-secondary">
                 Dedicated backports
             </h3>
-            <p>
+            <p class="mb-0">
             Vulnerability fixes applied to the <code>master</code> branch will be
             prioritized for backporting to stable branches.
             </p>
         </div>
     </div>
-
+    </div>
 
     </div>
     </div>
 
-    <div id="releases" class="panel panel-primary">
-    <div class="panel-heading">Releases</div>
-    <div class="panel-body">
+    <div id="releases" class="card mb-4">
+    <div class="card-header text-bg-primary rounded-top">Releases</div>
+    <div class="card-body">
 
     <p>
     The Buildroot LTS sponsorship initiative has evolved from a more
@@ -96,71 +94,110 @@
     </p>
 
 
-    <div class="br-lts-chart">
-        <div class="br-lts-chart-head">
-            <div class="br-lts-head-spacer"></div>
-            <div class="br-lts-chart-head-label br-lts-span-year">2025</div>
-            <div class="br-lts-chart-head-label br-lts-span-year">2026</div>
-            <div class="br-lts-chart-head-label br-lts-span-year">2027</div>
-        </div>
-
-        <div class="br-lts-chart-row">
-            <div class="br-lts-chart-label">2025.02</div>
-            <div class="br-lts-bar br-lts-bar--long br-lts-col-start-2">3 Years Support (LTS)</div>
-        </div>
-
-        <div class="br-lts-chart-row">
-            <div class="br-lts-chart-label">2025.05</div>
-            <div class="br-lts-bar br-lts-col-start-3">3 mo</div>
-        </div>
-
-        <div class="br-lts-chart-row">
-            <div class="br-lts-chart-label">2025.08</div>
-            <div class="br-lts-bar br-lts-col-start-4">3 mo</div>
-        </div>
-
-        <div class="br-lts-chart-row">
-            <div class="br-lts-chart-label">2025.11</div>
-            <div class="br-lts-bar br-lts-col-start-5">3 mo</div>
-        </div>
-
-        <div class="br-lts-chart-row">
-            <div class="br-lts-chart-label">2026.02</div>
-            <div class="br-lts-bar br-lts-col-start-6">3 mo</div>
-        </div>
-
-        <div class="br-lts-chart-row">
-            <div class="br-lts-chart-label">2026.05</div>
-            <div class="br-lts-bar br-lts-col-start-7">3 mo</div>
-        </div>
-
-        <div class="br-lts-chart-row">
-            <div class="br-lts-chart-label">2026.08</div>
-            <div class="br-lts-bar br-lts-col-start-8">3 mo</div>
-        </div>
-
-        <div class="br-lts-chart-row">
-            <div class="br-lts-chart-label">2026.11</div>
-            <div class="br-lts-bar br-lts-col-start-9">3 mo</div>
-        </div>
-
-        <div class="br-lts-chart-row">
-            <div class="br-lts-chart-label">2027.02</div>
-            <div class="br-lts-bar br-lts-bar--long br-lts-col-start-10">3 Years Support (LTS)</div>
-        </div>
-
-        <div class="br-lts-chart-row br-lts-chart-row--faded">
-            <div class="br-lts-chart-label">...</div>
-        </div>
+    <div class="card mt-3">
+      <div class="table-responsive">
+        <table class="table align-middle mb-0">
+          <thead>
+            <tr>
+              <th scope="col"></th>
+              <th scope="col" class="w-100">
+                <div class="row g-0 text-center">
+                  <div class="col-4">2025</div>
+                  <div class="col-4">2026</div>
+                  <div class="col-4">2027</div>
+                </div>
+              </th>
+            </tr>
+          </thead>
+          <tbody>
+            <tr>
+              <th scope="row" class="text-nowrap">2025.02</th>
+              <td>
+                <div class="row g-0">
+                  <div class="col-12 px-1"><span class="badge text-bg-warning d-block text-truncate">3 Years Support (LTS)</span></div>
+                </div>
+              </td>
+            </tr>
+            <tr>
+              <th scope="row" class="text-nowrap">2025.05</th>
+              <td>
+                <div class="row g-0">
+                  <div class="col-1 offset-1 px-1"><span class="badge text-bg-primary d-block text-truncate">3 mo</span></div>
+                </div>
+              </td>
+            </tr>
+            <tr>
+              <th scope="row" class="text-nowrap">2025.08</th>
+              <td>
+                <div class="row g-0">
+                  <div class="col-1 offset-2 px-1"><span class="badge text-bg-primary d-block text-truncate">3 mo</span></div>
+                </div>
+              </td>
+            </tr>
+            <tr>
+              <th scope="row" class="text-nowrap">2025.11</th>
+              <td>
+                <div class="row g-0">
+                  <div class="col-1 offset-3 px-1"><span class="badge text-bg-primary d-block text-truncate">3 mo</span></div>
+                </div>
+              </td>
+            </tr>
+            <tr>
+              <th scope="row" class="text-nowrap">2026.02</th>
+              <td>
+                <div class="row g-0">
+                  <div class="col-1 offset-4 px-1"><span class="badge text-bg-primary d-block text-truncate">3 mo</span></div>
+                </div>
+              </td>
+            </tr>
+            <tr>
+              <th scope="row" class="text-nowrap">2026.05</th>
+              <td>
+                <div class="row g-0">
+                  <div class="col-1 offset-5 px-1"><span class="badge text-bg-primary d-block text-truncate">3 mo</span></div>
+                </div>
+              </td>
+            </tr>
+            <tr>
+              <th scope="row" class="text-nowrap">2026.08</th>
+              <td>
+                <div class="row g-0">
+                  <div class="col-1 offset-6 px-1"><span class="badge text-bg-primary d-block text-truncate">3 mo</span></div>
+                </div>
+              </td>
+            </tr>
+            <tr>
+              <th scope="row" class="text-nowrap">2026.11</th>
+              <td>
+                <div class="row g-0">
+                  <div class="col-1 offset-7 px-1"><span class="badge text-bg-primary d-block text-truncate">3 mo</span></div>
+                </div>
+              </td>
+            </tr>
+            <tr>
+              <th scope="row" class="text-nowrap">2027.02</th>
+              <td>
+                <div class="row g-0">
+                  <div class="col-4 offset-8 px-1"><span class="badge text-bg-warning d-block text-truncate">3 Years Support (LTS)</span></div>
+                </div>
+              </td>
+            </tr>
+            <tr>
+              <th scope="row" class="text-nowrap text-body-secondary">...</th>
+              <td></td>
+            </tr>
+          </tbody>
+        </table>
+      </div>
     </div>
 
 
     </div>
     </div>
 
-    <div id="organization" class="panel panel-primary">
-    <div class="panel-heading">How we work</div>
-    <div class="panel-body">
+    <div id="organization" class="card mb-4">
+    <div class="card-header text-bg-primary rounded-top">How we work</div>
+    <div class="card-body">
 
     <p>
     Each week, the LTS stewards define the set of commits to
@@ -191,103 +228,131 @@
     <a href="https://gitlab.com/buildroot.org/buildroot-lts-tools/-/blob/main/tools/README.md">documentation</a>.
     </p>
 
-    <div class="br-lts-chart br-lts-chart--wide-labels">
-        <div class="br-lts-chart-head">
-            <div class="br-lts-head-spacer"></div>
-            <div class="br-lts-chart-head-label br-lts-span-day">Monday</div>
-            <div class="br-lts-chart-head-label br-lts-span-day">Tuesday</div>
-            <div class="br-lts-chart-head-label br-lts-span-day">Wednesday</div>
-            <div class="br-lts-chart-head-label br-lts-span-day">Thursday</div>
-            <div class="br-lts-chart-head-label br-lts-span-day">Friday</div>
-            <div class="br-lts-chart-head-label br-lts-span-day">...</div>
-        </div>
-
-        <div class="br-lts-chart-row br-lts-chart-row--tall">
-            <div class="br-lts-chart-label">Freeze weekly commit set from master</div>
-            <div class="br-lts-bar br-lts-col-start-2"></div>
-        </div>
-
-        <div class="br-lts-chart-row br-lts-chart-row--tall">
-            <div class="br-lts-chart-label">Apply branch specific patches</div>
-            <div class="br-lts-bar br-lts-col-start-2"></div>
-        </div>
-
-        <div class="br-lts-chart-row br-lts-chart-row--tall">
-            <div class="br-lts-chart-label">Analysis & commit annotation</div>
-            <div class="br-lts-bar br-lts-bar--span-6 br-lts-col-start-2"></div>
-        </div>
-
-        <div class="br-lts-chart-row br-lts-chart-row--tall">
-            <div class="br-lts-chart-label">Cherry picking to staging branch</div>
-            <div class="br-lts-bar br-lts-bar--span-2 br-lts-col-start-7"></div>
-        </div>
-
-        <div class="br-lts-chart-row br-lts-chart-row--tall">
-            <div class="br-lts-chart-label">Push to upstream branch</div>
-            <div class="br-lts-bar br-lts-bar--span-2 br-lts-col-start-9"></div>
-        </div>
-
-        <div class="br-lts-chart-row br-lts-chart-row--tall">
-            <div class="br-lts-chart-label">Update vulns</div>
-            <div class="br-lts-bar br-lts-bar--span-2 br-lts-col-start-10"></div>
-        </div>
+    <div class="card mt-3">
+      <div class="table-responsive">
+        <table class="table align-middle mb-0">
+          <thead>
+            <tr>
+              <th scope="col" class="w-25"></th>
+              <th scope="col">
+                <div class="row g-0 text-center">
+                  <div class="col-2"><span class="d-none d-md-inline">Monday</span><span class="d-md-none">Mon</span></div>
+                  <div class="col-2"><span class="d-none d-md-inline">Tuesday</span><span class="d-md-none">Tue</span></div>
+                  <div class="col-2"><span class="d-none d-md-inline">Wednesday</span><span class="d-md-none">Wed</span></div>
+                  <div class="col-2"><span class="d-none d-md-inline">Thursday</span><span class="d-md-none">Thu</span></div>
+                  <div class="col-2"><span class="d-none d-md-inline">Friday</span><span class="d-md-none">Fri</span></div>
+                  <div class="col-2">...</div>
+                </div>
+              </th>
+            </tr>
+          </thead>
+          <tbody>
+            <tr>
+              <th scope="row">Freeze weekly commit set from master</th>
+              <td>
+                <div class="row g-0">
+                  <div class="col-1 px-1"><span class="badge text-bg-primary d-block text-truncate">&nbsp;</span></div>
+                </div>
+              </td>
+            </tr>
+            <tr>
+              <th scope="row">Apply branch specific patches</th>
+              <td>
+                <div class="row g-0">
+                  <div class="col-1 px-1"><span class="badge text-bg-primary d-block text-truncate">&nbsp;</span></div>
+                </div>
+              </td>
+            </tr>
+            <tr>
+              <th scope="row">Analysis & commit annotation</th>
+              <td>
+                <div class="row g-0">
+                  <div class="col-6 px-1"><span class="badge text-bg-primary d-block text-truncate">&nbsp;</span></div>
+                </div>
+              </td>
+            </tr>
+            <tr>
+              <th scope="row">Cherry picking to staging branch</th>
+              <td>
+                <div class="row g-0">
+                  <div class="col-2 offset-5 px-1"><span class="badge text-bg-primary d-block text-truncate">&nbsp;</span></div>
+                </div>
+              </td>
+            </tr>
+            <tr>
+              <th scope="row">Push to upstream branch</th>
+              <td>
+                <div class="row g-0">
+                  <div class="col-2 offset-7 px-1"><span class="badge text-bg-primary d-block text-truncate">&nbsp;</span></div>
+                </div>
+              </td>
+            </tr>
+            <tr>
+              <th scope="row">Update vulns</th>
+              <td>
+                <div class="row g-0">
+                  <div class="col-2 offset-8 px-1"><span class="badge text-bg-primary d-block text-truncate">&nbsp;</span></div>
+                </div>
+              </td>
+            </tr>
+          </tbody>
+        </table>
+      </div>
     </div>
 
     </div>
     </div>
 
-    <div id="benefits" class="panel panel-primary">
-    <div class="panel-heading">Sponsorship benefits</div>
-    <div class="panel-body">
+    <div id="benefits" class="card mb-4">
+    <div class="card-header text-bg-primary rounded-top">Sponsorship benefits</div>
+    <div class="card-body">
 
-    <div class="br-lts-item-row">
-        <div class="br-lts-item-number">1</div>
-        <div class="br-lts-item-content">
-            <h3 class="br-lts-item-title">
+    <div class="list-group list-group-flush">
+    <div class="list-group-item d-flex gap-3 py-3">
+        <span class="badge rounded-pill text-bg-primary fs-5 align-self-start">1</span>
+        <div>
+            <h3 class="h4 text-body-secondary">
                 Long-term sustainability
             </h3>
-            <p>
+            <p class="mb-0">
                 Sponsors ensure the long-term sustainability of the Buildroot
                 LTS effort with dedicated stewards assigned to tasks such as
                 backporting, security monitoring and LTS releases.
             </p>
         </div>
     </div>
-
-    <div class="br-lts-item-row">
-        <div class="br-lts-item-number">2</div>
-        <div class="br-lts-item-content">
-            <h3 class="br-lts-item-title">
+    <div class="list-group-item d-flex gap-3 py-3">
+        <span class="badge rounded-pill text-bg-primary fs-5 align-self-start">2</span>
+        <div>
+            <h3 class="h4 text-body-secondary">
                 Recognition of your sponsorship
             </h3>
-            <p>
+            <p class="mb-0">
                 Sponsors can be publicly acknowledged on the Buildroot website.
                 Sponsors may provide a logo linking to a webpage of their
                 choice.
             </p>
         </div>
     </div>
-
-    <div class="br-lts-item-row">
-        <div class="br-lts-item-number">3</div>
-        <div class="br-lts-item-content">
-            <h3 class="br-lts-item-title">
+    <div class="list-group-item d-flex gap-3 py-3">
+        <span class="badge rounded-pill text-bg-primary fs-5 align-self-start">3</span>
+        <div>
+            <h3 class="h4 text-body-secondary">
                 Direct interaction with LTS stewards
             </h3>
-            <p>
+            <p class="mb-0">
                 Sponsors may submit queries and requests regarding
                 Buildroot LTS and security updates.
             </p>
         </div>
     </div>
-
-    <div class="br-lts-item-row">
-        <div class="br-lts-item-number">4</div>
-        <div class="br-lts-item-content">
-            <h3 class="br-lts-item-title">
+    <div class="list-group-item d-flex gap-3 py-3">
+        <span class="badge rounded-pill text-bg-primary fs-5 align-self-start">4</span>
+        <div>
+            <h3 class="h4 text-body-secondary">
                 Assignment of priorities for package tracking
             </h3>
-            <p>
+            <p class="mb-0">
                 Buildroot integrates more than 2000 open source packages,
                 many of which do not offer long-term stable releases or
                 security updates.
@@ -299,14 +364,13 @@
             </p>
         </div>
     </div>
-
-    <div class="br-lts-item-row">
-        <div class="br-lts-item-number">5</div>
-        <div class="br-lts-item-content">
-            <h3 class="br-lts-item-title">
+    <div class="list-group-item d-flex gap-3 py-3">
+        <span class="badge rounded-pill text-bg-primary fs-5 align-self-start">5</span>
+        <div>
+            <h3 class="h4 text-body-secondary">
                 Testing of your packages
             </h3>
-            <p>
+            <p class="mb-0">
                 To make sure the packages of interest to the sponsors don't
                 include regressions between releases.
                 Sponsors may submit a list of packages to be tested
@@ -314,14 +378,13 @@
             </p>
         </div>
     </div>
-
-    <div class="br-lts-item-row">
-        <div class="br-lts-item-number">6</div>
-        <div class="br-lts-item-content">
-            <h3 class="br-lts-item-title">
+    <div class="list-group-item d-flex gap-3 py-3">
+        <span class="badge rounded-pill text-bg-primary fs-5 align-self-start">6</span>
+        <div>
+            <h3 class="h4 text-body-secondary">
                 Personalized security reports
             </h3>
-            <p>
+            <p class="mb-0">
                 Sponsors receive personalized security reports for their
                 Buildroot packages in the form of
                 <a href="https://security.buildroot.org/">security.buildroot.org</a>
@@ -329,21 +392,23 @@
             </p>
         </div>
     </div>
-
+    </div>
     </div>
     </div>
 
-    <div id="sponsor" class="panel panel-primary">
-    <div class="panel-heading">Sponsor now!</div>
-    <div class="panel-body">
+    <div id="sponsor" class="card mb-4">
+    <div class="card-header text-bg-primary rounded-top">Sponsor now!</div>
+    <div class="card-body">
     <p>
     Interested ? Contact us at
     <a href="mailto:buildroot-lts@buildroot.org?subject=[buildroot-lts] Sponsorship information&body=Thanks for showing interest in the Buildroot LTS Sponsorship. We would appreciate if you could introduce yourself and your company by answering the following questions: in which products do you use Buildroot ? How are you using Buildroot ? How many different configurations do you have ? How long do you support your products ?">buildroot-lts@buildroot.org</a>
     to learn more about the different sponsorship tiers and get all the
     details about the sponsorship.
     </p>
-    <a class="btn btn-success btn-lg" href="mailto:buildroot-lts@buildroot.org?subject=[buildroot-lts] Sponsorship information&body=Thanks for showing interest in the Buildroot LTS Sponsorship. We would appreciate if you could introduce yourself and your company by answering the following questions: in which products do you use Buildroot ? How are you using Buildroot ? How many different configurations do you have ? How long do you support your products ?">
-      <span class="glyphicon glyphicon-envelope"></span>&nbsp; Contact us</a>
+    <div class="text-center">
+      <a class="btn btn-success btn-lg" href="mailto:buildroot-lts@buildroot.org?subject=[buildroot-lts] Sponsorship information&body=Thanks for showing interest in the Buildroot LTS Sponsorship. We would appreciate if you could introduce yourself and your company by answering the following questions: in which products do you use Buildroot ? How are you using Buildroot ? How many different configurations do you have ? How long do you support your products ?">
+        <span class="bi bi-envelope-fill"></span>&nbsp; Contact us</a>
+    </div>
     </div>
     </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index b1c948e097..2295abbf57 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -3,18 +3,18 @@
 <link href="css/timeline.css" rel="stylesheet">
 
 <div class="container">
-<div class="row nh">
-<div class="col-lg-10 col-lg-offset-1 col-md-12 col-sm-12 col-xs-12">
+<div class="row my-4">
+<div class="col-lg-10 offset-lg-1 col-md-12 col-sm-12 col-12">
 
 <h2>News</h2>
 <ul class="timeline">
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2025.02.19 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>22 October 2026</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>22 October 2026</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2025.02.19 bugfix release is out, fixing a number of important /
@@ -29,11 +29,11 @@
   </li>
 
   <li class="timeline">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2026.08.1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>22 October 2026</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>22 October 2026</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2026.08.1 bugfix release is out, fixing a number of important /
@@ -48,11 +48,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2026.05.3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>10 September 2026</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>10 September 2026</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2026.05.3 bugfix release is out, fixing a number of important /
@@ -67,11 +67,11 @@
   </li>
 
   <li class="timeline">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2025.02.18 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>10 September 2026</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>10 September 2026</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2025.02.18 bugfix release is out, fixing a number of important /
@@ -86,11 +86,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2026.08 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>4 September 2026</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>4 September 2026</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2026.08 release is out - Thanks to everyone
@@ -105,11 +105,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2026.08-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>29 August 2026</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>29 August 2026</small></p>
       </div>
       <div class="timeline-body">
         <p>Another week, another release candidate with more cleanups and build fixes. See the
@@ -126,11 +126,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2026.08-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>23 August 2026</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>23 August 2026</small></p>
       </div>
       <div class="timeline-body">
         <p>Another week, another release candidate with more cleanups and build fixes. See the
@@ -147,11 +147,11 @@
   </li>
 
   <li class="timeline">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2026.05.2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>23 August 2026</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>23 August 2026</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2026.05.2 bugfix release is out, fixing a number of important /
@@ -166,11 +166,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2025.02.17 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>23 August 2026</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>23 August 2026</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2025.02.17 bugfix release is out, fixing a number of important /
@@ -185,11 +185,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2026.08-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>18 August 2026</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>18 August 2026</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over the tree, see the
@@ -206,11 +206,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2026.05.1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>15 July 2026</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>15 July 2026</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2026.05.1 bugfix release is out, fixing a number of important /
@@ -225,11 +225,11 @@
   </li>
 
   <li class="timeline">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2025.02.16 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>15 July 2026</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>15 July 2026</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2025.02.16 bugfix release is out, fixing a number of important /
@@ -244,11 +244,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2025.02.15 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>16 June 2026</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>16 June 2026</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2025.02.15 bugfix release is out, fixing a number of important /
@@ -263,11 +263,11 @@
   </li>
 
   <li class="timeline">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2026.02.3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>16 June 2026</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>16 June 2026</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2026.02.3 bugfix release is out, fixing a number of important /
@@ -282,11 +282,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2026.05 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>8 June 2026</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>8 June 2026</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2026.05 release is out - Thanks to everyone
@@ -301,11 +301,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2026.05-rc4 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>4 June 2026</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>4 June 2026</small></p>
       </div>
       <div class="timeline-body">
         <p>The Nice hackathon brought a large amount of (security) bugfixes, so here comes another
@@ -323,11 +323,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2026.05-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>29 May 2026</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>29 May 2026</small></p>
       </div>
       <div class="timeline-body">
         <p>Another week, another release candidate with more cleanups and build fixes. See the
@@ -344,11 +344,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2026.05-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>21 May 2026</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>21 May 2026</small></p>
       </div>
       <div class="timeline-body">
         <p>Another week, another release candidate with more cleanups and build fixes. See the
@@ -365,11 +365,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2026.02.2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>20 May 2026</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>20 May 2026</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2026.02.2 bugfix release is out, fixing a number of important /
@@ -384,11 +384,11 @@
   </li>
 
   <li class="timeline">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2025.02.14 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>20 May 2026</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>20 May 2026</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2025.02.14 bugfix release is out, fixing a number of important /
@@ -403,11 +403,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2026.05-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>12 May 2026</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>12 May 2026</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over the tree, see the
@@ -424,11 +424,11 @@
   </li>
 
   <li class="timeline">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2026.02.1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>21 April 2026</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>21 April 2026</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2026.02.1 bugfix release is out, fixing a number of important /
@@ -443,11 +443,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2025.02.13 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>21 April 2026</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>21 April 2026</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2025.02.13 bugfix release is out, fixing a number of important /
@@ -462,11 +462,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2025.11.3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>17 March 2026</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>17 March 2026</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2025.11.3 bugfix release is out, fixing a number of important /
@@ -481,11 +481,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2025.02.12 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>17 March 2026</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>17 March 2026</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2025.02.12 bugfix release is out, fixing a number of important /
@@ -500,11 +500,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2026.02 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>4 March 2026</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>4 March 2026</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2026.02 release is out - Thanks to everyone
@@ -519,11 +519,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2026.02-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>2 March 2026</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>2 March 2026</small></p>
       </div>
       <div class="timeline-body">
         <p>Another week, another release candidate with more cleanups and build fixes. See the
@@ -540,11 +540,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2026.02-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>24 February 2026</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>24 February 2026</small></p>
       </div>
       <div class="timeline-body">
         <p>Another week, another release candidate with more cleanups and build fixes. See the
@@ -561,11 +561,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2025.11.2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>20 February 2026</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>20 February 2026</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2025.11.2 bugfix release is out, fixing a number of important /
@@ -580,11 +580,11 @@
   </li>
 
   <li class="timeline">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2025.02.11 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>20 February 2026</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>20 February 2026</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2025.02.11 bugfix release is out, fixing a number of important /
@@ -599,11 +599,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2026.02-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>17 February 2026</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>17 February 2026</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over the tree, see the
@@ -620,11 +620,11 @@
   </li>
 
   <li class="timeline">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">Marcus Hoffmann joins the maintainer team</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>5 February 2026</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>5 February 2026</small></p>
       </div>
       <div class="timeline-body">
         <p>We are happy to announce that Marcus Hoffmann has joined
@@ -635,11 +635,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2025.11.1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>20 January 2026</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>20 January 2026</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2025.11.1 bugfix release is out, fixing a number of important /
@@ -654,11 +654,11 @@
   </li>
 
   <li class="timeline">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2025.02.10 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>20 January 2026</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>20 January 2026</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2025.02.10 bugfix release is out, fixing a number of important /
@@ -673,11 +673,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2025.11 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>11 December 2025</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>11 December 2025</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2025.11 release is out - Thanks to everyone
@@ -692,11 +692,11 @@
   </li>
 
   <li class="timeline">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2025.02.9 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>11 December 2025</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>11 December 2025</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2025.02.9 bugfix release is out, fixing a number of important /
@@ -711,11 +711,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2025.08.3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>11 December 2025</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>11 December 2025</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2025.08.3 bugfix release is out, fixing a number of important /
@@ -730,11 +730,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2025.11-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>30 November 2025</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>30 November 2025</small></p>
       </div>
       <div class="timeline-body">
         <p>Another week, another release candidate with more cleanups and build fixes. See the
@@ -751,11 +751,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2025.08.2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>20 November 2025</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>20 November 2025</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2025.08.2 bugfix release is out, fixing a number of important /
@@ -770,11 +770,11 @@
   </li>
 
   <li class="timeline">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2025.02.8 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>20 November 2025</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>20 November 2025</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2025.02.8 bugfix release is out, fixing a number of important /
@@ -789,11 +789,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2025.11-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>20 November 2025</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>20 November 2025</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over the tree, see the
@@ -810,11 +810,11 @@
   </li>
 
   <li class="timeline">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2025.02.7 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>11 October 2025</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>11 October 2025</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2025.02.7 bugfix release is out, fixing a number of important /
@@ -829,11 +829,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2025.05.3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>11 October 2025</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>11 October 2025</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2025.05.3 bugfix release is out, fixing a number of important /
@@ -849,11 +849,11 @@
   </li>
 
   <li class="timeline">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2025.08.1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>11 October 2025</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>11 October 2025</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2025.08.1 bugfix release is out, fixing a number of important /
@@ -868,11 +868,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2025.05.2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>9 September 2025</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>9 September 2025</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2025.05.2 bugfix release is out, fixing a number of important /
@@ -887,11 +887,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2025.02.6 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>9 September 2025</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>9 September 2025</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2025.02.6 bugfix release is out, fixing a number of important /
@@ -906,11 +906,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2025.08 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>9 September 2025</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>9 September 2025</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2025.08 release is out - Thanks to everyone
@@ -925,11 +925,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2025.08-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>28 August 2025</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>28 August 2025</small></p>
       </div>
       <div class="timeline-body">
         <p>Another week, another release candidate with more cleanups and build fixes. See the
@@ -946,11 +946,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2025.08-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>21 August 2025</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>21 August 2025</small></p>
       </div>
       <div class="timeline-body">
         <p>Another week, another release candidate with more cleanups and build fixes. See the
@@ -967,11 +967,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2025.05.1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>11 August 2025</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>11 August 2025</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2025.05.1 bugfix release is out, fixing a number of important /
@@ -986,11 +986,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2025.02.5 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>11 August 2025</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>11 August 2025</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2025.02.5 bugfix release is out, fixing a number of important /
@@ -1005,11 +1005,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2025.08-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>11 August 2025</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>11 August 2025</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over the tree, see the
@@ -1026,11 +1026,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2025.02.4 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>23 June 2025</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>23 June 2025</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2025.02.4 bugfix release is out, fixing a number of important /
@@ -1045,11 +1045,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2025.05 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>9 June 2025</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>9 June 2025</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2025.05 release is out - Thanks to everyone
@@ -1064,11 +1064,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2025.05-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>28 May 2025</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>28 May 2025</small></p>
       </div>
       <div class="timeline-body">
         <p>Another week, another release candidate with more cleanups and build fixes. See the
@@ -1085,11 +1085,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2025.05-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>19 May 2025</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>19 May 2025</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over the tree, see the
@@ -1106,11 +1106,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2025.02.3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>19 May 2025</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>19 May 2025</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2025.02.3 bugfix release is out, fixing a number of important /
@@ -1129,11 +1129,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2025.02.01 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>22 April 2025</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>22 April 2025</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2025.02.1 bugfix release is out, fixing a number of important /
@@ -1148,11 +1148,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2024.02.13 released, 2024.02.x series EOL</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>22 April 2025</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>22 April 2025</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2024.02.13 bugfix release is out, fixing a number of important /
@@ -1170,11 +1170,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2024.11.4 released, 2024.11.x series EOL</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>22 April 2025</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>22 April 2025</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2024.11.4 bugfix release is out, fixing a number of important /
@@ -1192,11 +1192,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2024.02.12 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>24 March 2025</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>24 March 2025</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2024.02.12 bugfix release is out, fixing a number of important /
@@ -1214,11 +1214,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2024.11.3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>24 March 2025</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>24 March 2025</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2024.11.3 bugfix release is out, fixing a number of important /
@@ -1233,11 +1233,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2025.02 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>17 March 2025</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>17 March 2025</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2025.02 release is out - Thanks to everyone
@@ -1255,11 +1255,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2025.02-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>13 March 2025</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>13 March 2025</small></p>
       </div>
       <div class="timeline-body">
         <p>Another 2 weeks, another release candidate with more cleanups and build fixes. See the
@@ -1276,11 +1276,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2025.02-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>28 February 2025</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>28 February 2025</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over the tree, see the
@@ -1297,11 +1297,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2024.11.2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>21 February 2025</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>21 February 2025</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2024.11.2 bugfix release is out, fixing a number of important /
@@ -1316,11 +1316,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2024.02.11 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>21 Febrary 2025</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>21 Febrary 2025</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2024.02.11 bugfix release is out, fixing a number of important /
@@ -1335,11 +1335,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2024.11.1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>9 January 2025</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>9 January 2025</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2024.11.1 bugfix release is out, fixing a number of important /
@@ -1354,11 +1354,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2024.02.10 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>9 January 2025</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>9 January 2025</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2024.02.10 bugfix release is out, fixing a number of important /
@@ -1373,11 +1373,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2024.02.9 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>8 December 2024</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>8 December 2024</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2024.02.9 bugfix release is out, fixing a number of important /
@@ -1392,11 +1392,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2024.08.3 released, 2024.08.x series EOL</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>8 December 2024</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>8 December 2024</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2024.08.3 bugfix release is out, fixing a number of important /
@@ -1414,11 +1414,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2024.11 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>8 December 2024</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>8 December 2024</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2024.11 release is out - Thanks to everyone
@@ -1433,11 +1433,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2024.11-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>5 December 2024</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>5 December 2024</small></p>
       </div>
       <div class="timeline-body">
         <p>Another week, another release candidate with more cleanups and build fixes. See the
@@ -1454,11 +1454,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2024.11-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>23 November 2024</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>23 November 2024</small></p>
       </div>
       <div class="timeline-body">
         <p>Another week, another release candidate with more cleanups and build fixes. See the
@@ -1475,11 +1475,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2024.02.8 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>14 November 2024</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>14 November 2024</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2024.02.8 bugfix release is out, fixing a number of important /
@@ -1494,11 +1494,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2024.08.2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>14 November 2024</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>14 November 2024</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2024.08.2 bugfix release is out, fixing a number of important /
@@ -1513,11 +1513,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2024.11-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>13 November 2024</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>13 November 2024</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over the tree, see the
@@ -1534,11 +1534,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">Buildroot Developers Meeting 2025</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>2 October 2024</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>2 October 2024</small></p>
       </div>
       <div class="timeline-body">
 	The Buildroot community is organizing a 3-day <i>Buildroot
@@ -1555,11 +1555,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2024.02.7 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>21 October 2024</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>21 October 2024</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2024.02.7 bugfix release is out, fixing a number of important /
@@ -1574,11 +1574,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2024.08.1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>20 October 2024</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>20 October 2024</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2024.08.1 bugfix release is out, fixing a number of important /
@@ -1593,11 +1593,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2024.02.6 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>9 September 2024</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>9 September 2024</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2024.02.6 bugfix release is out, fixing a number of important /
@@ -1612,11 +1612,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2024.05.3 released, 2024.05.x series EOL</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>9 September 2024</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>9 September 2024</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2024.05.3 bugfix release is out, fixing a number of important /
@@ -1634,11 +1634,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2024.08 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>6 September 2024</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>6 September 2024</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2024.08 release is out - Thanks to everyone
@@ -1653,11 +1653,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2024.08-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>1 September 2024</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>1 September 2024</small></p>
       </div>
       <div class="timeline-body">
         <p>2024.08-rc3 has been released with more cleanups and build fixes. See the
@@ -1674,11 +1674,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2024.08-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>22 August 2024</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>22 August 2024</small></p>
       </div>
       <div class="timeline-body">
         <p>Another 2 weeks, another release candidate with more cleanups and build fixes. See the
@@ -1695,11 +1695,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2024.02.5 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>14 August 2024</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>14 August 2024</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2024.02.5 bugfix release is out, fixing a number of important /
@@ -1714,11 +1714,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2024.05.2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>14 August 2024</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>14 August 2024</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2024.05.2 bugfix release is out, fixing a number of important /
@@ -1733,11 +1733,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2024.08-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>8 August 2024</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>8 August 2024</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over the tree, see the
@@ -1754,11 +1754,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2024.02.4 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>13 July 2024</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>13 July 2024</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2024.02.4 bugfix release is out, fixing a number of important /
@@ -1773,11 +1773,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2024.05.1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>13 July 2024</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>13 July 2024</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2024.05.1 bugfix release is out, fixing a number of important /
@@ -1792,8 +1792,8 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-euro"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-currency-euro text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">LTS Sponsoring announced</h4>
       </div>
@@ -1813,11 +1813,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2024.05 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>12 June 2024</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>12 June 2024</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2024.05 release is out - Thanks to everyone
@@ -1832,11 +1832,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2024.02.3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>10 June 2024</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>10 June 2024</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2024.02.3 bugfix release is out, fixing a number of important /
@@ -1851,11 +1851,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2024.05-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>4 June 2024</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>4 June 2024</small></p>
       </div>
       <div class="timeline-body">
         <p>Another week, another release candidate with more cleanups and build fixes. See the
@@ -1872,11 +1872,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2024.05-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>30 May 2024</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>30 May 2024</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over the tree, see the
@@ -1893,11 +1893,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2024.02.2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>7 May 2024</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>7 May 2024</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2024.02.2 bugfix release is out, fixing a number of important /
@@ -1912,11 +1912,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2023.02.11 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>27 March 2024</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>27 March 2024</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2023.02.11 bugfix release is out, fixing a number of important /
@@ -1934,11 +1934,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2023.11.3 released, 2023.11.x series EOL</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>26 March 2024</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>26 March 2024</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2023.11.3 bugfix release is out, fixing a number of important /
@@ -1956,11 +1956,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2024.02.1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>26 March 2024</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>26 March 2024</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2024.02.1 bugfix release is out, fixing a number of important /
@@ -1975,11 +1975,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2024.02 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>5 March 2024</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>5 March 2024</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2024.02 release is out - Thanks to everyone
@@ -1997,11 +1997,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2024.02-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>1 March 2024</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>1 March 2024</small></p>
       </div>
       <div class="timeline-body">
         <p>Another week, another release candidate with more cleanups and build fixes. See the
@@ -2018,11 +2018,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2023.02.10 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>1 March 2024</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>1 March 2024</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2023.02.10 bugfix release is out, fixing a number of important /
@@ -2037,11 +2037,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2023.11.2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>1 March 2024</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>1 March 2024</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2023.11.2 bugfix release is out, fixing a number of important /
@@ -2056,11 +2056,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2024.02-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>25 February 2024</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>25 February 2024</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over the tree, see the
@@ -2077,11 +2077,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2023.02.9 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>15 January 2024</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>15 January 2024</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2023.02.9 bugfix release is out, fixing a number of important /
@@ -2096,11 +2096,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2023.11.1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>15 January 2024</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>15 January 2024</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2023.11.1 bugfix release is out, fixing a number of important /
@@ -2115,11 +2115,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-exclamation-sign"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-exclamation-circle-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">Talos security vulnerabilities</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>6 December 2023</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>6 December 2023</small></p>
       </div>
       <div class="timeline-body">
 	<p>Talos has recently published
@@ -2136,11 +2136,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2023.02.8 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>4 December 2023</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>4 December 2023</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2023.02.8 bugfix release is out, fixing a number of important /
@@ -2155,11 +2155,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2023.08.4 released, 2023.08.x series EOL</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>4 December 2023</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>4 December 2023</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2023.08.4 bugfix release is out, fixing a number of important /
@@ -2177,11 +2177,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2023.11 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>4 December 2023</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>4 December 2023</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2023.11 release is out - Thanks to everyone
@@ -2196,11 +2196,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2023.11-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>29 November 2023</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>29 November 2023</small></p>
       </div>
       <div class="timeline-body">
         <p>2023.11-rc2 has been released with more cleanups and build fixes. See the
@@ -2217,11 +2217,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2023.02.7 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>14 November 2023</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>14 November 2023</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2023.02.7 bugfix release is out, fixing a number of important /
@@ -2236,11 +2236,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2023.08.3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>14 November 2023</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>14 November 2023</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2023.08.3 bugfix release is out, fixing a number of important /
@@ -2255,11 +2255,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2023.11-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>14 November 2023</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>14 November 2023</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over the tree, see the
@@ -2276,11 +2276,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2023.02.6 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>16 October 2023</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>16 October 2023</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2023.02.6 bugfix release is out, fixing a number of important /
@@ -2295,11 +2295,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2023.08.2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>15 October 2023</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>15 October 2023</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2023.08.2 bugfix release is out, fixing a number of important /
@@ -2314,11 +2314,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2023.08.1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>27 September 2023</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>27 September 2023</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2023.08.1 bugfix release is out, fixing a number of important /
@@ -2333,11 +2333,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2023.02.5 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>27 September 2023</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>27 September 2023</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2023.02.5 bugfix release is out, fixing a number of important /
@@ -2352,11 +2352,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2023.05.3 released, 2023.05.x series EOL</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>26 September 2023</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>26 September 2023</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2023.05.3 bugfix release is out, fixing a number of important /
@@ -2374,11 +2374,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2023.08 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>6 September 2023</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>6 September 2023</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2023.08 release is out - Thanks to everyone
@@ -2393,11 +2393,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2023.02.4 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>31 August 2023</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>31 August 2023</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2023.02.4 bugfix release is out, fixing a number of important /
@@ -2412,11 +2412,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2023.05.2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>31 August 2023</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>31 August 2023</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2023.05.2 bugfix release is out, fixing a number of important /
@@ -2431,11 +2431,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2023.08-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>29 August 2023</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>29 August 2023</small></p>
       </div>
       <div class="timeline-body">
         <p>2023.08-rc3 has been released with more cleanups and build fixes. See the
@@ -2452,11 +2452,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2023.08-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>20 August 2023</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>20 August 2023</small></p>
       </div>
       <div class="timeline-body">
         <p>2023.08-rc2 has been released with more cleanups and build fixes. See the
@@ -2473,11 +2473,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2023.08-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>5 August 2023</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>5 August 2023</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over
@@ -2494,11 +2494,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2023.02.3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>17 July 2023</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>17 July 2023</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2023.02.3 bugfix release is out, fixing a number of important /
@@ -2513,11 +2513,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2023.05.1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>17 July 2023</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>17 July 2023</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2023.05.1 bugfix release is out, fixing a number of important /
@@ -2532,11 +2532,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2023.02.2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>16 June 2023</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>16 June 2023</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2023.02.2 bugfix release is out, fixing a number of important /
@@ -2551,11 +2551,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2023.05 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>7 June 2023</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>7 June 2023</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2023.05 release is out - Thanks to everyone
@@ -2570,11 +2570,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2023.05-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>4 June 2023</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>4 June 2023</small></p>
       </div>
       <div class="timeline-body">
         <p>2023.05-rc3 has been released with more cleanups and build fixes. See the
@@ -2591,11 +2591,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2023.05-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>28 May 2023</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>28 May 2023</small></p>
       </div>
       <div class="timeline-body">
         <p>2023.05-rc2 has been released with more cleanups and build fixes. See the
@@ -2612,11 +2612,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2023.05-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>15 May 2023</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>15 May 2023</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over the tree, see the
@@ -2633,11 +2633,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2023.02.1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>10 May 2023</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>10 May 2023</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2023.02.1 bugfix release is out, fixing a number of important /
@@ -2652,11 +2652,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2022.02.12 released, 2022.02.x series EOL</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>4 May 2023</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>4 May 2023</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2022.02.12 bugfix release is out, fixing a number of important /
@@ -2674,11 +2674,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2022.02.11 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>19 March 2023</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>19 March 2023</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2022.02.11 bugfix release is out, fixing a number of important /
@@ -2693,11 +2693,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2022.11.3 released, 2022.11.x series EOL</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>18 March 2023</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>18 March 2023</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2022.11.3 bugfix release is out, fixing a number of important /
@@ -2715,11 +2715,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2023.02 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>12 March 2023</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>12 March 2023</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2023.02 release is out - Thanks to everyone
@@ -2737,11 +2737,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2023.02-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>8 March 2023</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>8 March 2023</small></p>
       </div>
       <div class="timeline-body">
         <p>2023.02-rc3 has been released with more cleanups and build fixes. See the
@@ -2758,11 +2758,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2022.02.10 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>18 January 2023</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>18 January 2023</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2022.02.10 bugfix release is out, fixing a number of important /
@@ -2777,11 +2777,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2022.11.2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>1 March 2023</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>1 March 2023</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2022.11.2 bugfix release is out, fixing a number of important /
@@ -2796,11 +2796,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2023.02-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>27 February 2023</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>27 February 2023</small></p>
       </div>
       <div class="timeline-body">
         <p>2023.02-rc2 has been released with more cleanups and build fixes. See the
@@ -2817,11 +2817,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2023.02-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>20 February 2023</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>20 February 2023</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over the tree, see the
@@ -2838,11 +2838,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2022.02.9 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>18 January 2023</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>18 January 2023</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2022.02.9 bugfix release is out, fixing a number of important /
@@ -2857,11 +2857,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2022.11.1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>18 January 2023</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>18 January 2023</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2022.11.1 bugfix release is out, fixing a number of important /
@@ -2876,11 +2876,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2022.02.8 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>10 December 2022</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>10 December 2022</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2022.02.8 bugfix release is out, fixing a number of important /
@@ -2895,11 +2895,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2022.08.3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>10 December 2022</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>10 December 2022</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2022.08.3 bugfix release is out, fixing a number of important /
@@ -2914,11 +2914,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2022.11 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>5 December 2022</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>5 December 2022</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2022.11 release is out - Thanks to everyone
@@ -2933,11 +2933,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2022.11-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>24 November 2022</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>24 November 2022</small></p>
       </div>
       <div class="timeline-body">
         <p>2022.11-rc3 has been released with more cleanups and build fixes. See the
@@ -2954,11 +2954,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2022.02.7 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>17 November 2022</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>17 November 2022</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2022.02.7 bugfix release is out, fixing a number of important /
@@ -2973,11 +2973,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2022.08.2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>16 November 2022</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>16 November 2022</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2022.08.2 bugfix release is out, fixing a number of important /
@@ -2992,11 +2992,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2022.11-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>16 November 2022</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>16 November 2022</small></p>
       </div>
       <div class="timeline-body">
         <p>2022.11-rc2 has been released with more cleanups and build fixes. See the
@@ -3013,11 +3013,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2022.11-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>3 November 2022</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>3 November 2022</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over the tree, see the
@@ -3034,11 +3034,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2022.08.1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>3 October 2022</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>3 October 2022</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2022.08.1 bugfix release is out, fixing a number of important /
@@ -3053,11 +3053,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2022.02.6 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>2 October 2022</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>2 October 2022</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2022.02.6 bugfix release is out, fixing a number of important /
@@ -3072,11 +3072,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2022.05.3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>2 October 2022</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>2 October 2022</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2022.05.3 bugfix release is out, fixing a number of important /
@@ -3094,11 +3094,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2022.08 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>10 September 2022</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>10 September 2022</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2022.08 release is out - Thanks to everyone
@@ -3113,11 +3113,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2022.08-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>1 September 2022</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>1 September 2022</small></p>
       </div>
       <div class="timeline-body">
         <p>2022.08-rc2 has been released with more cleanups and build fixes. See the
@@ -3134,11 +3134,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2022.02.5 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>31 August 2022</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>31 August 2022</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2022.02.5 bugfix release is out, fixing a number of important /
@@ -3153,11 +3153,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2022.05.2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>31 August 2022</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>31 August 2022</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2022.05.2 bugfix release is out, fixing a number of important /
@@ -3172,11 +3172,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2022.08-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>12 August 2022</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>12 August 2022</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over the tree, see the
@@ -3193,11 +3193,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2022.02.4 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>28 July 2022</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>28 July 2022</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2022.02.4 bugfix release is out, fixing a number of important /
@@ -3212,11 +3212,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2022.05.1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>24 July 2022</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>24 July 2022</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2022.05.1 bugfix release is out, fixing a number of important /
@@ -3231,11 +3231,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2022.02.3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>19 June 2022</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>19 June 2022</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2022.02.3 bugfix release is out, fixing a number of important /
@@ -3250,11 +3250,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2022.05 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>6 June 2022</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>6 June 2022</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2022.05 release is out - Thanks to everyone
@@ -3269,11 +3269,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2022.05-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>30 May 2022</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>30 May 2022</small></p>
       </div>
       <div class="timeline-body">
         <p>2022.05-rc2 has been released with more cleanups and build fixes. See the
@@ -3290,11 +3290,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2022.02.2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>29 May 2022</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>29 May 2022</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2022.02.2 bugfix release is out, fixing a number of important /
@@ -3309,11 +3309,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2022.05-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>18 May 2022</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>18 May 2022</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over the tree, see the
@@ -3330,11 +3330,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2022.02.1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>11 April 2022</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>11 April 2022</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2022.02.1 bugfix release is out, fixing a number of important /
@@ -3349,11 +3349,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2021.02.12 released, 2021.02.x series EOL</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>6 April 2022</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>6 April 2022</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2021.02.12 bugfix release is out, fixing a number of important /
@@ -3371,11 +3371,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2021.02.11 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>25 March 2022</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>25 March 2022</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2021.02.11 bugfix release is out, fixing a number of important /
@@ -3390,11 +3390,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2021.11.3 released, 2021.11.x series EOL</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>24 March 2022</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>24 March 2022</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2021.11.3 bugfix release is out, fixing a number of important /
@@ -3412,11 +3412,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2022.02 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>8 March 2022</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>8 March 2022</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2022.02 release is out - Thanks to everyone
@@ -3434,11 +3434,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2022.02-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>28 February 2022</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>28 February 2022</small></p>
       </div>
       <div class="timeline-body">
         <p>2022.02-rc3 has been released with more cleanups and build fixes. See the
@@ -3455,11 +3455,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2021.02.10 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>28 February 2022</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>28 February 2022</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2021.02.10 bugfix release is out, fixing a number of important /
@@ -3474,11 +3474,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2021.11.2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>28 February 2022</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>28 February 2022</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2021.11.2 bugfix release is out, fixing a number of important /
@@ -3493,11 +3493,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2022.02-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>20 February 2022</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>20 February 2022</small></p>
       </div>
       <div class="timeline-body">
         <p>2022.02-rc2 has been released with more cleanups and build fixes. See the
@@ -3514,11 +3514,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2022.02-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>13 February 2022</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>13 February 2022</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over the tree, see the
@@ -3535,11 +3535,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2021.02.9 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>29 January 2022</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>29 January 2022</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2021.02.9 bugfix release is out, fixing a number of important /
@@ -3554,11 +3554,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2021.11.1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>29 January 2022</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>29 January 2022</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2021.11.1 bugfix release is out, fixing a number of important /
@@ -3573,11 +3573,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2021.02.8 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>14 December 2021</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>14 December 2021</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2021.02.8 bugfix release is out, fixing a number of important /
@@ -3592,11 +3592,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2021.08.3 released, 2021.08.x series EOL</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>13 December 2021</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>13 December 2021</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2021.08.3 bugfix release is out, fixing a number of important /
@@ -3614,11 +3614,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2021.11 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>5 December 2021</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>5 December 2021</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2021.11 release is out - Thanks to everyone
@@ -3633,11 +3633,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2021.11-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>30 November 2021</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>30 November 2021</small></p>
       </div>
       <div class="timeline-body">
         <p>2021.11-rc3 has been released with more cleanups and build fixes. See the
@@ -3654,11 +3654,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2021.11-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>19 November 2021</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>19 November 2021</small></p>
       </div>
       <div class="timeline-body">
         <p>2021.11-rc2 has been released with more cleanups and build fixes. See the
@@ -3675,11 +3675,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2021.02.7 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>10 November 2021</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>10 November 2021</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2021.02.7 bugfix release is out, fixing a number of important /
@@ -3694,11 +3694,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2021.08.2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>10 November 2021</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>10 November 2021</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2021.08.2 bugfix release is out, fixing a number of important /
@@ -3713,11 +3713,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2021.11-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>8 November 2021</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>8 November 2021</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over the tree, see the
@@ -3734,11 +3734,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2021.02.6 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>12 October 2021</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>12 October 2021</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2021.02.6 bugfix release is out, fixing a number of important /
@@ -3753,11 +3753,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2021.05.3 released, 2021.05.x series EOL</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>12 October 2021</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>12 October 2021</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2021.05.3 bugfix release is out, fixing a number of important /
@@ -3775,11 +3775,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2021.08.1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>11 October 2021</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>11 October 2021</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2021.08.1 bugfix release is out, fixing a number of important /
@@ -3794,11 +3794,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2021.02.5 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>16 September 2021</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>16 September 2021</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2021.02.5 bugfix release is out, fixing a number of important /
@@ -3813,11 +3813,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2021.05.2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>15 September 2021</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>15 September 2021</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2021.05.2 bugfix release is out, fixing a number of important /
@@ -3832,11 +3832,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2021.08 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>4 September 2021</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>4 September 2021</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2021.08 release is out - Thanks to everyone
@@ -3851,11 +3851,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2021.08-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>31 August 2021</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>31 August 2021</small></p>
       </div>
       <div class="timeline-body">
         <p>2021.08-rc3 has been released with more cleanups and build fixes. See the
@@ -3872,11 +3872,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2021.08-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>18 August 2021</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>18 August 2021</small></p>
       </div>
       <div class="timeline-body">
         <p>2021.08-rc2 has been released with more cleanups and build fixes. See the
@@ -3893,11 +3893,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2021.02.4 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>11 August 2021</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>11 August 2021</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2021.02.4 bugfix release is out, fixing a number of important /
@@ -3912,11 +3912,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2021.05.1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>10 August 2021</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>10 August 2021</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2021.05.1 bugfix release is out, fixing a number of important /
@@ -3931,11 +3931,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2021.08-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>3 August 2021</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>3 August 2021</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over the tree, see the
@@ -3952,11 +3952,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2021.02.3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>12 June 2021</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>12 June 2021</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2021.02.3 bugfix release is out, fixing a number of important /
@@ -3971,11 +3971,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2021.05 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>6 June 2021</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>6 June 2021</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2021.05 release is out - Thanks to everyone
@@ -3990,11 +3990,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2021.05-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>31 May 2021</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>31 May 2021</small></p>
       </div>
       <div class="timeline-body">
         <p>2021.05-rc3 has been released with more cleanups and build fixes. See the
@@ -4011,11 +4011,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2021.05-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>22 May 2021</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>22 May 2021</small></p>
       </div>
       <div class="timeline-body">
         <p>2021.05-rc2 has been released with more cleanups and build fixes. See the
@@ -4032,11 +4032,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2021.02.2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>12 May 2021</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>12 May 2021</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2021.02.2 bugfix release is out, fixing a number of important /
@@ -4051,11 +4051,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2021.05-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>12 May 2021</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>12 May 2021</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over the tree, see the
@@ -4072,11 +4072,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2021.02.1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>7 April 2021</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>7 April 2021</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2021.02.1 bugfix release is out, fixing a number of important /
@@ -4091,11 +4091,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2020.02.12 released, 2020.02.x series EOL</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>5 April 2021</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>5 April 2021</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2020.02.12 bugfix release is out, fixing a number of important /
@@ -4113,11 +4113,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2020.11.4 released, 2020.11.x series EOL</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>5 April 2021</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>5 April 2021</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2020.11.4 bugfix release is out, fixing a number of important /
@@ -4135,11 +4135,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2021.02 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>6 March 2021</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>6 March 2021</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2021.02 release is out - Thanks to everyone
@@ -4157,11 +4157,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2021.02-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>27 February 2021</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>27 February 2021</small></p>
       </div>
       <div class="timeline-body">
         <p>2021.02-rc3 has been released with more cleanups and build fixes. See the
@@ -4178,11 +4178,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2020.02.11 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>17 February 2021</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>17 February 2021</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2020.02.11 bugfix release is out, fixing a number of important /
@@ -4197,11 +4197,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2020.11.3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>17 February 2021</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>17 February 2021</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2020.11.3 bugfix release is out, fixing a number of important /
@@ -4216,11 +4216,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2021.02-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>17 February 2021</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>17 February 2021</small></p>
       </div>
       <div class="timeline-body">
         <p>2021.02-rc2 has been released with more cleanups and build fixes. See the
@@ -4237,11 +4237,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2021.02-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>9 February 2021</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>9 February 2021</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over the tree, see the
@@ -4258,11 +4258,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2020.02.10 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>31 January 2021</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>31 January 2021</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2020.02.10 bugfix release is out, fixing a number of important /
@@ -4277,11 +4277,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2020.11.2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>31 January 2021</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>31 January 2021</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2020.11.2 bugfix release is out, fixing a number of important /
@@ -4296,11 +4296,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2020.02.9 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>27 December 2020</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>27 December 2020</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2020.02.9 bugfix release is out, fixing a number of important /
@@ -4315,11 +4315,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2020.08.3 released, 2020.08.x series EOL</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>27 December 2020</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>27 December 2020</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2020.08.3 bugfix release is out, fixing a number of important /
@@ -4337,11 +4337,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2020.11.1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>27 December 2020</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>27 December 2020</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2020.11.1 bugfix release is out, fixing a number of important /
@@ -4356,11 +4356,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2020.11 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>2 December 2020</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>2 December 2020</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2020.11 release is out - Thanks to everyone
@@ -4375,11 +4375,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2020.11-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>28 November 2020</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>28 November 2020</small></p>
       </div>
       <div class="timeline-body">
         <p>Another week, another release candidate with more cleanups and build fixes. See the
@@ -4396,11 +4396,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2020.02.8 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>17 November 2020</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>17 November 2020</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2020.02.8 bugfix release is out, fixing a number of important /
@@ -4415,11 +4415,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2020.08.2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>16 November 2020</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>16 November 2020</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2020.08.2 bugfix release is out, fixing a number of important /
@@ -4434,11 +4434,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2020.11-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>14 November 2020</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>14 November 2020</small></p>
       </div>
       <div class="timeline-body">
         <p>2020.11-rc2 has been released with more cleanups and build fixes. See the
@@ -4455,11 +4455,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2020.11-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>4 November 2020</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>4 November 2020</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over the tree, see the
@@ -4476,11 +4476,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2020.02.7 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>12 October 2020</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>12 October 2020</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2020.02.7 bugfix release is out, fixing a number of important /
@@ -4495,11 +4495,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2020.05.3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>12 October 2020</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>12 October 2020</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2020.05.3 bugfix release is out, fixing a number of important /
@@ -4517,11 +4517,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2020.08.1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>12 October 2020</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>12 October 2020</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2020.08.1 bugfix release is out, fixing a number of important /
@@ -4536,11 +4536,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2020.02.6 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>5 September 2020</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>5 September 2020</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2020.02.6 bugfix release is out, fixing a number of important /
@@ -4555,11 +4555,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2020.08 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>1 September 2020</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>1 September 2020</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2020.08 release is out - Thanks to everyone
@@ -4574,11 +4574,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2020.02.5 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>29 august 2020</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>29 august 2020</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2020.02.5 bugfix release is out, fixing a number of important /
@@ -4593,11 +4593,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2020.05.2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>29 August 2020</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>29 August 2020</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2020.05.2 bugfix release is out, fixing a number of important /
@@ -4612,11 +4612,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2020.08-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>28 August 2020</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>28 August 2020</small></p>
       </div>
       <div class="timeline-body">
         <p>Another week, another release candidate with more cleanups and build fixes. See the
@@ -4633,11 +4633,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2020.08-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>24 August 2020</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>24 August 2020</small></p>
       </div>
       <div class="timeline-body">
         <p>2020.08-rc2 has been released with more cleanups and build fixes. See the
@@ -4654,11 +4654,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2020.08-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>6 August 2020</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>6 August 2020</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2020.08-rc1 release candidate is out. It is the first
@@ -4675,11 +4675,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2020.02.4 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>26 July 2020</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>26 July 2020</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2020.02.4 bugfix release is out, fixing a number of important /
@@ -4694,11 +4694,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2020.05.1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>25 July 2020</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>25 July 2020</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2020.05.1 bugfix release is out, fixing a number of important /
@@ -4713,11 +4713,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2020.02.3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>3 June 2020</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>3 June 2020</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2020.02.3 bugfix release is out, fixing a number of important /
@@ -4732,11 +4732,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2020.05 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>1 June 2020</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>1 June 2020</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2020.05 release is out - Thanks to everyone
@@ -4751,11 +4751,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2020.05-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>29 May 2020</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>29 May 2020</small></p>
       </div>
       <div class="timeline-body">
         <p>Another week, another release candidate with more cleanups and build fixes. See the
@@ -4772,11 +4772,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2020.05-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>22 May 2020</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>22 May 2020</small></p>
       </div>
       <div class="timeline-body">
         <p>Another week, another release candidate with more cleanups and build fixes. See the
@@ -4793,11 +4793,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2020.02.2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>12 May 2020</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>12 May 2020</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2020.02.2 bugfix release is out, fixing a number of important /
@@ -4812,11 +4812,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2020.05-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>10 April 2020</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>10 April 2020</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over the tree, see the
@@ -4833,11 +4833,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2020.02.1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>10 April 2020</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>10 April 2020</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2020.02.1 bugfix release is out, fixing a number of important /
@@ -4852,11 +4852,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2019.11.3 released, 2019.11.x series EOL</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>10 April 2020</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>10 April 2020</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2019.11.3 bugfix release is out, fixing a number of important /
@@ -4874,11 +4874,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2019.02.11 released, 2019.02.x series EOL</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>9 April 2020</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>9 April 2020</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2019.02.11 bugfix release is out, fixing a number of important /
@@ -4896,11 +4896,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2019.02.10 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>16 march 2020</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>16 march 2020</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2019.02.10 bugfix release is out, fixing a number of important /
@@ -4915,11 +4915,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2019.11.2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>16 March 2020</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>16 March 2020</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2019.11.2 bugfix release is out, fixing a number of important /
@@ -4934,11 +4934,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2020.02 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>8 March 2020</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>8 March 2020</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2020.02 release is out - Thanks to everyone
@@ -4956,11 +4956,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2020.02-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>2 March 2020</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>2 March 2020</small></p>
       </div>
       <div class="timeline-body">
         <p>Another week, another release candidate with more cleanups and build fixes. See the
@@ -4977,11 +4977,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2020.02-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>26 February 2020</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>26 February 2020</small></p>
       </div>
       <div class="timeline-body">
         <p>Another week, another release candidate with more cleanups and build fixes. See the
@@ -4998,11 +4998,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2020.02-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>18 February 2020</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>18 February 2020</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over the
@@ -5021,11 +5021,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2019.02.9 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>12 January 2020</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>12 January 2020</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2019.02.9 bugfix release is out, fixing a number of important /
@@ -5040,11 +5040,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2019.11.1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>12 January 2020</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>12 January 2020</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2019.11.1 bugfix release is out, fixing a number of important /
@@ -5059,11 +5059,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2019.02.8 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>7 December 2019</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>7 December 2019</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2019.02.8 bugfix release is out, fixing a number of important /
@@ -5078,11 +5078,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2019.08.3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>7 December 2019</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>7 December 2019</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2019.08.3 bugfix release is out, fixing a number of important /
@@ -5100,11 +5100,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2019.11 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>1 December 2019</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>1 December 2019</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2019.11 release is out - Thanks to everyone
@@ -5119,11 +5119,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2019.11-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>24 November 2019</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>24 November 2019</small></p>
       </div>
       <div class="timeline-body">
         <p>Another week, another release candidate with more cleanups and build fixes. See the
@@ -5140,11 +5140,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2019.11-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>16 November 2019</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>16 November 2019</small></p>
       </div>
       <div class="timeline-body">
         <p>Another week, another release candidate with more cleanups and build fixes. See the
@@ -5161,11 +5161,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2019.02.7 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>10 November 2019</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>10 November 2019</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2019.02.7 bugfix release is out, fixing a number of important /
@@ -5180,11 +5180,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2019.08.2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>9 November 2019</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>9 November 2019</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2019.08.2 bugfix release is out, fixing a number of important /
@@ -5199,11 +5199,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2019.11-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>5 November 2019</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>5 November 2019</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over the
@@ -5222,11 +5222,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2019.02.6 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>4 October 2019</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>4 October 2019</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2019.02.6 bugfix release is out, fixing a number of important /
@@ -5241,11 +5241,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2019.05.3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>4 October 2019</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>4 October 2019</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2019.05.3 bugfix release is out, fixing a number of important /
@@ -5263,11 +5263,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2019.08.1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>4 October 2019</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>4 October 2019</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2019.08.1 bugfix release is out, fixing a number of important /
@@ -5282,11 +5282,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2019.05.2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>3 September 2019</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>3 September 2019</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2019.05.2 bugfix release is out, fixing a number of important /
@@ -5301,11 +5301,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2019.02.5 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>2 September 2019</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>2 September 2019</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2019.02.5 bugfix release is out, fixing a number of important /
@@ -5320,11 +5320,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2019.08 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>1 September 2019</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>1 September 2019</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2019.08 release is out - Thanks to everyone
@@ -5339,11 +5339,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2019.08-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>28 August 2019</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>28 August 2019</small></p>
       </div>
       <div class="timeline-body">
         <p>Another week, another release candidate with more cleanups and build fixes. See the
@@ -5360,11 +5360,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2019.08-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>20 August 2019</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>20 August 2019</small></p>
       </div>
       <div class="timeline-body">
         <p>Another week, another release candidate with more cleanups and build fixes. See the
@@ -5381,11 +5381,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2019.08-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>9 August 2019</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>9 August 2019</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over the
@@ -5404,11 +5404,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2019.02.4 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>7 June 2019</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>7 June 2019</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2019.02.4 bugfix release is out, fixing a number of important /
@@ -5423,11 +5423,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2019.05.1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>7 July 2019</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>7 July 2019</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2019.05.1 bugfix release is out, fixing a number of important /
@@ -5442,11 +5442,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2019.02.3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>7 June 2019</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>7 June 2019</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2019.02.3 bugfix release is out, fixing a number of important /
@@ -5461,11 +5461,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2019.05 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>2 June 2019</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>2 June 2019</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2019.05 release is out - Thanks to everyone
@@ -5480,11 +5480,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2019.05-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>25 May 2019</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>25 May 2019</small></p>
       </div>
       <div class="timeline-body">
         <p>Another week, another release candidate with more cleanups and build fixes. See the
@@ -5501,11 +5501,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2019.05-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>15 May 2019</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>15 May 2019</small></p>
       </div>
       <div class="timeline-body">
         <p>Another week, another release candidate with more cleanups and build fixes. See the
@@ -5522,11 +5522,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2019.05-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>8 May 2019</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>8 May 2019</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over the
@@ -5546,11 +5546,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2019.02.2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>29 April 2019</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>29 April 2019</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2019.02.2 bugfix release is out, fixing a number of important /
@@ -5565,11 +5565,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2019.02.1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>29 March 2019</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>29 March 2019</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2019.02.1 bugfix release is out, fixing a number of important /
@@ -5584,11 +5584,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2018.02.12 released, 2018.02.x series EOL</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>29 March 2019</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>29 March 2019</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2018.02.12 bugfix release is out, fixing a number of important /
@@ -5606,11 +5606,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2018.11.4 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>28 March 2019</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>28 March 2019</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2018.11.4 bugfix release is out, fixing a number of important /
@@ -5628,11 +5628,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2019.02 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>4 March 2019</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>4 March 2019</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2019.02 release is out - Thanks to everyone
@@ -5650,11 +5650,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2019.02-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>1 March 2019</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>1 March 2019</small></p>
       </div>
       <div class="timeline-body">
         <p>Another week, another release candidate with more cleanups
@@ -5672,11 +5672,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2018.11.3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>23 February 2019</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>23 February 2019</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2018.11.3 bugfix release is out, fixing a number of important /
@@ -5691,11 +5691,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2018.02.11 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>23 February 2019</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>23 February 2019</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2018.02.11 bugfix release is out, fixing a number of important /
@@ -5710,11 +5710,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2019.02-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>23 February 2019</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>23 February 2019</small></p>
       </div>
       <div class="timeline-body">
         <p>Another week, another release candidate with more cleanups
@@ -5732,11 +5732,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2019.02-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>13 February 2019</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>13 February 2019</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over the
@@ -5756,11 +5756,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2018.02.10 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>31 January 2019</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>31 January 2019</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2018.02.10 bugfix release is out, fixing a number of important /
@@ -5775,11 +5775,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2018.11.2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>30 January 2019</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>30 January 2019</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2018.11.2 bugfix release is out, fixing a number of important /
@@ -5794,11 +5794,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2018.02.9 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>20 December 2018</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>20 December 2018</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2018.02.9 bugfix release is out, fixing a number of important /
@@ -5813,11 +5813,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2018.08.4 released, 2018.08 series EOL</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>20 December 2018</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>20 December 2018</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2018.08.4 bugfix release is out, fixing a number of important /
@@ -5834,11 +5834,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2018.11.1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>19 December 2018</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>19 December 2018</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2018.11.1 bugfix release is out, fixing a number of important /
@@ -5853,11 +5853,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2018.11 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>1 December 2018</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>1 December 2018</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2018.11 release is out - Thanks to everyone
@@ -5872,11 +5872,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2018.11-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>30 November 2018</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>30 November 2018</small></p>
       </div>
       <div class="timeline-body">
         <p>Another week, another release candidate with more cleanups
@@ -5894,11 +5894,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2018.02.8 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>26 November 2018</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>26 November 2018</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2018.02.8 bugfix release is out, fixing a number of important /
@@ -5913,11 +5913,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2018.08.3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>26 November 2018</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>26 November 2018</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2018.08.3 bugfix release is out, fixing a number of important /
@@ -5932,11 +5932,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2018.11-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>21 November 2018</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>21 November 2018</small></p>
       </div>
       <div class="timeline-body">
         <p>Another week, another release candidate with more cleanups
@@ -5954,11 +5954,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2018.11-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>9 November 2018</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>9 November 2018</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over the
@@ -5978,11 +5978,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2018.02.7 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>25 October 2018</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>25 October 2018</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2018.02.7 bugfix release is out, fixing a number of important /
@@ -5997,11 +5997,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2018.08.2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>25 October 2018</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>25 October 2018</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2018.08.2 bugfix release is out, fixing a number of important /
@@ -6016,11 +6016,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2018.08.1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>7 October 2018</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>7 October 2018</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2018.08.1 bugfix release is out, fixing a number of important /
@@ -6035,11 +6035,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2018.02.6 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>7 October 2018</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>7 October 2018</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2018.02.6 bugfix release is out, fixing a number of important /
@@ -6054,11 +6054,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2018.05.3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>6 October 2018</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>6 October 2018</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2018.05.3 bugfix release is out, fixing a number of important /
@@ -6073,11 +6073,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2018.08 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>6 September 2018</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>6 September 2018</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2018.08 release is out - Thanks to everyone
@@ -6092,11 +6092,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2018.08-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>31 August 2018</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>31 August 2018</small></p>
       </div>
       <div class="timeline-body">
         <p>Another week, another release candidate with more cleanups
@@ -6114,11 +6114,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2018.02.5 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>29 August 2018</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>29 August 2018</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2018.02.5 bugfix release is out, fixing a number of important /
@@ -6133,11 +6133,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2018.05.2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>28 August 2018</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>28 August 2018</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2018.05.2 bugfix release is out, fixing a number of important /
@@ -6152,11 +6152,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2018.08-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>20 August 2018</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>20 August 2018</small></p>
       </div>
       <div class="timeline-body">
         <p>Another week, another release candidate with more cleanups
@@ -6174,11 +6174,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2018.08-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>5 August 2018</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>5 August 2018</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over the
@@ -6198,11 +6198,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2018.02.4 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>21 July 2018</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>21 July 2018</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2018.02.4 bugfix release is out, fixing a number of important /
@@ -6217,11 +6217,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2018.05.1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>20 July 2018</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>20 July 2018</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2018.05.1 bugfix release is out, fixing a number of important /
@@ -6236,11 +6236,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2018.02.3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>18 June 2018</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>18 June 2018</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2018.02.3 bugfix release is out, fixing a number of important /
@@ -6255,11 +6255,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2018.05 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>1 June 2018</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>1 June 2018</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2018.05 release is out - Thanks to everyone
@@ -6274,11 +6274,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2018.05-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>28 May 2018</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>28 May 2018</small></p>
       </div>
       <div class="timeline-body">
 	<p>Release candidate 3 is out with more cleanups and security
@@ -6296,11 +6296,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2018.05-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>22 May 2018</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>22 May 2018</small></p>
       </div>
       <div class="timeline-body">
         <p>Another week, another release candidate with more cleanups
@@ -6318,11 +6318,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2018.05-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>9 May 2018</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>9 May 2018</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over the
@@ -6342,11 +6342,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2018.02.2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>4 May 2018</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>4 May 2018</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2018.02.2 bugfix release is out, fixing a number of important /
@@ -6361,11 +6361,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2017.02.11 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>11 April 2018</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>11 April 2018</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2017.02.11 bugfix release is out, fixing a number of important /
@@ -6382,11 +6382,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2018.02.1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>10 April 2018</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>10 April 2018</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2018.02.1 bugfix release is out, fixing a number of important /
@@ -6401,11 +6401,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2018.02 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>4 March 2018</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>4 March 2018</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2018.02 release is out - Thanks to everyone
@@ -6423,11 +6423,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2018.02-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>27 February 2018</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>27 February 2018</small></p>
       </div>
       <div class="timeline-body">
 	<p>Release candidate 3 is out with more cleanups and security
@@ -6445,11 +6445,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2018.02-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>15 February 2018</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>15 February 2018</small></p>
       </div>
       <div class="timeline-body">
         <p>Another week, another release candidate with more cleanups
@@ -6467,11 +6467,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2018.02-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>5 February 2018</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>5 February 2018</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over the
@@ -6491,11 +6491,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2017.02.10 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>31 January 2018</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>31 January 2018</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2017.02.10 bugfix release is out, fixing a number of important /
@@ -6510,11 +6510,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2017.11.2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>21 January 2018</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>21 January 2018</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2017.11.2 bugfix release is out, fixing a number of important /
@@ -6529,11 +6529,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2017.02.9 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>1 January 2018</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>1 January 2018</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2017.02.9 bugfix release is out, fixing a number of important /
@@ -6548,11 +6548,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2017.11.1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>31 December 2017</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>31 December 2017</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2017.11.1 bugfix release is out, fixing a number of important /
@@ -6567,11 +6567,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2017.11 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>30 November 2017</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>30 November 2017</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2017.11 release is out - Thanks to everyone
@@ -6586,11 +6586,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2017.08.2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>29 November 2017</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>29 November 2017</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2017.08.2 bugfix release is out, fixing a number of important /
@@ -6605,11 +6605,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2017.02.8 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>27 November 2017</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>27 November 2017</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2017.02.8 bugfix release is out, fixing a number of important /
@@ -6624,11 +6624,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2017.11-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>13 November 2017</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>13 November 2017</small></p>
       </div>
       <div class="timeline-body">
         <p>Another week, another release candidate with more cleanups
@@ -6646,11 +6646,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2017.11-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>6 November 2017</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>6 November 2017</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over
@@ -6669,11 +6669,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2017.02.7 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>28 October 2017</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>28 October 2017</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2017.02.7 bugfix release is out, fixing a number of important /
@@ -6688,11 +6688,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2017.08.1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>23 October 2017</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>23 October 2017</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2017.08.1 bugfix release is out, fixing a number of important /
@@ -6707,11 +6707,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2017.02.6 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>24 September 2017</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>24 September 2017</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2017.02.6 bugfix release is out, fixing a number of important /
@@ -6726,11 +6726,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2017.08 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>1 September 2017</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>1 September 2017</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2017.08 release is out - Thanks to everyone
@@ -6744,11 +6744,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2017.08-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>23 August 2017</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>23 August 2017</small></p>
       </div>
       <div class="timeline-body">
 	<p>Another release candidate, on the road to the final 2017.08
@@ -6769,11 +6769,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2017.08-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>11 August 2017</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>11 August 2017</small></p>
       </div>
       <div class="timeline-body">
 	<p>Another release candidate, on the road to the final 2017.08
@@ -6794,11 +6794,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2017.08-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>2 August 2017</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>2 August 2017</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over
@@ -6818,11 +6818,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2017.05.2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>27 July 2017</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>27 July 2017</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2017.05.2 bugfix release is out, fixing a number of important /
@@ -6837,11 +6837,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2017.02.5 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>27 July 2017</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>27 July 2017</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2017.02.5 bugfix release is out, fixing a number of important /
@@ -6856,11 +6856,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2017.05.1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>4 July 2017</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>4 July 2017</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2017.05.1 bugfix release is out, fixing a number of important /
@@ -6875,11 +6875,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2017.02.4 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>4 July 2017</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>4 July 2017</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2017.02.4 bugfix release is out, fixing a number of important /
@@ -6894,11 +6894,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2017.02.3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>2 June 2017</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>2 June 2017</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2017.02.3 bugfix release is out, fixing a number of important /
@@ -6913,11 +6913,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2017.05 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>31 May 2017</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>31 May 2017</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2017.05 release is out - Thanks to everyone
@@ -6932,11 +6932,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2017.05-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>30 May 2017</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>30 May 2017</small></p>
       </div>
       <div class="timeline-body">
 	<p>Release candidate 3 is out with more cleanups and security
@@ -6954,11 +6954,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2017.05-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>17 May 2017</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>17 May 2017</small></p>
       </div>
       <div class="timeline-body">
         <p>Another week, another release candidate with more cleanups
@@ -6976,11 +6976,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2017.05-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>8 May 2017</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>8 May 2017</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over
@@ -7000,11 +7000,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2017.02.2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>1 May 2017</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>1 May 2017</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2017.02.2 bugfix release is out, fixing a number of important /
@@ -7019,11 +7019,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2017.02.1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>4 April 2017</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>4 April 2017</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2017.02.1 bugfix release is out, fixing a number of important /
@@ -7038,11 +7038,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2016.11.3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>10 March 2017</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>10 March 2017</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2016.11.3 bugfix release is out, fixing a number of important /
@@ -7059,11 +7059,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2017.02 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>28 February 2017</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>28 February 2017</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2017.02 release is out - Thanks to everyone
@@ -7081,11 +7081,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2017.02-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>26 February 2017</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>26 February 2017</small></p>
       </div>
       <div class="timeline-body">
 	<p>Release candidate 3 is out with more cleanups and security
@@ -7103,11 +7103,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2017.02-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>20 February 2017</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>20 February 2017</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over the tree, see
@@ -7125,11 +7125,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2017.02-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>11 February 2017</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>11 February 2017</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over
@@ -7150,11 +7150,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2016.11.2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>25 January 2017</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>25 January 2017</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2016.11.2 bugfix release is out, fixing a number of important /
@@ -7169,11 +7169,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2016.11.1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>29 December 2016</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>29 December 2016</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2016.11.1 bugfix release is out, fixing a number of important /
@@ -7188,11 +7188,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2016.11 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>30 November 2016</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>30 November 2016</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2016.11 release is out - Thanks to everyone
@@ -7207,11 +7207,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2016.11-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>28 November 2016</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>28 November 2016</small></p>
       </div>
       <div class="timeline-body">
 	<p>Release candidate 3 is out with more cleanups and security
@@ -7229,11 +7229,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2016.11-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>13 November 2016</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>13 November 2016</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of
@@ -7253,11 +7253,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2016.11-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>3 November 2016</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>3 November 2016</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of
@@ -7278,11 +7278,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2016.08.1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>21 September 2016</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>21 September 2016</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2016.08.1 bugfix release is out. This release fixes a
@@ -7299,11 +7299,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2016.08 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>1 September 2016</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>1 September 2016</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2016.08 release is out - Thanks to everyone
@@ -7318,11 +7318,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2016.08-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>30 August 2016</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>30 August 2016</small></p>
       </div>
       <div class="timeline-body">
 	<p>Release candidate 3 is out with more cleanups and security
@@ -7340,11 +7340,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2016.08-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>17 August 2016</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>17 August 2016</small></p>
       </div>
       <div class="timeline-body">
 	<p>Another week, another release candidate with more cleanups
@@ -7362,11 +7362,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2016.08-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>6 August 2016</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>6 August 2016</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of
@@ -7387,11 +7387,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2016.05 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>1 March 2016</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>1 March 2016</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2016.05 release is out - Thanks to everyone
@@ -7406,11 +7406,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2016.05-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>26 May 2016</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>26 May 2016</small></p>
       </div>
       <div class="timeline-body">
 	<p>Release candidate 3 is out with more cleanups and security
@@ -7428,11 +7428,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2016.05-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>17 May 2016</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>17 May 2016</small></p>
       </div>
       <div class="timeline-body">
 	<p>Another week, another release candidate with more cleanups
@@ -7450,11 +7450,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2016.05-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>10 May 2016</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>10 May 2016</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of
@@ -7475,11 +7475,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2016.02 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>1 March 2016</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>1 March 2016</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2016.02 release is out - Thanks to everyone
@@ -7494,11 +7494,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2016.02-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>27 February 2016</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>27 February 2016</small></p>
       </div>
       <div class="timeline-body">
 	<p>Release candidate 3 is out with more cleanups and security
@@ -7516,11 +7516,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2016.02-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>18 February 2016</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>18 February 2016</small></p>
       </div>
       <div class="timeline-body">
 	<p>Another week, another release candidate with more cleanups
@@ -7538,11 +7538,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2016.02-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>10 February 2016</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>10 February 2016</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of
@@ -7563,11 +7563,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2015.11.1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>5 December 2015</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>5 December 2015</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2015.11.1 bugfix release is out - Thanks to everyone
@@ -7582,11 +7582,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2015.11 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>30 November 2015</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>30 November 2015</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2015.11 release is out - Thanks to everyone
@@ -7601,11 +7601,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2015.11-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>26 November 2015</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>26 November 2015</small></p>
       </div>
       <div class="timeline-body">
 	<p>Release candidate 3 is out with more cleanups and security
@@ -7623,11 +7623,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2015.11-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>19 November 2015</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>19 November 2015</small></p>
       </div>
       <div class="timeline-body">
 	<p>Another week, another release candidate with more cleanups
@@ -7645,11 +7645,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2015.11-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>7 November 2015</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>7 November 2015</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of
@@ -7670,11 +7670,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2015.08.1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>6 September 2015</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>6 September 2015</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2015.08.1 bugfix release is out - Thanks to everyone
@@ -7689,11 +7689,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2015.08 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>31 August 2015</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>31 August 2015</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2015.08 release is out - Thanks to everyone
@@ -7708,11 +7708,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2015.08-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>24 August 2015</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>24 August 2015</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over the
@@ -7732,11 +7732,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2015.08-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>5 August 2015</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>5 August 2015</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over the tree, see
@@ -7754,11 +7754,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2015.05 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>31 May 2015</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>31 May 2015</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2015.05 release is out - Thanks to everyone
@@ -7773,11 +7773,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2015.05-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>22 May 2015</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>22 May 2015</small></p>
       </div>
       <div class="timeline-body">
 	<p>Release candidate 3 is out with more cleanups and security
@@ -7795,11 +7795,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2015.05-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>11 May 2015</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>11 May 2015</small></p>
       </div>
       <div class="timeline-body">
 	<p>Another week, another release candidate with more cleanups
@@ -7817,11 +7817,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2015.05-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>4 May 2015</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>4 May 2015</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over the
@@ -7839,11 +7839,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2015.02 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>1 March 2015</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>1 March 2015</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2015.02 release is out - Thanks to everyone
@@ -7859,11 +7859,11 @@
 
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2015.02-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>24 February 2015</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>24 February 2015</small></p>
       </div>
       <div class="timeline-body">
 	<p>Release candidate 3 is out with more cleanups and security
@@ -7881,11 +7881,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2015.02-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>15 February 2015</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>15 February 2015</small></p>
       </div>
       <div class="timeline-body">
 	<p>Another week, another release candidate with more cleanups
@@ -7903,11 +7903,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2015.02-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>8 February 2015</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>8 February 2015</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over
@@ -7927,11 +7927,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2014.11 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>1 December 2014</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>1 December 2014</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2014.11 release is out - Thanks to everyone
@@ -7945,11 +7945,11 @@
   </li>
 
   <li  class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2014.11-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>28 November 2014</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>28 November 2014</small></p>
       </div>
       <div class="timeline-body">
 	<p>Release candidate 3 is out with more cleanups and build
@@ -7968,11 +7968,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2014.11-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>21 November 2014</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>21 November 2014</small></p>
       </div>
       <div class="timeline-body">
 	<p>Another week, another release candidate with more cleanups
@@ -7990,11 +7990,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">Report from Buildroot Developers Meeting</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>13 November 2014</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>13 November 2014</small></p>
       </div>
       <div class="timeline-body">
 	<p>A report from the recent
@@ -8015,11 +8015,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2014.11-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>12 November 2014</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>12 November 2014</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over the
@@ -8038,11 +8038,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2014.08 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>1 September 2014</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>1 September 2014</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2014.08 release is out - Thanks to everyone
@@ -8057,11 +8057,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2014.08-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>26 August 2014</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>26 August 2014</small></p>
       </div>
       <div class="timeline-body">
 	<p>Release candidate 3 is out with more cleanups and build
@@ -8079,11 +8079,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2014.08-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>18 August 2014</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>18 August 2014</small></p>
       </div>
       <div class="timeline-body">
 	<p>Another week, another release candidate with more cleanups
@@ -8101,11 +8101,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2014.08-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>8 August 2014</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>8 August 2014</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over the
@@ -8124,11 +8124,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2014.05 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>31 May 2014</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>31 May 2014</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2014.05 release is out - Thanks to everyone
@@ -8143,11 +8143,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2014.05-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>28 May 2014</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>28 May 2014</small></p>
       </div>
       <div class="timeline-body">
 	<p>Release candidate 3 is out with more cleanups and build
@@ -8165,11 +8165,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2014.05-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>21 May 2014</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>21 May 2014</small></p>
       </div>
       <div class="timeline-body">
 	<p>Another week, another release candidate with more cleanups
@@ -8188,11 +8188,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2014.05-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>13 May 2014</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>13 May 2014</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over the
@@ -8211,11 +8211,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">27 February 2014</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>2014.02 released</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>2014.02 released</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2014.02 release is out - Thanks to everyone
@@ -8229,11 +8229,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">25 February 2014</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>2014.02-rc3 released</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>2014.02-rc3 released</small></p>
       </div>
       <div class="timeline-body">
 	<p>Release candidate 3 is out with more cleanups and build
@@ -8251,11 +8251,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">20 February 2014</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>2014.02-rc2 released</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>2014.02-rc2 released</small></p>
       </div>
       <div class="timeline-body">
 	<p>Another week, another release candidate with more cleanups
@@ -8273,11 +8273,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2014.02-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>11 February 2014</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>11 February 2014</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over the
@@ -8296,11 +8296,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">9 February 2014</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>Report from Buildroot Developers Meeting</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>Report from Buildroot Developers Meeting</small></p>
       </div>
       <div class="timeline-body">
 	<p>A report from the recent
@@ -8316,11 +8316,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">Upcoming Buildroot Developers meeting</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>30 January 2014</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>30 January 2014</small></p>
       </div>
       <div class="timeline-body">
 	<p>The upcoming Buildroot Developers meeting will take place in
@@ -8343,11 +8343,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2013.11 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>30 November 2013</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>30 November 2013</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2013.11 release is out - Thanks to everyone
@@ -8361,11 +8361,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">Slides from Embedded Linux Conference Europe</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>30 November 2013</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>30 November 2013</small></p>
       </div>
       <div class="timeline-body">
 	<p>The slides from the Buildroot presentation at the recent
@@ -8377,11 +8377,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2013.11-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>18 November 2013</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>18 November 2013</small></p>
       </div>
       <div class="timeline-body">
 	<p>Another week, another release candidate with more
@@ -8399,11 +8399,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2013.11-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>18 November 2013</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>18 November 2013</small></p>
       </div>
       <div class="timeline-body">
 	<p>Another week, another release candidate with more cleanups
@@ -8421,11 +8421,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">Announcement of the next Buildroot Developer Days</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>13 November 2013</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>13 November 2013</small></p>
       </div>
       <div class="timeline-body">
 	<p>The next <i>Buildroot Developer Days</i> meeting will take
@@ -8455,11 +8455,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2013.11-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>12 November 2013</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>12 November 2013</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over the
@@ -8478,11 +8478,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">Report from Buildroot Developers Meeting</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>11 November 2013</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>11 November 2013</small></p>
       </div>
       <div class="timeline-body">
 	<p>A report from the recent
@@ -8498,11 +8498,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2013.08.1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>17 September 2013</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>17 September 2013</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2013.08.1 bugfix release is out - Thanks to everyone
@@ -8517,11 +8517,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">Buildroot Developer Days</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>16 September 2013</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>16 September 2013</small></p>
       </div>
       <div class="timeline-body">
 	<p>The next <i>Buildroot Developer Days</i> meeting will take
@@ -8542,11 +8542,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2013.08 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>31 August 2013</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>31 August 2013</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2013.08 release is out - Thanks to everyone
@@ -8560,11 +8560,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2013.08-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>29 August 2013</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>29 August 2013</small></p>
       </div>
       <div class="timeline-body">
 	<p>Another week, another release candidate with more cleanups and
@@ -8582,11 +8582,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2013.08-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>16 August 2013</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>16 August 2013</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over the
@@ -8604,11 +8604,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2013.08-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>5 August 2013</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>5 August 2013</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over the
@@ -8626,11 +8626,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2013.05 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>31 May 2013</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>31 May 2013</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2013.05 release is out - Thanks to everyone
@@ -8645,11 +8645,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2013.05-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>25 May 2013</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>25 May 2013</small></p>
       </div>
       <div class="timeline-body">
 	<p>Another week, another release candidate with more cleanups and
@@ -8667,11 +8667,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2013.05-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>15 May 2013</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>15 May 2013</small></p>
       </div>
       <div class="timeline-body">
 	<p>Another week, another release candidate with more cleanups and
@@ -8689,11 +8689,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2013.05-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>8 May 2013</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>8 May 2013</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over the
@@ -8712,11 +8712,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2013.02 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>28 February 2013</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>28 February 2013</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2013.02 release is out - Thanks to everyone
@@ -8730,11 +8730,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2013.02-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>26 February 2013</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>26 February 2013</small></p>
       </div>
       <div class="timeline-body">
 	<p>Another week, another release candidate with more cleanups
@@ -8752,11 +8752,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2013.02-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>19 February 2013</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>19 February 2013</small></p>
       </div>
       <div class="timeline-body">
 	<p>Another week, another release candidate with more cleanups and
@@ -8774,11 +8774,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2013.02-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>10 February 2013</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>10 February 2013</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over the
@@ -8797,11 +8797,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">Report from Buildroot Developers Meeting</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>10 February 2013</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>10 February 2013</small></p>
       </div>
       <div class="timeline-body">
 	<p>A report from the recent Buildroot Developers Meeting is now
@@ -8817,11 +8817,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">Next Buildroot Developers Meeting next to FOSDEM, Brussels</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>12 January 2013</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>12 January 2013</small></p>
       </div>
       <div class="timeline-body">
 	<p>The next Buildroot Developers Meeting will take place on Monday
@@ -8844,11 +8844,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2012.11.1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>3 January 2013</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>3 January 2013</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2012.11.1 bugfix release is out - Thanks to everyone
@@ -8864,11 +8864,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2012.11 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>2 December 2012</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>2 December 2012</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2012.11 release is out - Thanks to everyone
@@ -8882,11 +8882,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2012.11-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>30 November 2012</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>30 November 2012</small></p>
       </div>
       <div class="timeline-body">
 	<p>RC2 is out with more bugfixes - See
@@ -8903,11 +8903,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2012.11-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>17 November 2012</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>17 November 2012</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over the
@@ -8926,11 +8926,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">Buildroot Developer Day</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>17 November 2012</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>17 November 2012</small></p>
       </div>
       <div class="timeline-body">
 	<p>A report from the recent <i>Buildroot Developer Days</i>
@@ -8952,11 +8952,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2012.08 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>31 August 2012</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>31 August 2012</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2012.08 release is out - Thanks to everyone
@@ -8969,11 +8969,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2012.08-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>25 August 2012</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>25 August 2012</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Various fixes, and
@@ -8991,11 +8991,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2012.08-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>15 August 2012</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>15 August 2012</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Various fixes, and addition
@@ -9013,11 +9013,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2012.08-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>1 August 2012</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>1 August 2012</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over
@@ -9035,11 +9035,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">Buildroot Developer Day</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>22 July 2012</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>22 July 2012</small></p>
       </div>
       <div class="timeline-body">
 	<p>The next <i>Buildroot Developer Day</i> meeting will take place
@@ -9060,11 +9060,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2012.05 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>30 May 2012</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>30 May 2012</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2012.05 release is out - Thanks to everyone
@@ -9079,11 +9079,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2012.05-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>25 May 2012</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>25 May 2012</small></p>
       </div>
       <div class="timeline-body">
 	<p>RC3 is out with more bugfixes - See
@@ -9100,11 +9100,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2012.05-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>18 May 2012</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>18 May 2012</small></p>
       </div>
       <div class="timeline-body">
 	<p>Another week, another release candidate with more cleanups
@@ -9122,11 +9122,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2012.05-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>10 May 2012</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>10 May 2012</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over
@@ -9145,11 +9145,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">Autobuilder Results Online</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>20 April 2012</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>20 April 2012</small></p>
       </div>
       <div class="timeline-body">
 	<p>The status of the autobuilders, which do repeated
@@ -9169,11 +9169,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2012.02 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>29 February 2012</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>29 February 2012</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2012.02 release is out - Thanks to everyone
@@ -9188,11 +9188,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2012.02-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>27 February 2012</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>27 February 2012</small></p>
       </div>
       <div class="timeline-body">
 	<p>RC3 is out with more bugfixes - See
@@ -9209,11 +9209,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2012.02-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>19 February 2012</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>19 February 2012</small></p>
       </div>
       <div class="timeline-body">
 	<p>Another week, another release candidate with more cleanups
@@ -9231,11 +9231,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2012.02-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>12 February 2012</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>12 February 2012</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over
@@ -9254,11 +9254,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">Buildroot Developer Day</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>31 January 2012</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>31 January 2012</small></p>
       </div>
       <div class="timeline-body">
 	<p>Another <i>Buildroot Developer Day</i> will take place on
@@ -9273,11 +9273,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2011.11 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>30 November 2011</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>30 November 2011</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2011.11 release is out - Thanks to everyone
@@ -9292,11 +9292,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2011.11-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>26 November 2011</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>26 November 2011</small></p>
       </div>
       <div class="timeline-body">
 	<p>RC3 is out with more bugfixes - See
@@ -9313,11 +9313,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2011.11-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>18 November 2011</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>18 November 2011</small></p>
       </div>
       <div class="timeline-body">
 	<p>Another week, another release candidate with a bunch of
@@ -9335,11 +9335,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2011.11-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>11 November 2011</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>11 November 2011</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over
@@ -9358,11 +9358,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2011.08 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>31 August 2011</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>31 August 2011</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2011.08 release is out - Thanks to everyone
@@ -9375,11 +9375,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2011.08-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>29 August 2011</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>29 August 2011</small></p>
       </div>
       <div class="timeline-body">
 	<p>RC2 is out with more bugfixes. See
@@ -9397,11 +9397,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2011.08-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>4 August 2011</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>4 August 2011</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over
@@ -9420,11 +9420,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2011.05 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>27 May 2011</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>27 May 2011</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2011.05 release is out - Thanks to everyone
@@ -9437,11 +9437,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2011.05-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>24 May 2011</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>24 May 2011</small></p>
       </div>
       <div class="timeline-body">
 	<p>RC2 is out with more bugfixes. See
@@ -9458,11 +9458,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2011.05-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>18 May 2011</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>18 May 2011</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over
@@ -9481,11 +9481,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2011.02 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>28 February 2011</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>28 February 2011</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2011.02 release is out - Thanks to everyone
@@ -9500,11 +9500,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2011.02-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>24 February 2011</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>24 February 2011</small></p>
       </div>
       <div class="timeline-body">
 	<p>RC2 is out with more cleanups and bugfixes, see
@@ -9521,11 +9521,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2011.02-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>14 February 2011</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>14 February 2011</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over
@@ -9544,11 +9544,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2010.11 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>30 November 2010</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>30 November 2010</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2010.11 release is out - Thanks to everyone
@@ -9563,11 +9563,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2010.11-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>25 November 2010</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>25 November 2010</small></p>
       </div>
       <div class="timeline-body">
 	<p>RC2 is out with more cleanups and bugfixes, see
@@ -9584,11 +9584,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2010.11-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>8 November 2010</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>8 November 2010</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over
@@ -9607,11 +9607,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">Buildroot Developer Day</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>28 September 2010</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>28 September 2010</small></p>
       </div>
       <div class="timeline-body">
 	<p>A <i>Buildroot Developer Day</i> will take place on
@@ -9630,11 +9630,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2010.08 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>31 August 2010</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>31 August 2010</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2010.08 release is out - Thanks to everyone
@@ -9649,11 +9649,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2010.08-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>30 August 2010</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>30 August 2010</small></p>
       </div>
       <div class="timeline-body">
 	<p>RC2 is out with more cleanups and bugfixes, see
@@ -9674,11 +9674,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2010.08-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>30 July 2010</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>30 July 2010</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over
@@ -9696,11 +9696,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2010.05 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>30 May 2010</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>30 May 2010</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2010.05 release is out - Thanks to everyone
@@ -9715,11 +9715,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2010.05-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>27 May 2010</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>27 May 2010</small></p>
       </div>
       <div class="timeline-body">
 	<p>RC3 is out with more cleanups and bugfixes, see
@@ -9736,11 +9736,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2010.05-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>11 May 2010</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>11 May 2010</small></p>
       </div>
       <div class="timeline-body">
 	<p>Another week, another release candidate with a bunch of
@@ -9756,11 +9756,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2010.05-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>3 May 2010</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>3 May 2010</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over
@@ -9778,11 +9778,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">FOSDEM slides online</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>2 May 2010</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>2 May 2010</small></p>
       </div>
       <div class="timeline-body">
 	<p>The slides from
@@ -9795,11 +9795,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2010.02 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>26 February 2010</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>26 February 2010</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2010.02 release is out - Thanks to everyone
@@ -9814,11 +9814,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2010.02-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>23 February 2010</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>23 February 2010</small></p>
       </div>
       <div class="timeline-body">
 	<p>RC2 is out with more cleanups and bugfixes, see
@@ -9835,11 +9835,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2010.02-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>9 February 2010</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>9 February 2010</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over
@@ -9857,11 +9857,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2009.11 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>1 December 2009</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>1 December 2009</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2009.11 release is out - Thanks to everyone
@@ -9876,11 +9876,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2009.11-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>29 November 2009</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>29 November 2009</small></p>
       </div>
       <div class="timeline-body">
 	<p>RC2 is out with more cleanups and bugfixes, see
@@ -9897,11 +9897,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2009.11-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>23 November 2009</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>23 November 2009</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over
@@ -9919,11 +9919,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">First Buildroot Developer Day</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>7 September 2009</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>7 September 2009</small></p>
       </div>
       <div class="timeline-body">
 	<p>The first <i>Buildroot Developer Day</i> will take place on
@@ -9946,11 +9946,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2009.08 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>31 August 2009</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>31 August 2009</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2009.08 release is out - Thanks to everyone
@@ -9965,11 +9965,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2009.08-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>26 August 2009</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>26 August 2009</small></p>
       </div>
       <div class="timeline-body">
 	<p>A number of bugfixes have been added to the tree since RC2
@@ -9991,11 +9991,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2009.08-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>6 August 2009</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>6 August 2009</small></p>
       </div>
       <div class="timeline-body">
 	<p>RC2 is out with more cleanups and bugfixes, see
@@ -10012,11 +10012,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2009.08-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>2 August 2009</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>2 August 2009</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over
@@ -10034,11 +10034,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2009.05 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>1 June 2009</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>1 June 2009</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2009.05 release is out - Thanks to everyone
@@ -10053,11 +10053,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2009.05-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>27 May 2009</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>27 May 2009</small></p>
       </div>
       <div class="timeline-body">
 	<p>We had a number of fixes post-RC2, so RC3 is out
@@ -10076,11 +10076,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2009.05-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>19 May 2009</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>19 May 2009</small></p>
       </div>
       <div class="timeline-body">
 	<p>RC2 is out with more cleanups and bug fixes
@@ -10099,11 +10099,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">Buildroot.org</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>14 May 2009</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>14 May 2009</small></p>
       </div>
       <div class="timeline-body">
 	<p>Earl Levine has been so kind to donate
@@ -10119,11 +10119,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2009.05-rc1 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>5 May 2009</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>5 May 2009</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Lots of changes all over the
@@ -10141,11 +10141,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">Moved to git</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>3 May 2009</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>3 May 2009</small></p>
       </div>
       <div class="timeline-body">
 	<p>We've moved the source code
@@ -10162,11 +10162,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">New logo</h4>
-	    <p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>27 March 2009</small></p>
+	    <p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>27 March 2009</small></p>
       </div>
       <div class="timeline-body">
 	<p>We have a <a href="images/logo.png">logo</a>! We have so
@@ -10179,11 +10179,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2009.02 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>12 February 2009</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>12 February 2009</small></p>
       </div>
       <div class="timeline-body">
 	<p>The stable 2009.02 release is out - Thanks to everyone
@@ -10197,11 +10197,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2009.02-rc4 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>9 February 2009</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>9 February 2009</small></p>
       </div>
       <div class="timeline-body">
 	<p>We had more than 50 changes since RC3, several of them
@@ -10221,11 +10221,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2009.02-rc3 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>31 January 2009</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>31 January 2009</small></p>
       </div>
       <div class="timeline-body">
 	<p>RC3 is out with more cleanups and bug fixes. Unless big
@@ -10243,11 +10243,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2009.02-rc2 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>23 January 2009</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>23 January 2009</small></p>
       </div>
       <div class="timeline-body">
 	<p>Another week, another release candidate with a bunch of
@@ -10263,11 +10263,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">Release candidate and new maintainer</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>16 January 2009</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>16 January 2009</small></p>
       </div>
       <div class="timeline-body">
 
@@ -10288,11 +10288,11 @@
   </li>
 
   <li>
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">Buildroot mailing list</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>16 July 2006</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>16 July 2006</small></p>
       </div>
       <div class="timeline-body">
 	<p>Buildroot now has its own <a href=support.html>mailing list</a>.</p>
@@ -10301,11 +10301,11 @@
   </li>
 
   <li class="timeline-inverted">
-    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
-    <div class="timeline-panel">
+    <div class="timeline-badge"><i class="bi bi-hand-thumbs-up-fill text-primary"></i></div>
+    <div class="timeline-panel card card-body">
       <div class="timeline-heading">
 	<h4 class="timeline-title">Buildroot webpage added</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>21 February 2005</small></p>
+	<p><small class="text-muted"><i class="bi bi-clock text-primary me-1"></i>21 February 2005</small></p>
 
 	<p>Buildroot is a set of Makefiles and patches that makes it easy generate a
 	  cross-compilation toolchain and root filesystem for your target Linux
diff --git a/docs/website/sponsors.html b/docs/website/sponsors.html
index 5d203fac92..e5d38cb28c 100644
--- a/docs/website/sponsors.html
+++ b/docs/website/sponsors.html
@@ -1,61 +1,60 @@
 <!--#include file="header.html" -->
 
-<link href="css/sponsors.css" rel="stylesheet">
 
 <div class="container">
-<div class="row nh"><!-- current sponsor row -->
-<div class="col-lg-10 col-lg-offset-1 col-md-12 col-sm-12 col-xs-12">
+<div class="row my-4"><!-- current sponsor row -->
+<div class="col-lg-10 offset-lg-1 col-md-12 col-sm-12 col-12">
 
-    <div class="panel panel-primary">
-    <div class="panel-heading">LTS sponsors</div>
-    <div class="panel-body">
-      <p>The maintenance of the Long Term Support branch of Buildroot is
+    <div class="card mb-4">
+    <div class="card-header text-bg-primary rounded-top">LTS sponsors</div>
+    <div class="card-body">
+      <p class="mb-0">The maintenance of the Long Term Support branch of Buildroot is
          possible thanks to the sponsors of the
          <a href="lts.html">Buildroot LTS Sponsorship
          Program</a>.</p>
     </div>
-    <div class="panel-body">
-      <h3>Gold Sponsors</h3>
+    <div class="card-body">
+      <h3 class="text-body-secondary">Gold Sponsors</h3>
 
-      <div class="sponsors-container">
-	<div class="sponsor-entry">
-	  <div class="panel panel-default panel-lts-sponsor">
-	    <div class="panel-body">
-	      <div class="sponsor-title">
-		<a href="https://evs.com">
-		  <img class="img-responsive" src="images/evs-logo.png"/>
+      <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-3">
+	<div class="col">
+	  <div class="card h-100">
+	    <div class="card-body d-flex flex-column">
+	      <div class="ratio ratio-21x9">
+		<a class="d-flex align-items-center justify-content-center" href="https://evs.com">
+		  <img class="mw-100 mh-100" src="images/evs-logo.png"/>
 		</a>
 	      </div>
-	      <div class="sponsor-body">
+	      <div class="mt-3">
 		<a href="http://evs.com">EVS Broadcast Equipment</a>
 	      </div>
 	    </div>
 	  </div>
 	</div>
-	<div class="sponsor-entry">
-	  <div class="panel panel-default panel-lts-sponsor">
-	    <div class="panel-body">
-	      <div class="sponsor-title">
-		<a href="https://www.openhomefoundation.org/">
-		  <img class="img-responsive" src="images/openhomefoundation-logo.png"/>
+	<div class="col">
+	  <div class="card h-100">
+	    <div class="card-body d-flex flex-column">
+	      <div class="ratio ratio-21x9">
+		<a class="d-flex align-items-center justify-content-center" href="https://www.openhomefoundation.org/">
+		  <img class="mw-100 mh-100" src="images/openhomefoundation-logo.png"/>
 		</a>
 	      </div>
-	      <div class="sponsor-body">
+	      <div class="mt-3">
 		<a href="https://www.openhomefoundation.org">Open Home
 		Foundation</a>
 	      </div>
 	    </div>
 	  </div>
 	</div>
-        <div class="sponsor-entry">
-          <div class="panel panel-default panel-lts-sponsor">
-            <div class="panel-body">
-              <div class="sponsor-title">
-                <a href="https://www.ti.com/">
-                  <img class="img-responsive" src="images/ti-logo.png"/>
+        <div class="col">
+          <div class="card h-100">
+            <div class="card-body d-flex flex-column">
+              <div class="ratio ratio-21x9">
+                <a class="d-flex align-items-center justify-content-center" href="https://www.ti.com/">
+                  <img class="mw-100 mh-100" src="images/ti-logo.png"/>
                 </a>
               </div>
-              <div class="sponsor-body">
+              <div class="mt-3">
                 <a href="https://www.ti.com">Texas Instruments</a>
               </div>
             </div>
@@ -64,32 +63,32 @@
     </div>
     </div>
 
-    <div class="panel-body">
-      <h3>Silver Sponsors</h3>
-      <div class="sponsors-container">
-        <div class="sponsor-entry">
-          <div class="panel panel-default panel-lts-sponsor">
-            <div class="panel-body">
-              <div class="sponsor-title">
-                <a href="https://www.ipcomm.de">
-                  <img class="img-responsive center-block" style="height: 100%;" src="images/ipcomm-logo.png"/>
+    <div class="card-body">
+      <h3 class="mt-4 text-body-secondary">Silver Sponsors</h3>
+      <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-3">
+        <div class="col">
+          <div class="card h-100">
+            <div class="card-body d-flex flex-column">
+              <div class="ratio ratio-21x9">
+                <a class="d-flex align-items-center justify-content-center" href="https://www.ipcomm.de">
+                  <img class="mw-100 mh-100" src="images/ipcomm-logo.png"/>
                 </a>
               </div>
-              <div class="sponsor-body">
+              <div class="mt-3">
                 <a href="https://www.ipcomm.de">IPComm</a>
               </div>
             </div>
           </div>
         </div>
-        <div class="sponsor-entry">
-          <div class="panel panel-default panel-lts-sponsor">
-            <div class="panel-body">
-              <div class="sponsor-title">
-                <a href="https://othermo.de/">
-                  <img class="img-responsive center-block" style="width: 100%;" src="images/othermo-logo.png"/>
+        <div class="col">
+          <div class="card h-100">
+            <div class="card-body d-flex flex-column">
+              <div class="ratio ratio-21x9">
+                <a class="d-flex align-items-center justify-content-center" href="https://othermo.de/">
+                  <img class="mw-100 mh-100" src="images/othermo-logo.png"/>
                 </a>
               </div>
-              <div class="sponsor-body">
+              <div class="mt-3">
                 <a href="https://othermo.de">Othermo</a>
               </div>
             </div>
@@ -98,33 +97,33 @@
       </div>
     </div>
 
-    <div class="panel-body">
-      <h3>Bronze Sponsors</h3>
-      <div class="sponsors-container">
-        <div class="sponsor-entry">
-          <div class="panel panel-default panel-lts-sponsor">
-            <div class="panel-body">
-              <div class="sponsor-title">
-                <a href="https://calian.com/">
-                  <img class="img-responsive center-block" style="height: 100%;" src="images/calian-logo.png"/>
+    <div class="card-body">
+      <h3 class="mt-4 text-body-secondary">Bronze Sponsors</h3>
+      <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-3">
+        <div class="col">
+          <div class="card h-100">
+            <div class="card-body d-flex flex-column">
+              <div class="ratio ratio-21x9">
+                <a class="d-flex align-items-center justify-content-center" href="https://calian.com/">
+                  <img class="mw-100 mh-100" src="images/calian-logo.png"/>
                 </a>
               </div>
-              <div class="sponsor-body">
+              <div class="mt-3">
                 <a href="https://calian.com/">Calian</a>
               </div>
             </div>
           </div>
         </div>
 
-        <div class="sponsor-entry">
-          <div class="panel panel-default panel-lts-sponsor">
-            <div class="panel-body">
-              <div class="sponsor-title">
-                <a href="https://smc-gateway.com/">
-                  <img class="img-responsive center-block" style="height: 100%;" src="images/smc-gateway-logo.png"/>
+        <div class="col">
+          <div class="card h-100">
+            <div class="card-body d-flex flex-column">
+              <div class="ratio ratio-21x9">
+                <a class="d-flex align-items-center justify-content-center" href="https://smc-gateway.com/">
+                  <img class="mw-100 mh-100" src="images/smc-gateway-logo.png"/>
                 </a>
               </div>
-              <div class="sponsor-body">
+              <div class="mt-3">
                 <a href="https://smc-gateway.com/">SMC Gateway</a>
               </div>
             </div>
@@ -134,20 +133,20 @@
     </div>
     </div>
 
-    <div class="panel panel-primary">
-    <div class="panel-heading">Current sponsors</div>
-    <div class="panel-body">
+    <div class="card mb-4">
+    <div class="card-header text-bg-primary rounded-top">Current sponsors</div>
+    <div class="card-body">
 
-      <div class="sponsors-container">
-	<div class="sponsor-entry">
-	  <div class="panel panel-default panel-sponsor">
-	    <div class="panel-body">
-	      <div class="sponsor-title">
-		<a href="https://www.smile.eu">
-		  <img class="img-responsive" src="images/smile-logo.png"/>
+      <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-3">
+	<div class="col">
+	  <div class="card h-100">
+	    <div class="card-body d-flex flex-column">
+	      <div class="ratio ratio-21x9">
+		<a class="d-flex align-items-center justify-content-center" href="https://www.smile.eu">
+		  <img class="mw-100 mh-100" src="images/smile-logo.png"/>
 		</a>
 	      </div>
-	      <div class="sponsor-body">
+	      <div class="mt-3">
 		<a href="http://www.smile.eu">Smile</a> is sponsoring the
 		Buildroot project by hosting
 		the <a href="https://elinux.org/Buildroot:DeveloperDaysFOSDEM2026">Buildroot
@@ -158,15 +157,15 @@
 	    </div>
 	  </div>
 	</div>
-        <div class="sponsor-entry">
-          <div class="panel panel-default panel-lts-sponsor">
-            <div class="panel-body">
-              <div class="sponsor-title">
-                <a href="https://www.ti.com/">
-                  <img class="img-responsive" src="images/ti-logo.png"/>
+        <div class="col">
+          <div class="card h-100">
+            <div class="card-body d-flex flex-column">
+              <div class="ratio ratio-21x9">
+                <a class="d-flex align-items-center justify-content-center" href="https://www.ti.com/">
+                  <img class="mw-100 mh-100" src="images/ti-logo.png"/>
                 </a>
               </div>
-              <div class="sponsor-body">
+              <div class="mt-3">
                 <a href="https://www.ti.com">Texas Instruments</a> is
                 financially sponsoring
                 the <a href="/association.html">Buildroot
@@ -175,15 +174,15 @@
             </div>
           </div>
 	</div>
-	<div class="sponsor-entry">
-	  <div class="panel panel-default panel-sponsor">
-	    <div class="panel-body">
-	      <div class="sponsor-title">
-		<a href="https://www.armadeus.com">
-		  <img class="img-responsive" src="images/armadeus-systems-logo.png"/>
+	<div class="col">
+	  <div class="card h-100">
+	    <div class="card-body d-flex flex-column">
+	      <div class="ratio ratio-21x9">
+		<a class="d-flex align-items-center justify-content-center" href="https://www.armadeus.com">
+		  <img class="mw-100 mh-100" src="images/armadeus-systems-logo.png"/>
 		</a>
 	      </div>
-	      <div class="sponsor-body">
+	      <div class="mt-3">
 		<a href="https://www.armadeus.com">Armadeus</a> is
 		financially sponsoring
 		the <a href="/association.html">Buildroot
@@ -192,15 +191,15 @@
 	    </div>
 	  </div>
 	</div>
-	<div class="sponsor-entry">
-	  <div class="panel panel-default panel-sponsor">
-	    <div class="panel-body">
-	      <div class="sponsor-title">
-		<a href="https://www.openhomefoundation.org/">
-		  <img class="img-responsive" src="images/openhomefoundation-logo.png"/>
+	<div class="col">
+	  <div class="card h-100">
+	    <div class="card-body d-flex flex-column">
+	      <div class="ratio ratio-21x9">
+		<a class="d-flex align-items-center justify-content-center" href="https://www.openhomefoundation.org/">
+		  <img class="mw-100 mh-100" src="images/openhomefoundation-logo.png"/>
 		</a>
 	      </div>
-	      <div class="sponsor-body">
+	      <div class="mt-3">
 		<a href="https://www.openhomefoundation.org">Open Home
 		Foundation</a> financially sponsored
 		the <a href="/association.html">Buildroot
@@ -213,23 +212,23 @@
     </div>
     </div>
 
-  <div class="panel panel-primary">
-    <div class="panel-heading">Past sponsors</div>
-    <div class="panel-body">
+  <div class="card mb-4">
+    <div class="card-header text-bg-primary rounded-top">Past sponsors</div>
+    <div class="card-body">
       <p>Throughout its history, the Buildroot project has been sponsored by
 	various companies, that we would like to thank below.</p>
 
-      <div class="sponsors-container">
+      <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-3">
 
-	<div class="sponsor-entry">
-	  <div class="panel panel-default panel-lts-sponsor">
-	    <div class="panel-body">
-	      <div class="sponsor-title">
-		<a href="https://www.sense.com">
-		  <img class="img-responsive" src="images/sense-logo.png"/>
+	<div class="col">
+	  <div class="card h-100">
+	    <div class="card-body d-flex flex-column">
+	      <div class="ratio ratio-21x9">
+		<a class="d-flex align-items-center justify-content-center" href="https://www.sense.com">
+		  <img class="mw-100 mh-100" src="images/sense-logo.png"/>
 		</a>
 	      </div>
-	      <div class="sponsor-body">
+	      <div class="mt-3">
 		<a href="https://www.sense.com">Sense Labs</a> sponsored the
 		LTS maintenance in 2025.
 	      </div>
@@ -237,15 +236,15 @@
 	  </div>
 	</div>
 
-	<div class="sponsor-entry">
-	  <div class="panel panel-default panel-sponsor">
-	    <div class="panel-body">
-	      <div class="sponsor-title">
-		<a href="https://www.smile.eu">
-		  <img class="img-responsive" src="images/smile-logo.png"/>
+	<div class="col">
+	  <div class="card h-100">
+	    <div class="card-body d-flex flex-column">
+	      <div class="ratio ratio-21x9">
+		<a class="d-flex align-items-center justify-content-center" href="https://www.smile.eu">
+		  <img class="mw-100 mh-100" src="images/smile-logo.png"/>
 		</a>
 	      </div>
-	      <div class="sponsor-body">
+	      <div class="mt-3">
 	        <a href="https://www.smile.eu">Smile</a> provided the
 	        meeting location Buildroot Developers days after
 	        FOSDEM each year since 2023, for the
@@ -259,15 +258,15 @@
 	  </div>
 	</div>
 
-	<div class="sponsor-entry">
-	  <div class="panel panel-default panel-sponsor">
-	    <div class="panel-body">
-	      <div class="sponsor-title">
-		<a href="http://www.mind.be">
-		  <img class="img-responsive" src="images/mind-logo.png"/>
+	<div class="col">
+	  <div class="card h-100">
+	    <div class="card-body d-flex flex-column">
+	      <div class="ratio ratio-21x9">
+		<a class="d-flex align-items-center justify-content-center" href="http://www.mind.be">
+		  <img class="mw-100 mh-100" src="images/mind-logo.png"/>
 		</a>
 	      </div>
-	      <div class="sponsor-body">
+	      <div class="mt-3">
 		<a href="http://www.mind.be">Mind</a> sponsored
 		financially the Buildroot Association for the ELCE
 		2018 meeting, sponsored the dinner of the FOSDEM 2014,
@@ -280,14 +279,15 @@
 	  </div>
 	</div>
 
-	<div class="sponsor-entry">
-	  <div class="panel panel-default panel-sponsor">
-	    <div class="panel-body">
-	      <div class="sponsor-title">
-		<p><a href="http://www.google.com">
-		    <img class="img-responsive" src="images/google-logo.png"/></a></p>
-	      </div>
-	      <div class="sponsor-body">
+	<div class="col">
+	  <div class="card h-100">
+	    <div class="card-body d-flex flex-column">
+	      <div class="ratio ratio-21x9">
+	        <a class="d-flex align-items-center justify-content-center" href="http://www.google.com">
+	          <img class="mw-100 mh-100" src="images/google-logo.png"/>
+	        </a>
+	      </div>
+	      <div class="mt-3">
 		<p><a href="http://www.google.com">Google</a> provided
 		  the logistics for the FOSDEM 2013, FOSDEM 2014,
 		  FOSDEM 2015, FOSDEM 2016, FOSDEM 2017, FOSDEM 2018,
@@ -298,14 +298,15 @@
 	  </div>
 	</div>
 
-	<div class="sponsor-entry">
-	  <div class="panel panel-default panel-sponsor">
-	    <div class="panel-body">
-	      <div class="sponsor-title">
-		<p><a href="https://www.amarulasolutions.com/">
-		    <img class="img-responsive" src="images/amarula-solutions-logo.png"/></a></p>
-	      </div>
-	      <div class="sponsor-body">
+	<div class="col">
+	  <div class="card h-100">
+	    <div class="card-body d-flex flex-column">
+	      <div class="ratio ratio-21x9">
+	        <a class="d-flex align-items-center justify-content-center" href="https://www.amarulasolutions.com/">
+	          <img class="mw-100 mh-100" src="images/amarula-solutions-logo.png"/>
+	        </a>
+	      </div>
+	      <div class="mt-3">
 		<a href="https://www.amarulasolutions.com/">Amarula
 		  Solutions</a> sponsored the <em>Buildroot
 		  Association</em> in 2018.
@@ -314,14 +315,15 @@
 	  </div>
 	</div>
 
-	<div class="sponsor-entry">
-	  <div class="panel panel-default panel-sponsor">
-	    <div class="panel-body">
-	      <div class="sponsor-title">
-		<p><a href="https://www.bootlin.com/">
-		    <img class="img-responsive" src="images/bootlin-logo.png"/></a></p>
-	      </div>
-	      <div class="sponsor-body">
+	<div class="col">
+	  <div class="card h-100">
+	    <div class="card-body d-flex flex-column">
+	      <div class="ratio ratio-21x9">
+	        <a class="d-flex align-items-center justify-content-center" href="https://www.bootlin.com/">
+	          <img class="mw-100 mh-100" src="images/bootlin-logo.png"/>
+	        </a>
+	      </div>
+	      <div class="mt-3">
 		<p><a href="http://www.bootlin.com">Bootlin</a>
 		  sponsored financially the Buildroot Association for
 		  the ELCE 2018 meeting, sponsored the meeting
@@ -333,15 +335,15 @@
 	  </div>
 	</div>
 
-	<div class="sponsor-entry">
-	  <div class="panel panel-default panel-sponsor">
-	    <div class="panel-body">
-	      <div class="sponsor-title">
-		<a href="http://www.logilin.fr">
-		  <img class="img-responsive" src="images/logilin-logo.png"/>
+	<div class="col">
+	  <div class="card h-100">
+	    <div class="card-body d-flex flex-column">
+	      <div class="ratio ratio-21x9">
+		<a class="d-flex align-items-center justify-content-center" href="http://www.logilin.fr">
+		  <img class="mw-100 mh-100" src="images/logilin-logo.png"/>
 		</a>
 	      </div>
-	      <div class="sponsor-body">
+	      <div class="mt-3">
 		<a href="http://www.logilin.fr">Logilin</a> sponsored
 		the ELCE 2018 Buildroot Developers meeting by
 		contributing financially to the <em>Buildroot
@@ -352,15 +354,15 @@
 	  </div>
 	</div>
 
-	<div class="sponsor-entry">
-	  <div class="panel panel-default panel-sponsor">
-	    <div class="panel-body">
-	      <div class="sponsor-title">
-		<a href="http://www.tkos.col.il">
-		  <img class="img-responsive" src="images/tkos-logo.png"/>
+	<div class="col">
+	  <div class="card h-100">
+	    <div class="card-body d-flex flex-column">
+	      <div class="ratio ratio-21x9">
+		<a class="d-flex align-items-center justify-content-center" href="http://www.tkos.col.il">
+		  <img class="mw-100 mh-100" src="images/tkos-logo.png"/>
 		</a>
 	      </div>
-	      <div class="sponsor-body">
+	      <div class="mt-3">
 		<a href="http://www.tkos.co.il">Tk Open Systems</a>
 		sponsored the ELCE 2018 Buildroot Developers meeting
 		by contributing financially to the <em>Buildroot
@@ -370,15 +372,15 @@
 	  </div>
 	</div>
 
-	<div class="sponsor-entry">
-	  <div class="panel panel-default panel-sponsor">
-	    <div class="panel-body">
-	      <div class="sponsor-title">
-		<a href="http://www.rockwellcollins.com/">
-		  <img class="img-responsive" src="images/rockwell-collins-logo.png"/>
+	<div class="col">
+	  <div class="card h-100">
+	    <div class="card-body d-flex flex-column">
+	      <div class="ratio ratio-21x9">
+		<a class="d-flex align-items-center justify-content-center" href="http://www.rockwellcollins.com/">
+		  <img class="mw-100 mh-100" src="images/rockwell-collins-logo.png"/>
 		</a>
 	      </div>
-	      <div class="sponsor-body">
+	      <div class="mt-3">
 		<a href="http://www.rockwellcollins.com">Rockwell
 		Collins</a> sponsored the ELCE 2018 Buildroot
 		Developers meeting by funding the social Saturday
@@ -388,15 +390,15 @@
 	  </div>
 	</div>
 
-	<div class="sponsor-entry">
-	  <div class="panel panel-default panel-sponsor">
-	    <div class="panel-body">
-	      <div class="sponsor-title">
-		<a href="http://www.scaleway.com">
-		  <img class="img-responsive" src="images/scaleway-logo.png"/>
+	<div class="col">
+	  <div class="card h-100">
+	    <div class="card-body d-flex flex-column">
+	      <div class="ratio ratio-21x9">
+		<a class="d-flex align-items-center justify-content-center" href="http://www.scaleway.com">
+		  <img class="mw-100 mh-100" src="images/scaleway-logo.png"/>
 		</a>
 	      </div>
-	      <div class="sponsor-body">
+	      <div class="mt-3">
 		<a href="https://www.scaleway.com/">Scaleway</a>
 		sponsored the complete logistics to organize our Buildroot
 		Hackathon in Paris in March 2018: meeting room, Internet
@@ -406,14 +408,15 @@
 	  </div>
 	</div>
 
-	<div class="sponsor-entry">
-	  <div class="panel panel-default panel-sponsor">
-	    <div class="panel-body">
-	      <div class="sponsor-title">
-		<p><a href="http://www.imgtec.com/">
-		    <img class="img-responsive" src="images/imgtec-logo.png"/></a></p>
-	      </div>
-	      <div class="sponsor-body">
+	<div class="col">
+	  <div class="card h-100">
+	    <div class="card-body d-flex flex-column">
+	      <div class="ratio ratio-21x9">
+	        <a class="d-flex align-items-center justify-content-center" href="http://www.imgtec.com/">
+	          <img class="mw-100 mh-100" src="images/imgtec-logo.png"/>
+	        </a>
+	      </div>
+	      <div class="mt-3">
 		<a href="http://www.imgtec.com/">Imagination Technologies</a>
 		sponsored the meeting room and dinner of the ELCE 2013
 		Developer Days in Edinburgh, UK.
@@ -422,14 +425,15 @@
 	  </div>
 	</div>
 
-	<div class="sponsor-entry">
-	  <div class="panel panel-default panel-sponsor">
-	    <div class="panel-body">
-	      <div class="sponsor-title">
-		<p><a href="http://circuitco.com/">
-		    <img class="img-responsive" src="images/circuitco-logo.png"/></a></p>
-	      </div>
-	      <div class="sponsor-body">
+	<div class="col">
+	  <div class="card h-100">
+	    <div class="card-body d-flex flex-column">
+	      <div class="ratio ratio-21x9">
+	        <a class="d-flex align-items-center justify-content-center" href="http://circuitco.com/">
+	          <img class="mw-100 mh-100" src="images/circuitco-logo.png"/>
+	        </a>
+	      </div>
+	      <div class="mt-3">
 		<p><a href="http://circuitco.com/">CircuitCo</a> sponsored
 		  several development boards for the Google Summer of Code
 		  2013 project on Buildroot.</p>
@@ -438,14 +442,15 @@
 	  </div>
 	</div>
 
-	<div class="sponsor-entry">
-	  <div class="panel panel-default panel-sponsor">
-	    <div class="panel-body">
-	      <div class="sponsor-title">
-		<p><a href="http://boundarydevices.com/">
-		    <img class="img-responsive" src="images/boundary-devices-logo.png"/></a></p>
-	      </div>
-	      <div class="sponsor-body">
+	<div class="col">
+	  <div class="card h-100">
+	    <div class="card-body d-flex flex-column">
+	      <div class="ratio ratio-21x9">
+	        <a class="d-flex align-items-center justify-content-center" href="http://boundarydevices.com/">
+	          <img class="mw-100 mh-100" src="images/boundary-devices-logo.png"/>
+	        </a>
+	      </div>
+	      <div class="mt-3">
 		<p><a href="http://boundarydevices.com/">BoundaryDevices</a>
 		  sponsored an i.MX6 development board for the Google Summer of
 		  Code 2013 project on Buildroot.</p>
@@ -454,14 +459,15 @@
 	  </div>
 	</div>
 
-	<div class="sponsor-entry">
-	  <div class="panel panel-default panel-sponsor">
-	    <div class="panel-body">
-	      <div class="sponsor-title">
-		<p><a href="http://www.fluendo.com/">
-		    <img class="img-responsive" src="images/fluendo-logo.png"/></a></p>
-	      </div>
-	      <div class="sponsor-body">
+	<div class="col">
+	  <div class="card h-100">
+	    <div class="card-body d-flex flex-column">
+	      <div class="ratio ratio-21x9">
+	        <a class="d-flex align-items-center justify-content-center" href="http://www.fluendo.com/">
+	          <img class="mw-100 mh-100" src="images/fluendo-logo.png"/>
+	        </a>
+	      </div>
+	      <div class="mt-3">
 		<p><a href="http://www.fluendo.com/">Fluendo</a> sponsored the
 		  meeting room for the ELCE 2012 Developer Days in Barcelona
 		  Spain.</p>
@@ -470,14 +476,15 @@
 	  </div>
 	</div>
 
-	<div class="sponsor-entry">
-	  <div class="panel panel-default panel-sponsor">
-	    <div class="panel-body">
-	      <div class="sponsor-title">
-		<p><a href="http://www.synopsys.com">
-		    <img class="img-responsive" src="images/synopsys-logo.png"/></a></p>
-	      </div>
-	      <div class="sponsor-body">
+	<div class="col">
+	  <div class="card h-100">
+	    <div class="card-body d-flex flex-column">
+	      <div class="ratio ratio-21x9">
+	        <a class="d-flex align-items-center justify-content-center" href="http://www.synopsys.com">
+	          <img class="mw-100 mh-100" src="images/synopsys-logo.png"/>
+	        </a>
+	      </div>
+	      <div class="mt-3">
 		<p><a href="http://www.synopsys.com">Synopsys</a> sponsored the
 		  dinner for the ELCE 2012 Developer Days in Barcelona, Spain.</p>
 	      </div>
@@ -485,14 +492,15 @@
 	  </div>
 	</div>
 
-	<div class="sponsor-entry">
-	  <div class="panel panel-default panel-sponsor">
-	    <div class="panel-body">
-	      <div class="sponsor-title">
-		<p><a href="http://www.calao-systems.com/">
-		    <img class="img-responsive" src="images/calao-logo.png"/></a></p>
-	      </div>
-	      <div class="sponsor-body">
+	<div class="col">
+	  <div class="card h-100">
+	    <div class="card-body d-flex flex-column">
+	      <div class="ratio ratio-21x9">
+	        <a class="d-flex align-items-center justify-content-center" href="http://www.calao-systems.com/">
+	          <img class="mw-100 mh-100" src="images/calao-logo.png"/>
+	        </a>
+	      </div>
+	      <div class="mt-3">
 		<p><a href="http://www.calao-systems.com/">Calao Systems</a>
 		  provided a meeting room for the ELCE 2009 Developer Days
 		  in Grenoble, France.</p>
@@ -501,15 +509,15 @@
 	  </div>
 	</div>
 
-	<div class="sponsor-entry">
-	  <div class="panel panel-default panel-sponsor">
-	    <div class="panel-body">
-	      <div class="sponsor-title">
-		<a href="https://www.tap2open.com">
-		  <img class="img-responsive" src="images/tap2open-logo.png"/>
+	<div class="col">
+	  <div class="card h-100">
+	    <div class="card-body d-flex flex-column">
+	      <div class="ratio ratio-21x9">
+		<a class="d-flex align-items-center justify-content-center" href="https://www.tap2open.com">
+		  <img class="mw-100 mh-100" src="images/tap2open-logo.png"/>
 		</a>
 	      </div>
-	      <div class="sponsor-body">
+	      <div class="mt-3">
 	        <a href="https://www.tap2open.com">Tap2Open</a>
 	        financially sponsored the <a href="/association.html">Buildroot Association</a>
 	        in 2020 and 2023.</div>
diff --git a/docs/website/support.html b/docs/website/support.html
index f4eaa8fdbd..8d5f096bac 100644
--- a/docs/website/support.html
+++ b/docs/website/support.html
@@ -1,22 +1,22 @@
 <!--#include file="header.html" -->
 
 <div class="container">
-<div class="row nh">
-<div class="col-lg-10 col-lg-offset-1 col-md-12 col-sm-12 col-xs-12">
+<div class="row my-4">
+<div class="col-lg-10 offset-lg-1 col-md-12 col-sm-12 col-12">
 
-  <div class="panel panel-primary">
-    <div class="panel-heading">Support</div>
-    <div class="panel-body">
+  <div class="card mb-4">
+    <div class="card-header text-bg-primary rounded-top">Support</div>
+    <div class="card-body">
       <p>You can get support for Buildroot through three main channels:</p>
 
       <div class="row">
 	<div class="col-sm-12">
-	  <div class="panel panel-primary">
-	    <div class="panel-heading">IRC</div>
-	    <div class="panel-body">
+	  <div class="card mb-4">
+	    <div class="card-header text-bg-primary rounded-top">IRC</div>
+	    <div class="card-body">
 	      <div class="row">
 		<div class="col-sm-1">
-		  <img class="img-responsive" src="images/irc.png" style="max-width:50px; margin-bottom:10px;">
+		  <img class="img-fluid" src="images/irc.png" style="max-width:50px; margin-bottom:10px;">
 		</div>
 		<div class="col-sm-11">
 		  <p>The Buildroot IRC channel is <a href="irc://irc.oftc.net/#buildroot">
@@ -39,12 +39,12 @@
 	</div>
 
 	<div class="col-sm-12">
-	  <div class="panel panel-primary">
-	    <div class="panel-heading">Mailing List Information</div>
-	    <div class="panel-body">
+	  <div class="card mb-4">
+	    <div class="card-header text-bg-primary rounded-top">Mailing List Information</div>
+	    <div class="card-body">
 	      <div class="row">
 		<div class="col-sm-1">
-		  <img class="img-responsive" src="images/email.png" style="max-width:50px; margin-bottom:10px;">
+		  <img class="img-fluid" src="images/email.png" style="max-width:50px; margin-bottom:10px;">
 		</div>
 		<div class="col-sm-11">
 		  <p>The mailing list is for discussion and
@@ -56,14 +56,14 @@
 		    from <a href="https://lists.buildroot.org/pipermail/buildroot/">Mailman</a>
 		    and <a href="https://lore.kernel.org/buildroot/">lore.kernel.org</a>.
 
-		  <h4>Search the List Archives</h4>
+		  <h4 class="text-body-secondary">Search the List Archives</h4>
 		  <p>Please search the mailing list archives before asking questions on the mailing
 		    list, since there is a good chance someone else has asked the same question
 		    before.</p>
 
 		  <form method="get" action="https://lore.kernel.org/buildroot/">
-		    <input type="text" name="q">
-		    <button type="submit" class="btn btn-default">Submit</button>
+		    <input class="form-control d-inline-block w-auto" type="text" name="q">
+		    <button type="submit" class="btn btn-secondary">Submit</button>
 		  </form>
 		</div>
 	      </div>
@@ -72,12 +72,12 @@
 	</div>
 
 	<div class="col-sm-12">
-	  <div class="panel panel-primary">
-	    <div class="panel-heading">Bug Tracker</div>
-	    <div class="panel-body">
+	  <div class="card mb-4">
+	    <div class="card-header text-bg-primary rounded-top">Bug Tracker</div>
+	    <div class="card-body">
 	      <div class="row">
 		<div class="col-sm-1">
-		  <img class="img-responsive" src="images/bug-buddy.png" style="max-width:50px; margin-bottom:10px;">
+		  <img class="img-fluid" src="images/bug-buddy.png" style="max-width:50px; margin-bottom:10px;">
 		</div>
 		<div class="col-sm-11">
 		  <p>If you think you found a bug in Buildroot, you can use the
@@ -94,9 +94,9 @@
     </div>
   </div>
 
-  <div class="panel panel-primary">
-    <div class="panel-heading">Commercial support</div>
-    <div class="panel-body">
+  <div class="card mb-4">
+    <div class="card-header text-bg-primary rounded-top">Commercial support</div>
+    <div class="card-body">
       <p>In addition, the following companies are able to provide commercial
 	 support. Only companies heavily involved in Buildroot maintenance and
 	 community are listed here.</p>
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
