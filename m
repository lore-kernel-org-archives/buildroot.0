Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 632B2C88E56
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 20:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7406B605FA;
	Sat, 12 Sep 2026 20:17:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F_rFyghOrRqn; Sat, 12 Sep 2026 20:17:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A09F56060A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789244244;
	b=omb1TfmvKJuNOIUN6y34xOqSPpu0Et8w3QnZNPS7UnT3cgPfQdD50jeQBxpe9jTsJo0y
	 KlQqxXnOcpOeDW1xw/mRkB7AVvsmmlTgWqiLCRMFF/BT3MVCCdcqx5rBaoNPhfTi7BjoT
	 EFsjdJYysEAZSR2gr5urb1u3J3fLnJFiGXX/uXHup3J1NFYzrcFcezT+dV8j3uAhNfwBD
	 vxDv56u0d4FnxWiahsitS1TaYs/mR1Swxi7Lhp949Iv37ekdRiaWHaxkdURVym+K6A2gl
	 +eo2Dd7EA35RkWY9jxNFEtDaHCuWeQp1xy2oe4OELvaUfe7RAWh5CQw0RfEszvOC8gg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789244244;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=WYFTG6SRNQvfZBeAIi5e6iFf/KCpQqkbHhMq87QPINw=;
	b=N3r9RugqlpZiKxF6n0iyExdm9/Nn7rAt5jy2vHL0KU0wTtXTxoDHeU9hJBdUQEcAusYd
	 qMhNme9tqJdhBA/rqVxoBaZIhZg6P3n+/L7D5aJevY5wZW+RNCYG97yU5gn2pUsY1315F
	 hR74sXwan2U5HB+VMeL+hMaUuAz1Q9M4vTmCf0flu0aS8V5sAx52ypr2az/1IRMh2rCWI
	 kk5Z4+vprx0l2Ze8gxojOwO0ZV8nIxGOsIuH4Ob63gy3i+xGPoADLi3xUoDGJ/wHBWe5K
	 fbMhNpdEvN6EUgEAuPb/HRrLXLdEqaHL6HcfKA6xa/QN9/XZiq/p9P569Fc1xeAcRNA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789244244;
	bh=WYFTG6SRNQvfZBeAIi5e6iFf/KCpQqkbHhMq87QPINw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=W4H12TM9XB2P1uTJlrMxj+SeI9LHiEV1D6yyLIVSCeuKwJoPuYBv4h7tZi+FQQFVy
	 nAGvRRMf4/o1acu3czHTeB/szbBbhLKBUsBGqVBP8SA0DnOsDiolhNEWf/7nLkfp7P
	 vKCLNxkcN3hmvMhdnY6aTOPjEm80Rd3ZSlwHnhbaSix78CU5qqaETqMMMVvk3ZTCg6
	 W0oLJVtGdng6VBIzk4W17YGPW/D0JTWUNg46UzQ+Yp1irj/lU/8l7hB28a8Y03LQo7
	 rFUnLu8gQk5vIVWVqFu/pzB5xNBb46sPtZFw8+h8vr2LPL5EunwvNlZvR2twLCCQGA
	 3NcIOz+vfJEYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A09F56060A;
	Sat, 12 Sep 2026 20:17:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BC5842D0
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 20:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A227B80E4B
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 20:17:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QFIYuXoAqmCp for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 20:17:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A0DF480D91
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789244241;
 b=b7emnaSS7vgInVSKQN3+k10jxod60Dg7AhXE9a0+kPmyV0VYkezxhad6arSiAGt6Trjg
 TmLP6cUJ/eqqov4+D1cykADHmN5hEP/Lud10Apu95uX1eHTI3Eq36meSa/ALW3pHZkl7+
 6LjTAWplckq6NhuDRK7JGgE7qC5rPMvTuEIE3kjNbFNF3T0j+ijJTZZhKA9RPwCEG9ECC
 S4/ukhXIbpkHosMHEouhx3TcOemjl9DRVEg8oJxspuG94cIN/A7zinZuOlBqkU/SBRzhH
 kVIzakg5rT94IS0+wRHXg5swjOqvAVv6cHbmN7iHrH9FGQnP+ANrwoUUqgCo/4RmTKw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789244241;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=++pfh9AL+o9Ed3IBaslA4uIXoOOEsJP0CFnsWQ4HLUk=;
 b=eiQwwfSAnSJCC+f35UAYIenw3Mir/6N3nw+gbh7ny/RYvN0WlunNXMBCBG1Vk/VNXO8Y
 w1eVsb/PX6bakC/Wu1uAqHEN+gQbVG2Z6rsa9r+A4bnqqSbJntn1c9VKDfNb4uT6zTcxL
 7TAHU5wS63LN6xOiXwNwncxo7YGRRShzTCCNxwdYlbuEregnj//KhpwBNQMP2a2g17Emv
 Z+LPwW/pQKbPLo7QSIod4YYMsj6pa4pdfFRWxrfDdTO2D2yn5TknPK+LxqIDISp9ywsno
 ObE8Fzl1na943dJtd2zCHOD3xrYrgD0xybWrXuAqQrCVPPPD99VIco9E9dSfZLZCzsA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ZqEWMlKW; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=ZqEWMlKW
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A0DF480D91
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 20:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789244239;
 bh=++pfh9AL+o9Ed3IBaslA4uIXoOOEsJP0CFnsWQ4HLUk=;
 h=From:To:Cc:Subject:Date:From;
 b=ZqEWMlKWmOWExfL2CSTdzeXVBGBkzifiEqZiMz4Y5YtfADkxRVSq+u1ZaBENzFznX
 TQM9wj7cBwCzvMS3gA9tQNp80FklT0N07jgH1mEiYDtxaFUsNa3Ym16tFt+2X+Jc04
 9zddGDsILeNzNPhL3D7c9hjwjUXZo+wBKGh14prg/17oov/G6jyZc0R3JlnmH+h9WB
 zrPicGRLsn7t1cXYgpQDa29oqHOQbqIR3EJwWA24Kx2SY0Drbmi9BgYMCDHSLWe5fT
 0X23SMQ/1Ii2vGnKSd/LycIe/qj1VMJJQB3NqpjQGuyKDXzWCw0YfHrmEg61LA71If
 GRIEDRKWpw6Rw==
