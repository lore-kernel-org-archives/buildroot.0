Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B38ECDB482
	for <buildroot@archiver.kernel.org>; Thu, 19 Oct 2023 07:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20CD94010D;
	Thu, 19 Oct 2023 07:55:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20CD94010D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qKk33JOizMic; Thu, 19 Oct 2023 07:55:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D923A424AA;
	Thu, 19 Oct 2023 07:55:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D923A424AA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F12221BF45A
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 07:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D745C83ACB
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 07:55:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D745C83ACB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IfAfwG6XiBNf for <buildroot@lists.busybox.net>;
 Thu, 19 Oct 2023 07:55:29 +0000 (UTC)
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.199])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D06383AC6
 for <buildroot@buildroot.org>; Thu, 19 Oct 2023 07:55:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D06383AC6
Received: from ProDesk.. (unknown [58.22.7.114])
 by zwqz-smtp-mta-g4-2 (Coremail) with SMTP id _____wDX3+Ti4DBlr6rgAw--.45669S2;
 Thu, 19 Oct 2023 15:55:18 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: buildroot@buildroot.org
Date: Thu, 19 Oct 2023 15:55:12 +0800
Message-Id: <20231019075512.2568398-1-andyshrk@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231019075440.2568312-1-andyshrk@163.com>
References: <20231019075440.2568312-1-andyshrk@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wDX3+Ti4DBlr6rgAw--.45669S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJw1rZF18WF43Ww1kAryfXrb_yoWrZrWUpr
 sIgryfGF1I9r1fJr9xKw17Xr4akrs3ur4UJw1xJryj9ry8trn2y347Aa48Jry7Gw47A3yU
 ZF1UWr45WrW8taUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEGQ69UUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiOwoOXmC5n9T70QAAsZ
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
 Content-Type; bh=5GazC9tSGPeXPiOm6sgq5LDV+hBTmdGMcijPxXmOuC4=;
 b=ObVDEg0i2pv1kI2djJyBwIsmz7uMB/Qj14P5tOtRPZ8fh1zMii6pqv4qu8bnFS
 PfjRhqpnI1VXvYuMXAqJ0Z0a/bT0Fu2HLaMoqZq/DyAW0PaVcFhFpkj4n/ts1jQB
 rBx0i3Z21rR2v6NwjhYa0dfFzZtKf22YMUWkMNmub/G1Y=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=163.com header.i=@163.com
 header.a=rsa-sha256 header.s=s110527 header.b=ObVDEg0i
