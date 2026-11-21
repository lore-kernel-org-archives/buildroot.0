Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25BD606A320
	for <buildroot@archiver.kernel.org>; Sat, 21 Nov 2026 21:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=EnULJ89v;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xWUQQKyJ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9024760669;
	Sat, 21 Nov 2026 21:52:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r5lhaxRr9Vug; Sat, 21 Nov 2026 21:51:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8D824606E8
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795297919;
	b=alyabp5DJ8l+vwZcv/Rk57zMH/Q9wdcUU3M9SLbvfq3ngnYLnqGwCTppyKMloNn8occe
	 mN8zlyw/9BSzQ5SrX0kFj5LbRChqfm+l0btHJ39STCWOdC361rvQaBxOY8VNQERXsr65+
	 jIrv474LBZ7nGB9lYjTV9RJ2uFlzw9k+oK/RqwC5pBE04TJqnsYhHlwmYUQFRETDgt0Hg
	 5hwGZvpGFV07QjIVRaVg/JW46qoSik9VUFCLrjrs7tk5l6lzJMS5JB8lcOGkNt0dMUTDB
	 uTwjXCV185dimGArEpBE7eg4u9eHhWoVg53SbGp5uxumQO2xtqibTyQUG/ojw8NzlWg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795297919;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=WI19dmtda3B5+tYHYvdmDJyTh8n9TPBdZ3BUkW/wHWc=;
	b=JK4tcIE313No7XuEOcz3KRg+UabqV+B8OW9xkFvZCCovMM9ScOtBT9ZSA62R1WcxLSj+
	 9kpWe6DH7KLu3/uNBcl1N1kPtseTXoQCt+YiUZvTtjgOyBXk9KV6h2jV/7eGFRzaKvzDo
	 E473J5Q2VmuyGJ79kzdgNXHoaHoB6Zt1oAFOpfSp94nbdJ0G2/goYCh042YHCULJVG/BT
	 N6l4UoN4CZJJ+Se2/HIVkB17GPxY6ZpT1FygQ4GsyF+AHdpZxd5zPdvtt0zVLrccF5o7g
	 ULiM8GP6DYcj70BxySaZ8aFp5cWZYHtugP78QJ2QyZf2ZKrF4XyVPWp68Z1JX8CPxuQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xWUQQKyJ;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795297919;
	bh=WI19dmtda3B5+tYHYvdmDJyTh8n9TPBdZ3BUkW/wHWc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EnULJ89v19HrUr7n9KYAupvwcaSw2ZM0tpG2OyfWjXmkapVRiVBl9Q+MYGBtMv6XA
	 lCthKnP7pFki5kA8MEZ0QohMfhiLZJE5h6XHA7O9GolQOYWmjarWyYsrOiVW5/NJJ2
	 90Z8lyMA4wmA9Zc3QIu2cWDEL075a9rseyTJn4HnRPVz7CDPj3fzQRfpRCBS8Ez2S0
	 xbZPeYIsDwnzt3MnO7GJw2wWC14bkq7FgwSppUmydo3wmbU+oBsDaMV3X9ohgu3Ypr
	 afSHZc0a71G9J7MW1luFiIDX2bCpZPS0Ud3rfY/3m35BbIJlW6NlGKjFpqocbj++vw
	 5K4tIpXwTlFcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D824606E8;
	Sat, 21 Nov 2026 21:51:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C499260
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 21:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A3F360617
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 21:51:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bq6eFmIPkOvi for <buildroot@buildroot.org>;
 Sat, 21 Nov 2026 21:51:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EC03D60628
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=xWUQQKyJ
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC03D60628
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 21:51:54 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4bb55cda775so12790375e9.0
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 13:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795297913; x=1795902713; darn=buildroot.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ByvCj/379Z1HGfyfq7+4JCajeN4SwUesCRRaj5SO51E=;
 b=xWUQQKyJAmPPQDq3o0yRmqkTBwwuB8xtyr3I5Kyn4kbsg4rMk6P50V+mfqqreNjeEN
 zS0zx425aqc+juMGVSXUFk4ojFMkN3EXjgFT7fFNCO2/MHG20OczVl6dddowF7As4dhp
 UbvIEAlBb4Sx122TkoXbfp3mmVxkzsqwd4Bepg+RddmLMRp61pS5oGoWg1MdSX09/9t/
 YiVQ6rZVKjidpCftnm1beqVo7ydJaFFQFwR9eTq36BDpemY6Dy7VINGP39wVaQc9Yt6X
 B91PC/hC05eEJeRy7aXdOSU7nqS2iSUO262KJPxV2F6sQNLBXp/usDUQ/5SjTIGVnFVY
 3Ezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795297913; x=1795902713;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ByvCj/379Z1HGfyfq7+4JCajeN4SwUesCRRaj5SO51E=;
 b=y3Q0GijH25wZXhwHZniPGmWo6juvdztgBsVGt/rnOinSePoaNK2uLqs6QeyciKHjR7
 /B6GLSzekvxJDLtflF7O0LX9nUccSq6itCEUSBRecXYG/kLly3JjTIGbnc/S+p+1lfdY
 2/CnvKINEy4p8c+FTKag20OugEnGEXd1kfue+LRiYVIZhMsSnBj5VFPNqS9OayDsbnBX
 l08bHlCLDvU7+3kew8JvEGe63/3OqQQI/y5S/kAjz8PNLHJRBNrTwODiP0RK/Eibg6tr
 9dR3sRWkZZgoUnBfa4OdV/wZ+JU/MOvJGxcK3dZGvMbNaLfedPxoHC1WgjNSI9P/hoZv
 slkQ==
