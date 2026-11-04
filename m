Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070126078C42
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 21:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ODhtgmei;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uMWsaw3d
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7AB2408B7;
	Wed,  4 Nov 2026 21:00:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aWyV27lhsQNK; Wed,  4 Nov 2026 21:00:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 033914089A
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793826027;
	b=EigePSMCp7cRSf+hunzKEPSmKOputARaM18C6ASRb7xBeZbqEbHKnEaLlU7TpywYhQt5
	 URRHuxTh54OmZh2AcDF6wEdAnra3Uqn3Nz9FL+FH3X+Std5Vg1dfxg9RqUcJowe69E+nD
	 z0F8OG97Ol/ppx/tNcKrAn1iBr80zQTVDO/ln8bAvbcMD7i/ZVwrpnvYrkHhlPn3HSrXi
	 q/bv+5fatQR69uE/Vqpa4PUQFBYgMYBSjL6CakvHUHz0XtlcVGefWHW4UO2nuGWe5GJaz
	 YcWsyt765wThc886RCzLjyiJVFQOl2PqEHf/kvZdg4FyEaW113P5C0BvV6HOO42lmZg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793826027;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=hxO4adK9SsAzJP6I8eHGBvvoE3oPil4rCEg1FNaWo+I=;
	b=Pfp8QxXDaum6A7c8vaF9cv5a3oLU1eMd2a3e0Z/1w+3DaabSjGQgLka7WcH2CBo9GCln
	 f9VgnLNzawgV4UTQK2dYKbUhfghZEqHMIXRL20mTx8yhbC21SaV2GwoHZsuJCW984UbIA
	 JCKNl7W+vu8YwJxTUk2xQuxAHyMlHkGmePzsbHwfPICpV844u8KA4RADdNYBacl6NFv4q
	 ljKyGVQ52qSxwZpkETqZSPdLyFN7Ofl1ObYnQvsRbDpaImk4WevWPEazb7O5IkJ1Cam9M
	 7oCqQbiAaJjkN9LKcrqg+OxdccYyWoZerTQiP3ii2XQUJjBP52V4Hz85AIMeLk8BW6Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793826027;
	bh=hxO4adK9SsAzJP6I8eHGBvvoE3oPil4rCEg1FNaWo+I=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ODhtgmeibmfj0ZidG5BOEbcZC4MpBRJK9OR+ca02cuxyM5FjPgqrRwS3gPE1Zl2GA
	 bDA21GeP6ESiK/16YDvFnuZuufsFN0zhkwrLcBLmMki9OKt8/HIJBOF6s6pmpTfr4V
	 qUgnXt5bRvVivOEQjZw4E2Fusj7JUtUJavD+GoTrOOPuWb7oF97zZ1YR3QkrlMyZyU
	 8QUeUbfRbkUWXsAqd6xwaQgNK1//0ERQuoPfiX9RpLBVauVlwo1KhkIMYzOxQsgwgt
	 MAGGQ2GioPSgXdNgIUmUrTp6zzQWvEMB+jkuTR58U4RjuQGWNYQTKzowAxAfY6+wtc
	 12J3EFhcqlNSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 033914089A;
	Wed,  4 Nov 2026 21:00:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 07A4131F
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1A1E607B4
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:00:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U8ReUDv_pO42 for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 21:00:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 16D84605C9
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::433"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=uMWsaw3d
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 16D84605C9
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:00:24 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-48df4e9d2d4so761753f8f.3
 for <buildroot@buildroot.org>; Wed, 04 Nov 2026 13:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793826022; x=1794430822; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=abymMUF0yGpjsqk+h651H0tsNoPudNoLG8SzqIaTlF0=;
 b=uMWsaw3dxLb1BW6Y6R3myMHcyUXMmL6bAYdTv7KFPVCm7cSthxl1UuLp1KyX6sfKDT
 /jNmu4S+2dCe8lNxLMRbJAa8mTd4KjF1++I1vW0Vjaw9qC4DMa3SqFdTyuDWY5PLFrGy
 nZGxXuVAVJ9/CmyoH9+yVQXnjF4rRjVIbXubcKILun888F8B7kLBzX+c5dGs3oSM4JHT
 g2ug8JY4bcVOGcrFTCWt/uCt9lzpVu4QPq1o+CgH+isT4CvbnJp1jhsGmH1oVZIAR1/T
 sWC++6FAeSJow0VRVxabppS88wFIJuA8q7Tsjp5cCWNtvkPjfz8nrIkughpyc2u4trY5
 zShA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793826022; x=1794430822;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=abymMUF0yGpjsqk+h651H0tsNoPudNoLG8SzqIaTlF0=;
 b=bAL018X/PTvkTXEEBuqzv9S+ofa5s/NjTO/BxEqaGIfb9n8cSzGGbDd1eH9uPFaw/9
 GpNV6RYNfpEauU3uscLRLxURfNRzvWxLoM0X5nok4jIzxxpzt+QHgRcpn4XPHD62CFPI
 M4QpnE63V79D0StUo8ahY2BLh0shunlkIX6cInw9dsYbuWOOZTW7MLCMGrdclGiopgmX
 +fgpEQncWssGhJ0xprEYKLmu4XolAouRCaQB9J+HLQ4tytMxQup7BQ1wOZacFEI6lYus
 hZZi/U7kckq6Y0EydSkC6ia3FCvjAGchrGF+sVUmSF2T0mY1ixS1U+/9aUSz8JQaXHmv
 mKvQ==
