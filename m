Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85FB8C636D7
	for <buildroot@archiver.kernel.org>; Sat, 18 Feb 2023 09:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16FA182031;
	Sat, 18 Feb 2023 09:30:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16FA182031
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N18t9JCYDNoL; Sat, 18 Feb 2023 09:30:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C6D982006;
	Sat, 18 Feb 2023 09:30:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C6D982006
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6A7951BF381
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 09:30:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 442DA60DF0
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 09:30:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 442DA60DF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8v6VHsI5GitQ for <buildroot@lists.busybox.net>;
 Sat, 18 Feb 2023 09:30:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAC7A60D65
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BAC7A60D65
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 09:30:27 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout02.posteo.de (Postfix) with ESMTPS id DEB20240604
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 10:30:24 +0100 (CET)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4PJk1W3j0Lz9rxQ;
 Sat, 18 Feb 2023 10:30:23 +0100 (CET)
From: Alexander Egorenkov <egorenar-dev@posteo.net>
To: buildroot@buildroot.org
Date: Sat, 18 Feb 2023 09:29:43 +0000
Message-Id: <20230218092943.2598-1-egorenar-dev@posteo.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=posteo.net; s=2017; 
 t=1676712624; bh=NsphXLzEh8YL3gFlaP0WTgmwq+ayYG+XWdHklTUcQIk=;
 h=From:To:Cc:Subject:Date:From;
 b=rlu7jxa3CIL0DeqekCsVuKSBwjOhtcaxcDcO6phIDBo1UQ26aDPUbAFC0dnF0y4v1
 QtPGZhoxbp8h7P+HcwEzVUhPJzKSLm5CySHoyA/xDibEengCy/hekM75pcSdBVHJ3c
 v23GJY0j3JneLDR90V/TAHbFZkpJXNLLacmuFGBwCQcaKhplj0Qkk7pLVR3kjFnpDo
 sbyd+MB2gy6GZwl9684mOcfcm1g+vXqQPoU9Vu3AxKv0MiwNTc0EfZsR/QKmhUsXil
 dvEvED2NsruA1HSp/g/BN7JYHTGIcMc0tBAZXaLMilN3f/GKKP3d0ZhO4oLq938WRo
 tAAqV1/o2VQOQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net
 header.a=rsa-sha256 header.s=2017 header.b=rlu7jxa3
Subject: [Buildroot] [PATCH 1/1] package/multipath-tools: fix path to kernel
 headers
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
Cc: Alexander Egorenkov <egorenar-dev@posteo.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

V2l0aCBjaGFuZ2UgNmI3ZDQ3YmUzYjIzICgibXVsdGlwYXRoLXRvb2xzOiBNYWtlZmlsZXM6IHNp
bXBsaWZ5IGNvZGUgZm9yCmluY2x1ZGUgZGlycyIpIHRoZSBNYWtlZmlsZSB2YXJpYWJsZSAnTElO
VVhfSEVBREVSU19JTkNESVInIGhhcyBiZWVuIHJlcGxhY2VkCndpdGggJ2tlcm5lbF9pbmNkaXIn
LgoKZnBpbl9oYW5kbGVycy5jOjM1NTozMjogbm90ZTogZWFjaCB1bmRlY2xhcmVkIGlkZW50aWZp
ZXIgaXMgcmVwb3J0ZWQgb25seSBvbmNlIGZvciBlYWNoIGZ1bmN0aW9uIGl0IGFwcGVhcnMgaW4K
ZnBpbl9oYW5kbGVycy5jOjM2MDozNzogZXJyb3I6IOKAmEVMU19EVEFHX0xOS19JTlRFR1JJVFni
gJkgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pCiAgMzYwIHwgICAgICAg
ICAgICAgICAgICAgICAgICAgaWYgKGR0YWcgPT0gRUxTX0RUQUdfTE5LX0lOVEVHUklUWSkgewog
ICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+
fn5+fn5+fn4KbWFrZVsyXTogKioqIFsuLi9NYWtlZmlsZS5pbmM6MTE2OiBmcGluX2hhbmRsZXJz
Lm9dIEVycm9yIDEKCkZpeGVzOiBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0
cy9lMGY1NmVmOTI0YzEzZDZiMTUzNWZkYzM1MGFkOGVjYzA2ZWEwYTU4ClNpZ25lZC1vZmYtYnk6
IEFsZXhhbmRlciBFZ29yZW5rb3YgPGVnb3JlbmFyLWRldkBwb3N0ZW8ubmV0PgotLS0KIHBhY2th
Z2UvbXVsdGlwYXRoLXRvb2xzL211bHRpcGF0aC10b29scy5tayB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
bXVsdGlwYXRoLXRvb2xzL211bHRpcGF0aC10b29scy5tayBiL3BhY2thZ2UvbXVsdGlwYXRoLXRv
b2xzL211bHRpcGF0aC10b29scy5tawppbmRleCA5MDM5NGZhZTlmZGUuLjIzYjNjYzk0NDI2NyAx
MDA2NDQKLS0tIGEvcGFja2FnZS9tdWx0aXBhdGgtdG9vbHMvbXVsdGlwYXRoLXRvb2xzLm1rCisr
KyBiL3BhY2thZ2UvbXVsdGlwYXRoLXRvb2xzL211bHRpcGF0aC10b29scy5tawpAQCAtMjIsNyAr
MjIsNyBAQCBNVUxUSVBBVEhfVE9PTFNfQ1BFX0lEX1ZFTkRPUiA9IG9wZW5zdmMKIAogTVVMVElQ
QVRIX1RPT0xTX0RFUEVOREVOQ0lFUyA9IGx2bTIganNvbi1jIHJlYWRsaW5lIHVkZXYgbGlidXJj
dSBsaWJhaW8gaG9zdC1wa2djb25mCiBNVUxUSVBBVEhfVE9PTFNfTUFLRV9PUFRTID0gXAotCUxJ
TlVYX0hFQURFUlNfSU5DRElSPSQoU1RBR0lOR19ESVIpL3Vzci9pbmNsdWRlIFwKKwlrZXJuZWxf
aW5jZGlyPSQoU1RBR0lOR19ESVIpL3Vzci9pbmNsdWRlIFwKIAlMSUI9ImxpYiIgXAogCVJVTj0i
cnVuIiBcCiAJT1BURkxBR1M9IiIgXAotLSAKMi4zOS4yCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
