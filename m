Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 009B9C02194
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 14:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB715813F3;
	Tue,  4 Feb 2025 14:37:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MPQiybyWVmRF; Tue,  4 Feb 2025 14:37:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B05F780A6F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B05F780A6F;
	Tue,  4 Feb 2025 14:37:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D992185
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 14:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52383813CA
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 14:37:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 67jI8zCiofkR for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 14:37:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D1578803A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1578803A8
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D1578803A8
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 14:37:34 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.121.123]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MulqN-1tNee02qnb-011O47; Tue, 04
 Feb 2025 15:37:31 +0100
Message-ID: <6730ffaf-e2ec-4db2-ae35-62aff47d215f@gmx.de>
Date: Tue, 4 Feb 2025 15:37:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: yann.morin@orange.com
Cc: buildroot@buildroot.org, Thomas Perale <thomas.perale@mind.be>,
 Christian Stewart <christian@aperture.us>
References: <20250203120130.2332720-1-fiona.klute@gmx.de>
 <Z6GzCbcs9k0Rul1a@yd-6wlzhs3> <c3a16cbe-ae5b-4b68-9713-0fe3bf5888d4@gmx.de>
 <Z6H2W96MX4oQFoOx@yd-6wlzhs3> <bb9a665e-47aa-48e7-ae56-a50999bcc0f3@gmx.de>
 <Z6IEYRiU1IklParS@yd-6wlzhs3>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 xsFNBFrLsicBEADA7Px5KipL9zM7AVkZ6/U4QaWQyxhqim6MX88TxZ6KnqFiTSmevecEWbls
 ppqPES8FiSl+M00Xe5icsLsi4mkBujgbuSDiugjNyqeOH5iqtg69xTd/r5DRMqt0K93GzmIj
 7ipWA+fomAMyX9FK3cHLBgoSLeb+Qj28W1cH94NGmpKtBxCkKfT+mjWvYUEwVdviMymdCAJj
 Iabr/QJ3KVZ7UPWr29IJ9Dv+SwW7VRjhXVQ5IwSBMDaTnzDOUILTxnHptB9ojn7t6bFhub9w
 xWXJQCsNkp+nUDESRwBeNLm4G5D3NFYVTg4qOQYLI/k/H1N3NEgaDuZ81NfhQJTIFVx+h0eT
 pjuQ4vATShJWea6N7ilLlyw7K81uuQoFB6VcG5hlAQWMejuHI4UBb+35r7fIFsy95ZwjxKqE
 QVS8P7lBKoihXpjcxRZiynx/Gm2nXm9ZmY3fG0fuLp9PQK9SpM9gQr/nbqguBoRoiBzONM9H
 pnxibwqgskVKzunZOXZeqyPNTC63wYcQXhidWxB9s+pBHP9FR+qht//8ivI29aTukrj3WWSU
 Q2S9ejpSyELLhPT9/gbeDzP0dYdSBiQjfd5AYHcMYQ0fSG9Tb1GyMsvh4OhTY7QwDz+1zT3x
 EzB0I1wpKu6m20C7nriWnJTCwXE6XMX7xViv6h8ev+uUHLoMEwARAQABzSBGaW9uYSBLbHV0
 ZSA8ZmlvbmEua2x1dGVAZ214LmRlPsLBlAQTAQgAPgIbIwULCQgHAwUVCgkICwUWAgMBAAIe
 AQIXgBYhBOTTE4/i2fL6gVL9ke6nJs4hI1pYBQJkNTaZBQkNK+tyAAoJEO6nJs4hI1pY3qwQ
 AKdoJJHZpRu+C0hd10k6bcn5dr8ibqgsMHBJtFJuGylEsgF9ipWz1rMDWDbGVrL1jXywfwpR
 WSeFzCleJq4D0hZ5n+u+zb3Gy8fj/o3K/bXriam9kR4GfMVUATG5m9lBudrrWAdI1qlWxnmP
 WUvRSlAlA++de7mw15guDiYlIl0QvWWFgY+vf0lR2bQirmra645CDlnkrEVJ3K/UZGB0Yx67
 DfIGQswEQhnKlyv0t2VAXj96MeYmz5a7WxHqw+/8+ppuT6hfNnO6p8dUCJGx7sGGN0hcO0jN
 kDmX7NvGTEpGAbSQuN2YxtjYppKQYF/macmcwm6q17QzXyoQahhevntklUsXH9VWX3Q7mIli
 jMivx6gEa5s9PsXSYkh9e6LhRIAUpnlqGtedpozaAdfzUWPz2qkMSdaRwvsQ27z5oFZ0dCOV
 Od39G1/bWlY+104Dt7zECn3NBewzJvhHAqmAoIRKbYqRGkwTTAVNzAgx+u72PoO5/SaOrTqd
 PIsW5+d/qlrQ49LwwxG8YYdynNZfqlgc90jls+n+l3tf35OQiehVYvXFqbY7RffUk39JtjwC
 MfKqZgBTjNAHYgb+dSa7oWI8q6l26hdjtqZG+OmOZEQIZp+qLNnb0j781S59NhEVBYwZAujL
 hLJgYGgcQ/06orkrVJl7DICPoCU/bLUO8dbfzsFNBGQ1Nr0BEADTlcWyLC5GoRfQoYsgyPgO
 Z4ANz31xoQf4IU4i24b9oC7BBFDE+WzfsK5hNUqLADeSJo5cdTCXw5Vw3eSSBSoDP0Q9OUdi
 PNEbbblZ/tSaLadCm4pyh1e+/lHI4j2TjKmIO4vw0K59Kmyv44mW38KJkLmGuZDg5fHQrA9G
 4oZLnBUBhBQkPQvcbwImzWWuyGA+jDEoE2ncmpWnMHoc4Lzpn1zxGNQlDVRUNnRCwkeclm55
 Dz4juffDWqWcC2NrY5KkjZ1+UtPjWMzRKlmItYlHF1vMqdWAskA6QOJNE//8TGsBGAPrwD7G
 cv4RIesk3Vl2IClyZWgJ67pOKbLhu/jz5x6wshFhB0yleOp94I/MY8OmbgdyVpnO7F5vqzb1
 LRmfSPHu0D8zwDQyg3WhUHVaKQ54TOmZ0Sjl0cTJRZMyOmwRZUEawel6ITgO+QQS147IE7uh
 Wa6IdWKNQ+LGLocAlTAi5VpMv+ne15JUsMQrHTd03OySOqtEstZz2FQV5jSS1JHivAmfH0xG
 fwxY6aWLK2PIFgyQkdwWJHIaacj0Vg6Kc1/IWIrM0m3yKQLJEaL5WsCv7BRfEtd5SEkl9wDI
 pExHHdTplCI9qoCmiQPYaZM5uPuirA5taUCJEmW9moVszl6nCdBesG2rgH5mvgPCMAwsPOz9
 7n+uBiMk0ZSyTQARAQABwsF8BBgBCAAmFiEE5NMTj+LZ8vqBUv2R7qcmziEjWlgFAmQ1Nr0C
 GwwFCQPCZwAACgkQ7qcmziEjWlgY/w//Y4TYQCWQ5eWuIbGCekeXFy8dSuP+lhhvDRpOCqKt
 Wd9ywr4j6rhxdS7FIcaSLZa6IKrpypcURLXRG++bfqm9K+0HDnDHEVpaVOn7SfLaPUZLD288
 y8rOce3+iW3x50qtC7KCS+7mFaWN+2hrAFkLSkHWIywiNfkys0QQ+4pZxKovIORun+HtsZFr
 pBfZzHtXx1K9KsPq9qVjRbKdCQliRvAukIeTXxajOKHloi8yJosVMBWoIloXALjwCJPR1pBK
 E9lDhI5F5y0YEd1E8Hamjsj35yS44zCd/NMnYUMUm+3IGvX1GT23si0H9wI/e4p3iNU7n0MM
 r9aISP5j5U+qUz+HRrLLJR7pGut/kprDe2r3b00/nttlWyuRSm+8+4+pErj8l7moAMNtKbIX
 RQTOT31dfRQRDQM2E35nXMh0Muw2uUJrldrBBPwjK2YQKklpTPTomxPAnYRY8LVVCwwPy8Xx
 MCTaUC2HWAAsiG90beT7JkkKKgMLS9DxmX9BN5Cm18Azckexy+vMg79LCcfw/gocQ4+lQn4/
 3BjqSuHfj+dXG+qcQ9pgB5+4/812hHog78dKT2r8l3ax3mHZCDTAC9Ks3LQU9/pMBm6K6nnL
 a4ASpGZSg2zLGIT0gnzi5h8EcIu9J1BFq6zRPZIjxBlhswF6J0BXjlDVe/3JzmeTTts=
