Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B6D606A330
	for <buildroot@archiver.kernel.org>; Tue, 24 Nov 2026 12:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qeECIJg8;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=QYJrrdvg
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB435405DC;
	Tue, 24 Nov 2026 12:04:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TVfLpjEPy_Ld; Tue, 24 Nov 2026 12:04:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8A8D240603
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795521892;
	b=fIjurO9qx+pcwPFBxwJ7JHgD8lVoS6wMb6lFqlGT8PDLLPllL0JnHXrlKM70TRyq6SBw
	 WZL0t7mPx0GO3Cy9+tvEFO98mO3GkAV3QwLBbuE+7VYp31RoPzQgOLbXV+M0NVlydhWO3
	 FTbvMduYtsrIZuw9FjesrIxL52rP9N/63neQooa2V4qKmV+wXFWqueU9vd2iLtxxXhRvu
	 zVP4XnGhetbMNoskVnrmkkGhbjzf/8CS3pje5zNCA1kU2GV4S+nCrn8iNUnjwHwUg6o2E
	 SUItC/NAqwiol5t1MBkIGx2fCfUd2ptGXi05ft1qiTFm1xJu8nZzaeZdRRXZ3P6GadA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795521892;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=vzUk0RnZuX8q4ZI47805oLDXf3eflGKw2KVW7ID8u80=;
	b=WkLx8r/axkfVgOB1FmyvRpwv8Dr3okledU6oQ2JHU53Zscclitohl+wSEeAbX+/qlEn/
	 Rj79yXItUQXKUSW9qB09uVkk2AU7saiZmcgUu0Pq3Hi4FwUo+cA4aQnbp7HGnJ1LmSIvo
	 HejF2z58XxQomV6FSzriJE0oDIiXO8RDcc5PU6AGRkS1bwbF3XWA+77bJ9y42ItQLo+ft
	 WAKAdQhXHxnFttN3DnafU+tv0k0DDc8udo7ww6HEWXslM61Aij/J0dDLPkozcE7YNc2gB
	 c1SCGOBIEqP1RXbOyUbn+O1KGk/bcGuGWJgcu6jY+bWh260Uwk7gNlzyYNcsG3hA17w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795521892;
	bh=vzUk0RnZuX8q4ZI47805oLDXf3eflGKw2KVW7ID8u80=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qeECIJg8NwYhwNjtI4RfGoHdHffTF5qPMwt8THgQWKNjcCoqUsrZtZ42n90Vx5U7y
	 0A28t/xDjXOaQ/jsKAdOXvEEgUiAg72jeQmeV5kTY6lyCJR0j6KACyhzMhTcn0F2x4
	 55+A412IGQmtxktUuiMzmN5BVQshCQ16tWiPZaznSbw8BVbt2K0RQ0Y9bquIFAC9Ym
	 mif0v26jomUpYLq4XyvG3+/xvnXzRDZW/E//RDjy+T80vO3REgkbWcv4p1qud7Uzg4
	 +h0bUCEXM22un1yWmQnD1/gKXYBKk2nIj2GjRPbattIA97efnKxWUV1mCZkjL5lKtg
	 mNbiYr+VLzNTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A8D240603;
	Tue, 24 Nov 2026 12:04:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 125E479D
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 12:04:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0255280F7C
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 12:04:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ACNc5yk7JLda for <buildroot@buildroot.org>;
 Tue, 24 Nov 2026 12:04:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E687080F68
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::532"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=QYJrrdvg
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E687080F68
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 12:04:48 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-6b86bbbe954so682671a12.0
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 04:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1795521886; x=1796126686;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qO3ZaNXW+QkRR35sxBfGqNTNCGFIFeTtpnjOZzw219U=;
 b=QYJrrdvgKKcJ/CStDQ6Rz2cdZpgtimuViHcLABCy7r1d8AMV7j70+iqMcZ8qgJnaVT
 rtY1CvovZ5HMADA1bmKZ+ajygFslPq6Omh/1bFr6OAGqm9QazRRlangTsL5iZ3O5+zF3
 hukRy58Ucv6V8yWN3sFFzDCYOVI72PW9urs0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795521886; x=1796126686;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=qO3ZaNXW+QkRR35sxBfGqNTNCGFIFeTtpnjOZzw219U=;
 b=iI+LcU8K2ZSdDSgysLGKWzimtQsvflON4P/LVAf8dNg9bSrNs39yEZ+tWigk0v5V6Y
 RZ7KSj3kuBUYMVR2aNeZ1QrgdWv//QZ3k0JGxYBHp4EUbPAHTMuUFeOYbzXtLMosanQA
 11URYQRV+IY76fM/CKPZFadS0iv3WvAyFR+/yoldqABI6ejdk0WCd4WSvtAKNS2qGGo1
 LxWMmo09rGARFNz1rMwdtEPRdJUKv1KsYVPRT94ex64hNAinWd9aZX3W4WJ6jClXpXya
 GW0cA/ibHa83A4UH27gyxW6cIiVSyc3rcRT7ECf1HZUUm1+XsGuxMC5VU+LZ/SZehT8f
 dm8g==
