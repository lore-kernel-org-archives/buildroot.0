Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDF5606D801
	for <buildroot@archiver.kernel.org>; Mon,  9 Nov 2026 09:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=BV2t9Kys;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c95FJweC
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECA4B80F0E;
	Mon,  9 Nov 2026 09:40:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rDtPFCS43LbB; Mon,  9 Nov 2026 09:40:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0BEE880ED9
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794217248;
	b=cYosClBM5fSO8dTA/IdQPBF240Bwb5/FxZlyH0q5fbVI8maBP2znfknvkc5MnRut/R5Y
	 Bu2Yfva7vhFKRXQztOLR9gXlvyubWc3bZaVG4/l841YTZLwqxSQS1cbTTM246SagOx6Wf
	 NPa8li6OXSWqom1fpq+JZxEZQYUxzgO0CjS0OXDIT/MlQumnqXeHzW03OjMVmr4BsTTHD
	 MrUYlIGppE+/CV1CdPjdPatN5rsn+PYwPpaMeykQqutpCKdirxrfObXop/k++knzzHcOT
	 B1Of2EnB6Oa/TwmUD7sHkkUFQ16sDSMXGge/RYxms2V+IMdq08bNE76YqE9ryWbF8Sg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794217248;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=0HUVxZVp3heyY1UPPgj9ayoumdJLcLs+vrMiBLP7Ges=;
	b=BS8HSiw3uFrM9RWjAQSEhDTDoCvp5bZGMfS/aulpOATgctyXXd91gnMQHK6EwSL1JW0U
	 v5rChbxpRwdroKFbZ1e1IcLom4bl0rtXELI03tp2nE3A5W7/OUjNvipp8TjkKyEkBZpMy
	 CZs75YgfSY9cYpG3Twdf5sJSzKLGxRyYn5RkqRsnYU+1XcRPJpV+gOEG78jVCwHiZjQWE
	 OkVaY6croLgp4ll1IANEyhBvaX8qkT71YO/mpCpGjyyKbbVKSmcWZfAs+68Y8nLXB8Cse
	 HXyV8BVlQ2986RR3RU8QpTJ1+WYoojXSAs6bFxZwOrb2FeVBQwXReqiFMNhD8sbCN6w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794217248;
	bh=0HUVxZVp3heyY1UPPgj9ayoumdJLcLs+vrMiBLP7Ges=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BV2t9KysgBYKXhll+Hy+mNleTp5wqQrY29kv4zZNozgU9W/xUyo7QiK/P50a9cbnL
	 Dcy40HvGXQZ7Lid1iUDFIR6Jy7anYUZvtn+GD73MSRzHpbLck7deKZKgqk5ai0mAWE
	 Xp4lXq8ikjxHNoBM2umJuk1UF3SXNW5CPxEmpmama1R2DuEqm5CLUxv42J16B0Z9ng
	 /Zd2YN5EzScxJN6pJUNJMzl56XP1K0uLNao7NCh96lleaRiZEhwW+cGyZxqkILscwg
	 9rsWZ6ExeCx4Z7ALAEo6VraA6EETzs6tJmhfP5Trra1Fmb8XJoksZjmHrpTBjM6eZz
	 wV9pOf3vpxdoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BEE880ED9;
	Mon,  9 Nov 2026 09:40:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 02868361
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 09:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBCBC400CC
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 09:40:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OLTCVb8q6CFl for <buildroot@buildroot.org>;
 Mon,  9 Nov 2026 09:40:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org F1ADC400BE
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=c95FJweC
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F1ADC400BE
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 09:40:45 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4a215e64962so7320005e9.1
 for <buildroot@buildroot.org>; Mon, 09 Nov 2026 01:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794217243; x=1794822043; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=C+dtcn0IdYnSC0YsYCBAoLhT/7pNP6wWu+80obcQ+Mg=;
 b=c95FJweC0boTLMDQKMwxbkLym/P5VyPFgsLa6G/HNHZuRQhhmA83O64HWpWbqiunX+
 cZBRz30uDKsQZSA7tJNYPokj2GzdvM+WBKOxXlnqUEKV5kfDv+G1TqqXthexi8IsAUtB
 Mdk1kBq1lfUVUKjgNGGdS3uYnUGII4KAEWKADLCmyJ4CseHN5GuAI1pwg9xcy3TjEEft
 syMKCbTGEj6x0GYRrb+J2mketLap+Yw6qkm9edteSEra+xpdYXIW/+qpsoGCwmqfgQQ+
 +yfT4YaMf1D5AgRUQFM3lFNFplCuWg9EPKGj9vZVirqC0XRebFCmLvvcSmgKLl9biCPa
 B93A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794217243; x=1794822043;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=C+dtcn0IdYnSC0YsYCBAoLhT/7pNP6wWu+80obcQ+Mg=;
 b=0Wve47Ua5xfanntAeYZJDiReXYADJzj3DZ4QCADYOeGoZ4iu9AwO3ozINvlYo2WWaT
 mnuCHBk9jmTaOoCOACzcNjdTzpAxR0ZznwYWhexjs6vWn09Ex3bsZbAB2dyh7VauYiK/
 akFtIKk+lqb/RtC3EIjx7q3HZ9Rb7f2PVnD7g74pA1vODuecDXEUE+G9yH43ADwEowh+
 uYj3UipwNjzu9uthqxBjvW44bGC6xQJPjgmyWtE9WsdRTWcMscKEcAi7s9LtsoQ6Qg24
 WjJfKkDOXIIVsadu43wRHso68atvE1R86TjBvgfv+7YqrD2N8QQatYqGMmw7jhNCDU8z
 y6nQ==
