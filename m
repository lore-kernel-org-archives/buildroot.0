Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 641E6CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 21:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FA5840CF0;
	Sat, 30 May 2026 21:51:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 66-kpcET9xnm; Sat, 30 May 2026 21:51:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E04D40CF7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780177892;
	bh=HjjuGXAM3sowTl0PNUT5o5Oie6Mw4pF1uHXslCrESCo=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=FBLpb/nRPhWHggTi2Aw2/6LCeGXBWWysVnMwYMDDOsX+qkAbjInvlI8mFB+Yn8sZi
	 aQI8drxjM56LHxk6Kw0vpmxeD1XhEpQ2nTAVXx0T7/vH2HwF4fonJ1JiS3lkUOyU2W
	 eoRKngRUcLqoqeGv9ajbYimOE3Z2F+YptGhB20t+pECQ5YSXgoUPPjmFeAtPUY9LWO
	 tVX72kk3l9SZ8zbvIwv4FRWiMylOIiPNapFi4+EoyGHxRX3HC02XpjFDwfCwkrFCPE
	 j1FE/cpcDbaPyY5e7rjC9Vd9fB3Zdbymvrv/NDfq8xlxpEDvB5GhCEajCSPPo9GVxa
	 mWsyBSRsiZ88w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E04D40CF7;
	Sat, 30 May 2026 21:51:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C62A2D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B77F74230C
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:51:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NJvoA3XHHtzE for <buildroot@buildroot.org>;
 Sat, 30 May 2026 21:51:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A62234010F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A62234010F
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A62234010F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:51:29 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-490a7877068so1219315e9.3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 14:51:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780177887; x=1780782687;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iL99UOMGu030PaSJwYvOk+0IGHBJjOH1MDw/y5McIpo=;
 b=oaTjoxONVDlNvWboCs4PzXE8gTmr5wuXwNdMDyND7pRodyF8tQbIUI0rSY5nFzLRHF
 DdoRMhBrV7GSJ8p8xi2Z0xvldbVPZ1mn35HgndnTUWqrs0s9XxNB9uiL2wchJR/ow5dK
 k6IivjAOdGoEDd4sh/VT+mUitQQ9G7DFoH5fbWIrO6mMimqo0dZt1KDzO+I2DtNtOrw3
 HCs6++yX7dkwJkXMM131EvC5DQcvoTd6q0R0TzVUXq/UZnGVUCdKnG41CLNowtTayo8s
 P7DpfRewKiBqrGHZbp6N2zPAbXV6XXaRDvtVR47j2gE+R/syDoMTJDGNwjM9XlX1sa1e
 bq9g==
X-Gm-Message-State: AOJu0YyM0RWmqsuKG8e2ZcOi5UvpFCh3UtKBWohTZiY160Ln4xhSG7I5
 a3tBp/xzPfVI2Ty6G25ok4lxU7Cwz31gROCFOF5Vk/y1FaL35kR4q9/zgYNmQOcRKeCmALRUEfr
 mz9DX
X-Gm-Gg: Acq92OFP8iSsm33qLJeDKNmsBIKisc2FZ5MLBaSfnOAiWwHE+ySjmHc3OdfmfjArIxC
 uDYziIdPAVvkgKfoMzyV7l86GFh9S4hS6yCbe+kBmkEAH+xxXuShqXF1ClOx29p/gAa4uzwEb3l
 p2XlKJGxgTMGlbLGWZpmHyxKyZFw1aELVsQuU9HmrDW/lFj9W/vEGcaP+/DF12NNj4th6Js2099
 +96w8FnZfuyRrPdT6Os4ibGPtfIMAsq72u2YUZ28d+wpDEdkGjfbw8iE/HiQLTAjJhO4LdchgyF
 ohk1p80IDAJf4bDv2XV3Ar0tgEp1ToElK0wIoGn+apN26w85uTkvaPrZu0ype8GTePPTE6ww6bn
 bIlEEm521pNKMDy5bZJNdKbAR64B1/FU9dZjEYYeLDEqU8uZJV+CpqavI6HMdddaLtTM5gqgvae
 QEP2ZOjndoDysaf9MV80/5aTdSALhWWD/A40vA/Vk=
