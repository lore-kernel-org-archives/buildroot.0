Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D324606A331
	for <buildroot@archiver.kernel.org>; Thu, 19 Nov 2026 11:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=aHYc5y5/
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DEA160D7B;
	Thu, 19 Nov 2026 11:24:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y5Wbu_HUunM9; Thu, 19 Nov 2026 11:24:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 28A9860D78
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795087440;
	b=D+3Ph4p1ft/niKVRbpbA4iazBcdXk/YqtszHXYkslnYmaHyGenkYMQqkZ/meHk5QrA4Z
	 qvP6usUJa2e1fyap62NLlcdayzq/gziu4Trm6JNfVD+hD/FKEgpustU74u0um15xQ1zWM
	 sSvafgNAl9an5IqOCBoetMKJG+NAIPpnrDqd0y2P8t1YURVifxewLMTNNi+fCe6AcDfvA
	 Kw02LzODwr8B1MzEDoRfnoZ+PVcT1Dn5tbME06YjNLw6+Z5LnsAM7ynSH1Dj71icLibjz
	 wn44wrB2gjzMoDwmx7FkZG2M2HONqauKJZWGJlMTX+EI2C3MM5TRmit2V2HxE2ETb8w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795087440;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=oa61m4mIsLfYMuhJcQFkCM9hc+qGizu6qd3Ip1GxaYw=;
	b=ImeJRIamfOYXbGkp1XKI2jppypKabp2Z5O8dFwROB048BEwj32LYGiO6ImPiXWTrdsaY
	 H0qjgnqnYpgDY0zhKchiWLjaPJjR360qq8gb3bbY/W2lsE0velyp2nXJ8/RcOX7nbRQx9
	 u+5TNQP5DACOQZMf1m/JuY08NQLh+/Pr8zo1twfEGbHwFDqskBNODzbbEOhdPotueRZn8
	 DXWdPYfNRYqpL44q8bvJKBPaWTgmI2mgFcQscUYRVgjeJDxEDgrc5Z9P1iAZkWMGUQoOS
	 83h1tl/AVuXTaLmmUXtaJY5uoBoS0HPdOTYWy+jgg2zxKtAKNMQQC0JRZNN6Jd9vHLA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795087440;
	bh=oa61m4mIsLfYMuhJcQFkCM9hc+qGizu6qd3Ip1GxaYw=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=aHYc5y5/g3RB6xjYNmZr+yLFwAXGuGVZIm0wo8+1Ya8/mmfRWnec8qRZLzXCQaiCo
	 1DV55C7wA7sEhqI3qJWPF/VQUwShPlq5hsGwHh2QWZ1EymRIQzIhOfsPBriCvozyli
	 cygQ5+6XW6zrEXWHvjoCZ71D8an+NMgxBK4me5mUk2Bgdf9a0kphUFEu6HrfUCvzO2
	 ikdoEoD7QJEP/vHWhzMZHyVc0YSy5hCHEqEd3HBbiPKd5A5u+drrZWRXBBhkZ+vgaJ
	 P8Q8E1FwhzNHGg0FLzX/PN8ml7lCs+klmATyv4mL5loIo7/nu/q39Ubo0dOjNxfbwg
	 cDjeOVGtmgqhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28A9860D78;
	Thu, 19 Nov 2026 11:24:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8AAAC70B
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 11:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7019740A6D
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 11:23:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sEIpqm6VQHTw for <buildroot@buildroot.org>;
 Thu, 19 Nov 2026 11:23:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1BF0C40A59
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1BF0C40A59
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 11:23:55 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4bb6ba3b244so21930795e9.3
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 03:23:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795087434; x=1795692234;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=dho9KeLRbM0iGyfKX4ENmv1X0NqtP3hDl05UQ1JW6kM=;
 b=YiBAnbzT/1KqMHrO4xj91IngJNqbwzXYw4I/X24VCO51xSVqEcK7+N+szWI7Dh1YN/
 /uuap7/DeWJ0IY0h0Z3NJHJIFdX7medx46uLgEmOAQFnRTNKlfQDoYaDkktxB9IxrNTa
 eLVsbltEoQW76ruCx6geAVuz8oW8fUGvYvcGFY9v8BvpFeOLIv8si26QkwrZgGw5izHz
 Z/fY+4EluXSH34rVKXEjzwLC/pDmt6qXoJqyBx0iq4Y/7hNobqkWBF+/1+lC/b243OzX
 g12H65dd+sK0ivYXCWxMsy52a8K4hKsHjPZDWp3nW2uBxdk1LV5YcmPRO7uQzeiXCpKT
 ZXWw==
X-Gm-Message-State: APuU4Z9h+dnWAKuKqQfwpunFbGqpZM6nyBpsJzl8vhx7g2Q0rMgi7+4m
 aKaieu3WQtY5jpd+uxD6s2v13nYWTZ7dgnLMjB8+1kaIxi/tPsNo42FByhEkIELI39fmsp7S7mM
 9jQMl5Q4=
