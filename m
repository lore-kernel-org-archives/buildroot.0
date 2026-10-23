Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9252F606A319
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 00:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kO9eaNPP;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YEvUT3c9
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6263C81295;
	Fri, 23 Oct 2026 00:11:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9xkL7e0gktbm; Fri, 23 Oct 2026 00:11:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6F5E180C25
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792714282;
	b=X2QSmse5d3RzyaDV0BBVjd4Cl4r/MbHQHTJxmDgrLHIkK8E3ulPLAxYlSzqxfcYwh5pU
	 f1Dq2O9HX6AKizaK5/D1otCf9K1mZBhm+7TDk2+LZ/uTvZApwh2gR+6apf70kbB5GLS/M
	 v626Oy5EZbXZWgsH0us0U7auXxe4EnT04Lllk4faS//SBX2tCCjjzTnGkDSVSfxha+lNs
	 sv8kXe7BEm9KZN2P2d94vFB1+9cfs6dn72o4sbBKaWedAOeW+llYW5ca8FvN++Z6RFrN7
	 x3n0m0Ba9O6f/95W4gSh9gaj9YNhoJ2P1cdTMnd3UT7aIbVtIF8Oon5DHfwn8Quvk1g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792714282;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=xWDOnz1r9xl8yFJHZtbrX/fPBlHr0IOIJCR2JrLJzTA=;
	b=ksRz1kYNfmslKWyyhgrO25OTTTyV3uTezdBM/Y3XxBjRDx12I2D3/I8IO5DskP0w8pDX
	 33bm7hfBAhGI99U8xpi9W9cH6D0YuoLFossni928d/7qxdajqguNOxAJbMN6srC7BpB+M
	 eU0R0HXke9ots4tNtPz1uqYtWLuaIgIgMFIOKlOVySlmHAAPt0M7LIdYapOeahthWl+6a
	 U/1DvDTdVPVWFJc7suqo7jEhXaPqD51SgmvGtr8wsPn7LJVeBN/8S+CZ5ZweyLuXQWvHJ
	 uclFpc7gXwd1StaPW4bQV1NqxUwu7/7F26m6tUhcuxudJ5c0kAOwvyQtH26BaPylogA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792714282;
	bh=xWDOnz1r9xl8yFJHZtbrX/fPBlHr0IOIJCR2JrLJzTA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kO9eaNPPQfnZUeD0g9vskNogpAVnXT734/fNE8cWvCuBwJpaZ+omdMsxbRP/bKniR
	 qmrFQTDPGtkpt/Uw//a3jDVaLx9eWrmKNYCuqC79Qf8RlSopt3E1rG+3128AQ1rSWn
	 PkozXDt01cDca/RT9rHYIfjltuXMmTltndyvraoqoDSug/Ts7HFKjqHr/crKjz/Uqd
	 XkDSKkwGDbX2gG81d1lnZS9ymQMrhpuoPNDobyMakY0MAugwamiz7Okm58cRcipW5K
	 mRbSrKU7ykHRmRSfuTc59Kty7daX/0QJ0O0QsLMJpYhCRC6pxOWkGm6gU1xKzLGRJg
	 8V4va2sr/jk6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F5E180C25;
	Fri, 23 Oct 2026 00:11:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B4CFB91C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 00:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A3157400D7
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 00:11:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c6goAaITKVyj for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 00:11:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org AEF47400AC
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c30"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792714280;
 b=cp9O3PrJnCh37P0iAZ2g3Ip9C7xtWW+F1wdC4Imn9NMp4uqwARvxHFKQMm2IIvq/LRxh
 ZDN48YbjodnefwG6vaX8gVJcgqJMq7dnOf+Cwe4AaTuc/gUujsolyyRbuNwFrFRZtYes1
 eGVfJpX5Z3XIy+j9uYvR3NCti+0XdZoK/e1o/sv3KFoH6xDOHAtTI5ELl/66LqZwFGrIH
 4zTPDIUcyqe0UocdS/50pSwCJ0K8Lh3xUkeqTamwRxCFteu1nlF2HAnVSdkI37wXew0Gl
 TNgo6Cnzs7m4pLWp4xePFTHFQasej//Zuf7EYoxC8mgFZktQl8N3j6a/oqZl7x7Gxyg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792714280;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=+hoUH9Zv+609Z17qmqZ/MugVByx4jbERDdtkWsF7CwQ=;
 b=P5SGrCWbd2NsxoPfRqT1/Dxm+7rI4seph3AbaElQZ8qcggVLfwlik8468zzgCy7Mm8u3
 pJDogii08gBzNtTVHWyQVFAFOtuQrGH0ItsKCrrkc3fLI7F8hcYkQ3/Kta3WvHFZNkLP7
 MG4hy/UzXVJb3+t9/a7kLHjQ6n81fQXLaLpbvTxyuvPbAqZMg9a4cf1ipPv0OlhgSMR20
 vnGgxLA09TQc0qlo+/8ouEgioAIC39kV0yDghDzbaHOxxqZVK+CsKIP+zJrZHTjQuCltS
 v2Oyt6fNYs0mB0DWbdU83N9RsIeu2UQ4DTRFkdN1/lKqFG/EMiAQy0e1Db5XL79VnlA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=YEvUT3c9; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c30"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c30; helo=mail-oo1-xc30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=YEvUT3c9
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AEF47400AC
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 00:11:18 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-6fbf1ba31fbso132641eaf.0
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 17:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792714277; x=1793319077; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=+hoUH9Zv+609Z17qmqZ/MugVByx4jbERDdtkWsF7CwQ=;
 b=YEvUT3c9gNtQdpLv6+r89FEZAhikYRjAwrZ5HcpQ8PWDb/gTh1EZyHfrko5HT8WfS0
 yM+zpoDWOvKUMF8gxVLwv4yte+p5R6ZmdTv8j36+8x2q+1WBOasDU8OgLTPAkYTZDnEa
 sH7tXdSTMGczsKtqk4dqGnszFAmx4xwGmpglyBV9sB7B1/6/SsSq3fxUQAIA5pVwCyKo
 4Hn3caqkhq268WktBso5RrS3jqi8xH41vb/EF3pynmzF2RvEAh2DrUx262+YxfyLl9sJ
 ZrF3frJ1tIF4qLTDwFEdfkUCC/QmpAxkmjEavAysxnBRfxzdiPSxWS7bCO9uK3Jf83jB
 iWng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792714277; x=1793319077;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+hoUH9Zv+609Z17qmqZ/MugVByx4jbERDdtkWsF7CwQ=;
 b=FCoGtkbH3+xuNRmRFWsT0YdMTpsnvR9xlwcwH0HBaAC8S13dCm7G0BlVjDg4p97SLy
 siXPGPPMpTKjyLGfWZ0aktpJ2Ztz7tNFr1fwPeeg5DgtA3rrPULNqvQRseaYh0Cucc0C
 ukONTnKNWLmNRZZK1xKHOIMj2hqDx7mCujvPPUzDxXqQXVUAl2fLBBuoLtxKCj4rRLu3
 4Uj7AJqbwlnA8lAanHfVvyhc4z3q/o5aHNc2Fol+CUKoJh9P4RvffZd4BmdhkG/Lri6m
 n3uY1d8aRZauPycuspIGNuYOGwzGtB/9KRIYS4lbnI1UfPGxMUs15G5oog2UcT69SbQ7
 pAHg==
