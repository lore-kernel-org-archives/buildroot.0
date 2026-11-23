Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9B2606A321
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 20:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Gv9lpIV2;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qNxlQq4J
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 814E680E38;
	Mon, 23 Nov 2026 20:55:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 25xiT3ETpUt9; Mon, 23 Nov 2026 20:55:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B12B080DC5
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795467331;
	b=l/OZDBjbNw+ToabPNhB/Z83zJy6jEbfADbgJ0SHnKSoB/La5W1d2biFO3ATldO29Q4lB
	 6gEHwzV5VeLHNaNrDA2si40jAA8Ukd0FW+M1tKLctYIAwBana03TDlaqLgrvAEUt3k04u
	 xsTQ8FHn+xCE364Ml4WIjQWRSgi5hKMEOAhboVJowiJkS09jK1tbRGeBwv9YhPFCiXefm
	 UbzxxVswb0EkHrNibJhtMVPnu1az1Cuik8f6dVCBiJs7YTjbdnStkAT1aK6aKlJt2+ZAJ
	 cUE1c/URGvPuUlzSK5hCGl26Pp23IvTvZ3JmWLxgecTvFnKPch9X44rEQpxUC8BCPPQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795467331;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=BMmRoBmr2tTAAYfNTuWP3g6c3P0d0SO/hWHXUaI6x+o=;
	b=S3uJPCmKHH9hwf6legBC3vxOT3bkXcIxa10LtQFM1VrEvEMsU5X2k+jvP6W0Ybls85rI
	 j0wYpmmH6+jHLW1sbbj1s4QCQRpsHUW+imyzKma1x7icB6NbXfBN63iqJcMO7Tl+gNtzo
	 ccoTKXdPXC7jlZc78UfTxku2cQM90RE5pMyZqfJaKqE8/IUqDH65kkVYvZ1Tiy0HuQmRn
	 yW3jIt/vjx1/Y3WHlyO91/Cv5+3MOJrNzwWk2+WNWK2P2oFonwQ8k7F1eeibLJDHqv5oB
	 81Tz94HtZCCDx9y45YFblr76RXebjS8/u8U8FZRHSp2giPNP9ivTQ5TdrCTLQpXNdTw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qNxlQq4J;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795467331;
	bh=BMmRoBmr2tTAAYfNTuWP3g6c3P0d0SO/hWHXUaI6x+o=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gv9lpIV2OzFCPWCD8g5ydm/uo21YRLyRXJcHWWYV10vRNgyktXGiokm1FM3IHxCWG
	 PPT0LfDupCGL79KgJlXGl+jxXk6C8sUsQRBVP0XNEByzMYL5C3eIbnKt1Ke2fLtgzg
	 euNXypgMjtCRM7NBp2wO7zm0epihzyfe3SqXhLDfPtttflRBfazfOVdaGy3aVfwNjI
	 AhRtr067xrJzA5v+Wo90HwzaxujuE76Lb63h8cHgHtIJF93SJSmVqIXjA14FHa3gEz
	 HzRFsJGO4JKC01u2TY0abnkiYxpluoEfNOBBePTjEliysWJ6lXCttUzK9u//K15uae
	 rbPownN7sBB3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B12B080DC5;
	Mon, 23 Nov 2026 20:55:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D0F45311
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 20:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B741480DC5
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 20:55:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G2uqCGfXOxYo for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 20:55:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B9E6180D8A
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::434"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=qNxlQq4J
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B9E6180D8A
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 20:55:26 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-48e3b22e971so1983376f8f.0
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 12:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795467324; x=1796072124; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=tsnlADF1XDRMIkUeZPvizj5YUSJKB+MkvjuXEmDtvds=;
 b=qNxlQq4JBcX0eg8pPO5MsnWgp23ZS3A8asVZHCI8Sf0kmqa7dbjNuixNEcvx/PsAxT
 No7sEQ1EIdRI+I96XP9rR2//Wz95HUKJDfwKu+QMNpxb/fpwR7V9M4mekjrS5NZpodIE
 68RGxkGIwkVLblo1kVrg2I6A/hputltGkfeeqIR7Ik9tz4cbBOAjlGT1HjnlRi8tV6wR
 tlEe7FhPkI9lDK73MGGlVM2vwUuHK3j3Og9cyIDLdoElx/6CCSB7eveh40JeX0eihxZL
 JFVJ+hMxctBiyG93w1SmtZeivGTNXmxLUh6ZBpVQvfk4x+miLntfs0fLFvDNtR3zBI3M
 dE1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795467324; x=1796072124;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=tsnlADF1XDRMIkUeZPvizj5YUSJKB+MkvjuXEmDtvds=;
 b=ukmfObEVszaXO74P3K79OccnlLeuDnM3z3kiJGoWeEffDz4MXtEHxBu+c8DupU+WCx
 eAu6xYp/6sM669WUhTqLvc8n7iI9tW0YrkfbfmNy1evL2BwkH0UNxdOByAJFjZEO7f9O
 82eh/xIYPsepmQFxlFUmCGm7kZkqm3sunAg8+Kj7ALjR1PM63gy/EwZLz/dJpAQlnLKw
 2ewuESfH4mlPpRP1pfUGcHh+UjCLftQfDXOSqXsZrPdcwo76uq5NF2mGOnU8dcQall3U
 0cPi0NyhFVgnYeUD84J0zoTrI8dHBPnD/jTtjmdcjQXzFcEgB3lVvCvNzHsu9a/upuE0
 +52Q==
