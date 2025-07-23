Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA161C83F17
	for <buildroot@archiver.kernel.org>; Wed, 23 Jul 2025 13:57:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FF4C4085F;
	Wed, 23 Jul 2025 13:57:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ov3W9AvMT6x8; Wed, 23 Jul 2025 13:57:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFE47409BF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFE47409BF;
	Wed, 23 Jul 2025 13:57:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A2B6CD
 for <buildroot@buildroot.org>; Wed, 23 Jul 2025 13:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4FE9E81024
 for <buildroot@buildroot.org>; Wed, 23 Jul 2025 13:56:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t1Y_B_BgwwYZ for <buildroot@buildroot.org>;
 Wed, 23 Jul 2025 13:56:57 +0000 (UTC)
X-Greylist: delayed 1813 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 23 Jul 2025 13:56:56 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4062F80F3A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4062F80F3A
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=220.197.31.4;
 helo=m16.mail.163.com; envelope-from=tianyuanhao3@163.com; receiver=<UNKNOWN> 
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4062F80F3A
 for <buildroot@buildroot.org>; Wed, 23 Jul 2025 13:56:55 +0000 (UTC)
Received: from tianyuanhao3$163.com (
 [240e:40c:2101:1998:ec2f:7b73:6879:d48] ) by ajax-webmail-wzpm-k8s-gz
 (Coremail) ; Wed, 23 Jul 2025 21:11:05 +0800 (GMT+08:00)
X-Originating-IP: [240e:40c:2101:1998:ec2f:7b73:6879:d48]
Date: Wed, 23 Jul 2025 21:11:05 +0800 (GMT+08:00)
From: "TIAN Yuanhao" <tianyuanhao3@163.com>
To: "yann.morin.1998" <yann.morin.1998@free.fr>
Cc: buildroot <buildroot@buildroot.org>, arnout <arnout@mind.be>,
 bonet <bonet@grenoble.cnrs.fr>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20250620(6dc55b48) Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <60de7be584b8ba31a450182f662c2c78cbeafe1a.1752178975.git.yann.morin.1998@free.fr>
References: <cover.1752178975.git.yann.morin.1998@free.fr>
 <60de7be584b8ba31a450182f662c2c78cbeafe1a.1752178975.git.yann.morin.1998@free.fr>
X-NTES-SC: AL_Qu2eAf6cuUot4yKQZekfmk8TjuY8WsS5v/0i24ZRO51wjAXp6wUBXW17MWL19tyuDjiTlTa5UxRK995bWbtFfoUxQ27/Q4KqtE5fdAyC7YxucA==
MIME-Version: 1.0
Message-ID: <57fa4a0b.3fb1c.1983768b346.Coremail.tianyuanhao3@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: _____wD3x8Fp34BompocAA--.7942W
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/1tbiXQCTjWiATYWzfAABst
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=UDfzEcsePia3xJKio/K1Dljnj0VVUD/SR7YYmA6kRak=; b=i
 5BDNBUbzruX5S+88KQZt9vhKGAcmCuA3FfXFn0U4Gz62Rxgdyp1WN5dh1Ftp576p
 y/3vhXOEHogyy3LfFIefsP9OtMRBbH/9HWIZdgXdI+Zf+8McezTqrZmz8E9T9Xy/
 yq5/RyQxkQyAQ0bSrwfhPAArk7IGnc32m01XsWmLSg=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=i5BDNBUb
Subject: Re: [Buildroot] [PATCH 11/17 v2] system: add support for merged
 /usr/sbin (aka merged-bin)
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
Content-Type: multipart/mixed; boundary="===============7865596329599496389=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7865596329599496389==
Content-Type: multipart/alternative; 
	boundary="----=_Part_1029624_2093385518.1753276265286"

------=_Part_1029624_2093385518.1753276265286
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