X-Gm-Message-State: APuU4Z9afKZNXefwysVyTEsXY1I5G9CjO0Yy9HyMCS12VW8cWd1cnYlR
 gDID1CIvfllAF0nBfYPpTBDnmj71XNGGh09M5+eOTRYyaoEi+AlPLqaYTdsrcg==
X-Gm-Gg: AYBFou2lW3GE/+b4Hf/c1rXGx8ygMXUdXxymBakxGNqN0ocS4M93lJz/eqRLSkDrlfC
 q/VUzjaW3oboAbiyQa1x0DSRoZrmM6htWvbVBelQMqBEFAM/WXa62XEYe2ulbTZpx6Up64vwA73
 VlEWsw4X35NUuElLpl3GyHrGVtVgye+CJgZ9/m98tVFVRUxtlnG30UVRByM77RhsGd6R+Hy1fed
 nN+NKZWn71rlFV56nZWuLJPxg3bg9v3JbCOdD0Aw1+YYox00DzxWoKFciRAvhwXYLCWORNSOHLx
 bB4zEEjisEXkoua3o8j4mz3xulI6yX7cOS/mDVcWS9F2mBeGmeZWIrJbnvwnTOa6MyZCCGNKp+2
 Nw9eqrHbKkNZvAmK3io4iHbOqt4dTt8/eXctLFbYEuUFjpbxGpK6ZtDCWrS/05fKU9tn7KMEU5G
 8romGkLpqag0viOYEN5cMX5yNtKdQ68S4pddhPAp0FHNyu0vr+NajeUdLG2h1m3CZWbTQEu5TAz
 RVJjxoLc/UlY9pkOdwp+mHJK74gcEZT2ePrqXpSKjIa78FKVcQ9dLHTn/howJFyojdN89w/vOeV
 iloTajmJyxAXISJpc+5M+jcToivtEtwEOTfrzkMieTcxVsoJeN+1
X-Received: by 2002:a05:600c:1d29:b0:4a3:12fb:1ee7 with SMTP id
 5b1f17b1804b1-4b963c9789cmr74260405e9.25.1794217243232; 
 Mon, 09 Nov 2026 01:40:43 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b7da62edb4sm264992635e9.1.2026.11.09.01.40.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2026 01:40:41 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon,  9 Nov 2026 10:40:35 +0100
Message-ID: <20261109094035.3151751-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] DEVELOPERS: remove Angelo Compagnucci from
 mender
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

I no longer maintain the mender package.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index febf03773c..1d385c35a0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -241,7 +241,6 @@ F:	package/jq/
 F:	package/libapparmor/
 F:	package/libb64/
 F:	package/libdill/
-F:	package/mender/
 F:	package/mender-artifact/
 F:	package/mono/
 F:	package/mono-gtksharp3/
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