X-Received: by 2002:a05:600c:5544:b0:48e:6db3:ff33 with SMTP id
 5b1f17b1804b1-490a29438camr68525635e9.14.1780177887253; 
 Sat, 30 May 2026 14:51:27 -0700 (PDT)
Received: from dragon ([2a01:e0a:1015:b940:d4d1:7b69:edd2:59ef])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909d68a925sm207321005e9.2.2026.05.30.14.51.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 May 2026 14:51:26 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Alistair Francis <alistair@alistair23.me>,
	vincent.stehle@arm.com
Date: Sat, 30 May 2026 23:51:23 +0200
Message-ID: <20260530215124.1786348-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780177887; x=1780782687; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iL99UOMGu030PaSJwYvOk+0IGHBJjOH1MDw/y5McIpo=;
 b=Rektl3W+WaQ7ypYmm8ydhV7/Po5sy+76gtVHKrGLx+yBQS9IjRYAWwMclHT1cw0a8f
 ZaEkBRitwyajtmAOzFfuctpyVnF3RHtwQ225g7ktgTPrxKoOKhCpeGE8FAwxxFcJ1xvN
 Ah6Ntcad/YqFHpqkbLgJv8qwCfLES5YwU6WCIBwvTV/OaYq/o2pFVC3VfjmP5D+5oJqU
 1/RzU/6rXNELrej10HBHlPXYX/p7ALiAi3S7AKKJjW4PT5kmMzzYO+407Urkg/G997T0
 MynmMoY9+KXfViyOD6dgoxbt8fVLZjbAku7eEbeaPQp977IPifXVuHPyu37pAMN+MQ89
 V/Mw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Rektl3W+
