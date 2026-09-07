Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7331BC79F89
	for <buildroot@archiver.kernel.org>; Mon,  7 Sep 2026 13:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11D468096F;
	Mon,  7 Sep 2026 13:47:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nNKv5HdpBkLo; Mon,  7 Sep 2026 13:47:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D492F808D9
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788788877;
	b=G0K/6KcmezF9LUhO40uM1lI9hm1y1A3OOpKp0NKKaWZszfgTVd183IuPp4WOwMTBSfwJ
	 Mb3F6kPH3axHlt+63rkSAzYOEjNCqOCdeAyvEzqgH30TRz6hs5uvqDcdTXAdFG6w6vusi
	 PwTGlowiPYyR/RnVonGFH2+3wFS6YIR8gbNX+NY8QI47ea71muQBUEqkviUivjvw4hGqB
	 DXDCofQtt4Jqmkl6F87BfoZ4UuBRCN3sRVkpwsJs3vW2vzGJl6j9r5Cc8PmsoOmwfo9ah
	 zuX9WW9H9I20fhk+j8MKlOvIwSx3nZkFTr72n0kZuPzq74V5BW4KSxZll/asVfwu39A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788788877;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:Message-Id:MIME-Version:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=/SupDNKNbhpAt8bMbA0jxbZnkSuR1AR4kwfRQthWxsY=;
	b=dtPnA8dwCnviYXQ+nyE9U+37sesl5rslIbJdeo3N10iKvyhmzhzyKtwXrMZukvBfOlNv
	 IbT2tBbjv6bhIkRZJ0xxs8H4lI+ffT66nI2D2T6LJYavXUh7ldBGm5s0MizpvrCgGUWl3
	 NIitJsaypNJ+dpBxXtAFSM/HixiCMemIiMvvdVJFnphNd5y72JWqQ0iTJTfq8Q1D07SDL
	 XWB/WtbgW2EaO01o+vtNpJc8XFBghOcZgjHr/enKRrj/lVP4fIZ4pdEXaeUungliqKDCh
	 r3+OrbWCoKtukxqkCXnOMPaeDAdFvUUI3fitMxX0aWrX7fMn79HGY2BoWId+alFmZwg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788788876;
	bh=/SupDNKNbhpAt8bMbA0jxbZnkSuR1AR4kwfRQthWxsY=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=AUeKJNNUofSgvnHp6wjToMscA/kU5e2P8TnEOyD2E8zy+NYxHxx23wjJp3kBySUZr
	 5GT1spPXwBUGajOOv0KZwqEtsV3b4Z/Vcn6nKvg/imrbEj5dwkD+9zmYnFcWJ0fliq
	 b0/X/8VMmtZIGv1HSJK4tjWBKqul0mBwbsjgPz02Jy9SD6hf14uBQB5Yq3r0usT7kT
	 wo5yzspJk+vQzqsWYQQz6fijHbtlF22Cq+eDILAVUQR3KTfoMXcVqRMeSoyrdwrdbi
	 m6WCVC4omD2WrBZx9ym/XLeogaJ7Gr129IGlVALnybQwrrvDM6ZF+d7YGj5ZZwZn3Y
	 dEkHXGve3x3Uw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D492F808D9;
	Mon,  7 Sep 2026 13:47:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BE6FA48
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 13:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E492808D9
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 13:47:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q-DQaX-ES88M for <buildroot@buildroot.org>;
 Mon,  7 Sep 2026 13:47:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 724B0808A9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788788872;
 b=KArOwQioUkNvxGDoWiDvQfmOHHSYsG6y1aS5UWo8y3a1aqAfXMmZpnqMmpm1we83RHQm
 cYXDFt9Omp+hqsipmVr5jRq64TuQbXlFTGIXYjXhmfgevcDjFANMjH6zDyv7Dh8rK7sxr
 9BmxiwVuGFO59+tocg6tpa2QLYoaDirxXSaHhtpkkQnfsSxtSX4vgjdw81j2VQ8Z5J10y
 8sbN8dOk3AIJGVUkn80gk0y/G2wrOEJW8HT+rWU8O9yhD2iEE7lWdZdqSe5rgdyuI6D0k
 Q+6A3AoZD5oVAg/57vjo4A3LZVKHchZn/n+P3+KNShKTXtwbr7dzP+rqSTdhYE+q9PA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788788872;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:Subject:
 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
 bh=eD820Qa6BA7eM6swIlorT0UQg7UGJzKF7pI3SuM3QNA=;
 b=TpFTJO1a65CjR9CJfhVmixwZN2VYjZcJCHTJYEjYFH6PAcY6OoAH5tOCeMK/N63Wc4F8
 1bKTHoiPwC2S/s0JGasqVqOy7cyvBTxpgDHpuvMDGGreIsEnibbOonOm10DGnOvVVr/IG
 +QKJJfQoffAZta09cjg+28aUDz38BUisTcMnMpW4ayUlprhYseasIQtf/wLMpa8st2ixr
 xtyfo6q4BKlWgqtlF75C3hHvzylnPS2UBRYCnN/IZxUvwP5O0MlFhjRvCfm56JCanlCtU
 Qcs0WuVNceM3Q6VvOcv32HrGcAY1pk/QCVfjWcBSjeGFePUnVY+e9gvptfqjp4mWC3A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="Tcz9/sah"; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 724B0808A9
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 13:47:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 0F4C61A1A36
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 13:47:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D848960383
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 13:47:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AD5F311C79257; 
 Mon,  7 Sep 2026 15:47:42 +0200 (CEST)