X-Gm-Message-State: APuU4Z97vBwg7nNJVuVTRlC6KcfsJIgkHzejGGj3vaekFe0nn6BtrVeD
 S2cB4mBwv3R3gnFWFgKmpr+hgI0KKCRNMlw792GBd+Azzv7ukskRITj7hTwS3V7E
X-Gm-Gg: AZFdTZen9pWhf1olfnKVN/NU86hOZVVI18Nj/RwTsPSdohoIB45M+rg2D5zdBvaewRr
 kTMdDwk96HL94WqmYCozCri/9mjwERNl4nSvoGVTcFawvXrn9HmFdmZEWVyJVb4rj32NMR6D4V/
 7QddjttMRXNlLCOqFpkavKnc/nY6eYQOZNrxhMLUi0he+bKW49JdTV5ps7GblS1D11/xxQ1y4AP
 Zm1nfAHQkesBDnAvEhZxvyRAMkhjrx8VZTg3c9apgmm+FLhz7TXnUGDowrpVgymib5BIeV/2f3S
 fooSvG8WiiMwmlIzb4itg5XF24zfgE+2N9DsHv0WanJFua4Faf0RrHq+LBboO27dMl92hWTr+xz
 FhMzn1LTxDLEwnZhf76QQXs/Yp9j1MFHEqtR34gmPHFwT/9gTDUoijXHGJYzHcbjmpmSyTi01CG
 T9JInQegUBa1xBRzHvLoyCTFvpLLYCndjnCHnFPfuW4Nc45rqqfmGSruWRdLZigGfkpWrNIuw5X
 EXnXVS0cIRDTdjT9obqSNJoGT7IlA0xJ4p5ehTo7h3cAE+7Di8bxQnBr9opX41dBvc4o2I1tyKk
 v0pWvHg7hCCMKmGKp7x8/qs13/bXm60rkyHWgcXVmXei57GxFwo=
X-Received: by 2002:a05:600c:154c:b0:4bb:6a78:7c42 with SMTP id
 5b1f17b1804b1-4bb887c3428mr161403355e9.1.1795297912601; 
 Sat, 21 Nov 2026 13:51:52 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb88402ce9sm161893155e9.0.2026.11.21.13.51.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2026 13:51:52 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Cheng Yang <yangcheng.work@foxmail.com>
