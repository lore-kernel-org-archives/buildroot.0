Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE9BC36014
	for <buildroot@archiver.kernel.org>; Wed,  2 Apr 2025 09:22:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C40E183B4D;
	Wed,  2 Apr 2025 09:22:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fd3ZaGdXZ5bz; Wed,  2 Apr 2025 09:22:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6D6783B49
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6D6783B49;
	Wed,  2 Apr 2025 09:22:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C770B11F
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 09:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8CC761B1C
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 09:22:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hs2CMK7IsfyC for <buildroot@buildroot.org>;
 Wed,  2 Apr 2025 09:22:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=117.135.210.4;
 helo=m16.mail.163.com; envelope-from=andyshrk@163.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 39D05610BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39D05610BD
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
 by smtp3.osuosl.org (Postfix) with ESMTP id 39D05610BD
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 09:22:43 +0000 (UTC)
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-114 (Coremail) ; Wed, 2 Apr 2025 17:07:24 +0800 (CST)
X-Originating-IP: [58.22.7.114]
Date: Wed, 2 Apr 2025 17:07:24 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Thomas Bonnefille" <thomas.bonnefille@bootlin.com>
Cc: buildroot@buildroot.org, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20250205-fix_zxing-v1-2-c3e4c2adfdab@bootlin.com>
References: <20250205-fix_zxing-v1-0-c3e4c2adfdab@bootlin.com>
 <20250205-fix_zxing-v1-2-c3e4c2adfdab@bootlin.com>
X-NTES-SC: AL_Qu2fAfmTu0Av4iSbZukfmkcVgOw9UcO5v/Qk3oZXOJF8jDvp6CEgd21jJ0DK6eeEOiqAjTi3YBx39upQfaBdUrMA7SWXdGgZ6AXCtXPspYqMVA==
MIME-Version: 1.0
Message-ID: <1d860b05.9627.195f5c15a97.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: cigvCgD3H+BM_uxnukmNAA--.8584W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkAEjXmfs9k-9CwABsp
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=nbl1QJzBBjPxTeFg8XF0FWvIweTfDLqbFOEqfyeXMXU=; b=F
 GkWY/TsllZJlRL/5EQSRlaUAL5VnkqtpDScvypypkJah+4sYyWtAyUOHcko1PZy1
 XrS5niFQbZmjq8wy+jhXxNmUNd71FLtDkjUUVy2SBAzXbNc/rKMtGygKDyXImldZ
 +AjtLSdpW9punTB/I2VID2Eb5AOxXvptmLN3cWSgsQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=FGkWY/Ts
Subject: Re: [Buildroot] [PATCH 02/12] package/gstreamer1/gstreamer1: bump
 version to 1.24.11
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

