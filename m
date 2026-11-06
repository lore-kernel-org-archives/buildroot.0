Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDB0606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=re39jnay
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBF8A812BD;
	Fri,  6 Nov 2026 16:34:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l9qWEir7aU-3; Fri,  6 Nov 2026 16:34:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C47E3812A0
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793982840;
	b=C93aRgCPWKQAK2TZyEZAI4YARpGaGCyO5xlgYZxjUozB7FzqTDOQxeG/HqM/jRYAsCQ4
	 hz4wemaMtUDKFWXIdmvKaVQ7fZuB8ZTg+Mw3vhJPTkZq+Cykowv4uvlq/8Sfxn96wF/7R
	 Vx+JdUzpI9msiS92m7f+uIdtH8Xes9j0LaCOJo8WaaTv5oRJjJ0H2jOej5zMATaChpf1E
	 GcdnvMqtV8iY42ah6ei3YlJAGSySR3uXU/c1q7QnP1xv9YttIdCQ4qBpR/LqhBWDGIPnk
	 KAS7/3I95OjsP9haSU2yiTI+2XistkR19j6FIPfqbPKZ/8oWGTEmsYnQH7lxh/Zddow==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793982840;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=UYiKO7sRoGWUbVEOoMtrTuHFzTm6E4tdg1Xeqhw6nTs=;
	b=IgVqkWaefTENdFRHoORqLIk492zbOoxbOuM/YszGMyDupQQx6I6BIajOryO+AgEbgDJd
	 rEplwpX4FAFTuKWATgjGWKXVN1fHUwRVXOp7G+Spwom7HfzEXbPMJOK4YMDW3u8LvuT3h
	 AItdIXCxR+5MQLztcKv1zko+zPAkdLR2fIrmJ88j0zCCFjo4VAtw8gWu6h1YoPtcHCFLf
	 chE9tIMzteMzD94n9l+z5bLQs9cB+qbUeEtwcV/GClOkeI5a9pQoVYg3jGJw+tIGPp7ud
	 EUHlcDOZzr9qKIII6Ckg/blDgRAFpbL/RfSm0POubjnM9+50WKCK6KH/q5bc7rq0IrA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793982840;
	bh=UYiKO7sRoGWUbVEOoMtrTuHFzTm6E4tdg1Xeqhw6nTs=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=re39jnayo639bl/7D7BouFDlMTy/q+dEupW2+eapRWtWfuQFK3s00F4KyEP6Tym0l
	 9459Rf0kJ40mzNvYA6q5it5TY/aNC5Zcy3TFl1uEkziWrZ7BJAXbneRB8dvTg0dKox
	 2NIdYkt437OT4Bz8qTNskZleJq61jP0ib1C+SaHn8wery10+a+BIigboqwY5j0EOqP
	 ELHQ/H3gqujOjh/Jrm3moEUqA0ah0dBFK+X4hiNlzmTtjVNBxE6/Z8k3iEmhxWqqCq
	 mUg8Y14rtaumNzQODN7TEUiqD9EBJsIwJBOtOjGvnnUMobEkZiVp3wornYMVAWh+GB
	 egVwg8B7cgncA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C47E3812A0;
	Fri,  6 Nov 2026 16:34:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A3DA4B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5BFE3606AA
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:33:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LPCVRiGcKk4v for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:33:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3BB3F6069B
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3BB3F6069B
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:33:57 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4b7252a32c8so7332865e9.0
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 08:33:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793982836; x=1794587636;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=X64KqXOTzTqn2fEClcUd5BTOsPzK/BXRxO9RGmRXME4=;
 b=AfGTkClmrm1zHgAi6aTE6vhZ/kcUkI7lxOdcROKcRX2A1vIUkEaOiKfDdIuAZu7ZUG
 Y/7qp0DsWt3Fd5uZK217RbSVY3FxJnhVDTaV4TGyDuapGPzYtdTzrRUDaSJr7vSAxCeC
 mAFLu/TnXv5iHMmIJRJ0jU4ZBXP1fnqTil9nTyk2D10bi+4Mf3lYHuaEdYMhrjC64L0s
 IkiMpXLdUsQkG1DUV/rZEadjB2lphm/WqgP9bXgobLG3FGUUH+IdNO3LHQdcrmWIiFtg
 jjaX2QAFSYgGuYQlOf84emmEPTLBKNuLShC7O6vAwTs47OtIJUncx+/KEO91R0lDvuSW
 pY/Q==
X-Gm-Message-State: APuU4Z9jWtPubMno6T2DvoSMsCHuTfoWNPM3IMUtjXkvvUsdIJ0xMSSB
 PpJt2/4XkyuwAHTTZ4n5nkmPT+M8rQl5+HjyXbsuydcsHpjzv1ORLVlfYWO4GTIOGoDh2Vxitze
 +4I+u
