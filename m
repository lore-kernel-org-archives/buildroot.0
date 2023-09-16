Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F110CD37B2
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 07:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D90C9405BF;
	Sat, 16 Sep 2023 07:02:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D90C9405BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hEkF73wVCiGC; Sat, 16 Sep 2023 07:02:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3721B4023F;
	Sat, 16 Sep 2023 07:02:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3721B4023F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 785D41BF860
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 07:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 522D083B69
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 07:02:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 522D083B69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PLyVEjOQAFzp for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 07:02:00 +0000 (UTC)
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6DCFA83B63
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 07:02:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DCFA83B63
X-Virus-Scanned: by amavisd-new using ClamAV (23)
Received: from zm.lan (pub-46.182.29.194.multiplay.pl [194.29.182.46])
 by server220076.nazwa.pl (Postfix) with ESMTP id DB9711BBEB4;
 Sat, 16 Sep 2023 09:01:57 +0200 (CEST)
From: Marcin Niestroj <m.niestroj@grinn-global.com>
To: buildroot@buildroot.org
Date: Sat, 16 Sep 2023 09:01:47 +0200
Message-ID: <20230916070153.2983243-1-m.niestroj@grinn-global.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/python-pytest: fix dependency on
 zlib
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

dGVzdHMucGFja2FnZS50ZXN0X3B5dGhvbl9weXRlc3QuVGVzdFB5dGhvblB5M1B5dGVzdCBydW50
aW1lIHRlc3RzIGZhaWxzCm5vdyB3aXRoIGZvbGxvd2luZyBlcnJvcjoKCiAgPT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PQogIEZBSUw6IHRlc3RfcnVuICh0ZXN0cy5wYWNrYWdlLnRlc3RfcHl0aG9uX3B5dGVzdC5UZXN0
UHl0aG9uUHkzUHl0ZXN0LnRlc3RfcnVuKQogIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KICBUcmFjZWJhY2sgKG1v
c3QgcmVjZW50IGNhbGwgbGFzdCk6CiAgICBGaWxlICIvYnVpbGRyb290L3N1cHBvcnQvdGVzdGlu
Zy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9uLnB5IiwgbGluZSAxMzcsIGluIHRlc3RfcnVuCiAg
ICAgIHNlbGYucnVuX3NhbXBsZV9zY3JpcHRzKCkKICAgIEZpbGUgIi9idWlsZHJvb3Qvc3VwcG9y
dC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25fcHl0ZXN0LnB5IiwgbGluZSAxOCwg
aW4gcnVuX3NhbXBsZV9zY3JpcHRzCiAgICAgIHNlbGYuYXNzZXJ0UnVuT2soY21kLCB0aW1lb3V0
PXNlbGYudGltZW91dCkKICAgIEZpbGUgIi9idWlsZHJvb3Qvc3VwcG9ydC90ZXN0aW5nL2luZnJh
L2Jhc2V0ZXN0LnB5IiwgbGluZSA4OSwgaW4gYXNzZXJ0UnVuT2sKICAgICAgc2VsZi5hc3NlcnRF
cXVhbCgKICBBc3NlcnRpb25FcnJvcjogMSAhPSAwIDoKICBGYWlsZWQgdG8gcnVuOiBweXRob24g
LW0gcHl0ZXN0IHNhbXBsZV9weXRob25fcHl0ZXN0LnB5CiAgb3V0cHV0IHdhczoKICAgIFRyYWNl
YmFjayAobW9zdCByZWNlbnQgY2FsbCBsYXN0KToKICAgICAgRmlsZSAiPGZyb3plbiBydW5weT4i
LCBsaW5lIDE4OSwgaW4gX3J1bl9tb2R1bGVfYXNfbWFpbgogICAgICBGaWxlICI8ZnJvemVuIHJ1
bnB5PiIsIGxpbmUgMTQ4LCBpbiBfZ2V0X21vZHVsZV9kZXRhaWxzCiAgICAgIEZpbGUgIjxmcm96
ZW4gcnVucHk+IiwgbGluZSAxMTIsIGluIF9nZXRfbW9kdWxlX2RldGFpbHMKICAgICAgRmlsZSAi
L3Vzci9saWIvcHl0aG9uMy4xMS9zaXRlLXBhY2thZ2VzL3B5dGVzdC9fX2luaXRfXy5weSIsIGxp
bmUgNSwgaW4gPG1vZHVsZT4KICAgICAgRmlsZSAiL3Vzci9saWIvcHl0aG9uMy4xMS9zaXRlLXBh
Y2thZ2VzL19weXRlc3QvX2NvZGUvX19pbml0X18ucHkiLCBsaW5lIDIsIGluIDxtb2R1bGU+CiAg
ICAgIEZpbGUgIi91c3IvbGliL3B5dGhvbjMuMTEvc2l0ZS1wYWNrYWdlcy9fcHl0ZXN0L19jb2Rl
L2NvZGUucHkiLCBsaW5lIDM2LCBpbiA8bW9kdWxlPgogICAgICBGaWxlICIvdXNyL2xpYi9weXRo
b24zLjExL3NpdGUtcGFja2FnZXMvcGx1Z2d5L19faW5pdF9fLnB5IiwgbGluZSAxNiwgaW4gPG1v
ZHVsZT4KICAgICAgRmlsZSAiL3Vzci9saWIvcHl0aG9uMy4xMS9zaXRlLXBhY2thZ2VzL3BsdWdn
eS9fbWFuYWdlci5weSIsIGxpbmUgMTAsIGluIDxtb2R1bGU+CiAgICAgIEZpbGUgIi91c3IvbGli
L3B5dGhvbjMuMTEvaW1wb3J0bGliL21ldGFkYXRhL19faW5pdF9fLnB5IiwgbGluZSA4LCBpbiA8
bW9kdWxlPgogICAgICBGaWxlICIvdXNyL2xpYi9weXRob24zLjExL3ppcGZpbGUucHkiLCBsaW5l
IDYsIGluIDxtb2R1bGU+CiAgICBJbXBvcnRFcnJvcjogbGliei5zby4xOiBjYW5ub3Qgb3BlbiBz
aGFyZWQgb2JqZWN0IGZpbGU6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKCkZpeCB0aGF0IGJ5
IGFkZGluZyBCUjJfUEFDS0FHRV9QWVRIT04zX1pMSUIgZGVwZW5kZW5jeS4KClNpZ25lZC1vZmYt
Ynk6IE1hcmNpbiBOaWVzdHJvaiA8bS5uaWVzdHJvakBncmlubi1nbG9iYWwuY29tPgotLS0KIHBh
Y2thZ2UvcHl0aG9uLXB5dGVzdC9Db25maWcuaW4gfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLXB5dGVzdC9Db25maWcuaW4g
Yi9wYWNrYWdlL3B5dGhvbi1weXRlc3QvQ29uZmlnLmluCmluZGV4IDliYmM5ZWEyZDIuLmM4Zjlh
NmViNWIgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcHl0aG9uLXB5dGVzdC9Db25maWcuaW4KKysrIGIv
cGFja2FnZS9weXRob24tcHl0ZXN0L0NvbmZpZy5pbgpAQCAtNiw2ICs2LDcgQEAgY29uZmlnIEJS
Ml9QQUNLQUdFX1BZVEhPTl9QWVRFU1QKIAlzZWxlY3QgQlIyX1BBQ0tBR0VfUFlUSE9OX1BMVUdH
WSAjIHJ1bnRpbWUKIAlzZWxlY3QgQlIyX1BBQ0tBR0VfUFlUSE9OX1BZICMgcnVudGltZQogCXNl
bGVjdCBCUjJfUEFDS0FHRV9QWVRIT04zX1BZRVhQQVQgIyBydW50aW1lCisJc2VsZWN0IEJSMl9Q
QUNLQUdFX1BZVEhPTjNfWkxJQiAjIHJ1bnRpbWUKIAloZWxwCiAJICBweXRlc3QgaXMgYSBmcmFt
ZXdvcmsgdGhhdCBtYWtlcyBidWlsZGluZyBzaW1wbGUgYW5kIHNjYWxhYmxlCiAJICB0ZXN0cyBl
YXN5LiBUZXN0cyBhcmUgZXhwcmVzc2l2ZSBhbmQgcmVhZGFibGXigJRubyBib2lsZXJwbGF0ZQot
LSAKMi40Mi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
