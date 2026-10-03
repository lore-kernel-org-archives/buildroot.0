Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE4B8CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:22:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE992410E9;
	Sat,  3 Oct 2026 07:22:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hrRCOISDU2AP; Sat,  3 Oct 2026 07:22:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org CFBE341141
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791012173;
	b=oJyMtccK8GS05jlUTzjLktq9DfMTmWKekTPBzHPhQJ5fOgb16pd+KGKqsOV8+lTuUSn2
	 26jueqwjILQ0tFHUsuDCkqztBzbnVCTGkNz0tITmTDew0O2Ya1KnmA7cGVi3k7aa2KtMk
	 F6B/lwjlkv9f2DvdEQ3SjtPRF5XwMuWsSkU364Q8s5qCmvEWqL5JIqFsaFeuz91BmcDPJ
	 H1voaN4AlfX8gkd8A/TKyR/2O6XDxNDZ/VoOYVk3UZVy/VQR8Ji7x3YYPNzjau0PGfCo2
	 VG/XU6nbIwMW7xSAZ4Ye8pqF2FRyCqeF1mYxY8ZLDEkhM6vTGSoWoeawBZZd9fIQ6HA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791012173;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=N99ufF7ramgraADvxZqHxwtAbftikF3wvBSizm2I8/A=;
	b=q+UDRDlT0OLZxkDxIxjsWPHnRaSc0hzz3Mgj3vF1h7PRVvwu32YhUXVmDD8ZOjV5xggP
	 gnke7Q6mApt759q0mdAf1dwijFgeUYnd9l7xETdb2cLSpaMmnaAjKaAWQe4TZOR9d6vaw
	 /tyzVSZWlA9YVLy8wmjZ7tXgz7m8ioVEc2Nicq4W1lP1cJgRCkIfDqHWCzwECbKt2Kg4Q
	 lL4OtqlMQYD0W3q5xNEbfDisvnAHtcpH/D7tAcFemELrj+k5wyfCsvx0aFmZCtEdDe832
	 cNpMiBYw5Jyec6diqW5QnsumyEQHitTolAoYO0drDquJfxgqwIKl125cNQV6/ZIbmkg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791012173;
	bh=N99ufF7ramgraADvxZqHxwtAbftikF3wvBSizm2I8/A=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=IAKQRrEz+oa+xVAkzRjo4TzjDylltTFAHxyXd/4WKo683o0M579ypWpvrDs5p1/sR
	 MjT8qK/CNrHB8hiDKyqKl2UwvJiKkaudFDol7aogh5rI0wiXZNIwyGv2flTSidrR7U
	 JSTo4k6S4Y89/IGBIstSCAdf5wXWCt0P+hwaaqtz/MnYWlkK2nFhhKhDE6lq6BGsbs
	 LoW38+656CMERsRYbENEOs6JkAoMiBT0PEB6fID/yMJlWyw06IjnzNPR0AWejxZTAF
	 q1mtU0vqN9Z65ceAlVLRFE8j71Sj0yOZsa1riB6sBGrojnUuCGltaWD9us7/uNaKkt
	 sc30zNVUI3qHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFBE341141;
	Sat,  3 Oct 2026 07:22:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D036C179
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B68DB40064
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:22:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id daQg9s1H8Ly0 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:22:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org C745940059
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791012172;
 b=YlnM6TrEve4OqEoLAmyU4RNyiQkk+ayFLdQJPslUL5iFKMl0RCVlMO1H24VBJtSyUBGR
 FuPR033xCkbyz6dF9a//NJAmHxRlQ0dgiFltj51B6hrEcjFOL645vL6BBWPvjN2vKZhJh
 gkzJ2bJT3Q6/6WoQIYHMuk7Pk/BUPVpJrayA07n10LEw8mGDgdr72ifLfmWTPzKfCSHQp
 l0NZraITLLpxvNbF4NaA2VhDV3vvhagjxbozr9J5esJIMfZHKeXtQkWoLf5uqYrTeeXtK
 RkJazrfppbKFRHZqfVUjQW4lrk5ymsdMXlhEgU0hqfmKAX+LDOEUeU+CkIW7xbWAV5g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791012172;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=FI8TKveYPkZpxObvAGeeY8c/JBs5muCIEDSmPXpgYKo=;
 b=gyAvwr8L73J467oBtKKvLTZNMDp+rbD/wn2LeITU9b3YTA9Wa8oa2vT/I+c3KbmwyRUT
 UOfFcexOSZb9bXW0bja7+d+G4e18IjZRECSmIRAa6I42n4CYqw2a0h4EETqJdMnwqj/gg
 fIfh6UNMFsl842wVSNk4pDCtCNySyM8bGtIBIK0bmnpznPpA+lsdgPUKywAOSQ+0WLG2k
 dBK+13Isw/cYZNjgb2XXraiKq23W2bRjvgHI47m/IC7wLjndRguKdyzpQDs8rvIB3n5M1
 rzV20/e+I3Xu6Gjph7JusnZsDI0F4W+mh/ayhTUpN+mDvgdbXvFGlMxY7LXtq/PRiaQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=BoPhIv0t; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=BoPhIv0t
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C745940059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010941;
 bh=FI8TKveYPkZpxObvAGeeY8c/JBs5muCIEDSmPXpgYKo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=BoPhIv0tctFBm5rbu0xv3Z8NIqkOszB9DxJiFVkB0c1azl97G+DoWEnM1kacCIPTX
 0jk7QgipFZ0jrt9uRgHn1h377opfPOjggluK+PLbwHOXpESxi7tSBwoIfuKk8Hcbc0
 GmAuACf8bcrh3zeCAfKL/ctX6iMjktYbNK21IO7ZcixFh4+gBhFvmdpXu32SpEOzyo
 7yei+Fr2SnRp2QatYOuxzI+sKiSBOSuA90EuO9mFfaZo4sK3+inDSfEMNBARotTK1+
 KzRojAwVtBdWpc5GDmAY/FYsSSEUvJb8IJpSY4D1AATEfExNRHpIVVpCTAydpcgyJd
 lUyMR+Pi1dqlA==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 HE2XYiC47jc3fXSGp+jWuQEVLYT6eutD5F4HNPxoyNNgwCFQhEgcBHDWfXdGbxU1MJdRJrtoEu+
 rR/3ayCWRu7rd7p5SiS4Dhh9bWDelCojp4gvnCe5mkakG6zT10j/HfJQg7ofc3V4F/HxRFzXZkm
 JW7sI6HyBDejZ+1yMi/DTAgCOMu/6xot5a/cixz7+w2Upo4iKPX9bTL27ixP5dHH3Zi+ilzsS49
 eN+IJAPtdz6rFnbstbf8IVt2Buz6pkBwU3y0s6ke8a/25+MUplUok5pwJ21TncSrsJXRfwRQngA
 QxwEJm+IX0R90353y8ZgnIf2XcvjEbx/GNsMdwGMngH98kjeQhm8wpHs5SCjoGMu9g//HDtx0hZ
 1jUbcpfaPm3gaYLbtJjtAho7YjzTE855ywEFwTydiXfnn5NUQHe985KZzkwGNikihkpASHjw0X3
 9KyCs5fVNfFiLJNT8167szSLAZo/NYSXO2KU7/qXhYBIywF1poxY+/hhZyhXYWHjHXAfO/8qAZp
 usgJONjMS3UIc04Wwg/vnO0C7Kx0JmQZgARpezzSyDIiT/vJRVSE569rucUfwSCNGHjr8j+EAUp
 qLrUhFif0qDW5DW+FveloXkAyua6MxMW1Ly1ByB4wsMWSn+3xKueYEgBQYC20iJx
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A9092A4C551C;
 Sat,  3 Oct 2026 09:02:21 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtke-000000007Zo-18kW;
 Sat, 03 Oct 2026 07:01:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:13 +0200