Received: from fli4l.lan.fli4l (p5b3a0da7.dip0.t-ipconnect.de [91.58.13.167])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 17933A4C3ACA;
 Sat, 12 Sep 2026 22:17:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54296)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x5UA2-000000000Ad-2mvw;
 Sat, 12 Sep 2026 20:17:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 12 Sep 2026 22:17:18 +0200
Message-ID: <20260912201718.1667470-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ---
Subject: [Buildroot] [PATCH 1/1] package/vboot-utils: Fix build with OpenSSL
 >= 3.x
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

UmVtb3ZlIC1XZXJyb3IgZnJvbSBDRkxBR1MgdG8gcHJldmVudCBidWlsZCBlcnJvcnMgZHVlIHRv
IHdhcm5pbmdzIG9mCmRlcHJlY2F0ZWQgZnVuY3Rpb25zOgoKZnV0aWxpdHkvY21kX2NyZWF0ZS5j
OiBJbiBmdW5jdGlvbiDigJh2YjFfbWFrZV9rZXlwYWly4oCZOgpmdXRpbGl0eS9jbWRfY3JlYXRl
LmM6OTY6OTogZXJyb3I6IOKAmFBFTV9yZWFkX1JTQVByaXZhdGVLZXnigJkgaXMgZGVwcmVjYXRl
ZDoKIFNpbmNlIE9wZW5TU0wgMy4wIFstV2Vycm9yPWRlcHJlY2F0ZWQtZGVjbGFyYXRpb25zXQog
ICA5NiB8ICAgICAgICAgcnNhX2tleSA9IFBFTV9yZWFkX1JTQVByaXZhdGVLZXkoZnAsIE5VTEws
IE5VTEwsIE5VTEwpOwoKZnV0aWxpdHkvY21kX2NyZWF0ZS5jOjE1NTo5OiBlcnJvcjog4oCYUlNB
X2ZyZWXigJkgaXMgZGVwcmVjYXRlZDoKIFNpbmNlIE9wZW5TU0wgMy4wIFstV2Vycm9yPWRlcHJl
Y2F0ZWQtZGVjbGFyYXRpb25zXQogIDE1NSB8ICAgICAgICAgUlNBX2ZyZWUocnNhX2tleSk7Cgpm
dXRpbGl0eS9jbWRfY3JlYXRlLmM6MTkxOjE3OiBlcnJvcjog4oCYUEVNX3JlYWRfUlNBX1BVQktF
WeKAmSBpcyBkZXByZWNhdGVkOgogU2luY2UgT3BlblNTTCAzLjAgWy1XZXJyb3I9ZGVwcmVjYXRl
ZC1kZWNsYXJhdGlvbnNdCiAgMTkxIHwgICAgICAgICAgICAgICAgIHJzYV9rZXkgPSBQRU1fcmVh
ZF9SU0FfUFVCS0VZKGZwLCBOVUxMLCBOVUxMLCBOVUxMKTsKCmZ1dGlsaXR5L2NtZF9jcmVhdGUu
YzoxOTk6OTogZXJyb3I6IOKAmFJTQV9nZXQwX2tleeKAmSBpcyBkZXByZWNhdGVkOgogU2luY2Ug
T3BlblNTTCAzLjAgWy1XZXJyb3I9ZGVwcmVjYXRlZC1kZWNsYXJhdGlvbnNdCiAgMTk5IHwgICAg
ICAgICBSU0FfZ2V0MF9rZXkocnNhX2tleSwgTlVMTCwgTlVMTCwgJnJzYV9kKTsKCmNjMTogYWxs
IHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3JzCgpUaGUgb2xkZXN0IGJ1aWxkIGVycm9y
IGRhdGVzIGJhY2sgdG8gMjAyNCBzbyBhIGJhY2twb3J0IHRvIExUUyBicmFuY2hlcwpzaG91bGQg
YmUgY29uc2lkZXJlZC4KCkZpeGVzOgpodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jl
c3VsdHMvMzc1LzM3NTU0YzVjZTc4NDgzNWEzNmYwMDY4ZDlhMGMxY2Q5MzEyMTJiNDQvCmh0dHBz
Oi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy8xZmEvMWZhYmNhMTFjNzgzOWQyZDdl
ZDgwOWYzMDQ4MjU5NTcxOWEyOWM5Mi8KClNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJu
ZEBrdWhscy5uZXQ+Ci0tLQogcGFja2FnZS92Ym9vdC11dGlscy92Ym9vdC11dGlscy5tayB8IDEg
KwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS92
Ym9vdC11dGlscy92Ym9vdC11dGlscy5tayBiL3BhY2thZ2UvdmJvb3QtdXRpbHMvdmJvb3QtdXRp
bHMubWsKaW5kZXggZGMwYjEzNjViNy4uMTRkZWY0YzcwOCAxMDA2NDQKLS0tIGEvcGFja2FnZS92
Ym9vdC11dGlscy92Ym9vdC11dGlscy5taworKysgYi9wYWNrYWdlL3Zib290LXV0aWxzL3Zib290
LXV0aWxzLm1rCkBAIC0zMyw2ICszMyw3IEBAIGRlZmluZSBIT1NUX1ZCT09UX1VUSUxTX0JVSUxE
X0NNRFMKIAkJQ0M9IiQoSE9TVENDKSIgXAogCQlDUFBGTEFHUz0iJChIT1NUX0NGTEFHUykgLURf
TEFSR0VGSUxFNjRfU09VUkNFIC1EX0dOVV9TT1VSQ0UiIFwKIAkJTERGTEFHUz0iJChIT1NUX0xE
RkxBR1MpIiBcCisJCVdFUlJPUj0iIiBcCiAJCUFSQ0g9YXJtIFwKIAkJZnV0aWwgY2dwdAogZW5k
ZWYKLS0gCjIuNDcuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