In-Reply-To: <Z6IEYRiU1IklParS@yd-6wlzhs3>
X-Provags-ID: V03:K1:FhDRsoueAr7lwc/Epe+KaGUnTfVYXcy7B9Cdkyd/bx8daKls0d9
 /gWL9jxgkB5kGdWl7qAd+2L2z5mBLId/RIQPutCB+SV2D3pBErOwCa2WtSfq8RSx8LQC4Nm
 saqC1CbrDoznxo3LNI728B+UjSGJfyqlKqQzM9RKxupJ4qEAwTUPjuTscdiphRJLTQQcZKZ
 gEMkruOY9QwqtRJK2wSLw==
UI-OutboundReport: notjunk:1;M01:P0:gV7IOJjpp0M=;/pxCVUr84YWQVQWs8LQOtzsViWb
 scfYwfX4uf8IRbkZ31wqmg8Wwgr7Iy95I7tuUCufkW70rtRfwZwXqjeLn6602GQqk00WF4h4z
 zjxh79I3hzCXGTwPlG6U6lnGPvakkfTsAumHTCS29L/7NeoPJI5jdUhdJgMMC9EqBfLeyTqpF
 tEw54rYCGHG8xktyHA8Vl7MfXROkdrhqLa+fUch+p6Bwy8M7i42XL/tdzdTqTcA0YMDX/d5ZB
 MEuimPhN2B3t5I6q+PjcpShENK+cNQaVlpmx4FWTR2zmPGP6Xm1XA1PMIU/7txy4L2f9OaKWq
 VUdaU4qmg6vrDxHp7w9jTxb1qx+KOE1dHpgy5XgUDA+J6DfLED38fvakNQEH0RVEgNjG8kzuZ
 igpQ+mmUkYZqwQjTLhXOMDaK+cs2n6zNm4nGFwpN88xObNWTv3lHRQsZqnODnPLl5/FZac9Wm
 bzzoywCnzE88iyjz6FaEcA07o77sTWLbXk8DmqVIYB2Io4s51eQQLESeWI0gAUM1HnnrLrM1/
 rZM4Pu2dsQVwnJnd+1vLMdHBYtQoybW5ZUu4GyiY3aJWnn/zYUKefF82LkfpyBPHozBb0GnYN
 /SohfjygOmvhaghJu/L7dMhWRQqWvMfCisk/9M25ovYCD5GyDGeeCS1dHJdxoBSbjI8JGOx4k
 aOg+GXFuxq/XR5Q76pHOV4HHWAJp5U+K7favxCHoJmZU1fkZ9rs3tzbCxg7KG9mRy80R2JK8G
 0uku++BrC3Nc6nFxYOdhS9caKpklB08e1z6ZTtokNJhEx9gBJsxktiliAPTtCiRhHQGc23s8G
 MvUCKNiqRe5EEoytnl7SrCtkviwzRlyXZSB8ZcbqnfE4GtTen91mmFuaCHT9r1SMsPOQq58Wp
 rpdrPSnU/Gb+uVDZUYmFU3DD3LK2b2VFaSbjtIY2G09vOBm2Ml/jr4hJX/VS0cTCpVbABOnKD
 9kMPEdrleJ58WAF7/6CPny1Kc/6CRCW9xY6IU3vH6E6V76AUjX370AyskyCGsPQMAU4bfMLjt
 VI9q/jCKPeX6LMXO8IYQTNRSpEnpkMf9bxQuD6j8CRYMZ9hJZGmH+l1rQRtuSS83f7Hc28uDr
 4gw0YRnwhGjTVPKugLjOuz7Wx8xucxcZO9C00bve2bYbQsPch3cy/+rk38NSefFVgWBb3HFiV
 XlwM3E74y3GH6kUiqGC80DOV/dEqWFTQU9dQ1ErAYJOaphKDwM+J3l7a18y8XaXc7GeBYXFk9
 Ly2BeVSb3XoipJ4OLkSXxjK/7piStKZB1knex1G5RgRXGvQwPXD3yd66Anplgz5r8uJ8O8ifi
 KTVmq6C1Gs9h05fBITNUe9VYTZZIgOzmS9piTKQzIteE2hnuRLckXZGOocXjjgKHzmp1f7+L5
 NBwg4dLf/80BqW8L9R8rGotnF6FtUxN7+GRz4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1738679851; x=1739284651; i=fiona.klute@gmx.de;
 bh=VYImXKZLiyTX8hGWkITeQ7gInsslE0yUO3/RojHDB9M=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=jZYZReHAt+N4uGh8aI0ouefxAapREf+flyFbSoHT4JSPib2OChEJ+hKJUD0nbdnJ
 j3d0evaylbcNDIvN++s1ov97egBqMdX34RXunUVC9TRNlffDyDgZkXcwOq0nTB6nX
 WdofQhDlNo3bgdIKPW2vnlm7lWtbNiz5SOnHMsrR/sPRoAenPyqAiMJRLKvReJskG
 fib7iXGrYLjbqDK2CvIrFxUg4GYnwRu9r8eppTBuBRDWJGcDbSQKY0gjjUtr778Ri
 f1nPsLSej9YkXrVg2mk49sjLL3nUUIRZi/PvLR4IwWzfvoZ4Rd0ghLxjUWYsaZdSd
 wEaKi/eWh0T69ML5UQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=jZYZReHA
