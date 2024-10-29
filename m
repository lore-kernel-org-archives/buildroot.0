Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F31FAD13594
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 06:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 879A280D9A;
	Tue, 29 Oct 2024 06:48:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ClfzNQiIP5-0; Tue, 29 Oct 2024 06:48:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89ECD80D9E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89ECD80D9E;
	Tue, 29 Oct 2024 06:48:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E6F4112A
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 06:48:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FF4E4061C
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 06:48:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sxyXVyy4hVKa for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 06:48:32 +0000 (UTC)
X-Greylist: delayed 601 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 29 Oct 2024 06:48:30 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4C5DE405F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C5DE405F9
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=114.111.35.240;
 helo=cvsmtppost28.nm.naver.com; envelope-from=dungeonlords789@naver.com;
 receiver=<UNKNOWN> 
Received: from cvsmtppost28.nm.naver.com (cvsmtppost28.nm.naver.com
 [114.111.35.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4C5DE405F9
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 06:48:30 +0000 (UTC)
X-Originating-IP: 125.132.232.68
X-Works-Smtp-Source: wdY9KxgqFqJCpNmrKAEwWHF0
Received: from cvsendbo008.nm ([10.112.24.37])
 by cvsmtppost28.nm.naver.com with ESMTP id E2dIQosSQYWyB5+ewOWJWQ
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 06:38:26 -0000
X-Session-ID: c0e24a3d6c3a0b093d2befd99a60b662885ac1560074dc05f7db0196158a8f03
MIME-Version: 1.0
Message-ID: <d6269fa3c64d831751c6ce37d105895@cweb002.nm>
Date: Tue, 29 Oct 2024 15:38:26 +0900
From: =?utf-8?B?Q0hFUk5JQUVWIEFORFJFSQ==?= <dungeonlords789@naver.com>
Importance: normal
To: <buildroot@buildroot.org>
X-Originating-IP: 125.132.232.68
X-Works-Send-Opt: 3eYwjAIYjHmlKxu/FoJYKxgXKBwkx0eFjAu=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=naver.com; s=s20171208; 
 t=1730183906; bh=7ouCElXdMOpbgRQKP/7aXol6auzK295+kRevZZRa22c=;
 h=Message-ID:Date:From:To:Subject:From:Subject:Feedback-ID:
 X-Works-Security;
 b=MhuSD1zc0eoUGXUdmkxU7UyUodzcZMCqlwF5pPhqniPuZgUVsrMhTDggiqW5nfsCp
 0UsjwAr9Yvb5at5FuafiebW04Hmgv9wYVFHI4fAV12s3FszEBwWs1MKP/60iPd0Bex
 G2/P2vRrUBbJkydxR/A8GjUZyqFxXyj0lP8KGAaBfFHoUpgMBdz5RokZV+pUvCdNCS
 MYxCIPcsdYusaXbAp6GGfjEC6nUwuYviEov77FgDxhj8jQVBXpEJS/QHWidrgcH8n1
 zyMO8+X/LCo42s5pWs2WtXGlEjakaz4MuwQldgy58vd6GMGhBgYam4HD9WDO2Vtmu7
 qIq7YFRX7GrPA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=naver.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=naver.com header.i=@naver.com header.a=rsa-sha256
 header.s=s20171208 header.b=MhuSD1zc
Subject: [Buildroot] =?utf-8?q?=5BFeature_request=5D_Find_all_non-existen?=
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
Content-Type: multipart/mixed; boundary="===============3236356100218129465=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3236356100218129465==
Content-Type: multipart/alternative;
	boundary="-----Boundary-WM=_7fac7e6f3700.1730183906773"

-------Boundary-WM=_7fac7e6f3700.1730183906773
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

QXMgW3lvdSBrbm93XShodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3Qv
LS9pc3N1ZXMvNTcpIGJ1aWxkcm9vdCBjb250YWlucyBzb21lIGFtb3VudCBvZiBub24tZXhpc3Rl
bnQgQlIyXyBjb25maWcgb3B0aW9ucy4gSSBzdWdnZXN0IHRvIGRpc2N1c3Mgc2hvdWxkIHdlIG1h
a2Ugc2NyaXB0IHRvIGF1dG9tYXRpY2FsbHkgZGV0ZWN0IGFsbCBiYWQgQlIyXyBhbmQgaG93IHRv
IGludGVncmF0ZSBpdCB0byBDSS9DRC4gSW4gbXkgcG9pbnQgb2YgdmlldyB3ZSBhbHNvIHNob3Vs
ZCBkZXRlY3QgbGVnYWN5IGNvbmZpZyBvcHRpb25zIHdoaWNoIGFyZSBub3QgbWFya2VkIGFzICJs
ZWdhY3kiLgpXaHkgSSBjYW4ndCBtYWtlIHN1Y2ggc2NyaXB0PyBCZWNhdXNlIEkgZG9uJ3Qga25v
dyBob3cgdG8gZ2V0IGEgbGlzdCBvZiBhbGwgbm9uLWxlZ2FjeSBCUjJfIGNvbmZpZyBvcHRpb25z
CgpQLlMuIExldCdzIHVzZSBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJv
b3QvLS9pc3N1ZXMgdG8gZGlzY3VzcyBhYm91dCBuZXcgZmVhdHVyZSEK

-------Boundary-WM=_7fac7e6f3700.1730183906773
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGhlYWQ+PHN0eWxlPnB7bWFyZ2luLXRvcDowcHg7bWFyZ2luLWJvdHRvbTowcHg7fTwv
c3R5bGU+PC9oZWFkPjxib2R5PjxkaXYgc3R5bGU9ImZvbnQtc2l6ZToxNHB4OyBmb250LWZhbWls
eTpHdWxpbSzqtbTrprwsc2Fucy1zZXJpZjsiPkFzIFt5b3Uga25vd10oPGEgaHJlZj0iaHR0cHM6
Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vaXNzdWVzLzU3IiB0YXJnZXQ9
Il9ibGFuayIgcmVsPSJub29wZW5lciBub3JlZmVycmVyIj5odHRwczovL2dpdGxhYi5jb20vYnVp
bGRyb290Lm9yZy9idWlsZHJvb3QvLS9pc3N1ZXMvNTc8L2E+KSAKYnVpbGRyb290IGNvbnRhaW5z
IHNvbWUgYW1vdW50IG9mIG5vbi1leGlzdGVudCBCUjJfIGNvbmZpZyBvcHRpb25zLiBJIApzdWdn
ZXN0IHRvIGRpc2N1c3Mgc2hvdWxkIHdlIG1ha2Ugc2NyaXB0IHRvIGF1dG9tYXRpY2FsbHkgZGV0
ZWN0IGFsbCBiYWQKIEJSMl8gYW5kIGhvdyB0byBpbnRlZ3JhdGUgaXQgdG8gQ0kvQ0QuIEluIG15
IHBvaW50IG9mIHZpZXcgd2UgYWxzbyAKc2hvdWxkIGRldGVjdCBsZWdhY3kgY29uZmlnIG9wdGlv
bnMgd2hpY2ggYXJlIG5vdCBtYXJrZWQgYXMgImxlZ2FjeSIuPGJyPldoeSBJIGNhbid0IG1ha2Ug
c3VjaCBzY3JpcHQ/IEJlY2F1c2UgSSBkb24ndCBrbm93IGhvdyB0byBnZXQgYSBsaXN0IG9mIGFs
bCBub24tbGVnYWN5IEJSMl8gY29uZmlnIG9wdGlvbnM8YnI+PGJyPlAuUy4gTGV0J3MgdXNlIDxh
IHRhcmdldD0iX2JsYW5rIiBocmVmPSJodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9i
dWlsZHJvb3QvLS9pc3N1ZXMiPmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxk
cm9vdC8tL2lzc3VlczwvYT4gdG8gZGlzY3VzcyBhYm91dCBuZXcgZmVhdHVyZSE8L2Rpdj48L2Jv
ZHk+PC9odG1sPjx0YWJsZSBzdHlsZT0nZGlzcGxheTpub25lJz48dHI+PHRkPjxpbWcgc3JjPSJo
dHRwczovL21haWwubmF2ZXIuY29tL3JlYWRSZWNlaXB0L25vdGlmeS8/aW1nPVZxUlRwNiUyQjUl
MkI2dFhicjNaV3J3NWFBdnNoenRyS29NbHA0dXFNcU1kcEEycUt4YjlLNktyTXJFcUZydHdLQUUl
MkZheGtnTVglMkIwTW9nbUtTbDVXeCUyRnNNTmtHV3ozWldyZWR0emk5MTZ3dmI0ZVQlMkJWbFRi
NGIlM0QuZ2lmIiBib3JkZXI9IjAiLz48L3RkPjwvdHI+PC90YWJsZT4=

-------Boundary-WM=_7fac7e6f3700.1730183906773--

--===============3236356100218129465==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3236356100218129465==--
