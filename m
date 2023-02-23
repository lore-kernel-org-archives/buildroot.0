Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E3CC61DA4
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 10:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88E34821F3;
	Thu, 23 Feb 2023 10:46:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88E34821F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j-pcbliPuk6S; Thu, 23 Feb 2023 10:46:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7160821E8;
	Thu, 23 Feb 2023 10:46:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7160821E8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A5CE11BF35E
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 10:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6564741B8E
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 10:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6564741B8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fdEY7crrrF9z for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 10:46:22 +0000 (UTC)
X-Greylist: delayed 00:05:27 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6206141B8C
Received: from first.geanix.com (first.geanix.com [116.203.34.67])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6206141B8C
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 10:46:22 +0000 (UTC)
Received: from xps.geanix.com (unknown [185.17.218.86])
 by first.geanix.com (Postfix) with ESMTPSA id DCA6A4614B8;
 Thu, 23 Feb 2023 10:40:50 +0000 (UTC)
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: buildroot@buildroot.org
Date: Thu, 23 Feb 2023 11:40:48 +0100
Message-Id: <20230223104048.333575-1-martin@geanix.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=geanix.com; s=first; 
 t=1677148851; bh=MlBK0X+D8leZMwMgtETaBvrQ0FB0w6L+XDoBvU0dWg0=;
 h=From:To:Cc:Subject:Date;
 b=BwY3vgH8H5BY99rGXCaL88Cle9sx4oNq7x7DX83eXq4ebhc785pYadl6olCdBUf4b
 HGadM3G0/GK2eae+NJf+d//R6a51nWTLZqgmCG+BJ+Av0IjBAGp77Iwmb9uJfFe2NN
 8J5BfLQ2obdHtvIgPTSCV6ZQcjVsVN4Lnmw0YAFcBVryhMHLnwJohPylXfu+yoHOpe
 8jjoAB7xUK2Gv9YyLwS/COtyaCRHEO3I2ucIk9jBU210Arvn/gze+lyyB3+Zkgq5Jh
 4+4ae9chESLSpjfNgLa5xp1FSHvW3KABwjmz6Zkw0y6tlZRLokjmnvfwTqy8B/pPXN
 IocMsDaoWN6JA==