Subject: Re: [Buildroot] [PATCH 1/1] package/go/go-src: stop forcing
 binutils-gold dependency on aarch64
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WWFubiwgZXZlcnlvbmUsCgpJJ3ZlIGp1c3Qgc2VudCBhIG5ldyBwYXRjaCB0aGF0IHNldHMgLWZ1
c2UtbGQ9YmZkIGZvciBwYWNrYWdlL2NvbnRhaW5lcmQ6Cmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFi
cy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyNTAyMDQxNDMyMjcuMTIzMzE2My0xLWZp
b25hLmtsdXRlQGdteC5kZS8KCkl0IHdvcmtzIGZvciBtZSAoaG9zdC1nby1zcmMsIG11c2wpLCBJ
J2QgYXBwcmVjaWF0ZSB0ZXN0cyB3aXRoIG90aGVyCnRvb2xjaGFpbnMuCgpCZXN0IHJlZ2FyZHMs
CkZpb25hCgpBbSAwNC4wMi4yNSB1bSAxMzoxMyBzY2hyaWViIHlhbm4ubW9yaW5Ab3JhbmdlLmNv
bToKPiBGaW9uYSwgQWxsLAo+Cj4gT24gMjAyNS0wMi0wNCAxMjozNyArMDEwMCwgRmlvbmEgS2x1
dGUgc3Bha2UgdGh1c2x5Ogo+PiBBY2NvcmRpbmcgdG8gdGhlIGRpc2N1c3Npb24gaW4gdGhlIEdv
IGlzc3VlLCB0aGVyZSB3YXMgYW5vdGhlciBidWcgdGhhdAo+PiBnb3QgZml4ZWQgd2l0aCAyLjQx
Lgo+PiBodHRwczovL2dpdGh1Yi5jb20vZ29sYW5nL2dvL2lzc3Vlcy8yMjA0MCNpc3N1ZWNvbW1l
bnQtMTQzMDExMDQwMAo+Cj4gWWVzLCB0aGF0J3MgZXhhY3RseSB3aHkgSSBuZWVkZWQgdG8gcGFz
cyAtZnVzZS1sZD1iZmQgZm9yIGZpbGViZWF0IGJ1dAo+IG5vdCBmb3IgYXJtLgo+Cj4+IEFtIDA0
LjAyLjI1IHVtIDEyOjEzIHNjaHJpZWIgeWFubi5tb3JpbkBvcmFuZ2UuY29tOgo+IFstLVNOSVAt
LV0KPj4+IFNvLCBwYWNrYWdlcyB0aGF0IG5lZWQgdG8gc3BlY2lmeSAiLWZ1c2UtbGQ9YmZkIiB3
b3VsZCBkbyBzbwo+Pj4gdW5jb25kaXRpb25hbHksIGp1c3QgbWF5YmUgZm9yIHRoZSBBQXJjaDY0
IGNhc2UsIHdoaWNoIGlzIHRoZSBvbmx5IG9uZSBJCj4+PiBrbm93IGNhbiBjYXVzZSB0aGUgYnVp
bGQgZmFpbHVyZSAobm90IGFsbCBwYWNrYWdlcyBoYXZlIHRoZSBpc3N1ZSwgYXMKPj4+IGNhbiBi
ZSBleHBsYW1wbGlmaWVkIGJ5IHRoZSBmYWN0IHRoYXQgd2UgaGF2ZSBubyBzdWNoIGZhaWx1cmVz
IGluIHRoZQo+Pj4gYXV0b2J1aWxkZXJzKS4KPj4gSSBsaWtlIHRoYXQgYXBwcm9hY2gsIGJ1dCBh
cyBtZW50aW9uZWQgYWJvdmUgdGhlIHRvb2xjaGFpbnMgd2lsbCBoYXZlIHRvCj4+IGJlIGEgYml0
IG1vcmUgcmVjZW50Lgo+Cj4gMi4zNiB3b3JrZWQgZm9yIG1lLCBhdCBsZWFzdC4gQnV0IHVubGVz
cyB0aGUgdG9vbGNoYWlucyBoYXZlIHRvIGJlIGxlc3MKPiB0aGFuIGEgeWVhciBvbGQsIEkgdGhp
bmsgaXQgaXMgT0sgdG8gcmVxdWlyZSB0aGF0Lgo+Cj4gQnV0IG5vdywgYXMgeW91IG1lbnRpb25l
ZCBbMF0sIGlmIGdvbGQgZ2V0cyBkcm9wcGVkLCB0aGVuIEknZCBleHBlY3QKPiBuZXdlciBiaW51
dGlscyB0byBubyBsb25nZXIgaW5zdGFsbCBsZC5iZmQgZWl0aGVyIChiZWNhdXNlIHRoZXJlJ2Qg
YmUKPiBvbmx5IG9ubHkgbGlua2VyIGxlZnQpLiBTbyB3ZSdkIGJlIGJhY2sgdG8gdGhlIGNhc2Ug
b2Ygb2xkIHRvb2xjaGFpbnMsCj4gd2hlcmUgZ29sZCBkaWQgbm90IHlldCBleGlzdCwgYW5kIHRo
dXMgbGQuYmZkIGRpZCBub3QgZXhpc3QgZWl0aGVyLgo+Cj4gU28sIGlmIHdlIG5lZWQgdG8gYmUg
ZnV0dXJlIHByb29mLCB0aGVuIHdlIG5lZWQgdG8gZGVzaWduIGEgc29sdXRpb24KPiB0aGF0IHdv
cmtzIGluIGFsbCBjYXNlczsKPiAgICAtIG9sZCB0b29sY2hhaW5zIHdoZXJlIGdvbGQgZGlkIG5v
dCBleGlzdCwgYW5kIHdoZXJlIGxkLmJmZCBkaWQgbm90Cj4gICAgICBleGlzdCwgbyBpdCdzIGp1
c3QgJ2xkOyc7Cj4gICAgIC0gdG9vbGNoYWlucyB3aGVyZSBiaW51dGlscyB3YXMgL2NvbmZpZ3Vy
ZS1kIHdpdGggLS1kaXNhYmxlLWdvbGQsCj4gICAgICBzbyBpdCdzIGp1c3QgJ2xkJzsKPiAgICAt
IHRvb2xjaGFpbnMgd2hlcmUgZ29sZCBleGlzdHMsIGFuZCBoYXMgYm90aCBsZC5iZmQgYW5kIGxk
LmdvbGQsIGFuZAo+ICAgICAgd2hlcmUgd2Ugd2FudCB0byB1c2UgJ2xkLmJmZCc7Cj4gICAgLSBm
dXR1cmUgdG9vbGNoYWlucyB3aGVyZSBnb2xkIG5vIGxvbmdlciBleGlzdHMsIHNvIGl0J3MgYWdh
aW4ganVzdAo+ICAgICAgJ2xkJy4KPgo+IFswXSBodHRwczovL2dpdGh1Yi5jb20vZ29sYW5nL2dv
L2lzc3Vlcy8yMjA0MCNpc3N1ZWNvbW1lbnQtMjYzMDg0ODc3Nwo+Cj4+IFdoYXQncyBvZGQgaXMg
dGhhdCBteSB0ZXN0IGJ1aWxkIGZhaWxlZC4gQXMgeW91IGNhbiBzZWUsIHdpdGggeW91ciBwYXRj
aAo+PiBzZXR0aW5nIENPTlRBSU5FUkRfRVhUTERGTEFHUyArPSAtZnVzZS1sZD1iZmQgd29ya3Mg
dG8gdXNlIGxkLmJmZCwgYnV0Cj4+IGNvbmZ1c2luZ2x5IHRoZXJlJ3MgYW4gZXJyb3IgdGhhdCBk
aWRuJ3QgYXBwZWFyIHdoZW4gcGF0Y2hpbmcgR286Cj4gWy0tU05JUC0tXQo+PiAvaG9tZS9maW9u
YS9kZXZlbG9wbWVudC9idWlsZHJvb3Qvb3V0cHV0L3JldnBpL2hvc3QvbGliL2djYy9hYXJjaDY0
LWJ1aWxkcm9vdC1saW51eC1tdXNsLzEzLjMuMC8uLi8uLi8uLi8uLi9hYXJjaDY0LWJ1aWxkcm9v
dC1saW51eC1tdXNsL2Jpbi9sZC5iZmQ6Cj4+IHJlYWQtb25seSBzZWdtZW50IGhhcyBkeW5hbWlj
IHJlbG9jYXRpb25zCj4+IGNvbGxlY3QyOiBGZWhsZXI6IGxkIGdhYiAxIGFscyBFbmRlLVN0YXR1
cyB6dXLDvGNrCj4+Cj4+IEFueSBpZGVhcz8gSXMgdGhlIGRpZmZlcmVudCBvcmRlciBvZiBhcmd1
bWVudHMgbWVzc2luZyB0aGluZ3MgdXA/Cj4KPiBPcmRlcmluZyBvZiBhcmdzIHNob3VsZCBub3Qg
bWF0dGVyOiB0aGUgbGF0dGVyIHNob3VsZCB3aW4uCj4KPiBNYXliZSB5b3UgY2FuIHJlcXVpZXIg
dmVyYm9zZSBvdXRwdXQ6Cj4KPiAgICAgIEZPT19FWFRMREZMQUdTID0gLWZ1c2UtbGQ9YmZkIC1X
bCwtLXZlcmJvc2UgLXYKPgo+IE90aGVyd2lzZSwgbm8gaWRlYSwgYXMgSSBhbSBub3QgYSBnbyBn
dXkuLi4gSSBqdXN0IGhhZCB0byBmaWRkbGUgd2l0aAo+IGZpbGViZWF0IGEgZmV3IHllYXJzIGJh
Y2ssIG1hbmFnZWQgdG8gZ2V0IGl0IGZhbGwgaW4gcGxhY2Ugd2l0aCB0aGUKPiByZWZlcmVuY2Vk
IGNoYW5nZSwgYnV0IG90aGVyIHRoYW4gdGhhdCwgSSBhbSBqdXN0IGEgbW9ua2V5IHR5cGluZyBv
biBhCj4ga2V5Ym9hcmQgaW4gdGhpcyBnbyBsYW5kLiA7LSkKPgo+IFJlZ2FyZHMsCj4gWWFubiBF
LiBNT1JJTi4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
