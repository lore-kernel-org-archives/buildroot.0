Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57431C7115B
	for <buildroot@archiver.kernel.org>; Fri, 20 Jun 2025 22:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 054F883E4A;
	Fri, 20 Jun 2025 22:19:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pp3SqZFIK1WP; Fri, 20 Jun 2025 22:19:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35A3F83DCF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35A3F83DCF;
	Fri, 20 Jun 2025 22:19:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D53B154
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 22:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F3B1400F8
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 22:19:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MfjU6QcIFf7v for <buildroot@buildroot.org>;
 Fri, 20 Jun 2025 22:19:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D60C64004A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D60C64004A
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D60C64004A
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 22:19:12 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.124.94]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mv31W-1uk8R336mW-00tkdi; Sat, 21
 Jun 2025 00:19:09 +0200
To: buildroot@buildroot.org
Date: Sat, 21 Jun 2025 00:18:50 +0200
Message-ID: <20250620221850.2465031-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:a8xE/8J7NMoOz8zFIQV2kLmm74/l9iQY1iRW++blyzaRKTzF/wp
 jTh2FpX11z14uhzMOwgCuQV2jwDbmslKYCIa/CAMe+lmQ/Z/jkKUxmI6+fqeJuTxImtd9Fn
 ckNXaUKsckhu9VTeJw8JzkfutFLuTP7pQPhsj5OTzLm29wm9d763aNYYtiUhU7/9Yb++Di8
 HfklCT0hVfTkJ7+C1qUUw==
