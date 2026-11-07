Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA52606A33C
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 15:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RjB85KwZ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mH/TJlN8
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A0BA40758;
	Sat,  7 Nov 2026 15:26:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LfjHRuQIcB5e; Sat,  7 Nov 2026 15:26:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 99A8240735
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794065187;
	b=ZPQyKOFGn/XITq64aVYOBP/rTPp8RRhmL70b71Mpp+kpRI+hv16YiSpUPCOnIB3J5GSA
	 flWTmK5AEIzIyKAoyp5w0MCAB7iHC41Qa9VNIxW49asUutgqUFup8HEIk/Vwrcm9WE9GM
	 ijaTYDdJEgou8Vn0VIFbz9fyJxBgMcHjB0x/1w0+1JBQN28tZGVckF6xejV7aXt73459J
	 oDivnzLUMneSYGHkAk6Fi/ox+Xd/OZo4xzT9+4y1pxrRudotOHdNbOG9+MmnXrfeB50zh
	 eteqKdKN4wv50Za6wQA+h/GjMeFW37z8mqycBEAlSpewutAmvPVOFrK5fXLKxh2w4/g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794065187;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=2VQPzH3/3ubYdiKa3xYdM6DTQFpfIFMVWxJ0x1pbzOk=;
	b=L0Z84ENIu5MeG282+9mIahh5bs7fBFMBBy3fjgtEgrXomPfbIyeETP0XYUghUrh1fn7l
	 pQcCHVrG0unVEBY2UWTuRj/KoP7kWsfAXy/wNKKSSlECZFAcxYREA5kVHCSlDj99TiwiD
	 DEWR6SEhnbgcMeM+vbVVveKRcu5xeTsFQliThmYR9d4h+tYoF6OJnHXGzWhy0281vYCVG
	 O/Te3cxBG/EVSzsFvlugxFantY5tJTlLfKOBM/u8MpMpSdn9if2IqkTZPvIJOz/6wtWml
	 8tAycKq57OiVyflUlE+J5A7P8KrcSnzw7QPJD16vWwMcAkM8I8nTY8uVjFuPuMiMGtw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="mH/TJlN8";
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794065187;
	bh=2VQPzH3/3ubYdiKa3xYdM6DTQFpfIFMVWxJ0x1pbzOk=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RjB85KwZwAP5exKPF+k1gUOj59NxWvmFqti0tLV+JOgOxYF1RFol7rGzR/xjrQx4C
	 p88zcsE5jm5w0/rKWjAZrqglW1vmEKrvm9wXB1XMV5sbDbgredVBvgcaWAI01HHld5
	 sF/z51hMSliDqreQBufFujeL2gT3o+6Jsgbx+aNChd+EoI0qd7jPx/v1tVI3MPLxa3
	 Io+UzgTxkFPgHMGG+cK9soisGvMiChPZStrZalstrqaXHPc+F1MGXsOqzE3X3cCT/O
	 34hbNVen5gXjGrW12lZeVBxwprcii8GwXWXf0kIZbt8Y/nrxETeFaGI20Bx7ECkOZ8
	 IVtf2cVjBYmgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99A8240735;
	Sat,  7 Nov 2026 15:26:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 701A91E3
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 15:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 619F540735
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 15:26:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q5Ga9afa2v52 for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 15:26:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 37EC34071D
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::333"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=mH/TJlN8
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 37EC34071D
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 15:26:23 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-49d05d51553so9470895e9.2
 for <buildroot@buildroot.org>; Sat, 07 Nov 2026 07:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794065182; x=1794669982; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xKfy4x/lqb5J17Mgu2YKe/wl2wttVtJzijlozMnI2Z8=;
 b=mH/TJlN8SYBxci+plzE4wWzXXRbdey2LL6uK/GJaTbjwv3WJ5ezy1dz9TV7Pl28aU8
 90WcPkSt+VE5Bdf1kSRRnHBHZV8hXSFp8esAdEQOVjixra6O+/A7EccbkqETt0XCXuLa
 kgl+CJEWVpm8k1Tn4cRn13FuPDbJJYvpY0ADotIw+5lcWF9GQWs5Kdzjr2ZQrAalmgaD
 a4/cYl6EXtoRCgbHzNmT+XxQ1cLwwLSknLUE/tWop6YezCNlssOvLUeR+88Djl537R7H
 /hnEjpW/m5eIwvpUbqVBMqwjoEAiMGcMr14O9FVovMfpp5Sq6WzXZVIIHVSPJB0SY8cn
 1iXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794065182; x=1794669982;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=xKfy4x/lqb5J17Mgu2YKe/wl2wttVtJzijlozMnI2Z8=;
 b=dcr8BxmZBFI0zWqAz8rEkJqfqh4dKefftEDAAfJ30rRosb3hgWHczff2x4H/3PRWe+
 O9gVmCymz0j1s3CYw2PGL0twCH+Rz0Gk2oOMD43O3nRsbxgigceyawNgNk+QfjvrQArv
 LXI2rxiKIcro5eboYJqT41XI/hC0+QzwJbJwz6pi9loWD/9uZfXhwXByLRnbCZ3tbNl3
 srnp7U8RhS2F/DyuUXyY8IC+qG9icMYUEOB82voRYvVhmm2DEDRIoKcvL5xjJdFYqc4O
 C/RzP3n7YWLhD66HFWhjcj8gKQB0aYAUBX3lVs2G8FZ7lcypn+tN5xvc8SHPRKwv8MtD
 xREg==
