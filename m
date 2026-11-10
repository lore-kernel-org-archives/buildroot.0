Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10DB60A2613
	for <buildroot@archiver.kernel.org>; Tue, 10 Nov 2026 21:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=QW2MRtNk;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nb9CgtY/
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0E3B40540;
	Tue, 10 Nov 2026 21:56:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mXl_r7GsWDPe; Tue, 10 Nov 2026 21:56:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AC50540330
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794347765;
	b=B1HOIbUynYMvEEQe6RnKlEKx18dozTo6sxqqT+hI1Q7+CCMvBcGzLzYJtbczsb0Kj2mu
	 n9nDIlHswKZvm3Y9wWMAKCbhRZJBETaU6AdfJOryHPZTIOuiv98PVoQUeJC6lSCjvvdFX
	 QRfMI1avJzsOSAqgOj1Jd3h3LNbasTELCVX5TIsDAL4KXnF8aCtbLCGtQ0E86vnxXc5Ne
	 MeNMDX5dyvk3D/NZo1FufI+gc10Hg2XHyvTaVH2TBWyyseBUgRtVVAvPPocI1yehd/u0+
	 ADvgRWqzK87BuKscKbMq2dXxBX2JHWA9cs5QDRCe4HI2vK2qQUqn33UfWuQmWyWDVTA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794347765;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=pS74OBjAgCXV34FmTIPwRKC2IGb3iVpo2wYXJy1SdTY=;
	b=oT8hW9uh1lVW/YGHtLtMgOLs1Yqbx8SM05YTqDho2X9pSj7Fg63Gv8fzD1uNbSlm06/B
	 GA9GGRSm7LnDJ1l7ymvH1TDqLT3X10e2K3vMdeEJjleTG8J6fGOvOjYQLzHXOhyCQkPVZ
	 FxkKBQQ/8QFKgdlNbsERJAkJBJYYNzlyJWRYbXWfgdLvYqu/5LaL9FOzpfV5CHeOqKwRE
	 M23GV2oDGqDbz41IDQAhaAZ1Qeg+xj8Z+oOLrXlZ3PwEzlcSESPrV866QIvl/j02n2fEK
	 YHngUB0xJLhuKw/2Xf9JwAuRlOol0P97xNlNCqN+FazzFM47zuVfg/8arlmQmiVK5gQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794347765;
	bh=pS74OBjAgCXV34FmTIPwRKC2IGb3iVpo2wYXJy1SdTY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QW2MRtNkC581mUVtGuif/RSsCCidJh5a8GTsnNXoeyQ1I50PnXWB1S+Odnlk2LUX9
	 qQMlcjsG57oKTTtPdsttQ7yCZ/ZtNgaLFhxk9i5i/1twsd661m0c6i8tfEc10cpLJE
	 dAUmilbjhnHLitsXg3cT9s0IRS8Vz1TEypDO8/3cwA+E3JrMcJDg5527sVUrG/6tpE
	 oFKBwKqs8TqXaZsgrSCa+/KtptG0c0vZPWfpAo+nLU+AE3IrKdnYKdSX0jVwvUdgTN
	 UNcdGpeOd+TQSzPNv/ASVAgU6nLqEwKIcTVIB/YVcsYmL3n+kjj8HNQJRl1G9iFW1P
	 Spt102wYO46DQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC50540330;
	Tue, 10 Nov 2026 21:56:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 634191FC
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 21:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54F7F60AAD
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 21:56:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eT5tIz4yOO8a for <buildroot@buildroot.org>;
 Tue, 10 Nov 2026 21:56:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 08E59605E3
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=nb9CgtY/
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 08E59605E3
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 21:56:02 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-48dee593f18so1870858f8f.3
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 13:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794347761; x=1794952561; darn=buildroot.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=nO/QaqfQd2WP9helB9D0GGt69CTKpo1FZiX/gANglyY=;
 b=nb9CgtY/ju/6TkuvpfpFQHH2As0MwiNDWYFvpCBWPwq0cUu1Qdnqi68fUbVCDK4xyf
 +w4SsIk98lI/vHc8n5DPZdSHXJLuXiWZzW785qz9bF5osIH958wADUXueAD89kYrawKc
 TUJTd90OUyOXh0UXvugj7xJUsJAotfIPSlq2O6Ya7OHRswY8ct/BgiYKZPuhpftKpeDP
 zM+MJBxW4WGlsfHRw8kFFdHpabDV6YKQuiVg3jf9o1TkBktLLijftiGgGiPnZ/oREuCx
 1C+d8RZTL6fxNQUhgUaFalvi7KfzM/eSgNcUJOjvG46IaH+CO7uYPuCzbdAT5v4RY8ZC
 xp8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794347761; x=1794952561;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=nO/QaqfQd2WP9helB9D0GGt69CTKpo1FZiX/gANglyY=;
 b=XwzuWZvupdo7TK2mxpApo408RY6X9LMV7cSvwuLTTnlsHdQpLY6rA4KN/hRf6fUhLy
 ArsHDKOs/C9s6d5BmjKkercHhvIApYwItMY96gfkXF1y5S0DXIb4d6PUefOrkyo8Lbr9
 dSYEKK0BupDkhYi7MSrVjZCJKTsIxGN7UpvzSPfEKvmmplj7ix4MUzq3ieSPgDY63770
 vglBBzK8vMH8l2rJC9NY6mHr5RlvFhXQZPblTBv7FcnbVeYiNN+8QIupTCqG9SKK2ufl
 fuRm8QcKW4rORuMAJXps1qFenLRsmQC7yuWd/o+p0IPWm/GzEOYdl4UVi2X7bSwrYoZj
 TstQ==
