Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F48606A321
	for <buildroot@archiver.kernel.org>; Wed, 11 Nov 2026 15:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Zuk5/L3Y;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xwTBLQYz
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 667BA8129C;
	Wed, 11 Nov 2026 15:46:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vWa6utVJQA0s; Wed, 11 Nov 2026 15:46:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1E9C081307
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794411967;
	b=ONddjIkxxxx57yu5U+A6dfPf8cUx1DngzK7wlnMqMviYGNtUT8LXN7bFFMeG3YznmYnZ
	 efFIVVziz9j7u3BEMpKLoud7q3oq5YdPbm+MA/jBfQuW8nB3mwnySQPvBflMDeXxqKpLu
	 tUCTCGd9Pmcb1MYx4cT/03TGW6RIVjF7eV6+l7Of7VQhpl+uFhYlLBP6ijG96ropgm6g/
	 S29ISla/6OiFwDOnkjrxGTNeFaa1bXGaP6yNBjxESybW/90twVbMwTNXHG/OkcXGzH3p1
	 c/5bq1Si2/rl0U5FXCBgvnehCTyRNmc/97eMSZjwTAXUbsGC9nGMTpV9yAH8ylOzGVw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794411967;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=jwZd76lp50Gedi6ifPdfI7vbv1c9HQgzjbxs2EzbLbE=;
	b=U7flNitYQG68tdh8E0AshUN3h2Q299xyJIvxK4ccaBXWE6UCnjusX4WN8+EDh4pCl//Q
	 0i9CBzTp8EjbeolBkHTIuS5mZLVmOTh3tRc+cjRz8LwK4eTCr3ym9ohR+r6xrT3nZSTIy
	 +88F/e8ef07tTYt+U3p1D88RDZ5rwT8d77/kjVC805TylK9FEe0RORK4GQOqrn/75n6AK
	 qP6qV8uynifC4af7ohg3ti7CsXu7nfsYAJYESVGPr0UBNZWbh0J3C/QjKItV4Ih90mInX
	 ojEbM3dBbtZB79AeoHIMWwT+j8+0yq4r0/NUO8ivBuLqti5h3jlDDbC4SRmNcsUNjfA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xwTBLQYz;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794411967;
	bh=jwZd76lp50Gedi6ifPdfI7vbv1c9HQgzjbxs2EzbLbE=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zuk5/L3YzGJffrVLuDbvvCcbXsPU+UEPjLnHKmMcpWcnPwI2Q9V/zccF/1Xd+Ou7t
	 5MSFBUAXG+uAcUfqGIuMFdqAwdBGsQE0VSjP+pq6SUmlwIZGmF3qR2TBWaTf6VENvu
	 LZGkMO53gR7g4k+5r/MO3FGQuGHecnogVf3ftuKJCrlLK60/Pik/DVED6ZCMmZ6M9i
	 tzEIMpX5Yv6Nei8SZnfvpBcXmlbR4SlyPoPWjsV2y6ipsyv2JMdcLqO6vIVyZSAAzO
	 vWUCIKz1r1RNY+kpKJiYgvDnSNughsc24RMCF/NCrHpkrqrzWLeiCA/90xGMOQg8MX
	 +QH3qAzVfy8BQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E9C081307;
	Wed, 11 Nov 2026 15:46:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 020E12FE
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 15:46:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7843812A0
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 15:46:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hnwDwx_e77OI for <buildroot@buildroot.org>;
 Wed, 11 Nov 2026 15:46:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 11B6580CD4
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::435"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=xwTBLQYz
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 11B6580CD4
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 15:46:01 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-497614c95f0so1823425f8f.1
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 07:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794411959; x=1795016759; darn=buildroot.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=POOqq2So8iPQHmW/9anCsqZtDH3jYe41WMrztzmbR/o=;
 b=xwTBLQYzRptP553MlYxmugSJzV8LD6tI4KL+N2YhfKNxoFiDEe1N4paXL7bzbK96hG
 82PqChD5RdUoZA2G7aX6ElcemNUOGUcVb6KvK0kWyvCG3XTFW9y6Js7v8mdY/Ys8c3+E
 Av7EtRbtKlZz5GDGu7Fqiitwaz24W0YlLYW9ZxBNCzdRGXEIo2lHWNCugMZXrLgdShJQ
 MBwIOF3KfpzurMdNw9JesOZyh0gPnI16bsaVVwRBQBxMq2SePTAG3uWDXJZ3U2tqTZRP
 oV2wepk+Aeg/66ZwqVDJAEDNvQ48AkveCEDPNgjhk7cttPLpjTKbp2Vsl9CA0wgKlSIx
 3oLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794411959; x=1795016759;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=POOqq2So8iPQHmW/9anCsqZtDH3jYe41WMrztzmbR/o=;
 b=qKyl3aKRUyuEdhwu8hTzEvvjbBf/oz19JgzTg7oBR6t1AIRzHAewAwXK1Fv8iJrFuc
 Xqh1jwY12RrjmVThS7wxxN+tzyQJCAB1VXFnQiew+i/LofeGJsSiNryjdhqJXb7P5jlD
 9jxPSz6bqo17HaniQmnGJeDJkXzwUNwSSI2hToZuRvyyqMxG4ZIFTGkkt7EjYruhHWZ/
 HWvPxtIFhyBOklh+kmiD0yoaYq3TRP0peIVTKUPk13rpIgpW4hfPHfL8QLrg1RZZvLEY
 eSmOqNF96dfpN7e8PYwIX8We2v0WRcNpNwYwhUeVWwIXA8tmohk1Hbzr0JclHUJc0R2z
 U+BQ==