UI-OutboundReport: notjunk:1;M01:P0:HAXGCny2F6A=;9UgPO7j5N0/OhH5vijsm1/VWlga
 od1dPSllMyb4P5SpTo9d56A69JppXvbSWaIlj9qvCJ8g8KFOqS7Jn2mdV6nIB9XP3c1yWVgFw
 GAKwwDGJ77r8Lr9VQIMUqPA8iB0BFjm5mnn6f3xemMJ4lG/CVPVm7W1Hc0VXtd68zSLO7LJ8a
 j9JDi5F35GUm1allguZ1UCxg9VWtdrjsmF3dNcmGs2tX5SdxTpjIkKOCGqRyKX6KjkTabODpu
 /zKduLMPOea30JXSNuJs+jfy/NnhdHF0+WbgiraYe1WQKdACCtRtqRffgAcFypXmlJH/krKDP
 jAMLA4r/PyIBHP1uMPCaWlcSU5wZ1ec6Bu0r7YHh1j2a9vP9QSjQIt9U7jgjK8SoFMusvZboK
 50jenLoIqghZMgfRbXGW0ViUzMgKjYBprYohmyHpgTmHmR4Q1b89W3lDU9hFff5XilUGUBhes
 /XHQ5n/4+icXzgQVfG9c0S+lGWl3NeNUC4SkGk8szTuLeMXorurXCXSdxoVCiDZr8pEcn9eFQ
 j8DOHlgv+1fQUaHNwwbPmn5AJ8ibx798EBAk9Tv7foo7k+iS6l6LeWBGG8sHA9QiRSUYmYqGg
 Z1sT7t4ViWBWgYxgB8M1kMttnyS4dTtGhPbPXi/dm/efmWG9rRhHc533g/Rn9s6OxYAFCUd60
 iEbWUj0PS/qPa9IBnEIuax4fc3CcJXQIjCoIPV0ux9TTmZPkKMmdjikNNLFZwheDUvhU6iMfR
 SyEeT0m+01Zq9P3qzs90P9nk0qUh7lr9pKbW66jSlfnwIC4S0nMC79yfzcEl66yZN+9PRH1wJ
 7YJM0285nVh0RgtvOCMgZctvCzUH2Wqxf9SwGkVizrJEarh4F9pYPKYoQVYI3++GFCdDdvaNO
 PZFJyzs6hPXZi9q99FA9cJKYNMu8tb5xg60jLC/b00H4KUzr41R2iMMqgxsiEuRDE/e/7wjxr
 lFyP8FfB5UEllZNX4ZFCZgzI+ydSDHQROjv/85Sp/9qkrLbNWdFa4pJ5+GJbv5EUkJytJufWu
 FgGnaCDKgOpqFMOJsqjmU2NCq7p48y1GGb37KHCuGyGSY3SNFSIJWXOR2ueMvG/I8JgEKMdDY
 6gXahQvepgToQDkB256o2+PeibwrN/Qz3an6m5QStRfLy5iuyF7J2LR2uoy2zpQwyC1qyhYRP
 +8NoMOmjQ7zIiQl9/2chxRaa/UMQ8LeJ6jBrvvpPk4W7Jj9VMI8gxVvK74wjPQnz3pNraG8Uu
 9+ystsYtnjB8MbzZJUps0ISGY4C4M0eyjh7NZIGBp3vrkyziZPouloa5ft8Kh0jhl+tLV31oY
 BiLclF+bHSj6MoycnDSju8vujo8ddxDK4WgOaTN3/Rc6zH8Bv+9TJvqmU38/B4NhiUAdsgwi4
 NaB7RGzXxu48X+T/sMbML9LMHPi0Lpc1rpgvnBkthgz0Me9SseC2jD9wk1y83uYqWw8IiwfDU
 JNIB8inqjW67C18093KU6bDqTjiJkJZH3acTEnog92WMUOzdLu6Ns5gOeXF5g+qiLatK408n/
 HPxwlht9Zimp/wrGnnMZ3VjCFsSXtZ8REaxbUWEC6cBr0j4CNL3+VYmn4WGSeIUAjXsyw7zC0
 JXAqJ8NUtTKW99WkmFip+ecBBAiqahAmgzNfc1TRzU7zrEtOq84jfyug8LftSiBlRzX9isvhC
 WW5R4biMlEySkz45Ljbbr7fzbshEuuqsBZCZgUXMTtLfMqCqD41kUga9QHihppK0+eOidIIpu
 cHdmcz8rnj796rJh1zmVXuQ1QzHqLkxqBj9ZDRX1C9NxDc161+NLHjpA0upq8bVaYVg1TByxe
 OMeDIksXIrW1nh2Qm5+uxACCijgGSrp7pg6E9De1UDOGOGVs17YnLUBWb1C7/zQwOVsKd0mT9
 tTpiOdPvr9bPIQAJMlRGJGnkkL+rHdVlKbBMqBamvWTOP040QL/nVKvkVTolLRqR6pP8NX4yA
 fuvzGbCHN7F1ZUJ5/oNz2VLOwqk6AbMr+oryxMsqJnOw0PPux+KtQwpcHCFOepRt5BflZNrFk
 x/YUt0lfXqIIt2SuJu0v1zlSPXcqGG6YrwhQSQ/fIuXjn6AtHOS79WXSBugrhc714sy/wRgyt
 r9wedg3iW3USudZfvadG0+My2y4/LhNrS/0wgoLq9bcHoCLrTevzu0jtyt3l/YaIXR69W4XCd
 bBwR7wOG1PnHmz+MO/VA7Yj/KqJ/SLcfJifwtN/l2riYOmUO/llmYIe3A+aG+MqboEOq9EZ+q
 wIGznmUBuf7HZ4V6G/SrneZPpkG7vlp5EI4xK80jX2m0h6OgEUHmmUaYoL17IsEJkg3S/az46
 1nbe4H/T/u0HrZv5FXk/KHKihPv8TAoaTAl5Uyel6Y9iS+YmXvRdArJHKheQaWhALhhd7PoFW
 nY56bIaOuuO8sQk7i1jEXWJdQL4fi+KJaoXa0VZOpPCgplbSlGyhUWqyN9Mm0otWgU+zNOI/v
 wTjqNQNFhGkKYYqxoBva8gI9hDyWdH+p3GLN5JnD/pmg2SOOVKM+VpLNKTSpoDgsrfwhbf5VH
 3Z/9CUGGS2q8n7JLcmVgL9+QBapQU1JpMLOVumm1RsJouukIAaJ+W3i8CJzTh49tGiZklQ7LP
 iPB+sFfL5GGNjdzw5DElyQVcLbs2kCSmDCWXXCXOZS+JBKyri2TFkT+TPy7iNqnfcX81B65AG
 d5dh4ONKL54wKJaC2zlbU3axrFH2Q/1DE4nWcf85HnXICxSULDHG9lP+YW0mHjTJ8kYHSeQ2g
 OhU6LfUq7tjOydPFau87waUBlOb4sZ7I0qb3bIBObk3b+5iKlgTo49PMtt9kaHVWn0yKROipa
 qYVrIJUHLwe1BZkjZAXsebaRfC4/YtcWOX3lGS/lr+tblRtgYUdloHZ0kZ0lg+DqMg8tNVidA
 N8crmPXvDx0IjQZAEjPCorK6H1DFJ+cxrBjDNZuIkr/33W7t4MB4WqYDJsCd0BU7+bMb9jahv
 ZSKF2u9jUfHoKMC1w2pO68kulYhJfqjwQ4+Kwh3GTn7vxMJO0W551aGl/gz2B/uwNYdgyknWa
 xQGKDd9wcK25nzm6Bf8dvagNasThgj7PlS7HXsVse75syb6ErouO0YWCcf46nykV7i4Ffxzm0
 VzrMd3C0z5SRNq3SMcN1T9SR6YMYtFCRYn0dOZSPJp1TPCRpNMlOokSpwo1CPPaS1YXJ0urEg
 MNloc7lnRZKNIOVx0FuSigBhUbkqXM4alqochdfIxBSoEBmBtKTozN7rFd34Ois4uTcY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1750457950; x=1751062750; i=fiona.klute@gmx.de;
 bh=hhhdCYZb/t9TVtmXRz+AQDA4MaowtV3c0Aa0pv5jwEg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=mXOIKX2ejoX5XivTZSpYERJLfBohXoKK1aVfpzEB6NAdvrPt0XltD5zG0LOV9nQr
 BAUIETGuzBDljppP+EaUnd3Eo/r/ItuBpjBhmow7SFh3bbaw0FwWj9C8Sy813tTf2
 Ku32AHskThmm54PMtFllfgN8MSf6VgqKeVrOB129ROajhk3aVGcxr9xVHE8G03X2c
 KxTmVf0Qpx5tX31cVA3xU2lCvyY1wWSRWwX5LPghxyL9nx+z51NtvcSiH+hW9DrH9
 X/lg1U7j7BsaFG6qp4abMpIesXNNaACKoJefAYLk1JOSMMzY2SaO6EjahVmjbKUAo
 rOW2hh/VraOb03da6w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=mXOIKX2e
