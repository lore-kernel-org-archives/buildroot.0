Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25D6606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 10:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=g/AlZQeH
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0880406E0;
	Tue, 27 Oct 2026 10:12:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L4KjUDaANGMD; Tue, 27 Oct 2026 10:12:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CDC0C406B3
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793095963;
	b=So46B3mekZjmrKanGpW+7+F0uzQ2+18Vg46JOrWUiF6sGvXrOAB8wAjdTQtFsUDWMPaK
	 V+8wpL+wHOmtQRbOJajQi6brTHUXGrD+vFuHMDCM5dJNxUw1vsa6cKKY+cspoaPa4hAte
	 SBVmNTCzDGifCN8rzyaboCrH8Sr21pvlDhiGR/RdXWXYTx6GFo7jZzZVDvuoIB5mQx7QG
	 2iPg9mFtXKB0+juzLaLeHhuDKUOCB/Tt0/IyOb0QO253JmD8aCz56E2mqN2YNDAdW2ZtK
	 cZjk1kk9aZt9UyS88ACbfXikYh0WlShaZKevHeVeUSOrvWW33WtMq97wkmqaEe5Lndg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793095963;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=cRAmKYX1pCdb+zIwPMHjYtvYtlJLg+3ZAAxp/TxmfGo=;
	b=Y50XsWhP/7wl7gSbbUn18hNvoJK0XMqOaCcKwM8iXiiuE98pSZeuYz9ThN8oStoCNuVo
	 iR6rWFcQHPlWu/qFEb/KSajdt9SllnCQxmCWiTXghtur49UDW8dRm3vUg/ddSEDBTdqz9
	 JPewRO3FN3tgRC5LUYOUlmcesw3MahALBa2n76CPQ66NkBM14BL0IF1kvc93GujnsXYWl
	 PXlyc4Q+duNRbuMFv3eWSKud+KYFCVDXR53uiafXr0q2X36aXRdYnOfQoP08Z3ycSRlGL
	 JLacJS2rm5Yj6xSiM7pzBzTwcNKS9em86LWK49aeXFugoD/jvAR28bx5u2fZnGCsU8g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793095963;
	bh=cRAmKYX1pCdb+zIwPMHjYtvYtlJLg+3ZAAxp/TxmfGo=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=g/AlZQeHe1ZGELXwGnOt20HlpCnqc0v1ufO8O8tnCi0b/guzDK6bjgUJRjoO0QQ8d
	 PRQ1BabWWJLmLQwk7uN+2wBdSj3rjG72kTYhe2LDsfqW4DDRPlUNq4Qv/PKSKtOs0o
	 GjjNkFVWcqcSyfSBmLxpjrio2us2Jc9OEK4UGzdr+3AEy09MIGzMvFslxS1E4zr+0A
	 WDTxK+Nw0B6Dd1gh5DzB6uuoObU2xrKQLJnW24Ldne9ZbSkBhcREjpHlOg5ySzq5F2
	 9UkODbIXQSK4PRcIIatpv2zTFPA6b+BNVexGqlBG/C7iXIYLN84ON3QCwoZj/kxc5Y
	 e85rhWuW9hgYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDC0C406B3;
	Tue, 27 Oct 2026 10:12:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 786631DE
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 10:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A02F60748
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 10:12:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6NAQeF4b-xh5 for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 10:12:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1F83160708
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793095961;
 b=N5HiMNsWcvhObI2yccaeFvMN9aUm4YPNa+V+13AZmYxU+lWEeIxazmi+/DOGkxaA5nlf
 Ec6yNN5TKi1km1wmPuonmton8Xzc0xtCT3uEl3S0IS02y/tvbUDyN7HYT/q9TfLekSIXC
 c2frjDFzl7fZLWJGzS4Q+o1jWkP05W9fYMDmCWpEdIv8wRw/80rxfuFTlr+T57yhSUD3s
 tin+l1h8fEIVwX7dgmBgHN/6Y0EAX70opTixAV3ANU107gPJDNztIG5ZTLZU+1DDvuvF4
 7MVxaE9KxGX+khbLqISh8FfTonvqBV78L9fSsUAi9cBz0ypnRIy7QEmlaZKnmGNwUrw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793095961;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=bfVI2fsCbhtBpg0O1JBjvlRIImJQfHkYYmsy1tjL76E=;
 b=g0XX1n/UyAxMcv+2aSzqU0VdzMUkaVp0KxO71/ltXaY3Z55Pp4Euf0RYfQuz20GmAgwd
 F2BRE7I+Kw0d84HhsA9krEL75av4u7RlxsGrTy3UKuGJ8PsOdeiwI3mI1Ay080oeeKHSK
 6olf1UVK+/N56fl1beT2KcCWNbwiGqLPKgg/3jaHD6TS6riZM5qUEaKBUXZ80Ugm2leQQ
 LtPYXedW3jBqEceMMyZmJ0nT408PFVO3WZUy0n2GaDkDZ53GKS/K6ulELiJMZPQiaCc3R
 2X/5L5O3RiRZ4pmu8bOzW0o3kUaBszN30U/VoOg9nERlPduhiIs5+hwNb58eckcKKhw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Lo8wFtky; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1F83160708
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 10:12:40 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-48e1d0e5dafso518200f8f.1
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 03:12:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793095958; x=1793700758;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bfVI2fsCbhtBpg0O1JBjvlRIImJQfHkYYmsy1tjL76E=;
 b=WMXdVLkTNmoXAPBXs7ZML1M3/B/SNGSSPva7YOmubACeqYvl7TiImGXwqIlEEBSA9e
 O/JgNPSJKgWcyChkC/luGjUMB66pKSxPzkojECmw62vGk004aejEhoUpupxlbUPT1dTp
 9Da2jF7YdYeQE9FR/i17hgZX0vGA1latEF3xImWTRec5dUyUCmTSqNBpPxuaOvZO2uy1
 PAgiLNd0czghkxT82gFckYtsadMWUXvrq5InI7VXOjR8IqhUzeqUdSAtkVMaeXge/uC/
 yp/86gRVLiuHqAEQ+pT+cc/z70uOd+URG7k3X6bbJjHpmwWFyeQ0BUORxE2PgzFRxbpt
 f0eg==