X-Gm-Message-State: APuU4Z8BgqEt+OBhL0H4GIXsOLUG2v/w++OM0Rr/fwydeNqwdED3KCrm
 8hPJ69gW5DxtKkvwdTrhvpiUPjwH85aecQPKsb6ZPqp+ldTVaR+lxtPIj3Kkz5Xs
X-Gm-Gg: AZFdTZcdkeFhpBE3PiFcGo0ONizrz8aBysJYvZRfLaj8Y072xJKNUuuJ8h0eljAzx73
 WmnDjx7moALFReX8m6EsTait5VVvt8HxxTMrEqX0vql07VOyJRp3Dx/B0Kxo+souFt/8j0OVDda
 eI6KYd4h1slB0bEI6vGGHk9OmnpzOPTV1LWcy2/izkhRCjOOkG7gMjpAZJ/wl07GhaRHRti5zuh
 /sTtaaJiliUJurECYVY9tNgY3Eaklqn4jQskKrDhsBSd258JgNPor2LjtZtke3dNF6/j8I1Yjux
 uPD5tbGuf9oV6/H3pWJvLCT1OqtPwXDIzuEyuckhQKRCNBijvERFQpJFP04ZTqf+8La/wSYootw
 mtn+Q+dX1rpz/AeFBS3K26U/0OHo+BqMgtb3jiy7Hb+FVqCrkU3B+6c+KDZwHjhdrSPqMPeCsvF
 U0mmbpe47mumL1UAAbyNco9MPx5I/iCmUAhLQ1GLwqYCBS8VpzTTdCyHdro704IOWCNDsnxagl1
 tk+F7xqD3eXhIlsUnVJZke8wfLDmpwaBqtNSV1jPOCi2YUv9YvWq+AHLyPFSxPzHCjm6tLSG5sG
 R2m06/wzwUUvTX8LTagoJck4gsj3jYZ5rmUAAk196WnfAjHw3yk=
X-Received: by 2002:adf:fdc8:0:b0:4a3:abd0:89ef with SMTP id
 ffacd0b85a97d-4abb400ad9emr18260451f8f.46.1795467324476; 
 Mon, 23 Nov 2026 12:55:24 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab69bf685asm23611512f8f.20.2026.11.23.12.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2026 12:55:24 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>
Date: Mon, 23 Nov 2026 21:55:20 +0100
Message-ID: <20261123205520.3702760-3-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123205520.3702760-1-angelo.compagnucci@gmail.com>
References: <20261123205520.3702760-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] DEVELOPERS: add myself for libp11 and
 p11-kit
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1d2960f9b3..cfa11baae2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -241,12 +241,14 @@ F:	package/jq/
 F:	package/libapparmor/
 F:	package/libb64/
 F:	package/libdill/
+F:	package/libp11/
 F:	package/mender/
 F:	package/mender-artifact/
 F:	package/mono/
 F:	package/mono-gtksharp3/
 F:	package/monolite/
 F:	package/openjpeg/
+F:	package/p11-kit/
 F:	package/python-can/
 F:	package/python-minimalmodbus/
 F:	package/python-pillow/
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