X-Gm-Message-State: APuU4Z8AowFaBs1v2MLMjl/IP9WZUgwAHYW63NyF88RQpDFFUK4LikOZ
 VnIOMmlQU5zCPju3z6tE+7wsclqM1pQTyUPMa51zm+g2MgZ7i13Xou2nLCqJyw==
X-Gm-Gg: AYBFou0PTqHJYdbVvBRPe+EnasUg84S8yob0/X58u0zMsEukeZ0RCbOAebDAaERZadf
 5K4wfViSPQlqYEvT8pAhgIg6kEosTFJtGVagms6ss6//BBePfH1GDr05eBn+UNIGtdyTdSEsWyR
 rNjDNcGSFQkh4yWSbsjPUgx094+Fg+MrzsLD+kGtX8fD24gQwZfUzkV2Ae8f4N+oE02sOvJFG88
 HML4T4typdX7lCpbxZOg1/KschHSh60j8HbQsUXyPRoAyLDxoQBDbcnP1I2Pe3/D9mN3Z7oS95Z
 jwrwLogWhkLDCg8JE4VCIsUVcCEOReVbJza3mmdlMIowGDqgvnO2DMOizPGmvLTDzC5Vah55zYt
 EPxpu973WJdOgvfwPBdMCGJ0tyJqK5IsQpf5ZImnv+ByvcCxUMRb65MXF3f4514rIRcG1vG2VrU
 F6bL2TlD1bpsT4M1vkrsZtv+rK5JjVKdFoGIi3zd+ZHpCWxpjbBl5Z77rva0jnykZZafUAP/+lo
 RLP7y6GVsvXD6LI3q0MUKVQ6EszJ/P5T16y8FfDINnyuVofkVNnVjSD8HMjQLMVvfpem1hsJQX6
 uBGn2q7UGJXr9gPqPrw/DnBB+fkBPIuHkFGnEdZLZfpUObK4R3wV8w==
X-Received: by 2002:a05:6000:2002:b0:48e:5eac:7e48 with SMTP id
 ffacd0b85a97d-48e6e2f692emr35767060f8f.22.1793826021992; 
 Wed, 04 Nov 2026 13:00:21 -0800 (PST)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48fec8d8734sm6100414f8f.20.2026.11.04.13.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 13:00:20 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed,  4 Nov 2026 22:00:11 +0100
Message-Id: <20261104210019.3509258-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/8] website: follow-up fixes
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

Hello,

a few fixes for the website, after the Bootstrap 5 rework was merged.

The download table and the git clone box now fit on phones, the
navigation bar is wider than the page and its menu is bigger, and the
homepage hero is laid out on the grid.

The CSS and JS URLs now carry a version: browsers that cached the old
buildroot.js showed empty recent commits and discussions boxes until a
forced reload.

Two patches fix the HTML errors left in the news and LTS pages, and
the last one adds me to DEVELOPERS for the website.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Angelo Compagnucci (8):
  website/download: make the table responsive
  website: rework the navigation bar
  website/index: align the hero on the grid
  website: version the CSS and JS URLs
  website/download: fix the git clone box on phones
  website/news: fix an unbalanced paragraph
  website: escape the bare ampersands
  DEVELOPERS: add Angelo Compagnucci for the website

 DEVELOPERS                 |  1 +
 docs/website/css/main.css  |  4 ++--
 docs/website/download.html | 25 +++++++++++++------------
 docs/website/footer.html   |  2 +-
 docs/website/header.html   | 28 ++++++++++++----------------
 docs/website/index.html    | 12 ++++++------
 docs/website/lts.html      |  8 ++++----
 docs/website/news.html     |  9 ++++-----
 8 files changed, 43 insertions(+), 46 deletions(-)

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
