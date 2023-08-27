Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE18AC83F10
	for <buildroot@archiver.kernel.org>; Sun, 27 Aug 2023 11:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4FC9240549;
	Sun, 27 Aug 2023 11:18:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FC9240549
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k_sqNOsichlE; Sun, 27 Aug 2023 11:18:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C017404DF;
	Sun, 27 Aug 2023 11:18:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C017404DF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EDDF61BF3F6
 for <buildroot@lists.busybox.net>; Sun, 27 Aug 2023 11:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B44760BBD
 for <buildroot@lists.busybox.net>; Sun, 27 Aug 2023 11:18:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B44760BBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZTeKETR_KiT5 for <buildroot@lists.busybox.net>;
 Sun, 27 Aug 2023 11:18:44 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D858060ABD
 for <buildroot@buildroot.org>; Sun, 27 Aug 2023 11:18:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D858060ABD
Received: by helium.openadk.org (Postfix, from userid 1000)
 id B285C3520BF2; Sun, 27 Aug 2023 13:18:39 +0200 (CEST)
Date: Sun, 27 Aug 2023 13:18:39 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZOsxD6Z372MejW1M@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1693135119; bh=EJj5yeOE5YFha5O8IbECgyy4kfZNIsc6ORiyPUVzi8o=;
 h=Date:From:To:Subject:From;
 b=HMoneUj5Ck71M6BFClkvo2OeZLpQKm4IaS27FOrOkoDK2ga4e4v9/3DMgghXffA1B
 pO9d2yR7P+pZ/rs7GmdrNoUurnIbys2lWovgq+EUVY7tj+n2QdGfYnkmTrIYm4uFzx
 5g2hjcdHuWpVrfkSB9VN/bcH2N3/6PoXn7Tkx2xoLJjt9/mstceFCU2oSY6+ErApJq
 8wILGyu7QFlS3N+1bK6Fo6jYDATEv/xJZtAeM9TfqXGzbMTpwMHrl18P456xkfq1RU
 YIYx38jrUEjwHIzlcwVtayR1O/SW0cScqhii3KUYC97y9kWYjhofd6DUYzb/E9v+FQ
 z9khT0uSJT/qQ==
