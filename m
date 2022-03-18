Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B22BC433EF
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 17:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EACA260A79;
	Fri, 18 Mar 2022 17:34:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xgrJCBZg8Kfn; Fri, 18 Mar 2022 17:34:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B31760A7B;
	Fri, 18 Mar 2022 17:34:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4822E1BF34E
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 17:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 35F5F401D5
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 17:34:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new); dkim=neutral
 reason="invalid (public key: not available)" header.d=embedded.rocks
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6mfjMchVQODp for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 17:34:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.142])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 35A0340117
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 17:34:33 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout02.posteo.de (Postfix) with ESMTPS id 959C9240101
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 18:34:30 +0100 (CET)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4KKrjf0wslz6tmG
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 18:34:29 +0100 (CET)
Authentication-Results: mail.embedded.rocks (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=embedded.rocks
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=embedded.rocks;
 h=content-transfer-encoding:content-type:content-type
 :mime-version:x-mailer:message-id:date:date:subject:subject:from
 :from:received:received; s=default; t=1647624869; x=1648229670;
 bh=STXze88hqfUV9wgavRsmc1svZd8d0EVm67ED3bHYAkA=; b=cz5c4QiUpfmZ
 vvJnoT2Wd7lFW/OZtu4ojGchJDiwmzJkO4v+oDCBnLQopWTobjUPHZZeBS7xkTDz
 d3pNKXZ+ljeqVLEzev8HpVP3H68ZUTz7T8wuRuhHOWiGLhHmiqNS5uLFlWyUwsUK
 tmKeLngSt5L/JGUxpxXXU/F3ZSZMhV5s05YgYZ6ydJazvpYs02SGR6FFD/hNx5s1
 FT1fp9Bao+xBVUJk5ZdR3EpjEOt5KyTrQQXQQoEQxWt9vBXeJNeHivXQvqQfOBzf
 eB0bNToQeYIj7BRjFaUGe9xh91Fhj+YM415pvF7CfYvy6Fb7k0iB6Chcp21RbZfS
 w+rHJmIkgA==
Received: from mail.embedded.rocks ([127.0.0.1])
 by localhost (mail.embedded.rocks [127.0.0.1]) (amavisd-new, port 10025)
 with ESMTP id b1qS9m5Nn1xs; Fri, 18 Mar 2022 18:34:29 +0100 (CET)
Received: from nzxt.fritz.box (port-92-193-142-156.dynamic.as20676.net
 [92.193.142.156]) (Authenticated sender: joerg.krause@embedded.rocks)
 by mail.embedded.rocks (Postfix) with ESMTPSA;
 Fri, 18 Mar 2022 18:34:29 +0100 (CET)
From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
To: buildroot@buildroot.org
Date: Fri, 18 Mar 2022 17:34:27 +0000
Message-Id: <20220318173427.68776-1-joerg.krause@embedded.rocks>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/luvi: bump to version 2.13.0
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
Cc: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogSsO2cmcgS3JhdXNlIDxqb2VyZy5rcmF1c2VAZW1iZWRkZWQucm9ja3M+
Ci0tLQogcGFja2FnZS9sdXZpL2x1dmkuaGFzaCB8IDIgKy0KIHBhY2thZ2UvbHV2aS9sdXZpLm1r
ICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2x1dmkvbHV2aS5oYXNoIGIvcGFja2FnZS9sdXZpL2x1
dmkuaGFzaAppbmRleCBmY2M4MTQzMGRiLi45NjIxZWY0ZDAzIDEwMDY0NAotLS0gYS9wYWNrYWdl
L2x1dmkvbHV2aS5oYXNoCisrKyBiL3BhY2thZ2UvbHV2aS9sdXZpLmhhc2gKQEAgLTEsMyArMSwz
IEBACiAjIExvY2FsbHkgY2FsY3VsYXRlZAotc2hhMjU2ICA0MTQ5Yzg3NjQ2ZjQ4N2Y5MDc2YzI5
ZTk4NjFmNjQ0Njg2MzdiMWQxMzYxYjc3N2IwOTNlNjIwNGE4M2UxZWQ5ICBsdXZpLXNyYy12Mi4x
Mi4wLnRhci5negorc2hhMjU2ICBkYTI1Yzc0YTMwYTNmZTJmYzc1ZTk3OTdhNmZhMDcxN2ViYjA1
Y2ViN2U2Y2NiNjEzMDFmODBjN2RkNDM2YjczICBsdXZpLXNyYy12Mi4xMy4wLnRhci5negogc2hh
MjU2ICBjZmM3NzQ5Yjk2ZjYzYmQzMWMzYzQyYjVjNDcxYmY3NTY4MTQwNTNlODQ3YzEwZjNlYjAw
MzQxN2JjNTIzZDMwICBMSUNFTlNFLnR4dApkaWZmIC0tZ2l0IGEvcGFja2FnZS9sdXZpL2x1dmku
bWsgYi9wYWNrYWdlL2x1dmkvbHV2aS5tawppbmRleCA1ZGFhM2MxNzkzLi41MjY2MjgxZmZjIDEw
MDY0NAotLS0gYS9wYWNrYWdlL2x1dmkvbHV2aS5taworKysgYi9wYWNrYWdlL2x1dmkvbHV2aS5t
awpAQCAtNCw3ICs0LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLUxVVklfVkVS
U0lPTiA9IDIuMTIuMAorTFVWSV9WRVJTSU9OID0gMi4xMy4wCiBMVVZJX1NPVVJDRSA9IGx1dmkt
c3JjLXYkKExVVklfVkVSU0lPTikudGFyLmd6CiBMVVZJX1NJVEUgPSBodHRwczovL2dpdGh1Yi5j
b20vbHV2aXQvbHV2aS9yZWxlYXNlcy9kb3dubG9hZC92JChMVVZJX1ZFUlNJT04pCiBMVVZJX0xJ
Q0VOU0UgPSBBcGFjaGUtMi4wCi0tIAoyLjM1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