Subject: [Buildroot] [PATCH RFC 0/1] package/xen: bump to v4.19.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBzZXJpZXMgaXMgYSBmb2xsb3ctdXAgb24gYW4gZWFybGllciwgbW9yZSBhbWJpdGlvdXMg
aW5pdGFsIHBhdGNoIGJ1bXBpbmcKWGVuIHRvIHY0LjIwIFswXS4gVGhpcyBmb2xsb3ctdXAgY2Fy
cmllcyB0aGUgd29yayBmcm9tIFZpbmNlbnQgWzFdLCB3aXRoCnRoZSBmb2xsb3dpbmcgY2hhbmdl
czoKCi0gUmViYXNlIG9uIHRvcCBvZiB0aGUgbGF0ZXN0IEJ1aWxkcm9vdCBtYXN0ZXIgKGFzIG9m
IDIwMjYtMDUtMzApCi0gUmVudW1iZXIgcGF0Y2hlcyB0byAwMDAxLTAwMDQKLSBTcXVhc2ggYWxs
IGluZGl2aWR1YWwgdmVyc2lvbiBidW1wcyBmcm9tIDQuMTQgdG8gNC4xOSBpbiBhIHNpbmdsZSBw
YXRjaAotIEJ1bXAgZnVydGhlciB0byBYZW4gNC4xOS41CgpUaGlzIGluaXRpYWwgcHJvcG9zYWwg
aXMgUkZDLCBhcyB0aGVyZSB3ZXJlIGEgZmV3IHRoaW5ncyBpbiBWaW5jZW50J3MgcHJvcG9zYWwK
SSB3b3VsZCBsaWtlIHRvIGNsYXJpZnkgYW5kIGZpeCB1cCBiZWZvcmUgc3VibWl0dGluZyB0aGUg
YWN0dWFsIHBhdGNoLgoKQm90aCBYZW4gcnVudGltZSB0ZXN0cyAoZm9yIEFybVY3IGFuZCBBYXJj
aDY0KSBhcmUgc3RpbGwgcGFzc2luZy4KCkBWaW5jZW50OiBoZXJlIGFyZSBhIGZldyBxdWVzdGlv
bnMgZm9yIHlvdToKCi0gQ291bGQgeW91IGJyaWVmbHkgZXhwbGFpbiB3aHkgdGhlIHBhdGNoICJO
byB0cmFjZSBiYWNrZW5kIiBpcyBuZWVkZWQgPwotIFlvdSBoYWQgYSBwYXRjaCB0aGF0IHdhcyBv
bmx5IG5hbWVkICJEZWJ1ZyIgdGhhdCBJIHJlbmFtZWQgdG8gIlVwZGF0ZSBsaW5rZXIKICBmbGFn
cyIuIENvdWxkIHlvdSBoZWxwIG1lIHdyaXRpbmcgZG93biBhIGJldHRlciBkZXNjcmlwdGlvbiBm
b3IgaXQgPwotIEkgZG9uJ3QgbGlrZSBkaXNhYmxpbmcgdGhlIC1XZXJyb3IgZmxhZywgYXMgd2Ug
Z2VuZXJhbGx5IHdhbnQgdG8gY2F0Y2ggYXMKICBtdWNoIHByb2JsZW1zIGFzIHBvc3NpYmxlLiBJ
IHVuZGVyc3RhbmQgdGhpcyBzZWVtcyB0byBiZSBuZWVkZWQgdG8gdGhlCiAgaGVhZGVyIGluY2x1
c2lvbiBvcmRlciBpbiB5b3VyIHBhdGNoIGluaXRpYWxseSBuYW1lZCAiRGVidWciLCBidXQgdGhl
cmUKICBjb3VsZCBiZSBhIGJldHRlciBvcHRpb24gPwoKRmluYWxseSwgdGhlIG5leHQgc3RlcCB3
b3VsZCBiZSB0byBidW1wIHRvIFhlbiA0LjIwIGFuZCBldmVuIDQuMjEsIGJ1dCB0aGlzIGlzCmxl
c3MgdHJpdmlhbCBhcyB0aGV5IGFyZSBzaWduaWZpY2FudCBjaGFuZ2VzIGluIHRoZSBidWlsZCBz
eXN0ZW0gZm9yIHFlbXUKdGhhdCBpcyBzaGlwcGVkIGludGVybmFsbHkgd2l0aCBYZW4uCgpbMF0g
aHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDI1
MTAwNzE2NDc1Ni44OTMyNjQtMS10aXRvdWFuLmNocmlzdG9waGVAbWluZC5iZS8KWzFdIGh0dHBz
Oi8vZ2l0aHViLmNvbS92c3RlaGxlL2J1aWxkcm9vdC9jb21wYXJlLzc0ZGNkYTI1NDQuLi5mb3It
dGl0b3VhbgoKQmVzdCByZWdhcmRzLApUaXRvdWFuCi0tClZpbmNlbnQgU3RlaGzDqSAoMSk6CiAg
cGFja2FnZS94ZW46IGJ1bXAgdG8gdjQuMTkuMgoKIC5jaGVja3BhY2thZ2VpZ25vcmUgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAgNSArLQogLi4uZGUtbGludXgtbGltaXRzLmgtZm9yLVhB
VFRSX1NJWkVfTUFYLnBhdGNoIHwgIDE1ICstCiAuLi4vMDAwMi1GaXgtYnVpbGQtd2l0aC02NC1i
aXRzLXRpbWVfdC5wYXRjaCAgfCAgOTUgLS0tLS0tLQogcGFja2FnZS94ZW4vMDAwMi1Oby10cmFj
ZS1iYWNrZW5kLnBhdGNoICAgICAgIHwgIDM1ICsrKwogLi4uLUFybS1wbGF0Zm9ybXMtZml4LWJ1
aWxkLXdpdGgtZ2NjMTUucGF0Y2h9IHwgIDE2ICstCiAuLi4tbGlicy1saWdodC1maXgtdHZfc2Vj
LXByaW50Zi1mb3JtYXQucGF0Y2ggfCAgNjMgLS0tLS0KIHBhY2thZ2UveGVuLzAwMDQtVXBkYXRl
LWxpbmtlci1mbGFncy5wYXRjaCAgICB8ICA4MCArKysrKysKIC4uLmxpYnMtbGlnaHQtZml4LXR2
X3NlYy1mcHJpbnRmLWZvcm1hdC5wYXRjaCB8ICAzMCAtLS0KIC4uLi1kcm9wLWJvZ3VzLWFuZC1v
YnNvbGV0ZS1wdHlmdW5jcy5tNC5wYXRjaCB8IDI1MyAtLS0tLS0tLS0tLS0tLS0tLS0KIC4uLl9p
cnFfdG9fZGVzYy10by1maXgtYnVpbGQtd2l0aC1nY2MxNC5wYXRjaCB8ICA2MiAtLS0tLQogLi4u
ZC0ucm9kYXRhLXRvLWJlLW1hcmtlZC1hcy1leGVjdXRhYmxlLnBhdGNoIHwgIDU4IC0tLS0KIC4u
LnNvbGFyaXMtc3ludGF4LWZvci0uc2VjdGlvbi1kaXJlY3Rpdi5wYXRjaCB8ICA3MyAtLS0tLQog
cGFja2FnZS94ZW4vQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKIHBh
Y2thZ2UveGVuL3hlbi5oYXNoICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMiArLQogcGFj
a2FnZS94ZW4veGVuLm1rICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA3ICstCiAxNSBm
aWxlcyBjaGFuZ2VkLCAxMzggaW5zZXJ0aW9ucygrKSwgNjU3IGRlbGV0aW9ucygtKQogZGVsZXRl
IG1vZGUgMTAwNjQ0IHBhY2thZ2UveGVuLzAwMDItRml4LWJ1aWxkLXdpdGgtNjQtYml0cy10aW1l
X3QucGF0Y2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3hlbi8wMDAyLU5vLXRyYWNlLWJh
Y2tlbmQucGF0Y2gKIHJlbmFtZSBwYWNrYWdlL3hlbi97MDAwOS1Bcm0tcGxhdGZvcm1zLWZpeC1i
dWlsZC13aXRoLWdjYzE1LnBhdGNoID0+IDAwMDMtQXJtLXBsYXRmb3Jtcy1maXgtYnVpbGQtd2l0
aC1nY2MxNS5wYXRjaH0gKDcyJSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3hlbi8wMDAz
LWxpYnMtbGlnaHQtZml4LXR2X3NlYy1wcmludGYtZm9ybWF0LnBhdGNoCiBjcmVhdGUgbW9kZSAx
MDA2NDQgcGFja2FnZS94ZW4vMDAwNC1VcGRhdGUtbGlua2VyLWZsYWdzLnBhdGNoCiBkZWxldGUg
bW9kZSAxMDA2NDQgcGFja2FnZS94ZW4vMDAwNC1saWJzLWxpZ2h0LWZpeC10dl9zZWMtZnByaW50
Zi1mb3JtYXQucGF0Y2gKIGRlbGV0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3hlbi8wMDA1LXRvb2xz
LWRyb3AtYm9ndXMtYW5kLW9ic29sZXRlLXB0eWZ1bmNzLm00LnBhdGNoCiBkZWxldGUgbW9kZSAx
MDA2NDQgcGFja2FnZS94ZW4vMDAwNi1Bcm02NC1hZGp1c3QtX19pcnFfdG9fZGVzYy10by1maXgt
YnVpbGQtd2l0aC1nY2MxNC5wYXRjaAogZGVsZXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UveGVuLzAw
MDcteGVuLWFybTMyLWF2b2lkLS5yb2RhdGEtdG8tYmUtbWFya2VkLWFzLWV4ZWN1dGFibGUucGF0
Y2gKIGRlbGV0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3hlbi8wMDA4LWFybS1Bdm9pZC11c2luZy1z
b2xhcmlzLXN5bnRheC1mb3ItLnNlY3Rpb24tZGlyZWN0aXYucGF0Y2gKCi0tIAoyLjU0LjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
