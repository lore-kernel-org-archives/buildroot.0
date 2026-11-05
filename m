Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7760606A326
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 10:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hyS2Y0CB;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u7mJ068X
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF82440867;
	Thu,  5 Nov 2026 10:25:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pQDzecqsNuE2; Thu,  5 Nov 2026 10:25:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CB7314084F
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793874306;
	b=JW+2vKCz+ezitInA7N5wLqg7pQU/BjB6fFG+d4XwHUf685lbGJ390GiGCeLNfQd6YAuj
	 zXG5J9sL2nhyOR4blvtkhvkC9xQyM+ynwr+XlFCaNTSwjOmRYhWYUh/fyVkkSsYPwuiYT
	 XnRpxidAbWpeStHnEdtLs3EYGebjkvJvyikETG8SozS9LVAz1A2JREepsnOFkdb9sqyPR
	 /RztQzqUB/YgpnMPQaTmnGYvw9rXHU7nb+pOvivYI1ZSOiwnpjtqpM/rciGXYxbONrq3X
	 jC/tYfBCTn/njxcIY8gOmT2yL09OhSegZd6Yy0/ipwgMu5pPv8p+/62WbvgiLBsbuoA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793874306;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=u096jaUUnqVI36ieV5+64DE6vRz8UcwXBf+ahxr5yQk=;
	b=Sa+f4J2oYkIB4IR9s5is1qmeBbRsnVGPB/Yr+TFy57WBlInPKU/XXcjuXv1pHdjaGEh3
	 ZYJSzFuKgaGKWQfvyo4srjbqpJM80d1hPbvAbeK6WAteYVT85492oB4xQWIydMnKVFUp6
	 hWIszvaiL2fHXqRLb9EbGiHZkZCfmzKhenYOaV+pUnfu1is1RC3jLTzsUHesI4hjDmOT1
	 hwbo/6DZ+AjZ4Zp+lG4ezbP09KeI51mEAAhO0AbT0U516FJ+EqdGubgSwzI+voWs1HcKM
	 NgEsCNuGuOQquzCq+rHLGqvWW8rzqwoSUaW04Lgy+wbEpJiSJIHXV/PiA9NuZPihGUw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u7mJ068X;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793874306;
	bh=u096jaUUnqVI36ieV5+64DE6vRz8UcwXBf+ahxr5yQk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hyS2Y0CBN0LmW2VQoDLcf0pM5zbLL+PFGW9XaqZKTs86CTiqBYduD26sX7YjBLAja
	 dIWWt98xBTerq+10IfIg71uN0TqQ5VeZspzxQEY5p8NF/YTkXsP3zYobFt02Ya8VbU
	 IWuoM9vKtBbHhNQlUqoc1eoAIWmA9YUfl+NchZM699a/lSO/HeelGF1N5udkbFhIi0
	 JN4rNtoSbqex3SHPEqhstfFbDxzx9uI7bxumAG7vZ69VRmxjQh6rIoF23erj0l4gJO
	 vwgcVgWchwxTfRaMVy6NvByWpKJvbg9/Ag/MycwzEf24yOWVqshnKFWI6kZ5RqcD5C
	 WGq8D5+6Q5mJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB7314084F;
	Thu,  5 Nov 2026 10:25:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 01C3A177B
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 10:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E73764085D
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 10:25:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0qjKvZs1fA0k for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 10:25:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D19E14084E
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=u7mJ068X
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D19E14084E
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 10:25:02 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-48e4831c028so1528739f8f.0
 for <buildroot@buildroot.org>; Thu, 05 Nov 2026 02:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793874301; x=1794479101; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=7zlcwFo0VooHau/gApMA0BRAcwxmb+DoMRx1VbFPF1I=;
 b=u7mJ068X66sOOEnTN81N095Y1KjXSMkvDsKSeTAU2EhnjBJUaxeHplCpONZm2cHDIk
 GIL/S/TX5GqjIY2LjwkPD8+zqgL/dcStVndwLkTlaCKUssvrSZIUzESp0X/5SNqUTPFE
 xu8V4S8T/JMhI3aVn+Y2OiFnwewuNqjS4H58GAEAIwOkKtgk8fqgql3qimw2zmCTbM1T
 QIdC4T7GYjTZOqDIRfbdnHzsgu0Uj0UPgw8/f3ZM4i2OWXOVTLC5BRGhKj4Pcs9CALdi
 gFOdVvbkHVJ3KTflcUHXBnoIhMg2uk+8lclYrpZlaZpJh7Vy/l5Kd9MmFA+WoXsHtq6Q
 r6Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793874301; x=1794479101;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=7zlcwFo0VooHau/gApMA0BRAcwxmb+DoMRx1VbFPF1I=;
 b=DEBwV0Yt413L9IlJ0XKF1+8v2s8CMysoIGfzFdPUg6wiGo75nIh4fyq09K6ape/e6x
 cnRF5pCshaNzuu9C43+kKms+gRMpOUseVIe+omqsAZAxwF8nECO3AomS6K1ioLrhPPz3
 jeMY/0/Ta01/4gsxJRFFpvkAtA+bW6nuJdWt2lPaXbwxA9tKHHbX0Yhw3XMu5hHKHkoi
 lMQR4zRw1xOWvOA3lT+CEv68Nii67Hd6c+PC1rsej76MaPttULQokPobAuCG65J5vAc7
 6oN2/9SBL/MKkPi+gCqCwPxeHNTGl9CN8+sIXXioEdfAwN4EFZkDvr2q6FArMnLzhIYF
 X6GQ==
