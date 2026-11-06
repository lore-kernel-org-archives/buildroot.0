Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32369606D82C
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 11:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=QaYdMy7Y;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=znUF2WnN
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD4E14057D;
	Fri,  6 Nov 2026 11:16:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N09vov1PZUvo; Fri,  6 Nov 2026 11:16:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EEA3C4055C
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793963772;
	b=Acf72DPQRWWi3qadybqKXLVYEBziqDyka79QeAekBxSEfHBBXfFnwpqDTa7GyqgSZUMm
	 vG5f2ZNToAJZ1CcB71fpr4Fmqz8Vb83DUszxrlK5WTBCs5iq+DWf6VkCSIuGv3yYImTb0
	 uzBWFmfKZrUFmC5acdmrnjzzUqkLG1R/5mA/JUmjhiW0TapmItZHCm1b6c6+CGTkc6q/A
	 oBCspVIhsgrXj++KKYHyzY+MvYw58UwYDD7A/wblwAXOptLkJN/6vY+kh0pjg07r2oDs9
	 7DsjY7ogCfna0BHhO9eZs0GCU5GtT38KIb74fEcVSbnnl4KgHE24WsGne+KDp4v7YEA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793963772;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=ALWGXhE0ubWUgjmGSCfbtRa90Nip9YaKZHVUC4Y6gfs=;
	b=PXWSODA4I9MZgz3OQyAZkI9Qoiwd0on1Y1Pa1RkI4oY4ZoyX3nNlCafN/7aw5SC/VBEm
	 vK3FUgHSjkE447R1PylLDQg2yoXTXnPaADHXrJPUpvN0CtwZjNSAps5ypXoxm1bNXfQh2
	 29k0UMZOO/fhroMUpWJbvodHR1ngtqA0N91SazpMk3fvbaJNWzbh0urN5xyyFE44pweBo
	 x4K9Ujg28qMrmmUHEUh/+HKuvqpkUzEmT1Mr4ICC7e85Av4WS0OrnZ8wD+eqFMF2gWEzo
	 ksqkTUNHL+jNHclVR/WfNs57CGrTykT5PDZb+ZNYk12tCVOrLSGNZJtGlptwprFKiRg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=znUF2WnN;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793963772;
	bh=ALWGXhE0ubWUgjmGSCfbtRa90Nip9YaKZHVUC4Y6gfs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=QaYdMy7YUfa5XJDeJi1un1IosAeyDaIUt51/jdgiqX9GLETMLyNSFtF5WMf49PKSQ
	 BuxtmZ4XiYKRcy2GEyRKMMzjfirNpLloxo7woExy/YI32UZ+im/L6ztQaREXnr934v
	 3DmUQ6l2HpEbbjPymZKorkimi9hVeKSTr+ohUPofl95MOn1L2WoebP+Pke4yYkltW5
	 6ymDMIvbh08ZFac2PNBat54d1o2/OMc9RgUstp3pdNM0Jh3JfVVSXYpzaRWgkySsW0
	 Cuc0o0bIByJpiAZrpqEwFc+h6WBp00lqCRZGrCb71jEKfLiApyUJRxQR3EV3Qxj+me
	 yl0gcYnLo0fOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEA3C4055C;
	Fri,  6 Nov 2026 11:16:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F82B362
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 11:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90B694055C
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 11:16:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xNzf3rY8x0Pr for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 11:16:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5B3C74055A
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::430"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=znUF2WnN
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B3C74055A
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 11:16:08 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-48e4831c028so506803f8f.0
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 03:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793963766; x=1794568566; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=i2gJeE/NdMlovfFpjBP060MjH04iFU8idSNumM/pt8g=;
 b=znUF2WnNP+YjR6IkmmyajCy0YJlYfQ3qgZLxUFMgypfxGJJB4i0uEQdfKg2XxAjNL+
 P+MOhVIzZSsDGEjxMf9ZOsZeMAlac3gcbSElD2CGXtFX0EYi7ylMeuWGOXcH8g57IotN
 +crQVAOhCNVn5PggMPP9B1p1eehCBbUk695gWkCLeIIDPH4mN9dpYFsagiaNWuRBG2wo
 TiMjLhAsEPHqby25Ql5pTo/WHcmmFtTWsXZE7Twy3wZJoabmzy0Sqena34U2Wxx92Zjk
 Dxrt5hNYS/W3ZMpG9m5DKgIk+xRbVeob+cP30pVpdz22EMCjD8/w7VdaDLuPw8ZFnETT
 BZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793963766; x=1794568566;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=i2gJeE/NdMlovfFpjBP060MjH04iFU8idSNumM/pt8g=;
 b=C7Nlm1fRnrQJXtUYZiHxHwgLcRktueH43vtJUL2G4ON3fvkD3HwO8O3vIaw6V+bHwi
 +ay9K2rrQzx90eYKLgmoSmWTEtNnkW3to9oYqRVp8ymARxjRhhFm9VDMBXscwEyotqYv
 xZLB5qHAJe2rvJQSI0muT2U8v4Ty1v+uRXbA4OFgqiqQq3X1rvlEmaop8f3BBvOh9kjy
 876l/HRC0nUgsbRQl0//SeiaoCnITaUmjUemTfiQOi2PF/DtK0Gk0K7ReB0kseo1UdQn
 Lsm1DZ9Kb1/rvaixhfM1PdfrXfGLnolIxnqo8YfzA+2gGvMyImzU0X6k2iLYoU9Fb91i
 mYrg==