Date: Mon, 07 Sep 2026 15:47:35 +0200
Message-Id: <20260907-fix_openscap-v2-0-28f8f6ee3248@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6CMBREr0L+2pq2YAuuvIchBspHvpGWtEg0h
 Lvb4trly8y8WSGgJwxwzlbwuFAgZyPIQwZmaOwdGXWRQXKpuBKK9fS+uQltMM3ECsExr3Sv5Ul
 DnEweY77rrvWPw6t9oJmTIzUGCrPzn/1vEan3R70IJhhy2RV5WeqcV5fWuflJ9mjcCPW2bV+ZD
 k/JvAAAAA==
X-Change-ID: 20260616-fix_openscap-410e397f7257
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH v2 0/2] package/openscap: fix and test build
 failure related to crypto
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCnRoaXMgaXMgdjIgb2YgYSBzbWFsbCBzZXJpZXMgYWltaW5nIHRvIGZpeCBhbiBvcGVu
c2NhcCBidWlsZCBmYWlsdXJlCm9jY3VyaW5nIHdoZW4gbm8gY3J5cHRvIGJhY2tlbmQgaXMgc2Vs
ZWN0ZWQgKHRoaXMgY2FuIGN1cnJlbnRseSBoYXBwZW4Kb24gbWFzdGVyIGlmIG9wZW5zY2FwIEFO
RCBzdGF0aWMgbGlicyBhcmUgc2VsZWN0ZWQpLiBUaGUgaW5pdGlhbApyZXZpc2lvbiBpcyBhIGZl
dyBtb250aHMgb2xkOyB0aGUgdXBzdHJlYW0gb3BlbnNjYXAgcHJvamVjdCBoYXMgZml4ZWQKdGhl
IHJvb3QgaXNzdWUgc2luY2UgdGhlbiAoYmVpbmcgYWJsZSB0byBidWlsZCBvcGVuc2NhcCB3aXRo
b3V0IGFueQpjcnlwdG8gYmFja2VuZCksIHNvIHRoZSBuZXcgcGF0Y2ggaXMgcXVpdGUgZGlmZmVy
ZW50IGZyb20gdGhlIG9yaWdpbmFsLgpUaGUgc2VyaWVzIG5vdyBhbHNvIGV4cG9zZXMgc29tZSBz
bWFsbCB0ZXN0cyB0byBleGVyY2l6ZSB0aGUgZGlmZmVyZW50CndheXMgb2YgYnVpbGRpbmcgb3Bl
bnNjYXAuCgpTaWduZWQtb2ZmLWJ5OiBBbGV4aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJv
b3RsaW4uY29tPgotLS0KQ2hhbmdlcyBpbiB2MjoKLSBnbyBmdXJ0aGVyIGFuZCBhbGxvdyBvcGVu
c2NhcCB0byBidWlsZCB3aXRob3V0IGFueSBjcnlwdG8gYmFja2VuZAotIGFkZCB0ZXN0cyBmb3Ig
b3BlbnNjYXAgd2l0aCBkaWZmZXJlbnQgY3J5cHRvIGJhY2tlbmRzCi0gTGluayB0byB2MTogaHR0
cHM6Ly9wYXRjaC5tc2dpZC5saW5rLzIwMjYwNjE2LWZpeF9vcGVuc2NhcC12MS0xLWUwMmQ0Mzg4
NzMwOUBib290bGluLmNvbQoKVG86IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCkNjOiBUaG9tYXMg
UGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgpDYzogQWxleGlzIExvdGhv
csOpIDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KCi0tLQpBbGV4aXMgTG90aG9yw6kgKDIp
OgogICAgICBwYWNrYWdlOiBvcGVuc2NhcDogZml4IGJ1aWxkIGZhaWx1cmUgd2hlbiBjcnlwdG8g
YmFja2VuZCBpcyBub3QgZ2NyeXB0CiAgICAgIHN1cHBvcnQvdGVzdGluZzogYWRkIHRlc3RzIGZv
ciBvcGVuc2NhcAoKIC4uLi8wMDAxLUZpeC1idWlsZC13aXRob3V0LWNyeXB0by1zdXBwb3J0LnBh
dGNoICAgIHwgNTcgKysrKysrKysrKysrKysrKysrKysKIC4uLmdjcnlwdC1jbWFrZS12YXJpYWJs
ZXMtaWYtZ2NyeXB0LWlzLW5vdC1mLnBhdGNoIHwgNTAgKysrKysrKysrKysrKysrKysKIHBhY2th
Z2Uvb3BlbnNjYXAvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDUgLS0KIHBh
Y2thZ2Uvb3BlbnNjYXAvb3BlbnNjYXAubWsgICAgICAgICAgICAgICAgICAgICAgIHwgIDkgKyst
LQogc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9vcGVuc2NhcC5weSAgICAgfCA2
MyArKysrKysrKysrKysrKysrKysrKysrCiAuLi4vcm9vdGZzLW92ZXJsYXkvcm9vdC9iZW5jaG1h
cmsueG1sICAgICAgICAgICAgICB8ICA1ICsrCiA2IGZpbGVzIGNoYW5nZWQsIDE3OCBpbnNlcnRp
b25zKCspLCAxMSBkZWxldGlvbnMoLSkKLS0tCmJhc2UtY29tbWl0OiA4N2U5NWI5ODc3ZmZkMjlj
ZTlhMDIzOTliOGEwMDgyNjZhMWY1OTcxCmNoYW5nZS1pZDogMjAyNjA2MTYtZml4X29wZW5zY2Fw
LTQxMGUzOTdmNzI1NwoKQmVzdCByZWdhcmRzLAotLSAgCkFsZXhpcyBMb3Rob3LDqSA8YWxleGlz
LmxvdGhvcmVAYm9vdGxpbi5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