X-Gm-Gg: AYBFou1QEFaLWge/Zy3zY984+nSxdldvnQ+xOI4VVD39QOWv8jkiT9X/8Z4yueAuoyQ
 prTTHdTSO+2c3bBEIKzdemkNp3GZeqRtd8OT8+tzog4IEk+S4Lq5UiXmgDryfK571+AopYnBOMR
 7TQJ8OAGU6cDgp49wh0ZEd7E35HIbJdJWJr1EVGcAqG9+HRQWae0x3nqXVAQAFQ/mfqFWTYlOOQ
 PuVxpJWfjLugPBKATK5Hg80UQQDUrRDijV0zpa0mEPxI/ixRx5uUQ25AQfK9G6M0BcnmFElezw1
 tsrsFIPmEfxA7l+9nP6/CJ7OmGMba8bBCrAlOBOaJkj9L/YiNj+Jdw6ojiqGp/9A7/ZVGoTB6BR
 KiENxwmpswnXTW0wh5shqDR3BdRBLVrIrzq7sX/XXESzedN9/nJTDL4h2ut6D/3BVQIzjm5laCI
 OWZGXCL50WsqxCv8YBnRwQUmMhzTSZAf6sWEWZUrfPvRrTx8N902PxLe8PWPfxuJdRYuaYmnDIk
 fVPeO9GD4kyipdsFKo+YaYYflMZAmPIgKFdSxOhcp/UedqPo7mUtTzOgI8RWtCK9q+ZX4r1bClY
 BFcr8XhBJACf+luf89cw9CvLtELyjus=
X-Received: by 2002:a05:600c:1d05:b0:4bb:73d5:ab33 with SMTP id
 5b1f17b1804b1-4bb7da27094mr118927375e9.22.1795087434266; 
 Thu, 19 Nov 2026 03:23:54 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb8538b2c5sm29132815e9.5.2026.11.19.03.23.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2026 03:23:53 -0800 (PST)
To: buildroot@buildroot.org
Cc: thomas.perale@mind.be, titouan.christophe@mind.be,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Bernd Kuhls <bernd@kuhls.net>, Maxim Kochetkov <fido_max@inbox.ru>
Date: Thu, 19 Nov 2026 12:23:27 +0100
Message-ID: <20261119112329.234753-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2025.02.x] package/postgresql: security bump to
 version 17.12
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

