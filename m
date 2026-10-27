Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B879606A31E
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 09:44:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0885960759;
	Tue, 27 Oct 2026 09:44:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MfgRAjo1GBp2; Tue, 27 Oct 2026 09:44:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 16192606A0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793094240;
	b=E4RX0YfO9IVQ0yJPZhb+kW7lxgDyEW4jdLzT5i1ACwMZh0W2fBRPhwUPaVkSDNU3phMT
	 lgLmn4v2OAY+yr4bASlTG45NNcvjkBcjEhvYUYOWuF0+X9aqa59EGkFkCLDQ1EJaLZc7D
	 RSlgzugbBkajED4FG68MrlT+IzUCE0YZOwVNy/Oti0QlArcuNY3lfsX+3jGbwWWOOmAlu
	 7daej5sDec/lQ/6u0C/uh1+pjAX1R4VAokMn6FuARzAsmzfV9QLRl6VfVyX5nYakUlo2H
	 tI8446la8y86WTRdtN19/25RMXz0wjN/ddv2HrYevxOG/dbRTap8fw4asHv1VXQtp8A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793094240;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=pwZhsvlbGanXwSqx1jXHiIh+oRunwPtlWnEK7Cq5pBI=;
	b=sfmigi7AU9Kwhv55iZ1Cq3PKpFZsq7XKza8GKtBQRVJkoBlrkYkp3YGyd93mQafc2yMj
	 n71TJhhZyGdJQ5YNqL1fVJwOtY9eH8SYVLgGxiQwj/fJQVoenqfMj8iVRZmRKio4HREkY
	 IAt117elfAkWZOL4NHWfPy0OPPdFiMInrOvZrjURfQz4QeFUX8DGceBT0msD+JsXAbps1
	 bS+dATUt799MrwCg+WlFhbHGNda+UwLao3pNV7ma/IPaulo8AiRnASKswd3Bd8A0DtP8P
	 piN00PA+BdIOPCb6xFNo6J6Jp+x9SL4dTYHEnLQPYE6taQR87uGyviFrLVb9AzsQVNg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793094240;
	bh=pwZhsvlbGanXwSqx1jXHiIh+oRunwPtlWnEK7Cq5pBI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=fGaYTtV3m3+Te4sCroG4pk5FpVHYYzSIhYVxxk1OoNEb5ypIwZ4Tx1PXmhqn5wY45
	 wd+s5x3Cvms2oQJ8ZjihGlG2hClEqE0BQtm2MeO+nb2QKzV8J1VgVvVsp3jIWTpC7U
	 jwv8Qs0Zv5tV0Ma+WN5GdrXgCqBWPORnEVewkjj4/hgmklsBs8lt3WtI4nJHjyji4K
	 mmD3Bm3xd/ZhBsjeI83I0iz5O8dUiDrf55YrKZnv2tIGepZ+MVXL4LH529SBFLVntG
	 KuX755UDKPQ2rv7gdv43vBXdhD3nnvH2w+mOfBS4QuguLIfpEJzP+UdbjKPI4VzcIq
	 q4KeDDVDrmg0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16192606A0;
	Tue, 27 Oct 2026 09:44:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 31F8172
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 09:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 17E1F606A0
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 09:43:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QMgYoR1G1_fF for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 09:43:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3DF4460687
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793094237;
 b=D4dzP82NjJewZsBckc0d9LG6/COkD38fBAU/oAkEA4Mc+2cgaKXXMdoA/R8eNGhzE4Cc
 tZI6sfA/ZEr/0dOw2QkQB+pYpkyBZhhagZF19T3gjV8gOv1U10mgGPxJ+cngqP+gtq7VW
 OfLny7xbKlcWTdKZU4279q/ziIHpb7jqicNNFyqzSXadnVVPE5XL9P6ntIbF/iPVdVCS3
 bMbWwaCmFpXLHifT+/ah3d/Zs0ekRucYDAYCi+h/hrXUPes+wSe7bPr5avUmfqX8FElQl
 SGzIUq/XDJyb2hQqyY+gsXbbsAvpa6gsK7aTR7Y4FxNzbdjEnkL0DIjDBQrgv6IM4Gw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793094237;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=+1fcH/wq0DnnmLL27urtVdPTQfn5gKKWWdM6OJR6xBQ=;
 b=Z6tRg+1icJGqscgQXHPegAKHmSV8abQgWNFfkPELUFwM8Yww6YHB6YGfthYT6QV0PX/c
 Axix7nPotS60ocAmKX19Bo9LLTzQNR+fhujOTnOKLrncr9JvORzcmlR0b0+4XCr15ZhVp
 MZAwtK4r54GR6P5efzKULxvLYd332KPPN2MLaXVN2nBNcBdwKfPeeQ7/mUytNoWQZvyLB
 ofLlbKHNernwK2nYTcvRJZgKr43CBw4Rse2K7E/DbZhTl/ucU5JMbFUgTkL8KLtJCwKkL
 TqcurJFR3XYRK8ujvpySWrC1utbhTPIVVC/c/ZWEfjcdR7gFdlJfRRHWNAmbvPEWHHQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=K5n+Fhep; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::330"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3DF4460687
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 09:43:55 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4a5087a5348so20898895e9.0
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 02:43:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793094233; x=1793699033;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+1fcH/wq0DnnmLL27urtVdPTQfn5gKKWWdM6OJR6xBQ=;
 b=yqp5oeddhWQiKr4k/lzsGbUl9b2LOIhUyGeA1Xs+QboQwqDpMmzmrBYyusaQH8oRM8
 eBoEVRtzksrz0sUiPukFxJa71VRxO9drs1RoDjFKrkFJTXoua+9WYh2S3/mP6mYCnOs6
 WELvhjH+HpOXe9uc+0HsrN+sprqFQqtxti1HBcwQ7zJuqtCp48bI62PBZ/nBUZJKHTG/
 ggW2wicrASC/3hQWjcWjkqK7guItdztaTooozR62M2n1LVbeuDfjudEnBdS0Epwm2TFm
 tr4PUbxi+pVcD5bwVHNPEZgwJbK4jVmKPz0teX4Vp3QzJ20AumrMHV5tkCx4jicdKItu
 Pp1g==