X-Gm-Message-State: APuU4Z9hMiYZBA+PQCZzPS1H2RKbbM28j1YADuIw6u/L/b5r2mO15lef
 y2vm3MK+cSiiRo+3akAn4W0+vdH/wtuBKKCY79VZjljNFzNNhUAhzKaH988hICbh
X-Gm-Gg: AYBFou1t6Kt9pbB17j/Qx02dyHYYyLnHnCVG3CviYoUnffl/f/qk1pWnBc3N1toWNqi
 xfKUEEqKgm5TKZ6bCzhKIxidN4BO4jnzT5YJ3ngPuMqZLR9sJoR8gq25IGlamWLKJ+EOHUDMbV9
 QCGTLG92yWLP5s9AmcHXzc/9OVYsR6BySBFpluwyGYZQTGSu8W9l1s3JFHgRA3zAqfIiAHtbqRT
 vvVwHg9BQ2ixQgBr6mx2XGPBYKhbyHFJC9i+VZCak4D9Ya2ByG9PBSkuzd7a9OsRcz8aK+/OziF
 9Z+77NYJbV7n4KDvo6fTu0agYDKHEj24zQsQUxSmQTGakE4jwIQUNuZuwprQvuPeS1IoQxG5j9Q
 2R+TW2gFd0UyOCUJlMYuqjo5fxb5/HegmLuSXC2exj+Th0/Hgp3OexIgL9TMzUeIm+FTfNQm7oa
 fs1fRP8EDCoJuT8agXww3WxVY4yZzRJPmmZLPT4PMQre5cCp9EelN3ApARN3nkAbDhcmu9vD4F4
 m1zh2JxaGSdo5WhkL9c6dtkkYNtsazb8whrd/87LJhmnXyRGcAYqmqQcyrJCtq4wdFbM7dZ20LV
 22t5egklonbaV2vxJwa+pTjWzWy96HicRCjKgJF8LKLfj9/FuZq5
X-Received: by 2002:a05:600c:c167:b0:4a5:dc5d:20f7 with SMTP id
 5b1f17b1804b1-4ba09382f6fmr49445365e9.14.1794411959078; 
 Wed, 11 Nov 2026 07:45:59 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb4c53bb94sm4574095e9.8.2026.11.11.07.45.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2026 07:45:58 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Biagio Montaruli <biagio.hkr@gmail.com>,
 Edgar Bonet <bonet@grenoble.cnrs.fr>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Simon Dawson <spdawson@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 11 Nov 2026 16:45:50 +0100