Message-ID: <20261003070128.1295458-41-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 041/114] package/python-marshmallow: bump
 version to 4.3.1
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
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KQ2M6IEphbWVzIEhp
bGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgpDYzogTWFydGluIEh1bmRlYsO4bGwg
PG1hcnRpbkBnZWFuaXguY29tPgpDYzogWWVnb3IgWWVmcmVtb3YgPHllZ29yc2xpc3RzQGdvb2ds
ZW1haWwuY29tPgotLS0KIHBhY2thZ2UvcHl0aG9uLW1hcnNobWFsbG93L3B5dGhvbi1tYXJzaG1h
bGxvdy5oYXNoIHwgNCArKy0tCiBwYWNrYWdlL3B5dGhvbi1tYXJzaG1hbGxvdy9weXRob24tbWFy
c2htYWxsb3cubWsgICB8IDQgKystLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tbWFyc2htYWxsb3cv
cHl0aG9uLW1hcnNobWFsbG93Lmhhc2ggYi9wYWNrYWdlL3B5dGhvbi1tYXJzaG1hbGxvdy9weXRo
b24tbWFyc2htYWxsb3cuaGFzaAppbmRleCA2YmUwNmYyMGY0Li4yYTEzNWM2NGE0IDEwMDY0NAot
LS0gYS9wYWNrYWdlL3B5dGhvbi1tYXJzaG1hbGxvdy9weXRob24tbWFyc2htYWxsb3cuaGFzaAor
KysgYi9wYWNrYWdlL3B5dGhvbi1tYXJzaG1hbGxvdy9weXRob24tbWFyc2htYWxsb3cuaGFzaApA
QCAtMSw2ICsxLDYgQEAKICMgbWQ1LCBzaGEyNTYgZnJvbSBodHRwczovL3B5cGkub3JnL3B5cGkv
bWFyc2htYWxsb3cvanNvbgotbWQ1ICA5NTU4OWQ2ZjEwODJhYWU1N2VmODFjYzVjZTE1ZmMyYyAg
bWFyc2htYWxsb3ctNC4zLjAudGFyLmd6Ci1zaGEyNTYgIGZiNDNjNTNiM2ZlMjQwYjhmNmFmMzcy
MjNkNmVmMTYzNmY5MjdhZDliZWE4YWIzMjNhZmFkOTVkZmYwOTA4ODAgIG1hcnNobWFsbG93LTQu
My4wLnRhci5negorbWQ1ICA1NjYzZWNiYzBhM2JiNjcyZDRlOTg4Mjk0NzIzMDI1YiAgbWFyc2ht
YWxsb3ctNC4zLjEudGFyLmd6CitzaGEyNTYgIGZiNmI4MDQ4YWYwOGQ0YWIwNjE2MTBkNWI3ZDM2
OTZhN2U0Yzk1MzM3ZGJkYTg4MGVkYjlmOTU4MTJjYWJjMjAgIG1hcnNobWFsbG93LTQuMy4xLnRh
ci5negogIyBMb2NhbGx5IGNvbXB1dGVkIHNoYTI1NiBjaGVja3N1bXMKIHNoYTI1NiAgOTA2YjVk
OTA1MWU0MjYxNDRjYjE3M2FkOTExNjY3YjhlYmQwNWE5YzU4NGMyYzI2YzEzNWIzMmEzZWQxMjAw
MSAgTElDRU5TRQogc2hhMjU2ICBmOTgyZTZmZDk3YmEwMDk3M2U5NDYwNWI5NzJmZjA0ODk0YjIy
YzRmYTkzN2I4Njg4MjhiMzJhZThmMGE3YzJlICBkb2NzL2xpY2Vuc2UucnN0CmRpZmYgLS1naXQg
YS9wYWNrYWdlL3B5dGhvbi1tYXJzaG1hbGxvdy9weXRob24tbWFyc2htYWxsb3cubWsgYi9wYWNr
YWdlL3B5dGhvbi1tYXJzaG1hbGxvdy9weXRob24tbWFyc2htYWxsb3cubWsKaW5kZXggOTY0ZmY2
NjczMi4uNzk1YzZmYWY2YSAxMDA2NDQKLS0tIGEvcGFja2FnZS9weXRob24tbWFyc2htYWxsb3cv
cHl0aG9uLW1hcnNobWFsbG93Lm1rCisrKyBiL3BhY2thZ2UvcHl0aG9uLW1hcnNobWFsbG93L3B5
dGhvbi1tYXJzaG1hbGxvdy5tawpAQCAtNCw5ICs0LDkgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjCiAKLVBZVEhPTl9NQVJTSE1BTExPV19WRVJTSU9OID0gNC4zLjAKK1BZVEhPTl9NQVJT
SE1BTExPV19WRVJTSU9OID0gNC4zLjEKIFBZVEhPTl9NQVJTSE1BTExPV19TT1VSQ0UgPSBtYXJz
aG1hbGxvdy0kKFBZVEhPTl9NQVJTSE1BTExPV19WRVJTSU9OKS50YXIuZ3oKLVBZVEhPTl9NQVJT
SE1BTExPV19TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzLzI1
LzdlLzFkYmQ0MDk2ZWI3YzE0OGNkMjg0MTg0MTkxNmY3ODgyMGJiODVhNGQ4MGEwYzI1YzAyZDMw
ODE1YTdmYgorUFlUSE9OX01BUlNITUFMTE9XX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhv
c3RlZC5vcmcvcGFja2FnZXMvNGUvZDcvNjExZTY4ZDU3ZTZhOTAzYzI5Y2IzM2I1YWZlYzBmOTNi
NGJhZWNhY2M2YzZjNjJlMzNjZGU5ZWI5ZGNiCiBQWVRIT05fTUFSU0hNQUxMT1dfU0VUVVBfVFlQ
RSA9IGZsaXQKIFBZVEhPTl9NQVJTSE1BTExPV19MSUNFTlNFID0gTUlUCiBQWVRIT05fTUFSU0hN
QUxMT1dfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UgZG9jcy9saWNlbnNlLnJzdAotLSAKMi40Ny4z
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