X-Gm-Message-State: APuU4Z+CTqruULahwKjLfyasRB9wJCjElWFIay6CcYXj34W0jpCEVqb9
 07ql+rrPTxbtC319CBpIi0NXd0bjKBXL8t+qLS8OBphOGE9vrfRkK4zNAGXtYw==
X-Gm-Gg: AYBFou2Y75fweq6zFIYTIFoeeHKs5lx79RBkj3k6VUncKAzg/wg2YxrKA76UadwFNZm
 do9w9aXLOTqbH//mtjN67FWZ4+neCIwZop4FbBvG7YPEaM3VG40NiEpzm4DXU0tXMVvkIj5mu1v
 T4kBGZ35vFsZWhbtNmsHLcHJxcoW7R86msEsHVRy5mCaNVtQl2fZpnJbyMw0sCGcxCaAh9PGZR0
 vrrY6T10OpTQFw8EtZq+04YDHVPmlbQ1vPr3+RoasjAGNH+1g8rnLZXTAC01FPXg1/4+B6M8neJ
 88j/GBcZQOwopgJNPI2bJr4COV3faw/ZEhSL/rm2+5nDCeBr6e40FSwlVCnfgnubmieiEglaw4H
 VNe5pEpuTWEwZq8KBEoC48AwjBowPvKCG2n7YD8xBTXlMqbbCsZHnpGHp8XFadHyIl+HZKOIwGK
 1h6wgFTA5P8n+2NkVSPNk5OZuu7QE1wvhkHN1h8oz4RY38hyh9WsUZI0z5vVoYHtFG6SDVacCD3
 nXKkBsOb9vT87MLbvhp27A82fFHHJrY3OuDcLRlLyovSR9aWrleWFj6zJf4M6U3Y83Ww3p+7h0h
 FOLxYimd0uDf8wKJ+Qq787fHWSe0aMptyAile4WQMaXH1UyZgio9
X-Received: by 2002:a05:6000:188c:b0:48e:2448:ea23 with SMTP id
 ffacd0b85a97d-499ca948c52mr319514f8f.55.1794347760510; 
 Tue, 10 Nov 2026 13:56:00 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49836b8eb11sm7767889f8f.57.2026.11.10.13.55.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 13:56:00 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Biagio Montaruli <biagio.hkr@gmail.com>,
 Edgar Bonet <bonet@grenoble.cnrs.fr>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Simon Dawson <spdawson@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 10 Nov 2026 22:55:53 +0100
Message-ID: <20261110215557.2248804-2-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110215557.2248804-1-angelo.compagnucci@gmail.com>
References: <20261110215557.2248804-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/5] boot/at91bootstrap3: bump 3.x series to
 3.10.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhlIHBhdGNoIGZpeGluZyB0aGUgYnVpbGQgd2l0aCBHQ0MgMTUgaXMgbm90IHVwc3RyZWFtIGlu
