Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8343CD4F30
	for <buildroot@archiver.kernel.org>; Wed,  4 Sep 2024 20:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70EA081209;
	Wed,  4 Sep 2024 20:42:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jh3l0RjzRVUv; Wed,  4 Sep 2024 20:42:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 656378120B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 656378120B;
	Wed,  4 Sep 2024 20:42:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 20F101BF267
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 20:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18D8F81209
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 20:42:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gswSi7dsO9mC for <buildroot@lists.busybox.net>;
 Wed,  4 Sep 2024 20:42:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B5FD88120B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5FD88120B
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B5FD88120B
 for <buildroot@buildroot.org>; Wed,  4 Sep 2024 20:42:37 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-374c84dcc64so2690706f8f.1
 for <buildroot@buildroot.org>; Wed, 04 Sep 2024 13:42:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725482555; x=1726087355;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OPOQN+h3UD8Ub8fxZyuh0pqdcl8cHf6ES8JiyzsnGHs=;
 b=so6zxGFzuX2UDOmW5u8gAO3G2ujYs5QkZk+iAoVqoGbqyELGMjc20TNnt/XMNctgzu
 LUMEs8+wNl+FJ7MfVW3erGMKes5x5jDJ1kka2s3poYvw+mG0FO3HtEl5OO7ahCqumWE9
 mdyNYy3QW8CMt0FIKBbfDU/JfQNdV49nvfy4ysfdBpo4/7hTQWaa+mvbpyDf9hmJ5/P0
 dAK3zi/PLBAuHbiVcygXNsD8H3fGDd1WFA8juKzPSi4F7A6O2WtAS3LLA14GKHL8Y+Yh
 2yyV6W4agZAEOEsXU1lT341E32UTFWV07ZVb0uuihMBeyDtu5vPAspPl5kyqr2hEmVAQ
 OXCg==
X-Gm-Message-State: AOJu0Yz8JA88Kt+EYj/0ZIYepLImPhaWJw/xqq/YonLQMjvpEHRkbLhm
 P8J7MaWSjUIc0vVktBGUI7JlXs9KsH/Mx7H1KPJ8aAb9oTU8PvKE6qsvxA==
X-Google-Smtp-Source: AGHT+IHTnrUoFMamq9b1IhJxAY0XHlK7KJn1QZBdWyxZnv6n5JQT+3juEgGjBMCKG+3YXZj8ly23mg==
X-Received: by 2002:a05:6000:d8e:b0:374:ca1d:85ad with SMTP id
 ffacd0b85a97d-374ca1d8830mr10001586f8f.56.1725482554955; 
 Wed, 04 Sep 2024 13:42:34 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374ce8bbeacsm7975194f8f.92.2024.09.04.13.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 13:42:34 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed,  4 Sep 2024 22:42:34 +0200
Message-ID: <20240904204234.498396-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725482555; x=1726087355; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=OPOQN+h3UD8Ub8fxZyuh0pqdcl8cHf6ES8JiyzsnGHs=;
 b=W7aZ1ecizdSmu1nuFXzxvGYgHvIYzhblP3Y6n4GWKIEsoriIiyysPZIrmGgcEA2udU
 N/JQ5jzKaH10CDv5eZxIm9aNoP+Yozchy0bTWzXgROHVrWNB0bsutUemD9hHfvWqZdn9
 fk2bbu2R4mikD8w90IAWk9jkwCGDJQsxouTcs6iByYOoCY2FZqLrRyUqYEUk087pw23i
 mKlaVZBiRDZtA9X3dmrNS9MxFhbWURE0ONQdMSi3OwmpyK/U8V+bRXyUsShGM8FBBUfQ
 p4dY64k6uMHyY+4i0Vm9tswlh15pG6TNJLRCiJoIRVlu9/ZvTYTye1Mub1dgRB8vMn5f
 lPgA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=W7aZ1eci
