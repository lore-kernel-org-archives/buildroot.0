Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF3DC88E41
	for <buildroot@archiver.kernel.org>; Thu, 10 Sep 2026 20:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D87088107D;
	Thu, 10 Sep 2026 20:38:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ka6xSU_ISJgN; Thu, 10 Sep 2026 20:38:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org F074581004
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789072706;
	b=qoa4J3fUeJJ+QnuKHpC3ETBUrZuv+huZjJFDNDq/FPc066K8JMrXKQsJQ0a2HR4Bl4u3
	 M3N7ZKsN8QYi5sRNmeWKgsmbeJZQRLeB46+fItsgRL+q4LMxdKzlLPwXIjsz58NKEqWbm
	 rgt7J4DLE1Dd+UeC3h4/LIOd+jNMw26mJXaXEOJxHjBKbYCjWMHdZ1eevP9rQqpJYPqqB
	 xdkpKiXVHZsV5IExPqLMpYzZl/Piiz/KRBNxyU0mLzknc5C6/DP5Hq1+8kUCZlAEAuKxO
	 OuiVv8y5N3LsmKr2oNO60PdV2+gtR4lQPu1ghMZMt7WPLR6h8u0Sm5pNCM1OOwtaI2w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789072706;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=g9rKKgL05ADT/M+tXs8WbO02hPC78FKnREeBVeYDvhY=;
	b=LX3313bIBMJcPLy4HlsqOHx6sLO28ZDzeBM4YiCX2iE3ZPJVFMuYGZcr39v1ht/8cYKj
	 MY+TNOvKELwbjTP5a2WW2iNSZijLGYuVicNLTnbfykQXDAN2f2wUt/gYznPFqFJo/xMol
	 gTsDIHFJEbBHchVt59WcdFx/AVd/DyJmQ7XtZrq83ItuAOBOrjwo+nlfiubiQCOC2sHWJ
	 goQQ4kDa9cYih8zqSfkuam7vIoEi5uKB8BtgCClLjrqe49DL65nGFmll/5/8VW8GV1gny
	 dVWBRQvA7HcNkP2zxmG8SAQ0F8ZdxES+0V4yVooITejl+qcBDncOSDsyCxrY9ghj8Ng==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789072706;
	bh=g9rKKgL05ADT/M+tXs8WbO02hPC78FKnREeBVeYDvhY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bQpJJpfr9qvE88v/a0Fmk9DHnx/6qNhaE6XjuLM12xiYw7sdvDaNDL03ps4Pfsjjp
	 UKv4kdk6SepIKWbWuJftpZZ+TolevDEQSNqk0xIPwccWhVfkgO2qr/cnB5MNDRA/Ol
	 zPjgY6pVRIV9GWrOr9CM0QUOC5PTZqr+7THpTAcwFCw+bSf6+Hlyh6B9/DS9NYnbtE
	 KrOo10pwQ7szH4c7hy0zHZrC5e7dKil8pqO8KAePikew7zvbdyw7uvgJqUJKNRKh12
	 UBVbWkkxTtdIGwkcLtuXf8vGIyz/gm5DOi8Gh4hlyzJY8GYflvVkCQVGnTdIXxEDS8
	 XvwJNrgZ8KYpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F074581004;
	Thu, 10 Sep 2026 20:38:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C350362
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 20:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31B2940B8A
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 20:38:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BymFhMcDBqWN for <buildroot@buildroot.org>;
 Thu, 10 Sep 2026 20:38:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 68BAB40B85
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789072703;
 b=WByzDmf5Vihy18MTI+xcc37z4o4v6rPhdskpwF1DkfqXY0bgW4euEwL2jSrLOTQSbGyJ
 OV94pRTNqgRwNDiho8O65z8EwY/3egUMvSTE98IQX3n2IBcoHUmRG04tGOWp+vQO6pQb0
 2vqr7HIhjrCy/AUF3qwa3wBL5gAQWc6OWLJSCJjMFd7pFzPz5mc3TOp3Fkpk6Im0JMDFp
 RSeveYTSyAXU3YxixwopDSDRUNcSaoJEAu5aMNJvxmIjR26kjRYXjmJ9KhyzX47/i/Px0
 PqltAbXsCVtVzDn/rMMypWfk6M19GOhrAmSF9kx3UjcES3FqsxxBBFq6W3ZWrzA7Rwg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789072703;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Type:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=mtB5xGWv90EEgaTXoZBTp2U1wMoHXtrTpJelbE2Z+m0=;
 b=h67NsIPC0mz+f9aO5ZGXHmVBWEm0A5DqXQGfDdEoO9+Dib6ZWpZq7fMc94cDeA3kFzui
 dQyNYaGG/Y/nRIa7ukSuSS86zj0vD9SDJI3V8A122Cq6gMkg4ko9HAAeZBjcl11kZwBIl
 lel91AKe4EqwzRsjwGV2ZpmktOIbPbn3A3qJm5F9iTIF+n7QRVQs5YeAhTkACfhVHHqw4
 8Oov9b5CaTcCFqbvKBPfYM31Y09TiWDdQt7BIyKmwt9YMTPsDnH+Ue/oQZoYkwmdmAPHE
 Y8E/bIosP0BynpFSmNChHiMYW6C2ylSAuC/jJ+AhWbWRwOAh14aMaIfvoILyzzB9NMw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=jpvxejim; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=jpvxejim
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 68BAB40B85
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 20:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789072699;
 bh=mtB5xGWv90EEgaTXoZBTp2U1wMoHXtrTpJelbE2Z+m0=;
 h=From:To:Subject:Date:From;
 b=jpvxejimwQmnSiEc4XQ7fDEyRDWoWUEKpLlHAMJzrTT8zyvhRYwTfjT2y+b4kc65F
 3GDkbY3V3sSULLEk0dkvzuNuKEsvwOdMtczpbnKzhkQe9uXOiWTKBowuXhYrbsaEAt
 NrQ4UVHegXlarbtCRSvy2B/NoNNc362zdbAPRwzvBQs8C8ZKtecpJTT9NbYGOMCDT/
 1m9xqdPBx6DpYYzoOOnhcL5DtDL4p+elC1wvkRotpEoB7q2kpHrc1YsxKh5nU2PHxA
 PJiSkGVBc7aWzufelW4pCdlZOoTzRyuaq2/e2sqQvzwgjnIdpQw7IH3G649TMULe7g
 y0X8iZbvdEPwQ==