X-Gm-Message-State: APuU4Z8wIBLv4O/qvRbfPOOT1DtCRC/qSl7PlAvW2lqVk/+TwrIs8nag
 wo7R0ILaGWzOYY3FU5ALi7YqFcfC38hk9eiVtb7J/xWGicaknVHFCCi9TfQdTu+S8ZLpVXCp4GN
 OY4/aKMY=
X-Gm-Gg: AZFdTZcbMZTFOQeKrqnNC+1sc+xHVNyk7bpFpa5qmHhCwM9fUJmi6P5POtkh2Tj3o+r
 +i1L5lAqtLCxVsGNx2AOvwRc9tyW4KLwZ/59gDzNAmAxjDJIXejQEHm2cX0ktg6+fpG+RL7ALuP
 /aw8MhNY69cJ7W9g49DfS29H8Mh/OVb+u1xQ5MpX4TFxR0MW7f71gul0sFZjSFEKx3LM3adNfbg
 P5v9XcltrWAG9oUCVg6abAZ9763JtCCwLKsYIloOjj8nUAi+zsOR0Bps2sjLwB3IbwK+SoWNCW+
 dw2xhlVaEjsXdi7Qgk2dKx2vN7rDiUe7zRWQteHUEex2DX+ZsUScKHRgOy2q0gEAiIqoT429IzB
 I0uJ9lwuJdGCuEK657UxvEwSpEdrgCGdhRwNKvsulJHXhhRkFFhd0L/hjOIJYCNjPd54tsjl1dl
 bcRd4XfE7tXuDLLcQ2w/8Xa1zSqku9bBhr4Q94SU7Yw8iRBnX58suc87Qf0iqBeZer/vvNAzr9j
 rnlO32e06e3AqkxAd9ZRpO82r+1w8/SlfU05kgv4F4C9aNuiLMgbeiVsymxovQT4mpfSNc2G0lT
 IGiEOjSSmdPykfxVudOpm7jLR1izf4717q5CHp5YHrd476OgPpEcViQR8aPvtRqVedxKGnWswCq
 hC1BriH8+AqfvmOxvLRxa5SnN37L3eo8YyV5l3GCqPRg+3u7TKWduDfq+rjS+lFM5Acg1g7OvFJ
 1IvMVn1Pq/H/CzXCUY+J6TGllmUaXZqUc2ViwyyWMpK1ekUPYBwVrlSZnLr5XOKcx/IUaBXscnr
 ppxy3HGiL7hToZjl7v/yg==
X-Received: by 2002:a17:906:a11a:b0:c42:e6c8:e45a with SMTP id
 a640c23a62f3a-c513a5f7605mr1071864166b.3.1795521886513; 
 Tue, 24 Nov 2026 04:04:46 -0800 (PST)
Received: from adam-linux.amarulasolutions.com
 (2001-1c00-8181-e800-dc0e-c162-ac5f-4bbe.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8181:e800:dc0e:c162:ac5f:4bbe])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c513ae67bd3sm499466766b.27.2026.11.24.04.04.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2026 04:04:46 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Nov 2026 13:04:36 +0100
Message-ID: <20261124120443.1909297-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124120443.1909297-1-adam.duskett@amarulasolutions.com>
References: <20261124120443.1909297-1-adam.duskett@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/9] support/testing/tests/package/test_flutter:
 do not enable the service at boot
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

If the service file has an install section, then flutter-pi runs
automatically when the test qemu boots. Depending on how fast the first
frame is drawn, the test measures the same CRC over and over again because
nothing is moving on the screen, and thus, the CRC never changes.

The test starts and stops the service explicitly, so its safe to
drop the [Install] section in the flutter-markdown-example.service
file.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 .../usr/lib/systemd/system/flutter-markdown-example.service     | 2 --
 1 file changed, 2 deletions(-)

diff --git a/support/testing/tests/package/test_flutter/overlay/usr/lib/systemd/system/flutter-markdown-example.service b/support/testing/tests/package/test_flutter/overlay/usr/lib/systemd/system/flutter-markdown-example.service
index 2a64b88c2d..bbea02ab0d 100644
--- a/support/testing/tests/package/test_flutter/overlay/usr/lib/systemd/system/flutter-markdown-example.service
+++ b/support/testing/tests/package/test_flutter/overlay/usr/lib/systemd/system/flutter-markdown-example.service
@@ -7,5 +7,3 @@ ExecStart=/usr/bin/flutter-pi --release /usr/share/flutter/flutter_markdown_exam
 Restart=always
 KillMode=process
 
-[Install]
-WantedBy=multi-user.target
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