Date: Sat, 21 Nov 2026 22:51:47 +0100
Message-ID: <20261121215147.4121-3-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121215147.4121-1-angelo.compagnucci@gmail.com>
References: <20250411172944.1379043-1-vincent.stehle@arm.com>
 <20261121215147.4121-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 3/3] package/edk2-non-osi: add custom version
 option
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RnJvbTogVmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBhcm0uY29tPgoKQWRkIGEgY3Vz
dG9tIHZlcnNpb24gb3B0aW9uLCB0byBlbmFibGUgZWFzaWx5IHNwZWNpZnlpbmcgYW4gb2ZmaWNp
YWwgRURLCklJIE5vbi1PU0kgcGxhdGZvcm1zIHZlcnNpb24gdG8gdXNlLiBUaGlzIGlzIHNpbWls
YXIgdG8gd2hhdCBpcyBkb25lIGluCm90aGVyIHBhY2thZ2VzLCBzdWNoIGFzIGxpbnV4LCB1Ym9v
dCwgb3B0ZWVfb3Mgb3IgYXJtLXRydXN0ZWQtZmlybXdhcmUuCgpNb3ZlIHRoZSBkZWZhdWx0IHZl
cnNpb24gZGVmaW5pdGlvbiBmcm9tIGVkazItbm9uLW9zaSBtYWtlZmlsZSB0byB0aGUKY29uZmln
IG1lbnUgdG8gc3VwcG9ydCB0aGF0LiBBbHNvLCB3ZSBuZWVkIHRvIG1ha2UgZWRrMi1ub24tb3Np
IGFwcGVhcgppbiB0aGUgbWVudSB0byBhbGxvdyBzZWxlY3RpbmcgdGhlIHZlcnNpb24uIFdlIGtl
ZXAgdGhlIHNhbWUgbGF0ZXN0CnZlcnNpb24gYnkgZGVmYXVsdCB0byBwcmVzZXJ2ZSBjdXJyZW50
IGJlaGF2aW91ci4KCkFsc28sIGFkZCBhIGNoZWNrIG9mIHRoZSBjdXN0b20gdmVyc2lvbiBvcHRp
b24gdmFsaWRpdHkgaW4gZWRrMi1ub24tb3NpCm1ha2VmaWxlLgoKU2tpcCB0aGUgaGFzaCBjaGVj
ayBmb3IgY3VzdG9tIHZlcnNpb25zOiB0aGUgaGFzaCBmaWxlIG9ubHkgY292ZXJzIHRoZQpkZWZh
dWx0IHZlcnNpb24uIG9wdGVlLW9zIGFuZCB1Ym9vdCBkbyB0aGUgc2FtZS4KClNpZ25lZC1vZmYt
Ynk6IFZpbmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVobGVAYXJtLmNvbT4KQ28tYXV0aG9yZWQt
Ynk6IEFuZ2VsbyBDb21wYWdudWNjaSA8YW5nZWxvLmNvbXBhZ251Y2NpQGdtYWlsLmNvbT4KVGVz
dGVkLWJ5OiBBbmdlbG8gQ29tcGFnbnVjY2kgPGFuZ2Vsby5jb21wYWdudWNjaUBnbWFpbC5jb20+
ClNpZ25lZC1vZmYtYnk6IEFuZ2VsbyBDb21wYWdudWNjaSA8YW5nZWxvLmNvbXBhZ251Y2NpQGdt
YWlsLmNvbT4KLS0tCkNoYW5nZXMgdjEgLT4gdjI6CiAgLSByZWJhc2Ugb24gbWFzdGVyOiB0aGUg
ZGVmYXVsdCB2ZXJzaW9uIGlzIG5vdyB0aGUgZWRrMi1ub24tb3NpCiAgICBjb21taXQgN2FjMTJk
ODFlMDJiICgiUmVtb3ZlIEludGVsIFBsYXRmb3JtIGFuZCBTaWxpY29uIFBhY2thZ2VzIiksCiAg
ICBzZXQgYnkgMjI2MDYyNzYxM2NiICgiYm9vdC9lZGsyOiBidW1wIHRvIHZlcnNpb24KICAgIGVk
azItc3RhYmxlMjAyNjA4IikKICAtIHNraXAgdGhlIGhhc2ggY2hlY2sgZm9yIGN1c3RvbSB2ZXJz
aW9ucywgb3RoZXJ3aXNlIHRoZSBkb3dubG9hZAogICAgZmFpbHMgd2l0aCAiTm8gaGFzaCBmb3Vu
ZCIKClN1cGVyc2VkZXMgdjE6IGh0dHBzOi8vcGF0Y2h3b3JrLmJ1aWxkcm9vdC5vcmcvcHJvamVj
dC9idWlsZHJvb3QvcGF0Y2gvMjAyNTA0MTExNzI5NDQuMTM3OTA0My00LXZpbmNlbnQuc3RlaGxl
QGFybS5jb20vCgogcGFja2FnZS9lZGsyLW5vbi1vc2kvQ29uZmlnLmluICAgICAgIHwgMzYgKysr
KysrKysrKysrKysrKysrKysrKysrKysrLQogcGFja2FnZS9lZGsyLW5vbi1vc2kvZWRrMi1ub24t
b3NpLm1rIHwgMjEgKysrKysrKysrKysrKystLQogMiBmaWxlcyBjaGFuZ2VkLCA1NCBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZWRrMi1ub24tb3Np
L0NvbmZpZy5pbiBiL3BhY2thZ2UvZWRrMi1ub24tb3NpL0NvbmZpZy5pbgppbmRleCA2YzU0MGM4
YTQwLi4zODQ2N2Q2M2JhIDEwMDY0NAotLS0gYS9wYWNrYWdlL2VkazItbm9uLW9zaS9Db25maWcu
aW4KKysrIGIvcGFja2FnZS9lZGsyLW5vbi1vc2kvQ29uZmlnLmluCkBAIC0xLDUgKzEsNSBAQAog
Y29uZmlnIEJSMl9QQUNLQUdFX0VESzJfTk9OX09TSQotCWJvb2wKKwlib29sICJFREsyIE5vbi1P
U0kgcGxhdGZvcm1zIgogCWhlbHAKIAkgIEVESzIgZGVzY3JpcHRpb24gZmlsZXMgZm9yIGFkZGl0
aW9uYWwgcGxhdGZvcm1zLCBub3QKIAkgIGNvbXBhdGlibGUgd2l0aCB0aGUgbm9ybWFsIGxpY2Vu
c2luZyByZXF1aXJlbWVudHMuCkBAIC05LDMgKzksMzcgQEAgY29uZmlnIEJSMl9QQUNLQUdFX0VE
SzJfTk9OX09TSQogCSAgT25seSB0aGUgTWFydmVsbCBBcm1hZGEgZmlsZXMgYXJlIGNvcGllZCBh
dCB0aGlzIHBvaW50LgogCiAJICBodHRwczovL2dpdGh1Yi5jb20vdGlhbm9jb3JlL2VkazItbm9u
LW9zaQorCitpZiBCUjJfUEFDS0FHRV9FREsyX05PTl9PU0kKKworY2hvaWNlCisJcHJvbXB0ICJF
REsyIE5vbi1PU0kgcGxhdGZvcm1zIHZlcnNpb24iCisJZGVmYXVsdCBCUjJfUEFDS0FHRV9FREsy
X05PTl9PU0lfTEFURVNUCisJaGVscAorCSAgU2VsZWN0IHRoZSBzcGVjaWZpYyBFREsyIE5vbi1P
U0kgcGxhdGZvcm1zIHZlcnNpb24geW91IHdhbnQKKwkgIHRvIHVzZQorCitjb25maWcgQlIyX1BB
Q0tBR0VfRURLMl9OT05fT1NJX0xBVEVTVAorCSMgS2VlcCBpbiBzeW5jIHdpdGggbGF0ZXN0IGNv
bW1pdCBhcyBvZiB0aGUgcmVsZWFzZSBkYXRlIGZvciBib290L2VkazIKKwlib29sICI3YWMxMmQ4
MWUwMmIzMjNiZmZkZjFlZjNjMTg4ZWEzM2MyMTg1YzkxIgorCitjb25maWcgQlIyX1BBQ0tBR0Vf
RURLMl9OT05fT1NJX0NVU1RPTV9WRVJTSU9OCisJYm9vbCAiQ3VzdG9tIHZlcnNpb24iCisJaGVs
cAorCSAgVGhpcyBvcHRpb24gYWxsb3dzIHRvIHVzZSBhIHNwZWNpZmljIG9mZmljaWFsIHZlcnNp
b24KKworZW5kY2hvaWNlCisKK2NvbmZpZyBCUjJfUEFDS0FHRV9FREsyX05PTl9PU0lfQ1VTVE9N
X1ZFUlNJT05fVkFMVUUKKwlzdHJpbmcgIkVESzIgTm9uLU9TSSBwbGF0Zm9ybXMgdmVyc2lvbiIK
KwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0VESzJfTk9OX09TSV9DVVNUT01fVkVSU0lPTgorCitj
b25maWcgQlIyX1BBQ0tBR0VfRURLMl9OT05fT1NJX1ZFUlNJT04KKwlzdHJpbmcKKwkjIEtlZXAg
aW4gc3luYyB3aXRoIGxhdGVzdCBjb21taXQgYXMgb2YgdGhlIHJlbGVhc2UgZGF0ZSBmb3IgYm9v
dC9lZGsyCisJZGVmYXVsdCAiN2FjMTJkODFlMDJiMzIzYmZmZGYxZWYzYzE4OGVhMzNjMjE4NWM5
MSIgXAorCSAgICAgICAgaWYgQlIyX1BBQ0tBR0VfRURLMl9OT05fT1NJX0xBVEVTVAorCWRlZmF1
bHQgQlIyX1BBQ0tBR0VfRURLMl9OT05fT1NJX0NVU1RPTV9WRVJTSU9OX1ZBTFVFIFwKKwkgICAg
ICAgIGlmIEJSMl9QQUNLQUdFX0VESzJfTk9OX09TSV9DVVNUT01fVkVSU0lPTgorCitlbmRpZgpk
aWZmIC0tZ2l0IGEvcGFja2FnZS9lZGsyLW5vbi1vc2kvZWRrMi1ub24tb3NpLm1rIGIvcGFja2Fn
ZS9lZGsyLW5vbi1vc2kvZWRrMi1ub24tb3NpLm1rCmluZGV4IDQ4YjM0YmNkY2QuLjI2NDE0ZjNl
MGQgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvZWRrMi1ub24tb3NpL2VkazItbm9uLW9zaS5taworKysg
Yi9wYWNrYWdlL2VkazItbm9uLW9zaS9lZGsyLW5vbi1vc2kubWsKQEAgLTQsMTIgKzQsMTUgQEAK
ICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLSMgS2VlcCBpbiBzeW5jIHdpdGggbGF0ZXN0
IGNvbW1pdCBhcyBvZiB0aGUgcmVsZWFzZSBkYXRlIGZvciBib290L2VkazIKLUVESzJfTk9OX09T
SV9WRVJTSU9OID0gN2FjMTJkODFlMDJiMzIzYmZmZGYxZWYzYzE4OGVhMzNjMjE4NWM5MQorRURL
Ml9OT05fT1NJX1ZFUlNJT04gPSAkKGNhbGwgcXN0cmlwLCQoQlIyX1BBQ0tBR0VfRURLMl9OT05f
T1NJX1ZFUlNJT04pKQogRURLMl9OT05fT1NJX1NJVEUgPSAkKGNhbGwgZ2l0aHViLHRpYW5vY29y
ZSxlZGsyLW5vbi1vc2ksJChFREsyX05PTl9PU0lfVkVSU0lPTikpCiBFREsyX05PTl9PU0lfSU5T
VEFMTF9UQVJHRVQgPSBOTwogRURLMl9OT05fT1NJX0lOU1RBTExfU1RBR0lORyA9IFlFUwogCitp
ZmVxICgkKEJSMl9QQUNLQUdFX0VESzJfTk9OX09TSSk6JChCUjJfUEFDS0FHRV9FREsyX05PTl9P
U0lfTEFURVNUKSx5OikKK0JSX05PX0NIRUNLX0hBU0hfRk9SICs9ICQoRURLMl9OT05fT1NJX1NP
VVJDRSkKK2VuZGlmCisKICMgQ29weSBNYXJ2ZWxsIEFybWFkYSBmaWxlcwogRURLMl9OT05fT1NJ
X0xJQ0VOU0UgKz0gQlNELTItQ2xhdXNlLVBhdGVudCAoTWFydmVsbCBBcm1hZGEpCiBFREsyX05P
Tl9PU0lfTElDRU5TRV9GSUxFUyArPSBTaWxpY29uL01hcnZlbGwvQXJtYWRhN2s4ay9EZXZpY2VU
cmVlL0FybWFkYTgweDBNY0Jpbi5pbmYKQEAgLTI0LDQgKzI3LDE4IEBAIGRlZmluZSBFREsyX05P
Tl9PU0lfSU5TVEFMTF9TVEFHSU5HX0NNRFMKIAkpCiBlbmRlZgogCitpZmVxICgkKEJSMl9QQUNL
QUdFX0VESzJfTk9OX09TSSkkKEJSX0JVSUxESU5HKSx5eSkKKworIworIyBDaGVjayBjdXN0b20g
dmVyc2lvbiBvcHRpb24KKyMKK2lmZXEgKCQoQlIyX1BBQ0tBR0VfRURLMl9OT05fT1NJX0NVU1RP
TV9WRVJTSU9OKSx5KQoraWZlcSAoJChjYWxsIHFzdHJpcCwkKEJSMl9QQUNLQUdFX0VESzJfTk9O
X09TSV9DVVNUT01fVkVSU0lPTl9WQUxVRSkpLCkKKyQoZXJyb3IgTm8gY3VzdG9tIGVkazItbm9u
LW9zaSB2ZXJzaW9uIHNwZWNpZmllZC4gXAorCUNoZWNrIHlvdXIgQlIyX1BBQ0tBR0VfRURLMl9O
T05fT1NJX0NVU1RPTV9WRVJTSU9OX1ZBTFVFIHNldHRpbmcpCitlbmRpZgorZW5kaWYKKworZW5k
aWYgIyBCUjJfUEFDS0FHRV9FREsyX05PTl9PU0kgYW5kIEJSX0JVSUxESU5HCisKICQoZXZhbCAk
KGdlbmVyaWMtcGFja2FnZSkpCi0tIAoyLjUzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