X-Gm-Message-State: AFq9FYL9s9RD4ddQ3mnrczbl38AKl/rjmruIciteQO2leq4OeOJjvnCD
 ijvXeJtOraHUcCUCRyS/BEXIi+SZsrIU0fU3JWWP8Himj0F/0CNHx8TbM2TpVg==
X-Gm-Gg: AYBFou3/n14tlcNRizZl+MZcUbAnXb5ZXzf818zdolq5I9SqcMMTMnmSTd7BM2rmDZU
 j2iXYJAi7U32Xqt2Ayh4B+bFfJFai2ppP6igCytkZJSoe9ZrFXPLTx3SDkYHebCu76OdADHyozI
 XoYf0eFOumfJrSqF6734SlN93kWFD/fl0FmXhnd88KLC7i3F2sy6canz52JibMNdQhbqfC4qyZW
 hb8npEny2k5DijHdYP7vWNuFadthNDpgoADOQLmGWkDq5dLYgxT8ucgfD+OIPUhxbdUGoQqR2LF
 chPtXj0U93pb/DreVVkWWeTWPzVo4tv2xhBHkNwHXBCrTL7z3L0CdtJv5+TmH1UJP9AZRYxajlI
 Vey0enzWvT/07ON9PnOpSSspeobar16sJNTAXwaTqyxARFNuxl//cucVOHp4B5gsfuivQA9cuxq
 UEuxU/b7W2TRdY6nfPWeWhba7uFb0qzLUu4NN8Kham6qar61V6iTRSziGzVVvr1u0M4GiBf9n+h
 hehJdxbkDq2ZpnPL7u95GFU5PhX4B13SCW2XZ0Nk5gT8fWqa7h0Q48PjU6XqZ8PQkE/g27Ey7J8
 bD6UcguYg199FGG3fnHLMIpcFi4igonn0+8WNQ+i/hBl8MelLgjHFCodfJ/Mfzx+OHwxTJ+f3Wf
 X/JatNdsj6Ru36nVDR6d5w+WXIGrdhlX7bKD0tmeKVgah++9jYnhwDj5yUQe1U3yQ/jXRs+IlWd
 QydHs3MHU1Trspv7Fbp9j5WQb+
X-Received: by 2002:a05:6820:4a1b:b0:6dc:82da:3e12 with SMTP id
 006d021491bc7-70b889ef3famr569829eaf.31.1792714277095; 
 Thu, 22 Oct 2026 17:11:17 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-70b8b2c4561sm594428eaf.9.2026.10.22.17.11.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2026 17:11:16 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 18:11:13 -0600
Message-ID: <20261023001113.59344-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/tailscale: disable built-in client
 updates
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

Tailscale's built-in update mechanism is not designed for Buildroot
systems and is likely to cause problems. Disable it with the
ts_omit_clientupdate build tag.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/tailscale/tailscale.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tailscale/tailscale.mk b/package/tailscale/tailscale.mk
index 8ac2ae41da..0031292226 100644
--- a/package/tailscale/tailscale.mk
+++ b/package/tailscale/tailscale.mk
@@ -11,7 +11,7 @@ TAILSCALE_LICENSE_FILES = LICENSE
 TAILSCALE_GOMOD = tailscale.com
 TAILSCALE_CPE_ID_VENDOR = tailscale
 TAILSCALE_BUILD_TARGETS = cmd/tailscale cmd/tailscaled
-TAILSCALE_TAGS = ts_omit_iptables
+TAILSCALE_TAGS = ts_omit_clientupdate ts_omit_iptables
 TAILSCALE_LDFLAGS = \
 	-X tailscale.com/version.longStamp=$(TAILSCALE_VERSION) \
 	-X tailscale.com/version.shortStamp=$(TAILSCALE_VERSION)
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