X-Gm-Message-State: AFq9FYJTSqw/ZCF1FIc27vCRRuCBk6Pf7nDB2tDBwQSdbauUriNpPn4j
 VbsRwpg/vmgeQ2D7rUxK86LniTqRHYdL1vAPZJNkREBW8gOb1CJ3zDJS+8K1Y2/B/mSHCYGkENX
 XMw0A
X-Gm-Gg: AYBFou1cYuEpH4L2FRJbbn8p6mzegsNk6MbIOKPAfayVntDelKgvmnY2fi7uAbPmW/A
 zkgMxs81x0hz0c+xH5BLBjhLVLOmXCUE4x8K7Nogw7ffSORSROVYmY5z7L31Bm3Gxi34efiylgB
 UbvT9FsAIk30KCT8VokIAdHAYu29x8Z57FKb8qO+gYxmgKlgGpq+01evAtxos+JWPAzBo0lNiKa
 U89bY0aAz8MjDgmKlpYd61uzWOHT17E5YSCKOB1v86LpkiOhShwke59NzNleG2LnAt51EGP/5nq
 a4DAyuQ8/dNHVtuYSHdB11jMa8YiH0Tti3GBFExe/mPvuVCQ9wJQXchhkeoPKv5/MpfctaLRRGA
 lvQDlfPkhzsQlnTW6EPAAnRaKBiPo+NVGXlSRZjjYdZtKNBjhnN1rn5QsDZal3didCPh2dwQNoF
 n+OKOpoyL8ORjBtrvUE56r07TKU8VdEgRRDd9RobDUO33lWaw/9ldYy11JnnFz0CCEjJkjfPqxH
 hiU5/XIaZQRoDhIv4B63btO9ge28WSTp24OyF5wKYHrsd6lVIiExQUie8QamyL7lmMpFU2Io+XT
 pyvzddFVge+PQ+mKzAuPUPYUOGgtP1VN
X-Received: by 2002:a05:600c:1d05:b0:49e:65f2:db64 with SMTP id
 5b1f17b1804b1-4a7c0485179mr43053365e9.5.1793095957738; 
 Tue, 27 Oct 2026 03:12:37 -0700 (PDT)
Received: from dragon.home (154.186-200-80.adsl-dyn.isp.belgacom.be.
 [80.200.186.154]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a35a30e22csm257745585e9.2.2026.10.27.03.12.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 03:12:37 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 27 Oct 2026 11:12:35 +0100
Message-ID: <20261027101235.2876416-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/mender-update-modules: fix LICENSE
 hash
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The SHA256 sum of the LICENSE file was incorrect, leading to a failure
when running `make mender-update-modules-legal-info`. This seems to be
the case since the introduction of mender-update-modules in Buildroot:
the license file hasn't been updated upstream for more than 7y [1], and
the buildroot package was introduced in May 2025 as Buildroot commit
a474642fdcd8 ("package/mender-update-modules: new package").

[1] https://github.com/mendersoftware/mender-update-modules/commits/master/LICENSE

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
Changes v1->v2: indicate commit introducing the breakage
---
 package/mender-update-modules/mender-update-modules.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mender-update-modules/mender-update-modules.hash b/package/mender-update-modules/mender-update-modules.hash
index ec879f46a1..f6de69c42c 100644
--- a/package/mender-update-modules/mender-update-modules.hash
+++ b/package/mender-update-modules/mender-update-modules.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  4846f39abc254ad2ae2a9f3d5479b064bc1bae5034b9d276ebdb09d8c60f4541  mender-update-modules-d8c4683e6660af6c65069e10ee4b8ee50ec1af46.tar.gz
-sha256  d0f406b04e7901e6b4076bdf5fd20f9d7f04fc41681069fd8954413ac6295688  LICENSE
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
