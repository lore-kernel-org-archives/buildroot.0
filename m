Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04287CA5FE6
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 17:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBC3E60E19;
	Sat,  3 Oct 2026 17:37:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o8m7h4eCHXx7; Sat,  3 Oct 2026 17:37:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 66D9C60611
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791049038;
	b=IdCCNgWW/lft3xtPBhxbfMcL4WhoDKwIfiuuHZBzzZzYhdpuJbTTlKximt7Qt5PKQZcb
	 IO4CIRmTWyx/my8I4YeX+OWpqUatT5Z9gPmyGzKDmQQ4f/kIaLCP/Q9Q/hCdaoSSMPMFZ
	 51Zj8rhNdTxgPNuKikvmwWsOlIODWby3z6Y5pnB7W99wYiuK1rxk2dTg1z3zaqgy49a/9
	 ji51sXdNmHrEgUitIfMYr/4FtLVhEcW8ar7Fflq/N/IoN1vOj64YPvbNPgJiqyOAUF8Jf
	 dC6AyqJ82PoidmTsbPcoRGgj/f6oWvt2WA7eDQymLKvnsBMfH6qvGTOmFm9RXYR6plQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791049038;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=ewruxgy5kGCzaEK06+BeXrMs5jTz+7bLvsa3FhslKv0=;
	b=SqziYv74Khqr9502x9NGCkbbknIZF1drvJ4roJRslFb/RY4F8QlVDrXrmDfxWrSSZAwq
	 FTUjt/XY4H9pwKni7try+TCnKPmMzGhCc7sbqJ3urI4YGwIAd6P2luGXyRkJC27g3O4W+
	 hqMFfhpcgjXXOypSn2QHv7PxB5S4T+EtFoW3nwIyj6D2DvzzrQzZwYs3sG07dR1/RFjs0
	 RP/FJoFxlIRq+PCHtbmTA1bXI1D9EXSXj8EXWEDZE2dyVd7N2vfOV6/mv4vQ9xB4l5F9e
	 3FuJoRf6CDPlk2Il5cQ/YlpwGa08xpIr7FT9CdnhKoyf9CvbYUbODeJGTJuSLlikAjw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791049038;
	bh=ewruxgy5kGCzaEK06+BeXrMs5jTz+7bLvsa3FhslKv0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fDJWoPC54aCGzjvTsZr6vYsoUG01zVEh8GPmICmm+01D8hjQVv/RWLr8x/d7Cw6J6
	 q0Ljjr6YJEEQSy/asWnHwQKt6f9hIFttQwg6MbCs6uRvFsmksFCp0Vn8GY0pLj+Wgc
	 DG4Ao+mD8Dq+hWjHGusCJDnZhvDclrMuYPs0voYG0afF2KFsxJm/3lBI0UkgYYfxpj
	 FSH70aEnNPDsyCS+/I4IJDfYWFhNVVkHwnvUz5fAmX4FtPJbhVflT/efRS7poCeigi
	 0lTIbzk8qXyNtpx9tWUuxk3TH7CMoWNL0Y4Dq1YCwYEP5WTsBTyUH29TnTOHfu+HyO
	 O/HSgfo6w2uJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66D9C60611;
	Sat,  3 Oct 2026 17:37:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 92D8A263
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78E2A40847
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:37:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tsF3yCfln1uK for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 17:37:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BA65C4083D
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=94.231.106.210
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791049035;
 b=Q8eE+9VxHN/unwrUOpSgJNjcWjfcyR42IE9ws/uEx9mM3muOQTbxa3Yl95Yo8IutNM04
 Bfe9prUHslAaiDRZUQwWzz8EoKpIPNoejeFIzEosKTbrUzssf4Jz3SoYmP04HeMJOeWa1
 Qw1G5LCSp/BCHoY8cIDYBv1siggf52crEzpwgbYUhV8ML9N04XLhkMlFwKrxTo2VYozAq
 jtH/rWbGzJcAn3MkQxM3nmnMS/OqGe1CUs7tDLwI3/BCQtRnbY0fhko0cHMfQNCjatRhA
 d2BS9MalUOdgSPiLiGAnql/20Qprtfnqd311WqzyL0eJS1avawxCw3VbFn6ut5ZDltA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791049035;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 bh=qAkFsV+amUGOLO5KiCXsE2AzkAHz1SzqeoB/NOTyuSQ=;
 b=kcOkPyJdgielJw1j7MqU29irPW+Sop8zQ05mFJ0sMoXnqucWhicUDHd0Au/HBwZj27Yf
 FZbON7ZPTXdOndwEYPno0DEkW6QXHfQvICjgxQyBaQ4yASwo2YarOWf7njCAa0q46kGiu
 6dt6MOJwVyYrnc7vD6sIl9dg94vZWQp+NPT496HQrkA62lSUweS4cBhFXfuvr2zFk73iv
 Zn7ApXZxuAJL8veP9tLRQ57XQoZ8H4CXD7RdxZuIZyKubdurBGp30TBE5fP3aLQl2537K
 6g4OhnV1gYvlSuT4D5KzDar2dOwvInMOlbJX6k4mT68R1WQrS+viVh9Le+0uM+UYBtg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=none header.from=bearware.dk; 
 dkim=pass header.d=bearware.dk header.i=@bearware.dk header.a=rsa-sha256
 header.s=simplycom2 header.b="F0ne7n/5"; 
 arc=none smtp.remote-ip=94.231.106.210
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=94.231.106.210;
 helo=smtp-out3.simply.com; envelope-from=contact@bearware.dk;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=bearware.dk
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=bearware.dk header.i=@bearware.dk header.a=rsa-sha256
 header.s=simplycom2 header.b=F0ne7n/5