IDMuMTAuNCB5ZXQKYW5kIGFwcGxpZXMgYXMgaXM6IGNvcHkgaXQgdG8gdGhlIHYzLjEwLjQgZGly
ZWN0b3J5LiBUaGUgdjMuMTAuMyBjb3B5CnN0YXlzLCB1c2VkIGJ5IHRoZSBkZWZjb25maWdzIHRo
YXQgZmV0Y2ggdjMuMTAuMyBmcm9tIGdpdAooYWNtZXN5c3RlbXNfYWNxdWFfYTVfKiBhbmQgYXQ5
MXNhbTl4NWVrXyopLgoKUmVsZWFzZSBub3RlczoKaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4NHNh
bS9hdDkxYm9vdHN0cmFwL3JlbGVhc2VzL3RhZy92My4xMC40CgpTaWduZWQtb2ZmLWJ5OiBBbmdl
bG8gQ29tcGFnbnVjY2kgPGFuZ2Vsby5jb21wYWdudWNjaUBnbWFpbC5jb20+Ci0tLQogYm9vdC9h
dDkxYm9vdHN0cmFwMy9Db25maWcuaW4gICAgICAgICAgICAgICAgIHwgIDQgKy0KIGJvb3QvYXQ5
MWJvb3RzdHJhcDMvYXQ5MWJvb3RzdHJhcDMuaGFzaCAgICAgICB8ICAyICstCiAuLi5jb25kaXRp
b25hbGx5LWRlZmluZS1ib29sLWZhbHNlLWFuZC0ucGF0Y2ggfCA0NyArKysrKysrKysrKysrKysr
KysrCiAzIGZpbGVzIGNoYW5nZWQsIDUwIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCiBj
cmVhdGUgbW9kZSAxMDA2NDQgYm9vdC9hdDkxYm9vdHN0cmFwMy92My4xMC40LzAwMDEtaW5jbHVk
ZS10eXBlcy5oLWNvbmRpdGlvbmFsbHktZGVmaW5lLWJvb2wtZmFsc2UtYW5kLS5wYXRjaAoKZGlm
ZiAtLWdpdCBhL2Jvb3QvYXQ5MWJvb3RzdHJhcDMvQ29uZmlnLmluIGIvYm9vdC9hdDkxYm9vdHN0
cmFwMy9Db25maWcuaW4KaW5kZXggODNkM2EwMjEyMS4uNjE4MWYzOWJiMSAxMDA2NDQKLS0tIGEv
Ym9vdC9hdDkxYm9vdHN0cmFwMy9Db25maWcuaW4KKysrIGIvYm9vdC9hdDkxYm9vdHN0cmFwMy9D
b25maWcuaW4KQEAgLTIyLDcgKzIyLDcgQEAgY29uZmlnIEJSMl9UQVJHRVRfQVQ5MUJPT1RTVFJB
UDNfTEFURVNUX1ZFUlNJT04KIAlib29sICI0LjAuMCIKIAogY29uZmlnIEJSMl9UQVJHRVRfQVQ5
MUJPT1RTVFJBUDNfTEFURVNUX1ZFUlNJT05fM1gKLQlib29sICIzLjEwLjMiCisJYm9vbCAiMy4x
MC40IgogCiBjb25maWcgQlIyX1RBUkdFVF9BVDkxQk9PVFNUUkFQM19DVVNUT01fR0lUCiAJYm9v
bCAiQ3VzdG9tIEdpdCByZXBvc2l0b3J5IgpAQCAtNjEsNyArNjEsNyBAQCBlbmRpZgogY29uZmln
IEJSMl9UQVJHRVRfQVQ5MUJPT1RTVFJBUDNfVkVSU0lPTgogCXN0cmluZwogCWRlZmF1bHQgInY0
LjAuMCIgaWYgQlIyX1RBUkdFVF9BVDkxQk9PVFNUUkFQM19MQVRFU1RfVkVSU0lPTgotCWRlZmF1
bHQgInYzLjEwLjMiIGlmIEJSMl9UQVJHRVRfQVQ5MUJPT1RTVFJBUDNfTEFURVNUX1ZFUlNJT05f
M1gKKwlkZWZhdWx0ICJ2My4xMC40IiBpZiBCUjJfVEFSR0VUX0FUOTFCT09UU1RSQVAzX0xBVEVT
VF9WRVJTSU9OXzNYCiAJZGVmYXVsdCBCUjJfVEFSR0VUX0FUOTFCT09UU1RSQVAzX0NVU1RPTV9S
RVBPX1ZFUlNJT04gXAogCQlpZiBCUjJfVEFSR0VUX0FUOTFCT09UU1RSQVAzX0NVU1RPTV9HSVQg
fHwgQlIyX1RBUkdFVF9BVDkxQk9PVFNUUkFQM19DVVNUT01fU1ZOCiAJZGVmYXVsdCAiY3VzdG9t
IglpZiBCUjJfVEFSR0VUX0FUOTFCT09UU1RSQVAzX0NVU1RPTV9UQVJCQUxMCmRpZmYgLS1naXQg
YS9ib290L2F0OTFib290c3RyYXAzL2F0OTFib290c3RyYXAzLmhhc2ggYi9ib290L2F0OTFib290
c3RyYXAzL2F0OTFib290c3RyYXAzLmhhc2gKaW5kZXggZTYxMWYxNjNjOS4uOTcyN2E4ODg1MCAx
MDA2NDQKLS0tIGEvYm9vdC9hdDkxYm9vdHN0cmFwMy9hdDkxYm9vdHN0cmFwMy5oYXNoCisrKyBi
L2Jvb3QvYXQ5MWJvb3RzdHJhcDMvYXQ5MWJvb3RzdHJhcDMuaGFzaApAQCAtMSw0ICsxLDQgQEAK
ICMgTG9jYWxseSBjYWxjdWxhdGVkCi1zaGEyNTYgIGI2YWU1YmNhYWNjNWE5NDlmNDAwMTgyZTAz
NmFlMDUzMDQ5NjM4NDQ0YTNiYThiMWRkMTU0ZWM1Zjc4OThkOGUgIGF0OTFib290c3RyYXAzLXYz
LjEwLjMudGFyLmd6CitzaGEyNTYgIGI2YjRjZDRiMTI3ZWZiZTEwMzc1NDY3M2QyOGViMmFiYjk3
NzJiNTM3OGQ5YzhjYmZjMDFjNjNiNThkMjc0NTEgIGF0OTFib290c3RyYXAzLXYzLjEwLjQudGFy
Lmd6CiBzaGEyNTYgIDA4YzViOTVkZjI4YmU3ZjJlMDQzOWZiMmI3N2ZlMjc1MjRmOTdjNDk5ODUw
NjQxZTQ1NDBjMDdlYTBiMmMyNWQgIGF0OTFib290c3RyYXAzLXY0LjAuMC50YXIuZ3oKIHNoYTI1
NiAgNWEzODA5YjFjMmJhMTNiNzI0MjU3MjMyMjk1MTMxMWM1ODQ0MTlmMWY4NTE2ZjY2NWQ2YzA2
ZjA2NjhkNzhkZSAgTElDRU5TRVMvTUlULnR4dApkaWZmIC0tZ2l0IGEvYm9vdC9hdDkxYm9vdHN0
cmFwMy92My4xMC40LzAwMDEtaW5jbHVkZS10eXBlcy5oLWNvbmRpdGlvbmFsbHktZGVmaW5lLWJv
b2wtZmFsc2UtYW5kLS5wYXRjaCBiL2Jvb3QvYXQ5MWJvb3RzdHJhcDMvdjMuMTAuNC8wMDAxLWlu
Y2x1ZGUtdHlwZXMuaC1jb25kaXRpb25hbGx5LWRlZmluZS1ib29sLWZhbHNlLWFuZC0ucGF0Y2gK
bmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uMzUyYzFjMGE0MwotLS0gL2Rl
di9udWxsCisrKyBiL2Jvb3QvYXQ5MWJvb3RzdHJhcDMvdjMuMTAuNC8wMDAxLWluY2x1ZGUtdHlw
ZXMuaC1jb25kaXRpb25hbGx5LWRlZmluZS1ib29sLWZhbHNlLWFuZC0ucGF0Y2gKQEAgLTAsMCAr
MSw0NyBAQAorRnJvbSA5MDhjNjU2Nzg4Njc1NjVhOTM0ZWE1YTk2N2JmZTdlMjA0ZDFjY2FmIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogRWRnYXIgQm9uZXQgPGJvbmV0QGdyZW5vYmxl
LmNucnMuZnI+CitEYXRlOiBXZWQsIDI1IEp1biAyMDI1IDExOjEzOjQzICswMjAwCitTdWJqZWN0
OiBbUEFUQ0hdIGluY2x1ZGUvdHlwZXMuaDogY29uZGl0aW9uYWxseSBkZWZpbmUgYm9vbCwgZmFs
c2UgYW5kIHRydWUKK01JTUUtVmVyc2lvbjogMS4wCitDb250ZW50LVR5cGU6IHRleHQvcGxhaW47
IGNoYXJzZXQ9VVRGLTgKK0NvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKKworaW5jbHVk
ZS90eXBlcy5oIHR5cGVkZWZzIOKAmGJvb2zigJkgYW5kIG1hY3JvLWRlZmluZXMg4oCYZmFsc2Xi
gJkgYW5kIOKAmHRydWXigJkuCitIb3dldmVyLCBzaW5jZSBDMjMsIHRoZXNlIGFyZSBwcmVkZWZp
bmUga2V5d29yZHMuIEFzIEMyMyBpcyB0aGUgZGVmYXVsdAorQyBkaWFsZWN0IGZvciBHQ0MgMTUs
IGJ1aWxkaW5nIHdpdGggdGhpcyBjb21waWxlciBmYWlscyB3aXRoOgorCisgICAgaW5jbHVkZS90
eXBlcy5oOjIzOjIzOiBlcnJvcjog4oCYYm9vbOKAmSBjYW5ub3QgYmUgZGVmaW5lZCB2aWEg4oCY
dHlwZWRlZuKAmQorICAgICAgIDIzIHwgdHlwZWRlZiB1bnNpZ25lZCBjaGFyIGJvb2w7CisgICAg
ICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgXn5+fgorICAgIGluY2x1ZGUvdHlwZXMuaDoy
MzoyMzogbm90ZTog4oCYYm9vbOKAmSBpcyBhIGtleXdvcmQgd2l0aCDigJgtc3RkPWMyM+KAmSBv
bndhcmRzCisKK0ZpeCB0aGlzIGJ1aWxkIGZhaWx1cmUgYnkgb25seSBkZWZpbmluZyDigJhib29s
4oCZLCDigJhmYWxzZeKAmSBhbmQg4oCYdHJ1ZeKAmSBvbiBDCitkaWFsZWN0cyBvbGRlciB0aGFu
IEMyMy4KKworVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eDRzYW0vYXQ5MWJvb3Rz
dHJhcC9wdWxsLzE4OAorW0VkZ2FyOiBiYWNrcG9ydCB0byB2My4xMC4zXQorCitTaWduZWQtb2Zm
LWJ5OiBFZGdhciBCb25ldCA8Ym9uZXRAZ3Jlbm9ibGUuY25ycy5mcj4KKy0tLQorIGluY2x1ZGUv
dHlwZXMuaCB8IDMgKysrCisgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQorCitkaWZm
IC0tZ2l0IGEvaW5jbHVkZS90eXBlcy5oIGIvaW5jbHVkZS90eXBlcy5oCitpbmRleCAxMjQ2YTRk
Zi4uMmMxYTQxY2YgMTAwNjQ0CistLS0gYS9pbmNsdWRlL3R5cGVzLmgKKysrKyBiL2luY2x1ZGUv
dHlwZXMuaAorQEAgLTQyLDggKzQyLDExIEBAIHR5cGVkZWYgc2lnbmVkIGxvbmcgbG9uZyBzNjQ7
CisgdHlwZWRlZiB1bnNpZ25lZCBsb25nIHNpemVfdDsKKyB0eXBlZGVmIHNpZ25lZCBsb25nIHNz
aXplX3Q7CisgCisrLyogYm9vbCwgZmFsc2UgYW5kIHRydWUgYXJlIHByZWRlZmluZWQgc2luY2Ug
QzIzLiAqLworKyNpZiBfX1NURENfVkVSU0lPTl9fIDwgMjAyMzExTAorIHR5cGVkZWYgdW5zaWdu
ZWQgY2hhciBib29sOworICNkZWZpbmUgZmFsc2UJMFUKKyAjZGVmaW5lIHRydWUJMVUKKysjZW5k
aWYKKyAKKyAjZW5kaWYgLyogVFlQRVNfSF8gKi8KKy0tIAorMi40My4wCisKLS0gCjIuNTMuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