X-Gm-Gg: AYBFou3ldj/KDZJ0a19Mh4nE+ZzbXY+3JTh8dncH5NIaShmRUgoZZWUGdDhGNGUY+Eo
 9B/SH05AG8RwgO13zX36c55L353xV3FtUSMSJtl7jaErxbilQNLitPtvKuyW0p8BvEYlDf3vBYI
 WcNH0+GFzHxMx79L73G1M+hzj6YQIf2Hq9NItyK2R8qewjmb4RBlY5YOj+/gvlpvcCGNulw030b
 DTs41MU+08h4E5NGcrVjQAM6mtP0L16qknRnSl1uhofgqK1I2b9irwnPELq1F75EafE5HIhZx9j
 4pss2niiU7hu8SHoXGBYlWt/3VMd7ZPxEpLv+YgKhc0KW7++pSshukW7Xt9pKiG7zVAQyw0esV2
 WJro4xx8djaP3d68Zv74N+aNC8jnuD1M8CKihbKgvcRmHNsyeaXlC1mJpdmvWMq7YnQA0wLLGjK
 49XS/nYbj/q1HPyzi2dhN/01btDS29yTMhNxlUAECq+x8MX1NGiK8oV/FZDEjl41cOV2C79cZa8
 is1kmdMoY84MJnXJy7vS+Not2kxWaHwWO49BVWRAAb4mmV+cHXrQXUfla6KA34ABy2QZVqRZXYL
 w8qPCzsIZaJ+xwqja5qcbv6MPdAVcsCo3vF85YjhL76UMyQgJUQKm3CkFNqzsVA4sg==
X-Received: by 2002:a05:600c:3e8d:b0:4a8:cb23:f71b with SMTP id
 5b1f17b1804b1-4b6df5eaac6mr53186235e9.18.1793982835698; 
 Fri, 06 Nov 2026 08:33:55 -0800 (PST)
