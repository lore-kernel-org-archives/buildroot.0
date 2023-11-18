Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C6DC2BB3F
	for <buildroot@archiver.kernel.org>; Sat, 18 Nov 2023 15:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23AB9400EC;
	Sat, 18 Nov 2023 15:31:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23AB9400EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BhH515gvTqXB; Sat, 18 Nov 2023 15:31:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D921404A1;
	Sat, 18 Nov 2023 15:31:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D921404A1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D3F6B1BF38C
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 15:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC13A4161C
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 15:31:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC13A4161C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aUb2_oHJQzYm for <buildroot@lists.busybox.net>;
 Sat, 18 Nov 2023 15:31:22 +0000 (UTC)
Received: from out203-205-221-164.mail.qq.com (out203-205-221-164.mail.qq.com
 [203.205.221.164])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A753041498
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 15:31:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A753041498
X-QQ-FEAT: oHWrrGTW1dC2rQ4SYB6o3zego2AKJXPB
X-QQ-SSF: 00000000000000F0000000000000
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-XMAILINFO: OfOeDWHjrjE/1G4FI7nT3o0tt3EGVUZo59VdBLsGQTJnUYKsP3ikiaQ/2gNbBt
 EbdkoB5C5xaQZhkdSsiYuIYdz+YYBkwLPdsv9DTFqK8ZwQRRiHDw1lPE+cDVQvOXyRdmD6LRtoIRX
 ike7Y/yZwN+Ws+I7L/zUxCNCJ/Wkx6J5dCyFx2MD9TdcVYSBsW1pZGdFfDAwyZZwerWlXjt+Gf5mB
 YvxjXjE2zDOohEQ0P6somp4LhhgfMHxb7rz6C3n9t47nh2I6zY/qlTJ41VzXIY2jMNrtU70lEAETw
 Ixodg5H5u5vOR03Xfn/tieHH1Hyuos/XNCYCXvnuOX6yiNFvphpNCkLZMhh+EVaOiZ3PDMzM4Sq1X
 ROfIfk3PavyOVxddZ/JfOfQ/nY26nNKTjSs+8sCgoa4W6fJqIehJqudJo/Xtcx/DuyI88d403hPXx
 zNXDJ2n7WITHxQtl3Bk3MQuHU+o/yLXL/JORfOBb/tD1pgr7V7+JA279Hxx3OWgtZIVelUClX9xTa
 nP3pQd+L+HkOP97ERz0+6nSTHMP4YLI5VQbjPvrE1SU2ZJKHuItDiL2E9i3nLc0O436fDvpXLp72B
 hFeEtZVmz/qEaQhM0cJyijE4YYdh3nJvt6XGoTz5QJmZhDt74sCzhHocQEUtciOu/e8jGEaHYuRrS
 LaSTJ/KKtl7xIw0JkYdDIufD5WMumgmh8N2qiXcUf1PiZ6v6YOpeTvrkOvey7sfuWNnV/UCO/ZyT+
 yXUGOrJd93Oe22dQy37UzIIaEHajL0Axpdf8fvYIh5+C8ggpYwKSVtJSJdbIuSAqlUXWbI/VXXB2s
 dSYCOJCcmARHhKnXgFJu4TvSlmGFZT8+KUIZ1wGJkocB1Re2j2UCyQYzVUScuCEDSTuArA49jX2Nl
 bTnuausUFghqzADXqnJpfM5+C7zSn/4JBkgRUrKBcPtxMZNZFplquYSl55TEJcgQxnf5DMMzczsGd
 F1Af2Q/zp3uEwBEH99WMcZEg5ko90Xiw/2t3Pi9dyGIZnsz9TPyaEiJ0I7es4135Tupl4HEfpcMc7
 gEWS01tKhe66LQ77xfnFvkmTwgvEia2+2y3OT/kZqC6iU5D0KeEWyHUqv7LJnt4D/mgAPx+qL/hDK
 vN7qOeRQBz19gvCZ2oukWmtc
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 120.245.14.161
X-QQ-STYLE: 
X-QQ-mid: webmail281t1700321473t770734
To: "=?gb18030?B?eWFubi5tb3Jpbi4xOTk4?=" <yann.morin.1998@free.fr>
Mime-Version: 1.0
Date: Sat, 18 Nov 2023 23:31:12 +0800
X-Priority: 3
Message-ID: <tencent_D6A6E9BF418910070340A731CA97A2A5C606@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qq.com; s=s201512; 
 t=1700321473; bh=jOjhV/ugfFmxw94OmfHCNzGCSg4JqcbImSfIoNVe8bQ=;
 h=From:To:Cc:Subject:Date;
 b=XL8n16X4tACyqek4lwsnhkD3ZLISi8jg941rp0K4qyOuVmIeC979vAaxtwvQDlJbg
 SR7li2nKoFSvm35nZMLHmGiH8/vMvm+K2Tp8JW92uPn2E+dURXefmf8FUa3NVUMw6z
 dIJeuZ8CGsaUVjKTaAc1OcCMP/4kj/ImvW/sWIJE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256
 header.s=s201512 header.b=XL8n16X4