X-Gm-Message-State: APuU4Z941di8fWeaWXm98VtFsHa3+ovg+AiuscYqsBDxT153pWfOLM+8
 cg7KXRCvGl5k+EjcjCBiY+p8YFTY1qs455gbXU8SESuDlpN3dnGHT/mgswI0Yw==
X-Gm-Gg: AYBFou1BbBlQsnya+7ZKMc9IWApryB/FLrfzvCIbVLnQ910soXOR8KCQJy4LOq8GtaI
 UUKSZUtmlD3AcA8CblJUpyMeD0+q+XtRNiC16kA0bMjfDizvo02D/1/fVNr338WbLw1bQbJE3uh
 Y/LttJbdDVU4Rys3/WM7iLV9LYWC5ZLY0QoNvD7iF92B3adT3PIjd2VUW5b4P4Sb0ix1ctgw0gv
 rx5JscEB0TgSvEfZmPaAXBt11dVf37/juCrssgdF8mhlt0dcNzWn+IRpXgtIw+Gv3BtJjjcr/h7
 0tNaxZQn70OF0TezL09b85lOInkfRN3nwcIJnygMeYV3BZcqzihkZZ7ojl5HlrcZu42SqIBLr46
 hhExrLa5G4Au1PhyP10Ah1zkHlZIrT+SAB/BYnia87sfDidzelcZwFjTDb/tbrgO8CM0TGQrMw5
 lNLcPM4uYltvXXYD0pdPZWAjQGtWlQ8x5wdJSH1pYi7CNpHJWM+Qh8JQ+ZWN5FLfGGbYwYLzXrd
 Sg/Upt9yjLxpYQzon0fg/SR+Yq2ATMyuFuho174cRkYxI4Ug9XYkFQRg/nyB/8Pcjtrei2Be55n
 AZayEW8/RxjlHGduFxjSYf2EwZZNnjRqSMxJiQ8D7CpmCx63Ea1hvho=
X-Received: by 2002:a05:6000:4903:b0:491:6b1b:7f25 with SMTP id
 ffacd0b85a97d-49276d4e353mr4274395f8f.45.1793963766391; 
 Fri, 06 Nov 2026 03:16:06 -0800 (PST)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-492d7232832sm3080195f8f.25.2026.11.06.03.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 03:16:06 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 12:16:02 +0100
Message-Id: <20261106111604.1500074-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105175058.3132718-1-angelo.compagnucci@gmail.com>
References: <20261105175058.3132718-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 1/3] website/download: complete the git clone
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
Changes v3 -> v4:
  - none

Changes v2 -> v3:
  - none

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