Subject: [Buildroot] [PATCH v2 1/1] igt-gpu-tools: add igt-gpu-tools package
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
Cc: gael.portay@collabora.com, Andy Yan <andyshrk@163.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogR2HDq2wgUE9SVEFZIDxnYWVsLnBvcnRheUBjb2xsYWJvcmEuY29tPgoKSUdUIEdQVSBU
b29scyBpcyBhIGNvbGxlY3Rpb24gb2YgdG9vbHMgZm9yIGRldmVsb3BtZW50IGFuZCB0ZXN0aW5n
IG9mCnRoZSBEUk0gZHJpdmVycwoKU2lnbmVkLW9mZi1ieTogR2HDq2wgUE9SVEFZIDxnYWVsLnBv
cnRheUBjb2xsYWJvcmEuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbmR5IFlhbiA8YW5keXNocmtAMTYz
LmNvbT4KClswXWh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3Qv
cGF0Y2gvMjAxODEyMDQwMjI3MDEuMjgwOTUtMS1nYWVsLnBvcnRheUBjb2xsYWJvcmEuY29tLwoK
LS0tCgpDaGFuZ2VzIGluIHYyOgotIGFkZHJlc3MgdGhlIGNvbW1lbnRzIGZyb20gQXJub3V0IFZh
bmRlY2FwcGVsbGUgaW4gVjFbMF0KCiBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDEgKwogcGFja2FnZS9pZ3QtZ3B1LXRvb2xzL0NvbmZpZy5pbiAgICAgICAgICB8
IDI5ICsrKysrKysrKysrKysrKysrKysrKysrKwogcGFja2FnZS9pZ3QtZ3B1LXRvb2xzL2lndC1n
cHUtdG9vbHMuaGFzaCB8ICA2ICsrKysrCiBwYWNrYWdlL2lndC1ncHUtdG9vbHMvaWd0LWdwdS10
b29scy5tayAgIHwgMTUgKysrKysrKysrKysrCiA0IGZpbGVzIGNoYW5nZWQsIDUxIGluc2VydGlv
bnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2lndC1ncHUtdG9vbHMvQ29uZmlnLmlu
CiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9pZ3QtZ3B1LXRvb2xzL2lndC1ncHUtdG9vbHMu
aGFzaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvaWd0LWdwdS10b29scy9pZ3QtZ3B1LXRv
b2xzLm1rCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9Db25maWcuaW4gYi9wYWNrYWdlL0NvbmZpZy5p
bgppbmRleCA4MzEzNGZiNTJkLi5kNzk4ZmU2ODUwIDEwMDY0NAotLS0gYS9wYWNrYWdlL0NvbmZp
Zy5pbgorKysgYi9wYWNrYWdlL0NvbmZpZy5pbgpAQCAtMTYwNSw2ICsxNjA1LDcgQEAgbWVudSAi
R3JhcGhpY3MiCiAJc291cmNlICJwYWNrYWdlL2d0a21tMy9Db25maWcuaW4iCiAJc291cmNlICJw
YWNrYWdlL2d0a3NvdXJjZXZpZXcvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9oYXJmYnV6
ei9Db25maWcuaW4iCisJc291cmNlICJwYWNrYWdlL2lndC1ncHUtdG9vbHMvQ29uZmlnLmluIgog
CXNvdXJjZSAicGFja2FnZS9panMvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9pbWxpYjIv
Q29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9pbnRlbC1nbW1saWIvQ29uZmlnLmluIgpkaWZm
IC0tZ2l0IGEvcGFja2FnZS9pZ3QtZ3B1LXRvb2xzL0NvbmZpZy5pbiBiL3BhY2thZ2UvaWd0LWdw
dS10b29scy9Db25maWcuaW4KbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4u
NWMwNDBmOGE1ZAotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvaWd0LWdwdS10b29scy9Db25m
aWcuaW4KQEAgLTAsMCArMSwyOSBAQAorY29uZmlnIEJSMl9QQUNLQUdFX0lHVF9HUFVfVE9PTFMK
Kwlib29sICJpZ3QtZ3B1LXRvb2xzIgorCWRlcGVuZHMgb24gQlIyX1VTRV9NTVUgIyBwcm9jcHMt
bmcKKwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0xJQlVOV0lORF9BUkNIX1NVUFBPUlRTICMgbGli
dW53aW5kCisJZGVwZW5kcyBvbiAhQlIyX1NUQVRJQ19MSUJTICMga21vZCwgbGlidW53aW5kCisJ
ZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hBU19USFJFQURTICMgbGliZHJtLCBsaWJ1bndpbmQK
KwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0hBU19VREVWCisJc2VsZWN0IEJSMl9QQUNLQUdFX0JV
U1lCT1hfU0hPV19PVEhFUlMgIyBwcm9jcHMtbmcKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfQ0FJUk8K
KwlzZWxlY3QgQlIyX1BBQ0tBR0VfQ0FJUk9fUE5HCisJc2VsZWN0IEJSMl9QQUNLQUdFX0tNT0QK
KwlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCRFJNCisJc2VsZWN0IEJSMl9QQUNLQUdFX0xJQlBDSUFD
Q0VTUworCXNlbGVjdCBCUjJfUEFDS0FHRV9MSUJVTldJTkQKKwlzZWxlY3QgQlIyX1BBQ0tBR0Vf
T1BFTlNTTAorCXNlbGVjdCBCUjJfUEFDS0FHRV9QSVhNQU4KKwlzZWxlY3QgQlIyX1BBQ0tBR0Vf
UFJPQ1BTX05HCisJc2VsZWN0IEJSMl9QQUNLQUdFX1pMSUIKKwloZWxwCisJICBJR1QgR1BVIFRv
b2xzIGlzIGEgY29sbGVjdGlvbiBvZiB0b29scyBmb3IgZGV2ZWxvcG1lbnQgYW5kCisJICB0ZXN0
aW5nIG9mIHRoZSBEUk0gZHJpdmVycy4KKworCSAgaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Au
b3JnL2RybS9pZ3QtZ3B1LXRvb2xzCisKK2NvbW1lbnQgImlndC1ncHUtdG9vbHMgbmVlZHMgdWRl
diAvZGV2IG1hbmFnZW1lbnQgYW5kIHRvb2xjaGFpbiB3LyB0aHJlYWRzLCB3Y2hhciwgZHluYW1p
YyBsaWJyYXJ5IgorCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfTElCVU5XSU5EX0FSQ0hfU1VQUE9S
VFMgIyBsaWJ1bndpbmQKKwlkZXBlbmRzIG9uIEJSMl9VU0VfTU1VICMgcHJvY3BzLW5nCisgICAg
ICAgIGRlcGVuZHMgb24gIUJSMl9QQUNLQUdFX0hBU19VREVWIHx8IEJSMl9TVEFUSUNfTElCUyB8
fCBcCisJCSFCUjJfVE9PTENIQUlOX0hBU19USFJFQURTIHx8ICFCUjJfVVNFX1dDSEFSCmRpZmYg
LS1naXQgYS9wYWNrYWdlL2lndC1ncHUtdG9vbHMvaWd0LWdwdS10b29scy5oYXNoIGIvcGFja2Fn
ZS9pZ3QtZ3B1LXRvb2xzL2lndC1ncHUtdG9vbHMuaGFzaApuZXcgZmlsZSBtb2RlIDEwMDY0NApp
bmRleCAwMDAwMDAwMDAwLi45NzRjMjQ3YTI4Ci0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9p
Z3QtZ3B1LXRvb2xzL2lndC1ncHUtdG9vbHMuaGFzaApAQCAtMCwwICsxLDYgQEAKKyMgTG9jYWxs
eSBjYWxjdWxhdGVkIGZyb20gZG93bmxvYWQKK3NoYTI1NiBiYTE1YjMyMWM1YTkwZGE2MjliYWYz
MjY5MTJjOWMwNDA2YTkwMzcxOTA0MGViNDk1OWUwYWYxMTk3OTM1MTMzICBpZ3QtZ3B1LXRvb2xz
LXYxLjI4LnRhci5negorc2hhMjU2IDZmOGIyYjEyNzA0YzBiMzdjMjJmMzJhMzc1MTY4OGU3MTQ0
Zjg1MGZhYTcxNWU4NWIyNmVmZmRjNTIwOWNmZDEJIGlndC1ncHUtdG9vbHMtdjEuMjgudGFyLmJ6
MgorCisjIEhhc2ggZm9yIGxpY2Vuc2UgZmlsZToKK3NoYTI1NiAxYjdlMjY2ODU3YjA1ODA4NjYw
ZjQyMzY5YTRhNzk3NDU5ZDdiN2JlYzcyNDVlMzc4YWEyOGE4ZGIyZjIxM2RhICBDT1BZSU5HCmRp
ZmYgLS1naXQgYS9wYWNrYWdlL2lndC1ncHUtdG9vbHMvaWd0LWdwdS10b29scy5tayBiL3BhY2th
Z2UvaWd0LWdwdS10b29scy9pZ3QtZ3B1LXRvb2xzLm1rCm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IDAwMDAwMDAwMDAuLmQ5ZjQ1NTg2OWQKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL2ln
dC1ncHUtdG9vbHMvaWd0LWdwdS10b29scy5tawpAQCAtMCwwICsxLDE1IEBACisjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIworIworIyBpZ3QtZ3B1LXRvb2xzIAorIworIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMKKworSUdUX0dQVV9UT09MU19WRVJTSU9OID0gdjEuMjgKK0lHVF9HUFVfVE9PTFNfU09V
UkNFID0gaWd0LWdwdS10b29scy0kKElHVF9HUFVfVE9PTFNfVkVSU0lPTikudGFyLmJ6MgorSUdU
X0dQVV9UT09MU19TSVRFID0gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pZ3Qt
Z3B1LXRvb2xzLy0vYXJjaGl2ZS8kKElHVF9HUFVfVE9PTFNfVkVSU0lPTikKK0lHVF9HUFVfVE9P
TFNfTElDRU5TRSA9IE1JVAorSUdUX0dQVV9UT09MU19MSUNFTlNFX0ZJTEVTID0gQ09QWUlORwor
SUdUX0dQVV9UT09MU19JTlNUQUxMX1NUQUdJTkcgPSBZRVMKK0lHVF9HUFVfVE9PTFNfREVQRU5E
RU5DSUVTID0gaG9zdC1wa2djb25mIGNhaXJvIGttb2QgbGliZHJtIGxpYmdsaWIyIGxpYnBjaWFj
Y2VzcyBsaWJ1bndpbmQgcGl4bWFuIHByb2Nwcy1uZyB6bGliCisKKyQoZXZhbCAkKG1lc29uLXBh
Y2thZ2UpKQotLSAKMi4zNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