Subject: [Buildroot] [PATCH] package/pkg-cargo: don't install crates tracking
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QnkgZGVmYXVsdCwgJ2NhcmdvIGluc3RhbGwnIGFsc28gaW5zdGFsbHMgYSBraW5kIG9mICJyZWdp
c3RyeSIgaW4KL3Vzci8uY3JhdGVzMi5qc29uIGFuZCAvdXNyLy5jcmF0ZXMudG9tbCBbMF06CiAg
ICBUbyB0cmFjayBpbmZvcm1hdGlvbiBvZiBpbnN0YWxsZWQgZXhlY3V0YWJsZXMsIHNvbWUgZXh0
cmEgZmlsZXMsCiAgICBzdWNoIGFzIC5jcmF0ZXMudG9tbCBhbmQgLmNyYXRlczIuanNvbiwgYXJl
IGFsc28gY3JlYXRlZCB1bmRlciB0aGlzCiAgICByb290LgoKUHJlc3VtYWJseSwgdGhpcyB3b3Vs
ZCBiZSB1c2VkIGJ5ICJjYXJnbyB1bmluc3RhbGwiIHRvIHByb3Blcmx5IGNsZWFudXAKdGhlIHBh
Y2thZ2UgWzFdOgogICAgQnkgZGVmYXVsdCBhbGwgYmluYXJpZXMgYXJlIHJlbW92ZWQgZm9yIGEg
Y3JhdGUgWy4uLl0uCgpIb3dldmVyLCBpbiB0aGUgY29udGV4dCBvZiBCdWlsZHJvb3QsIHRoaXMg
aXMgdXNlbGVzcywgYXMgd2UgZG8gbm90CnVuaW5zdGFsbCBwYWNrYWdlcywgYW5kIHRodXMgdGhv
c2UgZmlsZXMgYXJlIHN1cGVyZmx1b3VzLgoKVGVsbCBjYXJnbyB0byBub3QgY3JlYXRlIHRoYXQg
dHJhY2tpbmcgaW5mb3JtYXRpb24sIGJ5IHVzaW5nIC0tbm8tdHJhY2sKdG8gImNhcmdvIGluc3Rh
bGwiLgoKTm90ZSB0aGF0IHRoaXMgd291bGQgY2F1c2UgY2FyZ28gdG8gZmFpbCB0byBpbnN0YWxs
IGEgZmlsZSB0aGF0IGFscmVhZHkKZXhpc3RzIFsyXSwgbGlrZSB3b3VsZCBiZSB0aGUgY2FzZSB3
aGVuIHJ1bm5pbmcgZm9vLXJlaW5zdGFsbCBmb3IgZXhhbXBsZToKICAgIC0tbm8tdHJhY2sKICAg
IEJ5IGRlZmF1bHQsIENhcmdvIGtlZXBzIHRyYWNrIG9mIHRoZSBpbnN0YWxsZWQgcGFja2FnZXMg
d2l0aCBhCiAgICBtZXRhZGF0YSBmaWxlIHN0b3JlZCBpbiB0aGUgaW5zdGFsbGF0aW9uIHJvb3Qg
ZGlyZWN0b3J5LiBUaGlzIGZsYWcKICAgIHRlbGxzIENhcmdvIG5vdCB0byB1c2Ugb3IgY3JlYXRl
IHRoYXQgZmlsZS4gV2l0aCB0aGlzIGZsYWcsIENhcmdvCiAgICB3aWxsIHJlZnVzZSB0byBvdmVy
d3JpdGUgYW55IGV4aXN0aW5nIGZpbGVzIHVubGVzcyB0aGUgLS1mb3JjZSBmbGFnCiAgICBpcyB1
c2VkLiBUaGlzIGFsc28gZGlzYWJsZXMgQ2FyZ2/igJlzIGFiaWxpdHkgdG8gcHJvdGVjdCBhZ2Fp
bnN0CiAgICBtdWx0aXBsZSBjb25jdXJyZW50IGludm9jYXRpb25zIG9mIENhcmdvIGluc3RhbGxp
bmcgYXQgdGhlIHNhbWUKICAgIHRpbWUuCgpIb3dldmVyLCB3ZSBkbyBhbHJlYWR5IHVzZSAtLWZv
cmNlIHdoaWNoIGFsbG93cyBjYXJnbyB0byBvdmVyd3JpdGUKZXhpc3RpbmcgZmlsZXMgd2l0aG91
dCBhbnkgZnVydGhlciBhZG8sIHNvIGluIG91ciBjYXNlLCAtLW5vLXRyYWNrIHdpbGwKb25seSBk
aXNhYmxlIHRoZSB0cmFja2luZyBpbmZvcm1hdGlvbi4KCkFsc28sIGluIEJ1aWxkcm9vdCwgd2Ug
ZG8gbm90IGhhdmUgY29uY3VycmVudCBpbnN0YWxsYXRpb24gX3RvIHRoZSBzYW1lCmxvY2F0aW9u
XzogZWl0aGVyIFBQRCBpcyBkaXNhYmxlZCwgaW4gd2hpY2ggY2FzZSBvbmx5IG9uZSBwYWNrYWdl
IHdpbGwKYmUgaW5zdGFsbGVkIHRvIHRoZSBjb21tb24gdGFyZ2V0LyBhdCBhIHRpbWUsIG9yIHdl
J3JlIHVzaW5nIFBQRCwgc28KZWFjaCBwYWNrYWdlIHdpbGwgZ2V0IGluc3RhbGxlZCBpbnRvIGl0
cyBvd24gdGFyZ2V0Ly4gVGh1cywgLS1uby10cmFjawpoYXMgbm8gYWR2ZXJzZSBzaWRlIGVmZmVj
dCBmb3IgdXMuCgpDbG9zZXM6ICMxNwoKWzBdIGh0dHBzOi8vZG9jLnJ1c3QtbGFuZy5vcmcvY2Fy
Z28vcmVmZXJlbmNlL2NvbmZpZy5odG1sI2luc3RhbGxyb290ClsxXSBodHRwczovL2RvYy5ydXN0
LWxhbmcub3JnL2NhcmdvL2NvbW1hbmRzL2NhcmdvLXVuaW5zdGFsbC5odG1sClsyXSBodHRwczov
L2RvYy5ydXN0LWxhbmcub3JnL2NhcmdvL2NvbW1hbmRzL2NhcmdvLWluc3RhbGwuaHRtbAoKUmVw
b3J0ZWQtYnk6IFRob21hcyBLaW5kbGVyIEB0aG9tYXNrNzcKU2lnbmVkLW9mZi1ieTogWWFubiBF
LiBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+Ci0tLQogcGFja2FnZS9wa2ctY2FyZ28u
bWsgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
cGFja2FnZS9wa2ctY2FyZ28ubWsgYi9wYWNrYWdlL3BrZy1jYXJnby5tawppbmRleCA0MWRmY2Jk
MDk2Li5kOTRhMTkwMjRlIDEwMDY0NAotLS0gYS9wYWNrYWdlL3BrZy1jYXJnby5taworKysgYi9w
YWNrYWdlL3BrZy1jYXJnby5tawpAQCAtMjc5LDYgKzI3OSw3IEBAIGRlZmluZSAkKDIpX0lOU1RB
TExfVEFSR0VUX0NNRFMKIAkJCS0tcm9vdCAkJChUQVJHRVRfRElSKS91c3IvIFwKIAkJCS0tYmlu
cyBcCiAJCQktLXBhdGggLi8gXAorCQkJLS1uby10cmFjayBcCiAJCQktLWZvcmNlIFwKIAkJCS0t
bG9ja2VkIFwKIAkJCS1aIHRhcmdldC1hcHBsaWVzLXRvLWhvc3QgXApAQCAtMjk4LDYgKzI5OSw3
IEBAIGRlZmluZSAkKDIpX0lOU1RBTExfQ01EUwogCQkJLS1yb290ICQkKEhPU1RfRElSKSBcCiAJ
CQktLWJpbnMgXAogCQkJLS1wYXRoIC4vIFwKKwkJCS0tbm8tdHJhY2sgXAogCQkJLS1mb3JjZSBc
CiAJCQktLWxvY2tlZCBcCiAJCQkkJCgkKDIpX0NBUkdPX0lOU1RBTExfT1BUUykKLS0gCjIuNDYu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