X-Gm-Message-State: AFq9FYKD349oImNwbS6wxziXVrUrZWJ4s7AHGEq3EjSNUjKRkNDEXuOw
 kMxdlkBSi1ca2gUdSvfPRW6TEGVrCkfEAUw+RKqZIKJZiv16inIyFp7mxW0GRev66KSw1QQfz2z
 znQQ6
X-Gm-Gg: AYBFou1EnBhl8v/9B/paZT04/jWRpu4m14YUfouKERjL89Y0RMPU8yvcSSSTWX4F6m6
 /bcDZBN5Rqj71nJeMMsQeg7x++NAPyHHZtiwfomY0xrfAu8n3AJ8teP34Ld8gdo9AytCVidLZv3
 opBMYom0AAC7RGGWMVtbYtibc2o/hqSG59Wt7W/Rz8v0JCHSR0BUYHaYtOzhLHcTZRNqSYUkV8x
 bnFGElAjYv4A7H9nBluB6KS+fA71VWXBINWd+keMdWZ4s72Ad/C/m7GyI+X/24Vn9VYBN1EI6SK
 GB4RyU3ZyaBQb5fQ24UvolPLkyEHSxYB8DfGQEeVbnSmH02B22Es1OaPrapmRlqurbhn/+hxFLf
 hMb1sMcL4n4vfSvhKIXNDQDt1t+wEFHQupx9pTb68w1NAZxLCo8QCvD3BEPhatJD/XZuuYp24Mc
 a6t47xzdzR6yMGmw707V3sD172PZbTHaQN8RydoYAxvdrujxZgDdzROJHdGXTtINBLEEfdyTBYI
 KP2eIJ/QehbrkX0TipTeC32JfVnp+fnGE/4Loa1k+0qk8d1XkrmGGK8VcOIoba7oQeMjaG/GJR4
 wIKWGj4dWSFD0C2/cz8=
X-Received: by 2002:a05:600c:620f:b0:4a2:677:ad8e with SMTP id
 5b1f17b1804b1-4a35acb9faamr163265665e9.34.1793094233197; 
 Tue, 27 Oct 2026 02:43:53 -0700 (PDT)
Received: from dragon.home (154.186-200-80.adsl-dyn.isp.belgacom.be.
 [80.200.186.154]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a35a04ad39sm663344695e9.1.2026.10.27.02.43.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 02:43:52 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 27 Oct 2026 10:43:31 +0100
Message-ID: <20261027094331.2867802-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for 2025.02.x] package/python3: security bump to
 v3.12.16
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
Cc: raphael.melotte@mind.be, James Hilliard <james.hilliard1@gmail.com>,
 thomas.perale@mind.be, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an expedited security release to address the compromised eMudhra
intermediate CA keys. These keys are now blocked by the ssl module as a
last resort against their use. Normal uses of pip, including to upgrade
pip itself, are now safe from attacks based on those compromised keys,
even if pip hasn't been updated yet.

This fixes the following vulnerabilities:
- CVE-2026-115557: Distrust compromised eMudhra intermediate CA keys
- CVE-2026-77214 CVE-2026-102633: Update bundled Expat to 2.9.0
- CVE-2024-3220: Don't read mimetypes.knownfiles by default on Windows
- CVE-2026-114583: Reject links replacing the destination in tarfile.tar_filter

See the release notes: https://www.python.org/downloads/release/python-31216/

(alternative to commit 3736eda341337a2ddd824111a5f065c84d44c584)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/python3/python3.hash | 4 ++--
 package/python3/python3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 7949607fb7..0f456ccf94 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,3 +1,3 @@
-# From https://www.python.org/downloads/release/python-31215/
-sha256  c2c4321961fab0fb999d66e0cecf521c2ab3994c7992873ea99e306c1094fd5a  Python-3.12.15.tar.xz
+# From https://www.python.org/downloads/release/python-31216/
+sha256  b5796915dc45ff745cfb4e990a7e7c93d6f546328a102ce31448d69ebc37575c  Python-3.12.16.tar.xz
 sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index a2371b1a92..ed49fd6bb3 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.12
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).15
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).16
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