aHR0cHM6Ly93d3cucG9zdGdyZXNxbC5vcmcvZG9jcy9yZWxlYXNlLzE3LjEyLwoKRml4ZXMgdGhl
IGZvbGxvd2luZyBDVkVzOgoKQ1ZFLTIwMjYtNjQ2MApDVkUtMjAyNi02NDY3CkNWRS0yMDI2LTE0
NjYxCkNWRS0yMDI2LTE2MjM3CkNWRS0yMDI2LTE2MjQwCkNWRS0yMDI2LTE4NDQ3CkNWRS0yMDI2
LTExNjMwMwpDVkUtMjAyNi0xMTYzMDQKQ1ZFLTIwMjYtMTE2MzA2CkNWRS0yMDI2LTExNjMwNwpD
VkUtMjAyNi0xMTYzMDgKQ1ZFLTIwMjYtMTE2MzA5CkNWRS0yMDI2LTExNjMxMApDVkUtMjAyNi0x
MTYzMTEKQ1ZFLTIwMjYtMTE2MzEyCkNWRS0yMDI2LTExNjMxNApDVkUtMjAyNi0xMTYzMTUKQ1ZF
LTIwMjYtMTE2MzE2CkNWRS0yMDI2LTExNjMxNwpDVkUtMjAyNi0xMTYzMTkKQ1ZFLTIwMjYtMTE2
MzIwCkNWRS0yMDI2LTExNjMyMQpDVkUtMjAyNi0xMTYzMjMKQ1ZFLTIwMjYtMTE2MzI1CkNWRS0y
MDI2LTExNjMyNgpDVkUtMjAyNi0xMTYzMjcKQ1ZFLTIwMjYtMTE2MzI4CkNWRS0yMDI2LTExNjMz
MApDVkUtMjAyNi0xMTYzMzEKQ1ZFLTIwMjYtMTE2MzMyCkNWRS0yMDI2LTExNjMzMwpDVkUtMjAy
Ni0xMTYzMzUKQ1ZFLTIwMjYtMTE2MzM2CkNWRS0yMDI2LTEyMDEzOQpDVkUtMjAyNi0xMjAxNDEK
Q1ZFLTIwMjYtMTIwMTQyCkNWRS0yMDI2LTEyMDE0MwpDVkUtMjAyNi0xMjAxNDUKQ1ZFLTIwMjYt
MTIwMTQ2CkNWRS0yMDI2LTEyMDE0NwpDVkUtMjAyNi0xMjAxNDgKQ1ZFLTIwMjYtMTIwMTQ5CkNW
RS0yMDI2LTEyMDE1MApDVkUtMjAyNi0xMjAxNTEKQ1ZFLTIwMjYtMTIwMTUyCkNWRS0yMDI2LTEy
MDE1MwpDVkUtMjAyNi0xMjAxNTQKCihhbHRlcm5hdGl2ZSB0byBjb21taXQgNzU2NjI3MWE4MTI3
YTk4YjJhZjcyNTU4NjcxNTkyMTE0YjUwNGRiYykKU2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOp
bG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJlPgotLS0KIHBhY2thZ2UvcG9zdGdyZXNxbC9w
b3N0Z3Jlc3FsLmhhc2ggfCA0ICsrLS0KIHBhY2thZ2UvcG9zdGdyZXNxbC9wb3N0Z3Jlc3FsLm1r
ICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3Bvc3RncmVzcWwvcG9zdGdyZXNxbC5oYXNoIGIvcGFj
a2FnZS9wb3N0Z3Jlc3FsL3Bvc3RncmVzcWwuaGFzaAppbmRleCBjYTBkMzUwNzA4Li45ODRmOWI5
YTg2IDEwMDY0NAotLS0gYS9wYWNrYWdlL3Bvc3RncmVzcWwvcG9zdGdyZXNxbC5oYXNoCisrKyBi
L3BhY2thZ2UvcG9zdGdyZXNxbC9wb3N0Z3Jlc3FsLmhhc2gKQEAgLTEsNCArMSw0IEBACi0jIEZy
b20gaHR0cHM6Ly9mdHAucG9zdGdyZXNxbC5vcmcvcHViL3NvdXJjZS92MTcuMTEvcG9zdGdyZXNx
bC0xNy4xMS50YXIuYnoyLnNoYTI1Ngotc2hhMjU2ICBkZDI3ZjJiM2M1OWU3M2VkMTRhYTMzMjQ5
MDEyNDJiZjY5YTAzMmE2MzQ3ODA1ZjI3NGU2MjYwMzIyZDQyOTc5ICBwb3N0Z3Jlc3FsLTE3LjEx
LnRhci5iejIKKyMgRnJvbSBodHRwczovL2Z0cC5wb3N0Z3Jlc3FsLm9yZy9wdWIvc291cmNlL3Yx
Ny4xMi9wb3N0Z3Jlc3FsLTE3LjEyLnRhci5iejIuc2hhMjU2CitzaGEyNTYgIDljZjEzNmE3MDNk
OGVlMmY4MzQ2NWM0M2JlNGU5ZThlNzkzMGM4MmIwYmZiYTEzYmU3ZTI1MzdiZTc2OWFjNTUgIHBv
c3RncmVzcWwtMTcuMTIudGFyLmJ6MgogIyBMaWNlbnNlIGZpbGUsIExvY2FsbHkgY2FsY3VsYXRl
ZAogc2hhMjU2ICAzZDZhZjkyZmY4YTRjMmNkZjY5YWZiMWNmNDRlZGVhNzI3OTIyZjVjZDBjZjhi
NWY3MmIxMWNkZWNhYzhmZGZkICBDT1BZUklHSFQKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcG9zdGdy
ZXNxbC9wb3N0Z3Jlc3FsLm1rIGIvcGFja2FnZS9wb3N0Z3Jlc3FsL3Bvc3RncmVzcWwubWsKaW5k
ZXggZDdmYWQ3YzVhMS4uMGQwYjI4N2ViZiAxMDA2NDQKLS0tIGEvcGFja2FnZS9wb3N0Z3Jlc3Fs
L3Bvc3RncmVzcWwubWsKKysrIGIvcGFja2FnZS9wb3N0Z3Jlc3FsL3Bvc3RncmVzcWwubWsKQEAg
LTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1QT1NUR1JFU1FMX1ZF
UlNJT04gPSAxNy4xMQorUE9TVEdSRVNRTF9WRVJTSU9OID0gMTcuMTIKIFBPU1RHUkVTUUxfU09V
UkNFID0gcG9zdGdyZXNxbC0kKFBPU1RHUkVTUUxfVkVSU0lPTikudGFyLmJ6MgogUE9TVEdSRVNR
TF9TSVRFID0gaHR0cHM6Ly9mdHAucG9zdGdyZXNxbC5vcmcvcHViL3NvdXJjZS92JChQT1NUR1JF
U1FMX1ZFUlNJT04pCiBQT1NUR1JFU1FMX0xJQ0VOU0UgPSBQb3N0Z3JlU1FMCi0tIAoyLjU0LjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