QWNrZWQtYnk6IFRJQU4gWXVhbmhhbyA8dGlhbnl1YW5oYW8zQDE2My5jb20+CgoKCnwgfAp0aWFu
eXVhbmhhbzNAMTYzLmNvbQp8CnwK08rP5KO6dGlhbnl1YW5oYW8zQDE2My5jb20KfA==
------=_Part_1029624_2093385518.1753276265286
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGZvbnQgc3R5bGU9ImNvbG9yOnJnYigwLDAsMCk7Ij48Zm9udCBzdHlsZT0iZm9udC1zaXplOjE2
cHg7Ij5BY2tlZC1ieTogPC9mb250PjwvZm9udD5USUFOIFl1YW5oYW8gJmx0O3RpYW55dWFuaGFv
M0AxNjMuY29tJmd0Ozxicj48YnI+PGJyPjxodG1sPgo8aGVhZD4KICAgIDxtZXRhIGh0dHAtZXF1
aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PVVURi04Ij4KPC9o
ZWFkPgo8Ym9keT4KPGEgc3R5bGU9ImRpc3BsYXk6YmxvY2s7YmFja2dyb3VuZDojZmZmOyBtYXgt
d2lkdGg6IDQwMHB4OyBfd2lkdGg6IDQwMHB4O3BhZGRpbmc6MTVweCAwIDEwcHggMDt0ZXh0LWRl
Y29yYXRpb246IG5vbmU7IG91dGxpbmU6bm9uZTstd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6
dHJhbnNwYXJlbnQ7LXdlYmtpdC10ZXh0LXNpemUtYWRqdXN0Om5vbmUgIWltcG9ydGFudDt0ZXh0
LXNpemUtYWRqdXN0Om5vbmUgIWltcG9ydGFudDsiPgogICAgPHRhYmxlIGNlbGxwYWRkaW5nPSIw
IiBzdHlsZT0id2lkdGg6IDEwMCU7IG1heC13aWR0aDogMTAwJTsgdGFibGUtbGF5b3V0OiBmaXhl
ZDsgYm9yZGVyLWNvbGxhcHNlOiBjb2xsYXBzZTtjb2xvcjogIzliOWVhMTtmb250LXNpemU6IDE0
cHg7bGluZS1oZWlnaHQ6MS4zOy13ZWJraXQtdGV4dC1zaXplLWFkanVzdDpub25lICFpbXBvcnRh
bnQ7dGV4dC1zaXplLWFkanVzdDpub25lICFpbXBvcnRhbnQ7Ij4KICAgICAgICA8dGJvZHkgc3R5
bGU9ImZvbnQtZmFtaWx5OiAnUGluZ0ZhbmcgU0MnLCAnSGlyYWdpbm8gU2FucyBHQicsJ1dlblF1
YW5ZaSBNaWNybyBIZWknLCAnTWljcm9zb2Z0IFlhaGVpJywgJ86iyO3RxbraJywgdmVyZGFuYSAh
aW1wb3J0YW50OyB3b3JkLXdyYXA6YnJlYWstd29yZDsgd29yZC1icmVhazpicmVhay1hbGw7LXdl
YmtpdC10ZXh0LXNpemUtYWRqdXN0Om5vbmUgIWltcG9ydGFudDt0ZXh0LXNpemUtYWRqdXN0Om5v
bmUgIWltcG9ydGFudDsiPgogICAgICAgICAgICA8dHI+CiAgICAgICAgICAgICAgICAgICAgPHRk
IHdpZHRoPSIzOCIgc3R5bGU9InBhZGRpbmc6MDsgYm94LXNpemluZzogYm9yZGVyLWJveDsgd2lk
dGg6IDM4cHg7Ij4KICAgICAgICAgICAgICAgICAgICAgICAgPGltZyB3aWR0aD0iMzgiIGhlaWdo
dD0iMzgiIHN0eWxlPSJ2ZXJ0aWNhbC1hbGlnbjptaWRkbGU7IHdpZHRoOiAzOHB4OyBoZWlnaHQ6
IDM4cHg7IGJvcmRlci1yYWRpdXM6NTAlOyIgc3JjPSJodHRwczovL21haWwtb25saW5lLm5vc2Ru
LjEyNy5uZXQvcWl5ZWxvZ28vZGVmYXVsdEF2YXRhci5wbmciPgogICAgICAgICAgICAgICAgICAg
IDwvdGQ+CiAgICAgICAgICAgICAgICAgICAgPHRkIHN0eWxlPSJwYWRkaW5nOiAwIDAgMCAxMHB4
OyBjb2xvcjogIzMxMzUzYjsiPgogICAgICAgICAgICAgICAgICAgICAgICA8ZGl2IHN0eWxlPSJm
b250LXNpemU6IDE2cHg7Zm9udC13ZWlnaHQ6Ym9sZDsgd2lkdGg6MTAwJTsgd2hpdGUtc3BhY2U6
IG5vd3JhcDsgb3ZlcmZsb3c6aGlkZGVuO3RleHQtb3ZlcmZsb3c6IGVsbGlwc2lzOyI+dGlhbnl1
YW5oYW8zQDE2My5jb208L2Rpdj4KICAgICAgICAgICAgICAgICAgICA8L3RkPgogICAgICAgICAg
ICA8L3RyPgogICAgICAgICAgICAgICAgPHRyIHdpZHRoPSIxMDAlIiBzdHlsZT0iZm9udC1zaXpl
OiAxNHB4ICFpbXBvcnRhbnQ7IHdpZHRoOiAxMDAlOyI+CiAgICAgICAgICAgICAgICAgICAgPHRk
IGNvbHNwYW49IjIiIHN0eWxlPSJwYWRkaW5nOjEwcHggMCAwIDA7IGZvbnQtc2l6ZToxNHB4ICFp
bXBvcnRhbnQ7IHdpZHRoOiAxMDAlOyI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8ZGl2
IHN0eWxlPSJ3aWR0aDogMTAwJTtmb250LXNpemU6IDE0cHggIWltcG9ydGFudDt3b3JkLXdyYXA6
YnJlYWstd29yZDt3b3JkLWJyZWFrOmJyZWFrLWFsbDsiPtPKz+SjunRpYW55dWFuaGFvM0AxNjMu
Y29tPC9kaXY+CiAgICAgICAgICAgICAgICAgICAgPC90ZD4KICAgICAgICAgICAgICAgIDwvdHI+
CiAgICAgICAgPC90Ym9keT4KICAgIDwvdGFibGU+CjwvYT4KPC9ib2R5Pgo8L2h0bWw+
------=_Part_1029624_2093385518.1753276265286--


--===============7865596329599496389==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7865596329599496389==--