X-Gm-Message-State: APuU4Z8NnLgjJaMjSe5odYQOx65Q9B7cF1d7Myc1pp62+6y8vAQmuLSX
 nQsNq+YLXBoniaYIrMZOspjiKA0q2CRbr11kuvvk9R2Sh4c74YpXflJcGU3qjw==
X-Gm-Gg: AYBFou2G3noYzXcHG2pLMmh5pZUQYV2gpBFx24lus+aZ7cWEiZtM5MfrFh//WMdPF97
 c+Q9uu1vICExjxqecjgcBvsSmbRKPwhKkQ4079bPV9Pg9IOgB7i8ImWCqJVpp7B98591DOS1xs8
 6nKGY3thJjDK3alMy1ZdKrr2HhDndrzA48Rdy0FE7iVVlcWs+aMSVbXFLOhEVK0PPcbPuAnAEhU
 yA6j2MqAaMU9q6jqRYEHLP2g0C6ZtUwzGf2iUYXAJ26wN4IJQ9iwfje7XSiIY/li9aJ7TIuptfe
 DZw5Q56r2iCn/9uaq2D7X6uLucINYGH1PZmhDH/ZE5/sa7utC3f6u8EUcLwW5VfQGBpsstvJGXI
 zsEnL2UnK0T2UW6quofmwIUDR+2BNTQR/fKQ5ZoNFWC7RpnRaYyrEmc3/aig1DEZFpnyzS582v5
 kPnQhxiPNKncPB1erNucXIXLPoGWb1DOkQ86JNFVzizf5C2nRJCGxTzkhMkajLAXL9/g1Uj/bHX
 TENChTi87/otqCSVCrPFN2tbEJCvY75d3b25m2SoTrpmK9/RfJEdVoBb/k7aK02O5uFTeC9a3q8
 FiH7LayP6pkb9YvqdnD2ebm6MX7Q1txdYgnuWHOOmKnPlAgRPcitEeA=
X-Received: by 2002:a05:600c:46ce:b0:4a1:f625:2108 with SMTP id
 5b1f17b1804b1-4ac18a88820mr414011545e9.33.1793874300699; 
 Thu, 05 Nov 2026 02:25:00 -0800 (PST)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b4104d600fsm115558385e9.0.2026.11.05.02.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 02:25:00 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu,  5 Nov 2026 11:24:56 +0100
Message-Id: <20261105102458.1795886-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/3] website/download: complete the git clone
 box
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
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The copy button has rounded corners on its outer side only, as the
end of a box, but the git clone command next to it has no background
and no border: the box looks cut where the command starts.

Give the command a gray background and rounded corners on its outer
side, so that it closes the box together with the button, and some
padding so that the text does not touch the edge. Move the shadow from
the button to the whole box, so that the two parts share one outline.

Without its own shadow the button looks small next to the command, so
make it wider and its icon bigger.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 docs/website/download.html | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index 2482c0a26a..0928982e8e 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -140,11 +140,11 @@
 
       <p>To grab a copy of the repository use</p>
 
-      <div class="input-group">
-	<span class="form-control text-truncate" id="giturl">git clone https://gitlab.com/buildroot.org/buildroot.git</span>
-	<button class="btn btn-secondary" type="button" data-clipboard-target="#giturl"
+      <div class="input-group rounded shadow-sm">
+	<span class="form-control text-truncate bg-body-secondary rounded-start ps-3" id="giturl">git clone https://gitlab.com/buildroot.org/buildroot.git</span>
+	<button class="btn btn-secondary shadow-none px-4" type="button" data-clipboard-target="#giturl"
 		data-bs-toggle="tooltip" data-bs-placement="bottom" data-bs-trigger="manual" data-bs-title="Copied!">
-	  <img class="clippy" src="images/clippy.svg" alt="Copy to clipboard" width="13">
+	  <img class="clippy" src="images/clippy.svg" alt="Copy to clipboard" width="20">
 	</button>
       </div><br>
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
