Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AD5606A31C
	for <buildroot@archiver.kernel.org>; Tue, 17 Nov 2026 13:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KrU7uqPu;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256 header.s=ovhmo103079-selector1 header.b=BaQlJRVK
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14340810D0;
	Tue, 17 Nov 2026 13:40:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j6Ad8fp34Pst; Tue, 17 Nov 2026 13:40:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1FC5580F5C
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794922857;
	b=mqSzrxiZJb3NYNVFQtgMBZv9J8gP9zptQtSryrDxwqVW3fvVSiytI0GqgroP4nGhOpDI
	 lYTF3CMiiTYBZqxeBQLg+WEo8SGQ8kHNtpr36eq0jsstZ6a5jkxB260kgb4mczF4oaUgO
	 rqbIQe7rXnBIu19PeS/8o1aIrSL93bo7tpUbverfhcAn3LGFMs6VhjJFb6O1ZVFO05yBq
	 dX6Gi4yyKHiYrm1de+zK9vHKeO5XH1FQnryR0c3EG+ACTVrUwdHXcJbBhdj++2tn1eYrt
	 Y3c2+rHIGCOsmGtY4dkz4NN/LxbWPviulL1wQK5zAtONYZARr9DmNYwQoMNo+XP2tOw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794922857;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 Received:Received:Received:X-OVh-ClientIp:From:Date:Message-Id:
	 MIME-Version:X-B4-Tracking:X-Change-ID:To:X-Mailer:x-ovh-tracer-id:
	 X-VR-SPAMSTATE:X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Sw7O+27ZrddTHQjKqI1GTZiUPNTYEgXwtiOb+YMh6mQ=;
	b=gUhunw6g0chuxqQv7xRRCQde++OneHlDMw8ihbVEYeeKoAYMMaAuQKw7/sZrAfsAWdzU
	 u95yb5ejEJ94f4jdCvbayFPvTB8JOiY0PJGAUfQKzqHoIGLt/nLuWsXMbC/UhHqJNrI98
	 9CGYJoQlAhMLA7/Pq0yz3MGyZLkboq3JRIhHzbY8csdlF2YsEZgp8TJMMZPwFVE0VDUON
	 UrfW2kVN6YndsVAnLxXmCJ4MGBSmOHO98Q9c0aAbQP1WAaZN03tGuDrsh4vQXP9EFcVeW
	 D1ZqPyxdVwvq5u9EMVHfkoYCiy36vQIkDXbWjBRebMYQqhzK8cCcgTFBh2kHXpR5i5g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794922857;
	bh=Sw7O+27ZrddTHQjKqI1GTZiUPNTYEgXwtiOb+YMh6mQ=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=KrU7uqPuEBj1tm9XzDVPCFtVPwWXcrX/0d4K+KFOKglP6RUF+m+M9n2hpNsGOL7Ua
	 9Mhuj2JcHBf/9gblRLwE22PZTb6HEeEvSnRJs2qnKN+YaHQ8ncVU03kVNuE//oT+dc
	 KY/syZ4thWqedy/567isarahZi9zOVm/0hgC1rRG4Xgt02nKwO1tZVDLffMzCdT+jK
	 F3+qni0GMtWKRkv1gZvgvq2FxBrfxpYZmrLTHvc9ARuSmd4dP9st7dEZWJuAIif8wQ
	 OrCELy6/WwvkzJKel9RKLNgFwz81xqPD60+xN/qICu3N+akOOWXK9QOAtannysvpLr
	 WCN5DhDL0OiuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FC5580F5C;
	Tue, 17 Nov 2026 13:40:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EC31B1E7
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 13:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DDE87405AD
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 13:40:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uEc7_4EYoze5 for <buildroot@buildroot.org>;
 Tue, 17 Nov 2026 13:40:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3E8F94055F
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=46.105.72.36
X-Greylist: delayed 8401 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 17 Nov 2026 13:40:51 UTC
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=armadeus.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=BaQlJRVK
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.105.72.36;
 helo=2.mo584.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 2.mo584.mail-out.ovh.net (2.mo584.mail-out.ovh.net
 [46.105.72.36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3E8F94055F
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 13:40:51 +0000 (UTC)
Received: from director9.ghost.mail-out.ovh.net (unknown [10.110.58.226])
 by mo584.mail-out.ovh.net (Postfix) with ESMTP id 4jTKtM17Wpz8TJ0
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 09:58:19 +0000 (UTC)
Received: from ghost-submission-7ccd8bbbb6-5vtz7 (unknown [10.110.118.244])
 by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id D8E1580F7A;
 Tue, 17 Nov 2026 09:58:18 +0000 (UTC)
Received: from armadeus.com ([37.59.142.95])
 by ghost-submission-7ccd8bbbb6-5vtz7 with ESMTPSA
 id +ZCOLzol/GqU0j8AT5flKQ
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Tue, 17 Nov 2026 09:58:18 +0000
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0016fa93753-916a-4a97-b663-f27b2642fd74,
 E27E9456AC6DD6F5FB3B2C065D8FDFF45D5FC9B1)
 smtp.auth=sebastien.szymanski@armadeus.com
X-OVh-ClientIp: 92.148.202.169
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Tue, 17 Nov 2026 10:58:10 +0100
Message-Id: <20261117-imx-fix-ddr-choices-v1-0-609ff9c3afd2@armadeus.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBCF4auUWTuQaUkiXkVcmGQ0I9hKRqUQc
 vfGuvzgvb+CchFWOA0VCn9FZZk76DBAzNf5ziipG0YzOiJyKM8Vb7JiSgVjXiSyYjiysX4KfrI
 E/fkq3Cd79Xz5Wz/hwfH9S0FrG2qZSKV3AAAA
X-Change-ID: 20261116-imx-fix-ddr-choices-b8e0573b7351
To: buildroot@buildroot.org
X-Mailer: b4 0.16.0
x-ovh-tracer-id: 2682738003809261261
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTEckA5J3ODTV1FXlJ4u3EcujrI7agITcLmvjhbQS3u133YVicyOSa2KXRPRkoezAA6aRHQgck2Ihb5bgbClAxPmcNvji1Yorbmjv/NBuBdWh02dEI2btDum04TXtl4Oa7ACwRln7W3Xr6rclp9CL6Ty+Hg02wngscCI83Sa3SJ9eGqboYXI1CURyeryxQA6V6qnUWXgVMR9WJNbvEUQW1SMl4q8fAeyioxPTuWIvdbnVycyVtUVZU9ejlvZYnUwRXA08VDg9Z+1TYy29T2SQNY0kpgGXL2gBWcBeptNbcRrJeY5CVuR2dbr/cWUKWwIlPoPxtmVCEG/tkxtVZrBKJT0p4ja8f6cSEwL5KkJW7t2COugV/eXAGLfnz37p8RziKGP6U0hEmGGOcV/qhgtNmtXSxBnONrdd2YmCclZQNJydXoYmK93fDdR0sRCnB4EuWB8ZGVIlQ6TPxGUgeChvBE1qsLK3ANRPn4eyLbRkah5w0emeL7EOqjTPyNUIxX8ELOgZgTWM//G72zFvLbEcfcR2Cr2NuWabwfIseYTuayMjfuDHk1bD0hxW/ORB7LR6Ygy1TXaYuLRHnAJKYBkM7QXhZ+yk5VF+2z723ZX8VrhjRpsIyXmrmmV9jOkYvHi9j9KMx/K2db5jMv9nmbZb52Pcgsoo6vNYcESJ7NfSosK/A
DKIM-Signature: a=rsa-sha256; bh=2TkO+pHE4ieCkbp/PZYh19MpRxw/i3aWzukIb34ScMc=; 
 c=relaxed/relaxed; d=armadeus.com; h=From;
 s=ovhmo103079-selector1; t=1794909499; v=1;
 b=BaQlJRVKZjEwySBZJZioks0yq7TGABU1CWXCvldJu2H+ErFhT/oDXO8FMFeV6M6/Up3b7Qaz
 qrEYhuAqUON1Tjxf0TLR3o2j0Iw6ByLnV5CyDbIUqo98FvVWm051Qp0cl6GCo7/utHt0P3tSwDc
 zj+XpEcQ0ekURtuvIrFOYO2saOggP+aC4quL2NvU/Ek1cB3k31twJQniI8Sb+GbRR81ioHL4Y1/
 G/nHzi0L3xNVmtkolFlLMFGfs2dNFnZY5wIRe9YdGgjolcYSJbJh/RCmADsbdFwwaPc8xbMebss
 y2Wi9eY0cnjKHHoWOrdToBBDT+1so4eAp4B4B4FSvNTig==
Subject: [Buildroot] [PATCH 0/2] package/freescale-imx: prevent invalid
 SoC/DDR binaries combination
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhpcyBzbWFsbCBzZXJpZXMgcHJldmVudCB0aGUgdXNlciBmcm9tIHNlbGVjdGlvbiBpbnZsYWlk
IFNvQy9ERFIKYmluYXJpZXMgb24gaS5NWDhNUCBhbmQgaS5NWDk1IFNvQ3M6CgoqIE5vIEREUjMg
b24gaS5NWDhNUAoqIExQRERSNFggb25seSB1c2VkIG9uIGkuTVg5NQoKU2lnbmVkLW9mZi1ieTog
U8OpYmFzdGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lAYXJtYWRldXMuY29tPgot
LS0KU8OpYmFzdGllbiBTenltYW5za2kgKDIpOgogICAgICBwYWNrYWdlL2ZyZWVzY2FsZS1pbXg6
IEZvcmJpZCBERFIzIHNlbGVjdGlvbiBmb3IgaS5NWDhNUAogICAgICBwYWNrYWdlL2ZyZWVzY2Fs
ZS1pbXg6IHN1Z2dlc3QgTFBQRFI0WCBERFIgYmluYXJpZXMgb25seSBmb3IgaS5NWDk1CgogcGFj
a2FnZS9mcmVlc2NhbGUtaW14L2Zpcm13YXJlLWlteC9Db25maWcuaW4gfCA2ICsrKysrLQogMSBm
aWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQotLS0KYmFzZS1jb21t
aXQ6IDI5NDFlYjg2ZTNkYjZmNWVjYmI5M2VmZDQ2OGM0OWJjNGRkMjk4NzgKY2hhbmdlLWlkOiAy
MDI2MTExNi1pbXgtZml4LWRkci1jaG9pY2VzLWI4ZTA1NzNiNzM1MQoKQmVzdCByZWdhcmRzLAot
LSAgClPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNv
bT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