Received: from mindpad (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b76cb7f09asm3559825e9.2.2026.11.06.08.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:33:55 -0800 (PST)
To: buildroot@buildroot.org
Cc: Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Perale <thomas.perale@mind.be>
Date: Fri,  6 Nov 2026 17:33:53 +0100
Message-ID: <20261106163355.833305-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/luaossl: force libopenssl usage
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VHJ5aW5nIHRvIGJ1aWxkIGx1YW9zc2wgd2l0aCBMaWJyZVNTTCB3b3VsZCByZXN1bHQgaW4gYSBu
dW1iZXIgb2YKaW1wbGljaXQgZGVjbGFyYXRpb24gZXJyb3JzIFsxXS4KClRoaXMgY2FuIGJlIHJl
cHJvZHVjZWQgd2l0aCB0aGUgZm9sbG93aW5nIGRlZmNvbmZpZzoKCmBgYApCUjJfVE9PTENIQUlO
X0VYVEVSTkFMPXkKQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9CT09UTElOPXkKQlIyX1BBQ0tBR0Vf
TFVBPXkKQlIyX1BBQ0tBR0VfTFVBT1NTTD15CkJSMl9QQUNLQUdFX0xJQlJFU1NMPXkKYGBgCgpX
aGlsZSB0aGUgbHVhb3NzbCBwYWNrYWdlIG9yaWdpbmFsbHkgc3VwcG9ydGVkIGxpYnJlc3NsLCBz
aW5jZSBsaWJyZXNzbAp2ZXJzaW9uIDMuNCAoYnVpbGRyb290IGNvbW1pdCBbMl0pLCBpdCdzIG5v
IGxvbmdlciB0aGUgY2FzZSBhbmQgZmFpbHMKd2l0aCB0aGUgZm9sbG93aW5nIGVycm9yOgoKYGBg
CnNyYy9vcGVuc3NsLmM6IEluIGZ1bmN0aW9uIOKAmGNvbXBhdF9TU0xfQ1RYX3NldDFfY2VydF9z
dG9yZeKAmToKc3JjL29wZW5zc2wuYzoyMTUyOjE2OiBlcnJvcjogaW52YWxpZCB1c2Ugb2YgaW5j
b21wbGV0ZSB0eXBlZGVmIOKAmFNTTF9DVFjigJkge2FrYSDigJhzdHJ1Y3Qgc3NsX2N0eF9zdOKA
mX0KIDIxNTIgfCAgICAgICAgIGlmIChjdHgtPmNlcnRfc3RvcmUpIHsKICAgICAgfCAgICAgICAg
ICAgICAgICBefgoKLi4uCnNyYy9vcGVuc3NsLmM6MjE3NToyMDogZXJyb3I6IGludmFsaWQgdXNl
IG9mIGluY29tcGxldGUgdHlwZWRlZiDigJhTU0xfQ1RY4oCZIHtha2Eg4oCYc3RydWN0IHNzbF9j
dHhfc3TigJl9CiAyMTc1IHwgICAgICAgICAgICAgICAgIGN0eC0+Y2VydF9zdG9yZSA9IE5VTEw7
CiAgICAgIHwgICAgICAgICAgICAgICAgICAgIF5+CmBgYAoKVHJpZ2dlcmVkIGJ5IHRoZSB1cHN0
cmVhbSBwcm9qZWN0IG1ha2luZyBzb21lIHN0cnVjdHVyZSBpbnRlcm5hbCBbM10uCgpUaGlzIGVy
cm9yIGlzIHByZXNlbnQgb24gdGhlIGF1dG9idWlsZGVyIHNpbmNlIGF0IGxlYXN0IDIwMjIgWzRd
LgoKVGhpcyBjb21taXQgdGhlbiBmb3JjZSB0aGUgdXNhZ2Ugb2YgbGlib3BlbnNzbC4gVGhlICdD
b25maWcuaW4nCmNvbmRpdGlvbiBvbiAnTElCT1BFTlNTTF9FTkFCTEVfREVTJyBpcyB0aGVuIG5v
IGxvbmdlciByZXF1aXJlZC4KClsxXSBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jl
c3VsdHMvYjc3L2I3NzczNjRlYjE4NmVmZGNiY2NlMTMyZjEwOTliOGFiZTA4NzYyZDAvYnVpbGQt
ZW5kLmxvZwpbMl0gMjVlZjJjMjZkYSBwYWNrYWdlL2xpYnJlc3NsOiBidW1wIHRvIHZlcnNpb24g
My40LjEKWzNdIGh0dHBzOi8vZ2l0aHViLmNvbS9saWJyZXNzbC9vcGVuYnNkL2NvbW1pdC83YmU2
OTgxYzkwZmUzOGVlMjEzNDg5NmMxZDllZTdmMjdhNWFjNjgwCls0XSBodHRwczovL2F1dG9idWls
ZC5idWlsZHJvb3Qub3JnL2luZGV4LnBocD9yZWFzb249bHVhb3NzbCUyNSZzeW1ib2xzJTVCQlIy
X1BBQ0tBR0VfTElCUkVTU0wlNUQ9eQoKRml4ZXM6IGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9v
dC5vcmcvcmVzdWx0cy9iNzcvYjc3NzM2NGViMTg2ZWZkY2JjY2UxMzJmMTA5OWI4YWJlMDg3NjJk
MC8KU2lnbmVkLW9mZi1ieTogVGhvbWFzIFBlcmFsZSA8dGhvbWFzLnBlcmFsZUBtaW5kLmJlPgot
LS0KIHBhY2thZ2UvbHVhb3NzbC9Db25maWcuaW4gfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbHVhb3Nz
bC9Db25maWcuaW4gYi9wYWNrYWdlL2x1YW9zc2wvQ29uZmlnLmluCmluZGV4IGY4NGM1OWYyYTAu
LjkyN2MzMDE2ODggMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbHVhb3NzbC9Db25maWcuaW4KKysrIGIv
cGFja2FnZS9sdWFvc3NsL0NvbmZpZy5pbgpAQCAtMiw3ICsyLDggQEAgY29uZmlnIEJSMl9QQUNL
QUdFX0xVQU9TU0wKIAlib29sICJsdWFvc3NsIgogCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9I
QVNfVEhSRUFEUwogCXNlbGVjdCBCUjJfUEFDS0FHRV9PUEVOU1NMCi0Jc2VsZWN0IEJSMl9QQUNL
QUdFX0xJQk9QRU5TU0xfRU5BQkxFX0RFUyBpZiBCUjJfUEFDS0FHRV9MSUJPUEVOU1NMCisJc2Vs
ZWN0IEJSMl9QQUNLQUdFX09QRU5TU0xfRk9SQ0VfTElCT1BFTlNTTAorCXNlbGVjdCBCUjJfUEFD
S0FHRV9MSUJPUEVOU1NMX0VOQUJMRV9ERVMKIAloZWxwCiAJICBsdWFvc3NsIGlzIGEgY29tcHJl
aGVuc2l2ZSBiaW5kaW5nIHRvIE9wZW5TU0wgZm9yIEx1YSA1LjEsCiAJICA1LjIsIGFuZCBsYXRl
ci4KLS0gCjIuNTYuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