Subject: Re: [Buildroot] [PATCH 1/1 RESEND] package/wiringX: add GPIO
 library wiringX
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
From: hanyuan-z via buildroot <buildroot@buildroot.org>
Reply-To: =?gb18030?B?aGFueXVhbi16?= <hanyuan-z@qq.com>
Cc: =?gb18030?B?cy5tYXJ0aW40OQ==?= <s.martin49@gmail.com>,
 =?gb18030?B?aGFueXVhbi16?= <hanyuan-z@qq.com>,
 =?gb18030?B?YnVpbGRyb290?= <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============8334608341649478943=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.

--===============8334608341649478943==
Content-Type: multipart/alternative;
	boundary="----=_NextPart_6558D8C0_1372C520_1463393D"
Content-Transfer-Encoding: 8Bit

This is a multi-part message in MIME format.

------=_NextPart_6558D8C0_1372C520_1463393D
Content-Type: text/plain;
	charset="gb18030"
Content-Transfer-Encoding: base64

SGVsbG8gWWFubiwNCg0KSSBhcG9sb2dpemUgZm9yIG15IG1pc3VuZGVyc3RhbmRpbmcgb2Yg
dGhlIFJFU0VORCB3b3JkLiBCdXQgSaGvZCBsaWtlIHRvIGdpdmUgbXkgcmVhc29ucyBmb3Ig
dGhlIGVtYWlsoa9zIHJlc2VuZGluZy4NCg0KVGhpcyBlbWFpbCBhbmQgdGhlIGFjY29tcGFu
eWluZyBwYXRjaCBoYWQgYmVlbiBzZW50IGZvciBtb3JlIHRoYW4gb25lIG1vbnRoLCBob3dl
dmVyLCB1bmZvcnR1bmF0ZWx5LCBJIHN0aWxsIGdldCBubyByZXBseSwgZXZlbiBpZiBJIHdy
aXRlIGFuIGVtYWlsIGFnYWluIHRvIFNhbXVlbC4gSSBhbSBub3QgY2xlYXIgd2hhdCBoYXBw
ZW5lZC4gTWF5YmUgbXkgZW1haWwgaXMgYmxvY2tlZCBieSBnbWFpbCBieSBkZWZhdWx0PyBT
byBJIHRyaWVkIHRvIGVtYWlsIHRvIHlvdS4NCg0KT25jZSBhZ2FpbiwgSSBhbSBzaW5jZXJl
bHkgc29ycnkgZm9yIGFueSBpbmNvbnZlbmllbmNlIGNhdXNlZCBieSBteSByZXBlYXRlZCBh
dHRlbXB0cyB0byBjb250YWN0IHlvdS4gSSBhcHByZWNpYXRlIHlvdXIgdW5kZXJzdGFuZGlu
ZyBhbmQgYXNzaXN0YW5jZSBpbiB0aGlzIG1hdHRlci4NCg0KVGhhbmtzIQ0KDQpLaW5kIHJl
Z2FyZHMsDQpIYW55dWFu

------=_NextPart_6558D8C0_1372C520_1463393D
Content-Type: text/html;
	charset="gb18030"
Content-Transfer-Encoding: base64

SGVsbG8gWWFubiw8YnI+PGJyPkkgYXBvbG9naXplIGZvciBteSBtaXN1bmRlcnN0YW5kaW5n
IG9mIHRoZSBSRVNFTkQgd29yZC4gQnV0IEmhr2QgbGlrZSB0byBnaXZlIG15IHJlYXNvbnMg
Zm9yIHRoZSBlbWFpbKGvcyByZXNlbmRpbmcuPGJyPjxicj5UaGlzIGVtYWlsIGFuZCB0aGUg
YWNjb21wYW55aW5nIHBhdGNoIGhhZCBiZWVuIHNlbnQgZm9yIG1vcmUgdGhhbiBvbmUgbW9u
dGgsIGhvd2V2ZXIsIHVuZm9ydHVuYXRlbHksIEkgc3RpbGwgZ2V0IG5vIHJlcGx5LCBldmVu
IGlmIEkgd3JpdGUgYW4gZW1haWwgYWdhaW4gdG8gU2FtdWVsLiBJIGFtIG5vdCBjbGVhciB3
aGF0IGhhcHBlbmVkLiBNYXliZSBteSBlbWFpbCBpcyBibG9ja2VkIGJ5IGdtYWlsIGJ5IGRl
ZmF1bHQ/IFNvIEkgdHJpZWQgdG8gZW1haWwgdG8geW91Ljxicj48YnI+T25jZSBhZ2Fpbiwg
SSBhbSBzaW5jZXJlbHkgc29ycnkgZm9yIGFueSBpbmNvbnZlbmllbmNlIGNhdXNlZCBieSBt
eSByZXBlYXRlZCBhdHRlbXB0cyB0byBjb250YWN0IHlvdS4gSSBhcHByZWNpYXRlIHlvdXIg
dW5kZXJzdGFuZGluZyBhbmQgYXNzaXN0YW5jZSBpbiB0aGlzIG1hdHRlci48YnI+PGJyPlRo
YW5rcyE8YnI+PGJyPktpbmQgcmVnYXJkcyw8YnI+SGFueXVhbg==

------=_NextPart_6558D8C0_1372C520_1463393D--


--===============8334608341649478943==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8334608341649478943==--