Message-ID: <20261111154553.673632-4-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111154553.673632-1-angelo.compagnucci@gmail.com>
References: <20261110215557.2248804-1-angelo.compagnucci@gmail.com>
 <20261111154553.673632-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 4/6] boot/at91bootstrap3: drop the patch for
 3.10.3
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

Tm8gZGVmY29uZmlnIHVzZXMgQVQ5MUJvb3RzdHJhcCAzLjEwLjMgYW55bW9yZTogdGhlIGJ1aWxk
IGZpeCBmb3IKR0NDIDE1IGlzIGNhcnJpZWQgZm9yIDMuMTAuNCwgdGhlIDMueCB2ZXJzaW9uIG9m
IHRoZSBwYWNrYWdlLgoKU2lnbmVkLW9mZi1ieTogQW5nZWxvIENvbXBhZ251Y2NpIDxhbmdlbG8u
Y29tcGFnbnVjY2lAZ21haWwuY29tPgotLS0KQ2hhbmdlcyB2MSAtPiB2MjoKICAtIG5vbmUKLS0t
CiAuLi5jb25kaXRpb25hbGx5LWRlZmluZS1ib29sLWZhbHNlLWFuZC0ucGF0Y2ggfCA0NyAtLS0t
LS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNDcgZGVsZXRpb25zKC0pCiBkZWxldGUg
bW9kZSAxMDA2NDQgYm9vdC9hdDkxYm9vdHN0cmFwMy92My4xMC4zLzAwMDEtaW5jbHVkZS10eXBl
cy5oLWNvbmRpdGlvbmFsbHktZGVmaW5lLWJvb2wtZmFsc2UtYW5kLS5wYXRjaAoKZGlmZiAtLWdp
dCBhL2Jvb3QvYXQ5MWJvb3RzdHJhcDMvdjMuMTAuMy8wMDAxLWluY2x1ZGUtdHlwZXMuaC1jb25k
aXRpb25hbGx5LWRlZmluZS1ib29sLWZhbHNlLWFuZC0ucGF0Y2ggYi9ib290L2F0OTFib290c3Ry
YXAzL3YzLjEwLjMvMDAwMS1pbmNsdWRlLXR5cGVzLmgtY29uZGl0aW9uYWxseS1kZWZpbmUtYm9v
bC1mYWxzZS1hbmQtLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAzNTJjMWMw
YTQzLi4wMDAwMDAwMDAwCi0tLSBhL2Jvb3QvYXQ5MWJvb3RzdHJhcDMvdjMuMTAuMy8wMDAxLWlu
Y2x1ZGUtdHlwZXMuaC1jb25kaXRpb25hbGx5LWRlZmluZS1ib29sLWZhbHNlLWFuZC0ucGF0Y2gK
KysrIC9kZXYvbnVsbApAQCAtMSw0NyArMCwwIEBACi1Gcm9tIDkwOGM2NTY3ODg2NzU2NWE5MzRl
YTVhOTY3YmZlN2UyMDRkMWNjYWYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBFZGdh
ciBCb25ldCA8Ym9uZXRAZ3Jlbm9ibGUuY25ycy5mcj4KLURhdGU6IFdlZCwgMjUgSnVuIDIwMjUg
MTE6MTM6NDMgKzAyMDAKLVN1YmplY3Q6IFtQQVRDSF0gaW5jbHVkZS90eXBlcy5oOiBjb25kaXRp
b25hbGx5IGRlZmluZSBib29sLCBmYWxzZSBhbmQgdHJ1ZQotTUlNRS1WZXJzaW9uOiAxLjAKLUNv
bnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAotQ29udGVudC1UcmFuc2Zlci1F
bmNvZGluZzogOGJpdAotCi1pbmNsdWRlL3R5cGVzLmggdHlwZWRlZnMg4oCYYm9vbOKAmSBhbmQg
bWFjcm8tZGVmaW5lcyDigJhmYWxzZeKAmSBhbmQg4oCYdHJ1ZeKAmS4KLUhvd2V2ZXIsIHNpbmNl
IEMyMywgdGhlc2UgYXJlIHByZWRlZmluZSBrZXl3b3Jkcy4gQXMgQzIzIGlzIHRoZSBkZWZhdWx0
Ci1DIGRpYWxlY3QgZm9yIEdDQyAxNSwgYnVpbGRpbmcgd2l0aCB0aGlzIGNvbXBpbGVyIGZhaWxz
IHdpdGg6Ci0KLSAgICBpbmNsdWRlL3R5cGVzLmg6MjM6MjM6IGVycm9yOiDigJhib29s4oCZIGNh
bm5vdCBiZSBkZWZpbmVkIHZpYSDigJh0eXBlZGVm4oCZCi0gICAgICAgMjMgfCB0eXBlZGVmIHVu
c2lnbmVkIGNoYXIgYm9vbDsKLSAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICBefn5+
Ci0gICAgaW5jbHVkZS90eXBlcy5oOjIzOjIzOiBub3RlOiDigJhib29s4oCZIGlzIGEga2V5d29y
ZCB3aXRoIOKAmC1zdGQ9YzIz4oCZIG9ud2FyZHMKLQotRml4IHRoaXMgYnVpbGQgZmFpbHVyZSBi
eSBvbmx5IGRlZmluaW5nIOKAmGJvb2zigJksIOKAmGZhbHNl4oCZIGFuZCDigJh0cnVl4oCZIG9u
IEMKLWRpYWxlY3RzIG9sZGVyIHRoYW4gQzIzLgotCi1VcHN0cmVhbTogaHR0cHM6Ly9naXRodWIu
Y29tL2xpbnV4NHNhbS9hdDkxYm9vdHN0cmFwL3B1bGwvMTg4Ci1bRWRnYXI6IGJhY2twb3J0IHRv
IHYzLjEwLjNdCi0KLVNpZ25lZC1vZmYtYnk6IEVkZ2FyIEJvbmV0IDxib25ldEBncmVub2JsZS5j
bnJzLmZyPgotLS0tCi0gaW5jbHVkZS90eXBlcy5oIHwgMyArKysKLSAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspCi0KLWRpZmYgLS1naXQgYS9pbmNsdWRlL3R5cGVzLmggYi9pbmNsdWRl
L3R5cGVzLmgKLWluZGV4IDEyNDZhNGRmLi4yYzFhNDFjZiAxMDA2NDQKLS0tLSBhL2luY2x1ZGUv
dHlwZXMuaAotKysrIGIvaW5jbHVkZS90eXBlcy5oCi1AQCAtNDIsOCArNDIsMTEgQEAgdHlwZWRl
ZiBzaWduZWQgbG9uZyBsb25nIHM2NDsKLSB0eXBlZGVmIHVuc2lnbmVkIGxvbmcgc2l6ZV90Owot
IHR5cGVkZWYgc2lnbmVkIGxvbmcgc3NpemVfdDsKLSAKLSsvKiBib29sLCBmYWxzZSBhbmQgdHJ1
ZSBhcmUgcHJlZGVmaW5lZCBzaW5jZSBDMjMuICovCi0rI2lmIF9fU1REQ19WRVJTSU9OX18gPCAy
MDIzMTFMCi0gdHlwZWRlZiB1bnNpZ25lZCBjaGFyIGJvb2w7Ci0gI2RlZmluZSBmYWxzZQkwVQot
ICNkZWZpbmUgdHJ1ZQkxVQotKyNlbmRpZgotIAotICNlbmRpZiAvKiBUWVBFU19IXyAqLwotLS0g
Ci0yLjQzLjAKLQotLSAKMi41My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