X-Gm-Message-State: APuU4Z/UDlLM3YwcyU2c+UHXGhgpWxqn6WhUM7rctYWBWFbwiLaMuPxa
 WcyO8afeAH09+lQuzTMs0orwP3P74GJuCnfQiJYrRHxbt9uBEP8LooYpmLiM0A==
X-Gm-Gg: AYBFou2w+5FaLx+HfWomHKw7GmnlFxe8gtCirh8Do1legIPz9cdsfak3o6prqLcyBNq
 kzgl3tNnuyD8yKmC/M3Qwi9Uq5msvoU5IqdtsrxzoPBAsG9aHM0boSKGr/13SbH8mUsbrfEo9sQ
 lDsc0Q1YO9XihKFB+pPuKkTgTLmvHDcvCJOjpxhQ+71Me+YbqQvGIaSKbw5IMBFid7VuvB46KAe
 K9YQcPQUM0EZ09Eh+H6gSYZo5n22aFdrII+aAlEUmyxa3fWckc1dalEJXeF05mP2DYxRrV66QeN
 SP69+JX2RolUKHgnsMFGhVr7lzFa0crU7pMKRDIEHOH9NNwiXWF3Hxipispo4mMYW9aWsuPg2ND
 VZDxGjnLrfE/5j+J+3yE/jigG1pKdHVDFf248z5rcuXA82w18R1f57FXp9w35Rx4Nl6RU44swWS
 8lmiKrOPYhvyLrikQ2By22nX2za3N4H50uNWUd0nuA31yTkADG+9LVsVzjPnh8qCsRgpV5Ie0I9
 XBB2+5sBavB6alJCuvzaxsUbTUlUI0q44B2BhDjvdoNcXUzoL7qr7CwXqP78Y92S3U0Vqkusrzi
 tNu/jUxupF54sRtCc1LRfP1pv35rhEzbuzGu8uWwmdRxVyeek/Cs6q5p/xq1RxKsntbjdjETRw=
 =
X-Received: by 2002:a05:600c:a012:b0:4a2:526b:d3fd with SMTP id
 5b1f17b1804b1-4b6df5e9c8amr108687375e9.15.1794065181667; 
 Sat, 07 Nov 2026 07:26:21 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b7e2e9ad7esm78715795e9.1.2026.11.07.07.26.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Nov 2026 07:26:20 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat,  7 Nov 2026 16:26:16 +0100
Message-ID: <20261107152618.39702-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106111604.1500074-1-angelo.compagnucci@gmail.com>
References: <20261106111604.1500074-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5 1/3] website/download: complete the git clone
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
Changes v4 -> v5:
  - none

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
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