CkhlbGxv77yMCiAgICAgQXJlIHRoZSByZW1haW5pbmcgcGF0Y2hlcyBvZiB0aGlzIHNlcmllcyBs
ZWZ0IHVubWVyZ2VkIGR1ZSB0byBiZWluZyBmb3Jnb3R0ZW4/CgpBdCAyMDI1LTAyLTA1IDE3OjQ3
OjQwLCAiVGhvbWFzIEJvbm5lZmlsbGUgdmlhIGJ1aWxkcm9vdCIgPGJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnPiB3cm90ZToKPlNpZ25lZC1vZmYtYnk6IFRob21hcyBCb25uZWZpbGxlIDx0aG9tYXMu
Ym9ubmVmaWxsZUBib290bGluLmNvbT4KCiAgICBUZXN0ZWQtYnk6ICBBbmR5IFlhbjxhbmR5c2hy
a0AxNjMuY29tPgoKPi0tLQo+IHBhY2thZ2UvZ3N0cmVhbWVyMS9nc3RyZWFtZXIxL2dzdHJlYW1l
cjEuaGFzaCB8IDQgKystLQo+IHBhY2thZ2UvZ3N0cmVhbWVyMS9nc3RyZWFtZXIxL2dzdHJlYW1l
cjEubWsgICB8IDIgKy0KPiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKPgo+ZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ3N0cmVhbWVyMS9nc3RyZWFtZXIxL2dz
dHJlYW1lcjEuaGFzaCBiL3BhY2thZ2UvZ3N0cmVhbWVyMS9nc3RyZWFtZXIxL2dzdHJlYW1lcjEu
aGFzaAo+aW5kZXggNDQ1ZjFjMTVmNDhhNzM4OTFmZjY4MWU2ZWYwMjYxZDUyMTc5MmRkOS4uN2Nj
OTkyYTVjYjQ3N2I0ODkzOWMyODdlZjQ3NTg2NTgwZDFiMTg3OSAxMDA2NDQKPi0tLSBhL3BhY2th
Z2UvZ3N0cmVhbWVyMS9nc3RyZWFtZXIxL2dzdHJlYW1lcjEuaGFzaAo+KysrIGIvcGFja2FnZS9n
c3RyZWFtZXIxL2dzdHJlYW1lcjEvZ3N0cmVhbWVyMS5oYXNoCj5AQCAtMSwzICsxLDMgQEAKPi0j
IEZyb20gaHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy9nc3RyZWFtZXIvZ3N0
cmVhbWVyLTEuMjIuMTIudGFyLnh6LnNoYTI1NnN1bQo+LXNoYTI1NiAgYWMzNTJmM2QwMmNhYTY3
ZjNiMTY5ZGFhOWFhNzhiMDRkZWEwZmMwOGE3MjdkZTczY2IyOGQ4OWJkNTRjNmY2MSAgZ3N0cmVh
bWVyLTEuMjIuMTIudGFyLnh6Cj4rIyBGcm9tIGh0dHBzOi8vZ3N0cmVhbWVyLmZyZWVkZXNrdG9w
Lm9yZy9zcmMvZ3N0cmVhbWVyL2dzdHJlYW1lci0xLjI0LjExLnRhci54ei5zaGEyNTZzdW0KPitz
aGEyNTYgIDA5M2EzNzk2MDJhMjUwZDVjZDMzYjg4ZTcyMzc1N2M4MDE5ODMxN2VmZGUzMzg5M2Vk
ZjNjODdiNmU1M2I5MDcgIGdzdHJlYW1lci0xLjI0LjExLnRhci54ego+IHNoYTI1NiAgYWQyZWVj
NTE5ZWJkNGI1ZGY4NmVhODRkZmYyNGFlM2JmYTJlZGVhODQ2YTcwM2I1ODkwMmRkMjIxYWUzNzVk
YiAgQ09QWUlORwo+ZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ3N0cmVhbWVyMS9nc3RyZWFtZXIxL2dz
dHJlYW1lcjEubWsgYi9wYWNrYWdlL2dzdHJlYW1lcjEvZ3N0cmVhbWVyMS9nc3RyZWFtZXIxLm1r
Cj5pbmRleCAxNTc3OTk0MjQ4YTViOWM1N2U1MDFhYmUzMDMxZjhiOThmMzcyZjBlLi5lMDYzMDli
ZWI0YmY4ZWY1ZjhiY2QzM2E3MTVjZmI0NjczYzRiYTNkIDEwMDY0NAo+LS0tIGEvcGFja2FnZS9n
c3RyZWFtZXIxL2dzdHJlYW1lcjEvZ3N0cmVhbWVyMS5tawo+KysrIGIvcGFja2FnZS9nc3RyZWFt
ZXIxL2dzdHJlYW1lcjEvZ3N0cmVhbWVyMS5tawo+QEAgLTQsNyArNCw3IEBACj4gIwo+ICMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjCj4gCj4tR1NUUkVBTUVSMV9WRVJTSU9OID0gMS4yMi4xMgo+K0dT
VFJFQU1FUjFfVkVSU0lPTiA9IDEuMjQuMTEKPiBHU1RSRUFNRVIxX1NPVVJDRSA9IGdzdHJlYW1l
ci0kKEdTVFJFQU1FUjFfVkVSU0lPTikudGFyLnh6Cj4gR1NUUkVBTUVSMV9TSVRFID0gaHR0cHM6
Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy9nc3RyZWFtZXIKPiBHU1RSRUFNRVIxX0lO
U1RBTExfU1RBR0lORyA9IFlFUwo+Cj4tLSAKPjIuNDguMQo+Cj5fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+YnVpbGRyb290IG1haWxpbmcgbGlzdAo+YnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKPmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