Subject: [Buildroot] [PATCH] package/pam: fix uclibc compile error
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rm9sbG93aW5nIGJ1aWxkIGZhaWx1cmUgb2NjdXJzOgpvcGFzc3dkLmM6IEluIGZ1bmN0aW9uICdj
b21wYXJlX3Bhc3N3b3JkJzoKb3Bhc3N3ZC5jOjE0MjozOiBlcnJvcjogJ3JldHZhbCcgdW5kZWNs
YXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pOyBkaWQgeW91IG1lYW4gJ291dHZhbCc/
CiAgMTQyIHwgICByZXR2YWwgPSBvdXR2YWwgIT0gTlVMTCAmJiBzdHJjbXAob3V0dmFsLCBvbGRw
YXNzKSA9PSAwOwogICAgICB8ICAgXn5+fn5+CiAgICAgIHwgICBvdXR2YWwKCkFkZCBhIHBhdGNo
IGZyb20gdXBzdHJlYW0gdG8gZml4IGl0LgpIYXBwZW5zIHNpbmNlIHRoZSB1cGRhdGUgdG8gMS41
LjMgaW4gQnVpbGRyb290IGNvbW1pdDoKZjgxNDdlMjdjZGFjOGY5OThlYzY2NDRhMDljZTRlOGQ2
MmI2NDMzYwoKRml4ZXM6CiAtIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRz
LzU3Ni81NzZmYzRiOWNjYmM2Y2ZmODI1Njk2OTJiZGVjODIxOTJlODlmMDM2CgpTaWduZWQtb2Zm
LWJ5OiBXYWxkZW1hciBCcm9ka29yYiA8d2J4QG9wZW5hZGsub3JnPgotLS0KIC4uLkZpeC1idWls
ZC1pZi1jcnlwdF9yLWlzbi10LWF2YWlsYWJsZS5wYXRjaCB8IDM3ICsrKysrKysrKysrKysrKysr
KysKIDEgZmlsZSBjaGFuZ2VkLCAzNyBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQg
cGFja2FnZS9saW51eC1wYW0vMDAwMi1GaXgtYnVpbGQtaWYtY3J5cHRfci1pc24tdC1hdmFpbGFi
bGUucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpbnV4LXBhbS8wMDAyLUZpeC1idWlsZC1p
Zi1jcnlwdF9yLWlzbi10LWF2YWlsYWJsZS5wYXRjaCBiL3BhY2thZ2UvbGludXgtcGFtLzAwMDIt
Rml4LWJ1aWxkLWlmLWNyeXB0X3ItaXNuLXQtYXZhaWxhYmxlLnBhdGNoCm5ldyBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmM3ZmRkOGJlMzYKLS0tIC9kZXYvbnVsbAorKysgYi9w
YWNrYWdlL2xpbnV4LXBhbS8wMDAyLUZpeC1idWlsZC1pZi1jcnlwdF9yLWlzbi10LWF2YWlsYWJs
ZS5wYXRjaApAQCAtMCwwICsxLDM3IEBACitGcm9tIGI4MmFjYzIxZjFlMmY3NmQ0Y2IwYzc1YmI0
OTU4NzUxNTYyMDM5YWIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBCZXJuaGFyZCBS
b3Nlbmtyw6RuemVyIDxiZXJvQGxpbmRldi5jaD4KK0RhdGU6IFdlZCwgNyBKdW4gMjAyMyAxOTo0
OTowMSArMDIwMAorU3ViamVjdDogW1BBVENIXSBGaXggYnVpbGQgaWYgY3J5cHRfciBpc24ndCBh
dmFpbGFibGUKK01JTUUtVmVyc2lvbjogMS4wCitDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNo
YXJzZXQ9VVRGLTgKK0NvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKKworcmV0dmFsIHdh
cyBiZWluZyBkZWZpbmVkIG9ubHkgaW4gI2lmZGVmIEhBVkVfQ1JZUFRfUiwgYnV0IHVzZWQKK3Vu
Y29uZGl0aW9uYWxseS4KKworU2lnbmVkLW9mZi1ieTogQmVybmhhcmQgUm9zZW5rcsOkbnplciA8
YmVyb0BsaW5kZXYuY2g+CitGaXhlczogYmNiYTE3OTM5ZTFiICgibW9kdWxlczogbWFrZSB1c2Ug
b2Ygc2VjdXJlIG1lbW9yeSBlcmFzdXJlIikKK1NpZ25lZC1vZmYtYnk6IFdhbGRlbWFyIEJyb2Rr
b3JiIDx3YnhAb3BlbmFkay5vcmc+CitVcHN0cmVhbTogaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4
LXBhbS9saW51eC1wYW0vY29tbWl0L2I4MmFjYzIxZjFlMmY3NmQ0Y2IwYzc1YmI0OTU4NzUxNTYy
MDM5YWIKKy0tLQorIG1vZHVsZXMvcGFtX3B3aGlzdG9yeS9vcGFzc3dkLmMgfCAyICstCisgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCisKK2RpZmYgLS1naXQg
YS9tb2R1bGVzL3BhbV9wd2hpc3Rvcnkvb3Bhc3N3ZC5jIGIvbW9kdWxlcy9wYW1fcHdoaXN0b3J5
L29wYXNzd2QuYworaW5kZXggNDc5ZTNmYzQuLmZjNjEwZTJmIDEwMDY0NAorLS0tIGEvbW9kdWxl
cy9wYW1fcHdoaXN0b3J5L29wYXNzd2QuYworKysrIGIvbW9kdWxlcy9wYW1fcHdoaXN0b3J5L29w
YXNzd2QuYworQEAgLTEyOCw5ICsxMjgsOSBAQCBzdGF0aWMgaW50CisgY29tcGFyZV9wYXNzd29y
ZChjb25zdCBjaGFyICpuZXdwYXNzLCBjb25zdCBjaGFyICpvbGRwYXNzKQorIHsKKyAgIGNoYXIg
Km91dHZhbDsKKysgIGludCByZXR2YWw7CisgI2lmZGVmIEhBVkVfQ1JZUFRfUgorICAgc3RydWN0
IGNyeXB0X2RhdGEgb3V0cHV0OworLSAgaW50IHJldHZhbDsKKyAKKyAgIG91dHB1dC5pbml0aWFs
aXplZCA9IDA7CisgCistLSAKKzIuMzkuMgorCi0tIAoyLjM5LjIKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
