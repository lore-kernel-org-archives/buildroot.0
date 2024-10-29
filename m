Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C07D2AB26
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 11:57:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EBAC80E3A;
	Tue, 29 Oct 2024 11:57:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9vfUBqXSgTlW; Tue, 29 Oct 2024 11:57:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40C3380E3B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40C3380E3B;
	Tue, 29 Oct 2024 11:57:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 433DA112A
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 11:57:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 317B380E3B
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 11:57:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7UOqqAjwywfN for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 11:57:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=114.111.35.28;
 helo=cvsmtppost09.nm.naver.com; envelope-from=dungeonlords789@naver.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A316480E3A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A316480E3A
Received: from cvsmtppost09.nm.naver.com (cvsmtppost09.nm.naver.com
 [114.111.35.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A316480E3A
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 11:57:08 +0000 (UTC)
X-Originating-IP: 125.132.232.68
X-Works-Smtp-Source: q9nXKxgqFqJCpNmXKoMmWHF0
Received: from cvsendbo024.nm ([10.112.24.41])
 by cvsmtppost09.nm.naver.com with ESMTP id I-l8oYRbTg+iHGhIhADOyA
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 11:57:07 -0000
X-Session-ID: 56ea89d01030f56bd5642777d117b25fabaeb0a097cdf3a8b88c4a5d1f4c6d34
MIME-Version: 1.0
Message-ID: <58534f324981edb8a3a348673b5ba25e@cweb016.nm>
Date: Tue, 29 Oct 2024 20:57:07 +0900
From: =?utf-8?B?Q0hFUk5JQUVWIEFORFJFSQ==?= <dungeonlords789@naver.com>
In-Reply-To: <20241029121908.604a3074@windsurf>
References: <d6269fa3c64d831751c6ce37d105895@cweb002.nm>
 <20241029121908.604a3074@windsurf>
Importance: normal
To: =?utf-8?B?VGhvbWFzIFBldGF6em9uaQ==?= <thomas.petazzoni@bootlin.com>
Cc: <buildroot@buildroot.org>
X-Originating-IP: 125.132.232.68
X-Works-Send-Opt: LeYZjAIYjHmlKxu/FoJYKxgXKBwkx0eFjAu=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=naver.com; s=s20171208; 
 t=1730203027; bh=L+o7bcgcj/5M38zmrrYHqWBPpelNlBGkCJ0ydIogPDg=;
 h=Message-ID:Date:From:To:Subject:From:Subject:Feedback-ID:
 X-Works-Security;
 b=MEbencfYml0/bIo/pvtOg7TkxdtBeAO7BMwJVG9f4ulIGKhS/HQ5WpLGXVF0LXbFR
 Ep6Qmau4SZ2sWQUvo6BHaN6ERWf6Lw01RcupechGldCE/l9PCMKCBEAh5dBVFA2GSr
 efgfEqUZcElA6pEwkTxDalbFP70qUcM4ACuTtA7C+lR/B23Rri7xwoeB5Boe5kdoni
 Hu9BbdmEo1qX4mrAc188Twh38nME7IaJofSu7pHTww8LJyCA7lXYRms+knW+J0jh0r
 wENFTfp9CllRveYO4P0gb4v6t80KdMgheEQmVWPiRp0D5O3R/dbF9R2zzyIssN74S2
 ThxHb/ZnFLulw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=naver.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=naver.com header.i=@naver.com header.a=rsa-sha256
 header.s=s20171208 header.b=MEbencfY
Subject: Re: [Buildroot] 
	=?utf-8?q?=5BFeature_request=5D_Find_all_non-existen?=
	=?utf-8?q?t_config_options_by_CI/CD?=
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
Content-Type: multipart/mixed; boundary="===============4896064591914426997=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4896064591914426997==
Content-Type: multipart/alternative;
	boundary="-----Boundary-WM=_7f4128658700.1730203027386"

-------Boundary-WM=_7f4128658700.1730203027386
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

V2h5IHlvdSBjYWxsIHRoZSBvZmZpY2lhbGx5IHBhcnQgb2YgYnVpbGRyb290IGRvY3VtZW50YXRp
b24gYXMgInJhbmRvbSBkb2N1bWVudGF0aW9uIj8gSXMgZmlsZSAiL3N1cHBvcnQva2NvbmZpZy9S
RUFETUUuYnVpbGRyb290IiBvciAiYnVpbGRyb290L2Jsb2IvbWFzdGVyL2JvYXJkL3FlbXUveDg2
L3JlYWRtZS50eHQiIGFsc28gInJhbmRvbSBkb2N1bWVudGF0aW9uIj8gU28gaWYgYW55IGZpbGUg
ZnJvbSBidWlsZHJvb3QgcmVwbyBpcyBub3QgQ29uZmlnLmluIG9yIC5tayB0aGVuIGJ1aWxkcm9v
dCBkb2Vzbid0IHBsYW4gdG8gY2hlY2sgaXQ/CgotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQpG
cm9tOiAiVGhvbWFzIFBldGF6em9uaSB2aWEgYnVpbGRyb290IjxidWlsZHJvb3RAYnVpbGRyb290
Lm9yZz4KVG86ICJDSEVSTklBRVYgQU5EUkVJIjxkdW5nZW9ubG9yZHM3ODlAbmF2ZXIuY29tPjsK
Q2M6IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz47ClNlbnQ6IDIwMjQtMTAtMjkgKO2ZlCkgMjA6
MTk6MDggKEdNVCswOTowMCkKU3ViamVjdDogUmU6IFtCdWlsZHJvb3RdIFtGZWF0dXJlIHJlcXVl
c3RdIEZpbmQgYWxsIG5vbi1leGlzdGVudCBjb25maWcgb3B0aW9ucyBieSBDSS9DRAoKSGVsbG8g
QW5kcmVpLAoKT24gVHVlLCAyOSBPY3QgMjAyNCAxNTozODoyNiArMDkwMApDSEVSTklBRVYgQU5E
UkVJIDxkdW5nZW9ubG9yZHM3ODlAbmF2ZXIuY29tPiB3cm90ZToKCj4gQXMgW3lvdQo+IGtub3dd
KGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2lzc3Vlcy81Nykg
YnVpbGRyb290IGNvbnRhaW5zIHNvbWUgYW1vdW50IG9mIG5vbi1leGlzdGVudCBCUjJfIGNvbmZp
ZyBvcHRpb25zLiBJIHN1Z2dlc3QgdG8gZGlzY3VzcyBzaG91bGQgd2UgbWFrZSBzY3JpcHQgdG8g
YXV0b21hdGljYWxseSBkZXRlY3QgYWxsIGJhZCBCUjJfIGFuZCBob3cgdG8gaW50ZWdyYXRlIGl0
IHRvIENJL0NELiBJbiBteSBwb2ludCBvZiB2aWV3IHdlIGFsc28gc2hvdWxkIGRldGVjdCBsZWdh
Y3kgY29uZmlnIG9wdGlvbnMgd2hpY2ggYXJlIG5vdCBtYXJrZWQgYXMgImxlZ2FjeSIuCj4gV2h5
IEkgY2FuJ3QgbWFrZSBzdWNoIHNjcmlwdD8gQmVjYXVzZSBJIGRvbid0IGtub3cgaG93IHRvIGdl
dCBhIGxpc3QKPiBvZiBhbGwgbm9uLWxlZ2FjeSBCUjJfIGNvbmZpZyBvcHRpb25zCj4KPiBQLlMu
IExldCdzCj4gdXNlIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8t
L2lzc3VlcyB0byBkaXNjdXNzIGFib3V0IG5ldyBmZWF0dXJlIQoKV2UgYWxyZWFkeSBoYXZlIHN1
Y2ggYSBjaGVjayBpbiBjaGVjay1wYWNrYWdlLCBidXQgaXQgY2hlY2tzIENvbmZpZy5pbgphbmQg
Lm1rIGZpbGVzLCBub3QgcmFuZG9tIGRvY3VtZW50YXRpb24gaW5kZWVkLgoKQmVzdCByZWdhcmRz
LAoKVGhvbWFzCi0tClRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4K
RW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6
Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=

-------Boundary-WM=_7f4128658700.1730203027386
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGhlYWQ+PHN0eWxlPnB7bWFyZ2luLXRvcDowcHg7bWFyZ2luLWJvdHRvbTowcHg7fTwv
c3R5bGU+PC9oZWFkPjxib2R5PjxkaXYgc3R5bGU9ImZvbnQtc2l6ZToxNHB4OyBmb250LWZhbWls
eTpHdWxpbSzqtbTrprwsc2Fucy1zZXJpZjsiPjxkaXY+V2h5IHlvdSBjYWxsIHRoZSBvZmZpY2lh
bGx5IHBhcnQgb2YgYnVpbGRyb290IGRvY3VtZW50YXRpb24gYXMgInJhbmRvbSBkb2N1bWVudGF0
aW9uIj8gSXMgZmlsZSAiL3N1cHBvcnQva2NvbmZpZy9SRUFETUUuYnVpbGRyb290IiBvciAiYnVp
bGRyb290L2Jsb2IvbWFzdGVyL2JvYXJkL3FlbXUveDg2L3JlYWRtZS50eHQiIGFsc28gInJhbmRv
bSBkb2N1bWVudGF0aW9uIj8gU28gaWYgYW55IGZpbGUgZnJvbSBidWlsZHJvb3QgcmVwbyBpcyBu
b3QgQ29uZmlnLmluIG9yIC5tayB0aGVuIGJ1aWxkcm9vdCBkb2Vzbid0IHBsYW4gdG8gY2hlY2sg
aXQ/PGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxwIHN0eWxlPSJmb250LXNpemU6MTBwdDtmb250
LWZhbWlseTpzYW5zLXNlcmlmO3BhZGRpbmc6MCAwIDAgMTBwdCI+PHNwYW4+LS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS08L3NwYW4+PGJyPjxiPkZyb206PC9iPiAiVGhvbWFzIFBldGF6em9uaSB2
aWEgYnVpbGRyb290IiZsdDtidWlsZHJvb3RAYnVpbGRyb290Lm9yZyZndDsgPGJyPjxiPlRvOjwv
Yj4gIkNIRVJOSUFFViBBTkRSRUkiJmx0O2R1bmdlb25sb3Jkczc4OUBuYXZlci5jb20mZ3Q7OyA8
YnI+PGI+Q2M6PC9iPiAmbHQ7YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcmZ3Q7OyA8YnI+PGI+U2Vu
dDo8L2I+IDIwMjQtMTAtMjkgKO2ZlCkgMjA6MTk6MDggKEdNVCswOTowMCk8YnI+PGI+U3ViamVj
dDo8L2I+IFJlOiBbQnVpbGRyb290XSBbRmVhdHVyZSByZXF1ZXN0XSBGaW5kIGFsbCBub24tZXhp
c3RlbnQgY29uZmlnIG9wdGlvbnMgYnkgQ0kvQ0Q8YnI+PGJyPjwvcD5IZWxsbyBBbmRyZWksPGJy
Pjxicj5PbiBUdWUsIDI5IE9jdCAyMDI0IDE1OjM4OjI2ICswOTAwPGJyPkNIRVJOSUFFViBBTkRS
RUkgJmx0O2R1bmdlb25sb3Jkczc4OUBuYXZlci5jb20mZ3Q7IHdyb3RlOjxicj48YnI+Jmd0OyBB
cyBbeW91PGJyPiZndDsga25vd10oPGEgaHJlZj0iaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9v
dC5vcmcvYnVpbGRyb290Ly0vaXNzdWVzLzU3IiB0YXJnZXQ9Il9ibGFuayIgcmVsPSJub29wZW5l
ciBub3JlZmVycmVyIj5odHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3Qv
LS9pc3N1ZXMvNTc8L2E+KSBidWlsZHJvb3QgY29udGFpbnMgc29tZSBhbW91bnQgb2Ygbm9uLWV4
aXN0ZW50IEJSMl8gY29uZmlnIG9wdGlvbnMuIEkgc3VnZ2VzdCB0byBkaXNjdXNzIHNob3VsZCB3
ZSBtYWtlIHNjcmlwdCB0byBhdXRvbWF0aWNhbGx5IGRldGVjdCBhbGwgYmFkIEJSMl8gYW5kIGhv
dyB0byBpbnRlZ3JhdGUgaXQgdG8gQ0kvQ0QuIEluIG15IHBvaW50IG9mIHZpZXcgd2UgYWxzbyBz
aG91bGQgZGV0ZWN0IGxlZ2FjeSBjb25maWcgb3B0aW9ucyB3aGljaCBhcmUgbm90IG1hcmtlZCBh
cyAibGVnYWN5Ii48YnI+Jmd0OyBXaHkgSSBjYW4ndCBtYWtlIHN1Y2ggc2NyaXB0PyBCZWNhdXNl
IEkgZG9uJ3Qga25vdyBob3cgdG8gZ2V0IGEgbGlzdDxicj4mZ3Q7IG9mIGFsbCBub24tbGVnYWN5
IEJSMl8gY29uZmlnIG9wdGlvbnM8YnI+Jmd0OyA8YnI+Jmd0OyBQLlMuIExldCdzPGJyPiZndDsg
dXNlIDxhIGhyZWY9Imh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8t
L2lzc3VlcyIgdGFyZ2V0PSJfYmxhbmsiIHJlbD0ibm9vcGVuZXIgbm9yZWZlcnJlciI+aHR0cHM6
Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vaXNzdWVzPC9hPiB0byBkaXNj
dXNzIGFib3V0IG5ldyBmZWF0dXJlITxicj48YnI+V2UgYWxyZWFkeSBoYXZlIHN1Y2ggYSBjaGVj
ayBpbiBjaGVjay1wYWNrYWdlLCBidXQgaXQgY2hlY2tzIENvbmZpZy5pbjxicj5hbmQgLm1rIGZp
bGVzLCBub3QgcmFuZG9tIGRvY3VtZW50YXRpb24gaW5kZWVkLjxicj48YnI+QmVzdCByZWdhcmRz
LDxicj48YnI+VGhvbWFzPGJyPi0tIDxicj5UaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQg
Q0VPLCBCb290bGluPGJyPkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5k
IHRyYWluaW5nPGJyPjxhIGhyZWY9Imh0dHBzOi8vYm9vdGxpbi5jb20iIHRhcmdldD0iX2JsYW5r
IiByZWw9Im5vb3BlbmVyIG5vcmVmZXJyZXIiPmh0dHBzOi8vYm9vdGxpbi5jb208L2E+PGJyPl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fPGJyPmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3Q8YnI+YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc8YnI+PGEgaHJlZj0iaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290IiB0YXJn
ZXQ9Il9ibGFuayIgcmVsPSJub29wZW5lciBub3JlZmVycmVyIj5odHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3Q8L2E+PGJyPjwvZGl2PjwvYm9keT48
L2h0bWw+PHRhYmxlIHN0eWxlPSdkaXNwbGF5Om5vbmUnPjx0cj48dGQ+PGltZyBzcmM9Imh0dHBz
Oi8vbWFpbC5uYXZlci5jb20vcmVhZFJlY2VpcHQvbm90aWZ5Lz9pbWc9VllGVHA2JTJCNSUyQjZ0
WGJyM1pXcnc1YUF2c2hBRSUyRkZ4S2Rwb0taRkF2JTJGSzZrdk1vQ0NLcnVxRkEyckZxRlNGNmlD
S29rMHR6RlhwNlVtS3hNNVc0ZFFhcmk5MTZ3dmI0ZVQlMkJ1SVMlMkI2MG5wSGlUV1h0NVdYaU4u
Z2lmIiBib3JkZXI9IjAiLz48L3RkPjwvdHI+PC90YWJsZT4=

-------Boundary-WM=_7f4128658700.1730203027386--

--===============4896064591914426997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4896064591914426997==--