Received: from fli4l.lan.fli4l (p5b3a0da7.dip0.t-ipconnect.de [91.58.13.167])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2896AA4C0E1B
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 22:38:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38016)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x4lXG-000000001Zh-2yeT
 for buildroot@buildroot.org; Thu, 10 Sep 2026 20:38:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 10 Sep 2026 22:38:18 +0200
Message-ID: <20260910203818.2550925-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.24.7
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

aHR0cHM6Ly93d3cuc2FtYmEub3JnL3NhbWJhL2hpc3Rvcnkvc2FtYmEtNC4yNC43Lmh0bWwKClNp
Z25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+Ci0tLQpPbiBBdWcsIDE1
dGgsIHRoZSBHaXRsYWIgcGlwZWxpbmVzIHBhc3NlZCBidWlsZGluZyA0LjI0LjY6Cmh0dHBzOi8v
Z2l0bGFiLmNvbS9ia3VobHMvYnVpbGRyb290Ly0vY29tbWl0cy9kOTQ1NDc1ZjdlZmYwZTM3MjJm
ZGJmYTY4MjQ3MDMxZDgzZjEyMjEwCgpUaGUgc2FtZSB2ZXJzaW9uIGlzIGJyb2tlbiBhcyBvZiBT
ZXAsIDEwdGg6Cmh0dHBzOi8vZ2l0bGFiLmNvbS9ia3VobHMvYnVpbGRyb290Ly0vY29tbWl0cy9k
MmRlYTEzZjU5ZWQ1YzI3NjAxY2E0ODBjNDlkNzdiZDY0ZjdmMDI2Cgpib290bGluLW02OGstNjgw
NDAtdWNsaWJjOgouLi8uLi9saWIvdXRpbC90aW1lLmM6IEluIGZ1bmN0aW9uIOKAmHB1c2hfZG9z
X2RhdGUz4oCZOgouLi8uLi9saWIvdXRpbC90aW1lLmM6MjU5OjE6IGludGVybmFsIGNvbXBpbGVy
IGVycm9yOiBTZWdtZW50YXRpb24gZmF1bHQKCmJvb3RsaW4tcG93ZXJwYy1lNTAwbWMtdWNsaWJj
Ogpzc3AtbG9jYWwuYzooLnRleHQudW5saWtlbHkrMHgyMCk6IHVuZGVmaW5lZCByZWZlcmVuY2Ug
dG8gYF9fc3RhY2tfY2hrX2ZhaWwnCgpUaGlzIHZlcnNpb24gYnVtcCBzaG93cyB0aGUgc2FtZSBl
cnJvcnMgc28gdGhpcyBidW1wIGRvZXMgbm90IGludHJvZHVjZQpuZXcgYnVpbGQgZXJyb3JzOgpo
dHRwczovL2dpdGxhYi5jb20vYmt1aGxzL2J1aWxkcm9vdC8tL2NvbW1pdHMvYTM1YzA1ZDM1ODdl
NGI0YjBiNTA4Mzk1NTE4YmZjMWU5YTgzYmY2YgoKIHBhY2thZ2Uvc2FtYmE0L3NhbWJhNC5oYXNo
IHwgNCArKy0tCiBwYWNrYWdlL3NhbWJhNC9zYW1iYTQubWsgICB8IDIgKy0KIDIgZmlsZXMgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2th
Z2Uvc2FtYmE0L3NhbWJhNC5oYXNoIGIvcGFja2FnZS9zYW1iYTQvc2FtYmE0Lmhhc2gKaW5kZXgg
OWZjY2M5YmY1ZS4uZDYyZTMyNWY4MiAxMDA2NDQKLS0tIGEvcGFja2FnZS9zYW1iYTQvc2FtYmE0
Lmhhc2gKKysrIGIvcGFja2FnZS9zYW1iYTQvc2FtYmE0Lmhhc2gKQEAgLTEsNCArMSw0IEBACiAj
IExvY2FsbHkgY2FsY3VsYXRlZCBhZnRlciBjaGVja2luZyBwZ3Agc2lnbmF0dXJlCi0jIGh0dHBz
Oi8vZG93bmxvYWQuc2FtYmEub3JnL3B1Yi9zYW1iYS9zdGFibGUvc2FtYmEtNC4yNC42LnRhci5h
c2MKLXNoYTI1NiAgODEwY2M5NTVhY2IzNjdlOWJkZTU1NmRjY2ZiNTBkYjE3N2EwMmI3YzU1M2Fh
MTYyOWEwYjkwNWZhNzYxNjI2NyAgc2FtYmEtNC4yNC42LnRhci5negorIyBodHRwczovL2Rvd25s
b2FkLnNhbWJhLm9yZy9wdWIvc2FtYmEvc3RhYmxlL3NhbWJhLTQuMjQuNy50YXIuYXNjCitzaGEy
NTYgIDQ1Yjc3NDdhNDc0NTJlZmYyYjIxNTlhNDRjYzYzZWI0MzY5MGQzMzlmZDEwNjkwODhlMDIz
YTAxNWZlZDA2YzcgIHNhbWJhLTQuMjQuNy50YXIuZ3oKIHNoYTI1NiAgOGNlYjRiOWVlNWFkZWRk
ZTQ3YjMxZTk3NWMxZDkwYzczYWQyN2I2YjE2NWExZGNkODBjN2M1NDVlYjY1YjkwMyAgQ09QWUlO
RwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9zYW1iYTQvc2FtYmE0Lm1rIGIvcGFja2FnZS9zYW1iYTQv
c2FtYmE0Lm1rCmluZGV4IDYyOTFjYjI5YjkuLmE5ZTE1NzdlMjYgMTAwNjQ0Ci0tLSBhL3BhY2th
Z2Uvc2FtYmE0L3NhbWJhNC5taworKysgYi9wYWNrYWdlL3NhbWJhNC9zYW1iYTQubWsKQEAgLTQs
NyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1TQU1CQTRfVkVSU0lPTiA9
IDQuMjQuNgorU0FNQkE0X1ZFUlNJT04gPSA0LjI0LjcKIFNBTUJBNF9TSVRFID0gaHR0cHM6Ly9k
b3dubG9hZC5zYW1iYS5vcmcvcHViL3NhbWJhL3N0YWJsZQogU0FNQkE0X1NPVVJDRSA9IHNhbWJh
LSQoU0FNQkE0X1ZFUlNJT04pLnRhci5negogU0FNQkE0X0lOU1RBTExfU1RBR0lORyA9IFlFUwot
LSAKMi40Ny4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