Subject: [Buildroot] [PATCH] ifupdown: bump to 0.8.41
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
Cc: Martin Hundeboll <martin@geanix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogTWFydGluIEh1bmRlYm9sbCA8bWFydGluQGdlYW5peC5jb20+CgpNdXNsIGlzIG5vdCBz
dXBwb3J0ZWQgc2luY2UgSnVuZSAyMDE3LCB3aGVyZSB1c2Ugb2YgZm5tYXRjaCgpIHdhcwppbnRy
b2R1Y2VkIHRvIHN1cHBvcnQgd2lsZGNhcmQgbWF0Y2hpbmcgb24gaW50ZXJmYWNlcy4KClNpZ25l
ZC1vZmYtYnk6IE1hcnRpbiBIdW5kZWLDuGxsIDxtYXJ0aW5AZ2Vhbml4LmNvbT4KLS0tCiBwYWNr
YWdlL2lmdXBkb3duL0NvbmZpZy5pbiAgICAgfCAxICsKIHBhY2thZ2UvaWZ1cGRvd24vaWZ1cGRv
d24uaGFzaCB8IDQgKystLQogcGFja2FnZS9pZnVwZG93bi9pZnVwZG93bi5tayAgIHwgNSArKyst
LQogMyBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvcGFja2FnZS9pZnVwZG93bi9Db25maWcuaW4gYi9wYWNrYWdlL2lmdXBkb3duL0Nv
bmZpZy5pbgppbmRleCA5N2QwMmI0YzM3Li45OTlhMmU3ZTBjIDEwMDY0NAotLS0gYS9wYWNrYWdl
L2lmdXBkb3duL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL2lmdXBkb3duL0NvbmZpZy5pbgpAQCAt
Miw2ICsyLDcgQEAgY29uZmlnIEJSMl9QQUNLQUdFX0lGVVBET1dOCiAJYm9vbCAiaWZ1cGRvd24i
CiAJZGVwZW5kcyBvbiBCUjJfVVNFX01NVSAjIGZvcmsoKQogCWRlcGVuZHMgb24gQlIyX1RPT0xD
SEFJTl9IRUFERVJTX0FUX0xFQVNUXzNfNCAjIGlwcm91dGUyCisJZGVwZW5kcyBvbiAhQlIyX1RP
T0xDSEFJTl9VU0VTX01VU0wgIyBtaXNzaW5nIEZOTV9FWFRNQVRDSCBkZWZpbmUKIAlkZXBlbmRz
IG9uIEJSMl9QQUNLQUdFX0JVU1lCT1hfU0hPV19PVEhFUlMKIAkjIHJ1bnRpbWUgZm9yIGlwIGJp
bmFyeQogCXNlbGVjdCBCUjJfUEFDS0FHRV9JUFJPVVRFMiBpZiAhQlIyX1BBQ0tBR0VfQlVTWUJP
WApkaWZmIC0tZ2l0IGEvcGFja2FnZS9pZnVwZG93bi9pZnVwZG93bi5oYXNoIGIvcGFja2FnZS9p
ZnVwZG93bi9pZnVwZG93bi5oYXNoCmluZGV4IGY4ODQ0YTYwYTYuLmY1YzJkMmQzNGMgMTAwNjQ0
Ci0tLSBhL3BhY2thZ2UvaWZ1cGRvd24vaWZ1cGRvd24uaGFzaAorKysgYi9wYWNrYWdlL2lmdXBk
b3duL2lmdXBkb3duLmhhc2gKQEAgLTEsNCArMSw0IEBACi0jIEZyb20gaHR0cDovL2Z0cC5kZS5k
ZWJpYW4ub3JnL2RlYmlhbi9wb29sL21haW4vaS9pZnVwZG93bi9pZnVwZG93bl8wLjguMTYuZHNj
Ci1zaGEyNTYgIDYwMTQxNmMxMmUzOWFjMjkwMjI5NTFhMjg2N2FlZDVjNjA3ZjczMmFjNTdmZDUx
NTE3YmZiYTkyYTRjYzRmYjAgIGlmdXBkb3duXzAuOC4xNi50YXIueHoKKyMgRnJvbSBodHRwOi8v
c25hcHNob3QuZGViaWFuLm9yZy9hcmNoaXZlL2RlYmlhbi8yMDIzMDIyMlQyMDU2MTVaL3Bvb2wv
bWFpbi9pL2lmdXBkb3duL2lmdXBkb3duXzAuOC40MS5kc2MKK3NoYTI1NiAgMjIyYzViZWYzMTNh
OWU3MWQ5YmU0Yjk0NmM3M2M4NjA2Yzk4ZjllMDIyOTE1MzE5MWQ5YzZkOGZiOWIzNTk5YyAgaWZ1
cGRvd25fMC44LjQxLnRhci54egogIyBMb2NhbGx5IGNvbXB1dGVkCiBzaGEyNTYgIDMyYjEwNjJm
N2RhODQ5NjdlNzAxOWQwMWFiODA1OTM1Y2FhN2FiNzMyMWE3Y2VkMGUzMGViZTc1ZTVkZjE2NzAg
IENPUFlJTkcKZGlmZiAtLWdpdCBhL3BhY2thZ2UvaWZ1cGRvd24vaWZ1cGRvd24ubWsgYi9wYWNr
YWdlL2lmdXBkb3duL2lmdXBkb3duLm1rCmluZGV4IGU2MmMyYTc5YzUuLjE0YzM2ZGIwZGIgMTAw
NjQ0Ci0tLSBhL3BhY2thZ2UvaWZ1cGRvd24vaWZ1cGRvd24ubWsKKysrIGIvcGFja2FnZS9pZnVw
ZG93bi9pZnVwZG93bi5tawpAQCAtNCw5ICs0LDkgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjCiAKLUlGVVBET1dOX1ZFUlNJT04gPSAwLjguMTYKK0lGVVBET1dOX1ZFUlNJT04gPSAwLjgu
NDEKIElGVVBET1dOX1NPVVJDRSA9IGlmdXBkb3duXyQoSUZVUERPV05fVkVSU0lPTikudGFyLnh6
Ci1JRlVQRE9XTl9TSVRFID0gaHR0cDovL3NuYXBzaG90LmRlYmlhbi5vcmcvYXJjaGl2ZS9kZWJp
YW4vMjAxNjA5MjJUMTY1NTAzWi9wb29sL21haW4vaS9pZnVwZG93bgorSUZVUERPV05fU0lURSA9
IGh0dHA6Ly9zbmFwc2hvdC5kZWJpYW4ub3JnL2FyY2hpdmUvZGViaWFuLzIwMjMwMjIyVDIwNTYx
NVovcG9vbC9tYWluL2kvaWZ1cGRvd24KIElGVVBET1dOX0xJQ0VOU0UgPSBHUEwtMi4wKwogSUZV
UERPV05fTElDRU5TRV9GSUxFUyA9IENPUFlJTkcKIElGVVBET1dOX0NQRV9JRF9WRU5ET1IgPSBk
ZWJpYW4KQEAgLTE0LDYgKzE0LDcgQEAgSUZVUERPV05fQ1BFX0lEX1ZFTkRPUiA9IGRlYmlhbgog
ZGVmaW5lIElGVVBET1dOX0JVSUxEX0NNRFMKIAkkKFRBUkdFVF9NQUtFX0VOVikgJChNQUtFKSAk
KFRBUkdFVF9DT05GSUdVUkVfT1BUUykgXAogCQlDRkxBR1M9IiQoVEFSR0VUX0NGTEFHUykgLXN0
ZD1nbnU5OSAtRCdJRlVQRE9XTl9WRVJTSU9OPVwiJChJRlVQRE9XTl9WRVJTSU9OKVwiJyIgXAor
CQlBUkNIPWxpbnV4IFwKIAkJLUMgJChARCkKIGVuZGVmCiAKLS0gCjIuMzkuMgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