Received: from smtp-out3.simply.com (smtp-out3.simply.com [94.231.106.210])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BA65C4083D
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:37:14 +0000 (UTC)
Received: from macmini (85.191.81.201.dynamic.dhcp.aura-net.dk [85.191.81.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by smtp.simply.com (Simply.com) with ESMTPSA id 4hxtBb4Pzkz1FXSY;
 Sat,  3 Oct 2026 19:37:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bearware.dk;
 s=simplycom2; t=1791049031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qAkFsV+amUGOLO5KiCXsE2AzkAHz1SzqeoB/NOTyuSQ=;
 b=F0ne7n/5BbEVdUg3NBnZ9RmD2L03sCJBvpdcEZCNDQWSORHuaqonk443ryOcduMp49R4EZ
 3lByniWS4308pedeYyHD7uaWGYC7NyAbtTZWUlGb50eymmBFRqBQDw34yPT1pGK4pKsTEi
 DUsOR/sxWHsTiTIWNMsmqzFTQM+bEgQZLN/i/EuhY8EZgQXFfxyp/4p5e6uSfzUV1jDwSQ
 u+ThiAWWnMdHrRBCl417h1cmiVznzU96hfkk6vZVMhjvYH+M6eZXQJRut0aqDyu6pfx++m
 3xWcJPUWVftvZ39y/wA9OlMddUtUClozM6w7O88DTLi2fU5wAVorbcezGQ6llw==
From: =?UTF-8?q?Bj=C3=B8rn=20Damstedt=20Rasmussen?= <contact@bearware.dk>
To: buildroot@buildroot.org
Cc: Tudor Holton <buildroot@tudorholton.com>,
 =?UTF-8?q?Bj=C3=B8rn=20Damstedt=20Rasmussen?= <contact@bearware.dk>
Date: Sat,  3 Oct 2026 19:36:57 +0200
Message-ID: <20261003173657.1235590-2-contact@bearware.dk>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261003173657.1235590-1-contact@bearware.dk>
References: <20261003173657.1235590-1-contact@bearware.dk>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/openjdk: CPE ID for openjdk
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIENQRSBJRCBvbiB2ZXJzaW9uIDIxLjAuMiBpbiBOVkQ6Cmh0dHBzOi8vbnZkLm5pc3QuZ292
L3Byb2R1Y3RzL2NwZS9zZWFyY2gvcmVzdWx0cz9rZXl3b3JkPWNwZToyLjM6YTpvcmFjbGU6b3Bl
bmpkazoyMS4wLjI6KjoqOio6KjoqOio6KgoKVGhlIGF1dG9tYXRpY2FsbHkgZ2VuZXJhdGVkIE9Q
RU5KREtfQ1BFX0lEX1ZFUlNJT04gY2Fubm90IGJlIHVzZWQKYmVjYXVzZSBPUEVOSkRLX1ZFUlNJ
T04gaW5jbHVkZXMgYSAnKycsIGUuZy4gIjIxLjAuMisxMCIuIE5WRCB3aWxsIG5vdAphY2NlcHQg
YSB2ZXJzaW9uIG51bWJlciB3aXRoICcrJy4KClNpZ25lZC1vZmYtYnk6IEJqw7hybiBEYW1zdGVk
dCBSYXNtdXNzZW4gPGNvbnRhY3RAYmVhcndhcmUuZGs+Ci0tLQogcGFja2FnZS9vcGVuamRrL29w
ZW5qZGsubWsgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9wYWNrYWdlL29wZW5qZGsvb3Blbmpkay5tayBiL3BhY2thZ2Uvb3Blbmpkay9v
cGVuamRrLm1rCmluZGV4IGZiYzg2MDAxOWMuLjk1ZWZlMmJhMTkgMTAwNjQ0Ci0tLSBhL3BhY2th
Z2Uvb3Blbmpkay9vcGVuamRrLm1rCisrKyBiL3BhY2thZ2Uvb3Blbmpkay9vcGVuamRrLm1rCkBA
IC0xNyw2ICsxNywxMyBAQCBPUEVOSkRLX1ZFUlNJT05fTUFKT1IgPSAxNwogT1BFTkpES19WRVJT
SU9OX01JTk9SID0gMC4xOAogT1BFTkpES19WRVJTSU9OX0JVSUxEID0gOAogZW5kaWYKKworT1BF
TkpES19DUEVfSURfVkVORE9SID0gb3JhY2xlCitPUEVOSkRLX0NQRV9JRF9WQUxJRCA9IFlFUwor
CisjIE92ZXJyaWRlIGF1dG9tYXRpYyBDUEUgSUQgYmVjYXVzZSAnKycgaW4gJChPUEVOSkRLX1ZF
UlNJT04pIGlzIG5vdCBhbHBoYW51bWVyaWMgb3IgLl8tCitPUEVOSkRLX0NQRV9JRF9WRVJTSU9O
ID0gJChPUEVOSkRLX1ZFUlNJT05fTUFKT1IpLiQoT1BFTkpES19WRVJTSU9OX01JTk9SKQorCiBP
UEVOSkRLX1ZFUlNJT04gPSAkKE9QRU5KREtfVkVSU0lPTl9NQUpPUikuJChPUEVOSkRLX1ZFUlNJ
T05fTUlOT1IpKyQoT1BFTkpES19WRVJTSU9OX0JVSUxEKQogT1BFTkpES19TSVRFID0gJChjYWxs
IGdpdGh1YixvcGVuamRrLGpkayQoT1BFTkpES19WRVJTSU9OX01BSk9SKXUsamRrLSQoT1BFTkpE
S19WRVJTSU9OKSkKIAotLSAKMi41My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