Subject: [Buildroot] [PATCH 1/1] package/lrzsz: fix build with musl
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
Cc: Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

bGliL2xvbmctb3B0aW9ucy5jIGZhaWxlZCB0byBjb21waWxlIHdpdGggbXVzbCBmb3IgdGhlIHNh
bWUgcmVhc29uCjAwMDItbGliLWxvbmctb3B0aW9ucy5jLWluY2x1ZGUtc3RkbGliLmgucGF0Y2gg
d2FzIGFkZGVkIHRvIGZpeCwKZXhpdCgpIGJlaW5nIHVuZGVmaW5lZC4gVGhlIGZpeCBpcyB0aGUg
c2FtZSBhcyB3ZWxsOiBpbmNsdWRlIHN0ZGxpYi5oLgoKRml4ZXM6IGI2Nzg0YTFmMWYgKCJwYWNr
YWdlL2xyenN6OiBmaXggYnVpbGQgd2l0aCBHQ0MgPj0gMTQueCIpClNpZ25lZC1vZmYtYnk6IEZp
b25hIEtsdXRlIDxmaW9uYS5rbHV0ZUBnbXguZGU+Ci0tLQpUaGlzIGNvbXBpbGVzIHdpdGggdUNs
aWJjLW5nLCB0b28gKHdpdGhvdXQgZXZlbiBhIHdhcm5pbmcsIEkgZGlkbid0CnRlc3QgYXQgcnVu
dGltZSksIHNvIEknbSBub3Qgc3VyZSB3aGF0IHRob3NlICJub24tR05VIEMgbGlicmFyaWVzIgp3
aGVyZSB0aGluZ3MgYnJlYWsgYXJlLiBUaGVyZSBhcmUgc2ltaWxhciBjb21tZW50cyBhbGwgb3Zl
ciB0aGUgZ2V0b3B0CmNvZGUsIHNvIHdpdGggdGhlIGFnZSBvZiB0aGUgY29kZSBtYXliZSB3YXkg
b3V0ZGF0ZWQgb25lcywgb3IKbm9uLUxpbnV4IHBsYXRmb3Jtcy4KCiAuLi4vMDAwMi1saWItbG9u
Zy1vcHRpb25zLmMtaW5jbHVkZS1zdGRsaWIuaC5wYXRjaCAgICAgfCAxMCArKystLS0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL3BhY2thZ2UvbHJ6c3ovMDAwMi1saWItbG9uZy1vcHRpb25zLmMtaW5jbHVkZS1zdGRsaWIu
aC5wYXRjaCBiL3BhY2thZ2UvbHJ6c3ovMDAwMi1saWItbG9uZy1vcHRpb25zLmMtaW5jbHVkZS1z
dGRsaWIuaC5wYXRjaAppbmRleCA2MjI5MTE0ZTBhLi5mMDUzMmJkMDM2IDEwMDY0NAotLS0gYS9w
YWNrYWdlL2xyenN6LzAwMDItbGliLWxvbmctb3B0aW9ucy5jLWluY2x1ZGUtc3RkbGliLmgucGF0
Y2gKKysrIGIvcGFja2FnZS9scnpzei8wMDAyLWxpYi1sb25nLW9wdGlvbnMuYy1pbmNsdWRlLXN0
ZGxpYi5oLnBhdGNoCkBAIC0xNSw2ICsxNSw4IEBAIGxvbmctb3B0aW9ucy5jOjcwOjExOiBlcnJv
cjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYZXhpdOKAmQogCiBVcHN0cmVh
bTogaHR0cHM6Ly9naXRodWIuY29tL1V3ZU9oc2UvbHJ6c3ovcHVsbC80CiBTaWduZWQtb2ZmLWJ5
OiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgorW0Zpb25h
OiByZW1vdmUgY29uZGl0aW9uYWwgb24gX19HTlVfTElCUkFSWV9fIHRvIGZpeCBidWlsZCB3aXRo
IG11c2xdCitTaWduZWQtb2ZmLWJ5OiBGaW9uYSBLbHV0ZSA8ZmlvbmEua2x1dGVAZ214LmRlPgog
LS0tCiAgbGliL2xvbmctb3B0aW9ucy5jIHwgOSArKysrKysrKysKICAxIGZpbGUgY2hhbmdlZCwg
OSBpbnNlcnRpb25zKCspCkBAIC0yMywxOCArMjUsMTIgQEAgZGlmZiAtLWdpdCBhL2xpYi9sb25n
LW9wdGlvbnMuYyBiL2xpYi9sb25nLW9wdGlvbnMuYwogaW5kZXggNzZiOTc5Ni4uMTljODRlMCAx
MDA2NDQKIC0tLSBhL2xpYi9sb25nLW9wdGlvbnMuYwogKysrIGIvbGliL2xvbmctb3B0aW9ucy5j
Ci1AQCAtMjIsNiArMjIsMTUgQEAKK0BAIC0yMiw2ICsyMiw5IEBACiAgI2VuZGlmCiAgCiAgI2lu
Y2x1ZGUgPHN0ZGlvLmg+CiArCi0rLyogVGhpcyBuZWVkcyB0byBjb21lIGFmdGVyIHNvbWUgbGli
cmFyeSAjaW5jbHVkZQotKyAgIHRvIGdldCBfX0dOVV9MSUJSQVJZX18gZGVmaW5lZC4gICovCi0r
I2lmZGVmCV9fR05VX0xJQlJBUllfXwotKy8qIERvbid0IGluY2x1ZGUgc3RkbGliLmggZm9yIG5v
bi1HTlUgQyBsaWJyYXJpZXMgYmVjYXVzZSBzb21lIG9mIHRoZW0KLSsgICBjb250YWluIGNvbmZs
aWN0aW5nIHByb3RvdHlwZXMgZm9yIGdldG9wdC4gICovCiArI2luY2x1ZGUgPHN0ZGxpYi5oPgot
KyNlbmRpZgkvKiBHTlUgQyBsaWJyYXJ5LiAgKi8KICsKICAjaW5jbHVkZSA8Z2V0b3B0Lmg+CiAg
I2luY2x1ZGUgImxvbmctb3B0aW9ucy5oIgotLSAKMi41MC4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
