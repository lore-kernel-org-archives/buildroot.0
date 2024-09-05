Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED31ECD4F59
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 06:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B0E36066C;
	Thu,  5 Sep 2024 06:44:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Ur0CWhqrNhn; Thu,  5 Sep 2024 06:44:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEA3C606BD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEA3C606BD;
	Thu,  5 Sep 2024 06:44:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 421771BF47A
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 06:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C898606BD
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 06:44:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6WoMAJEmonsh for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 06:44:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=salvador.joseluis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CDB3D6066C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDB3D6066C
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CDB3D6066C
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 06:44:50 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-428e1915e18so2445745e9.1
 for <buildroot@buildroot.org>; Wed, 04 Sep 2024 23:44:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725518689; x=1726123489;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dIR/oCe7OIhD/of3+Nt7Fs4dyZlD/A44berlJnJpVgI=;
 b=TqTULT9WF2Nolq3oIGLm/X3tV1m3X0SX9RYqBLDHM4zOXW2/idKiu6DGosoiQBG8uz
 eopXukwtgnuGY9fqsm0AfKNt6qfLHF5q9SfTh2wGkQsAKyvxVYSG403cudtLu0p2vXHd
 ROVuXZpQw4+sAvOSRZtiaEzo498gcbbCsXSppBcI5liiZ7vVmeH6secf9jAt3PZgbs4x
 UMPK1Ois/t8s6vA8javs5O3p2rR3X4mJZABpbz4lbDDovBIwWeflAp4KKzVMBA/dH8fi
 YNZYvzyB7r5fG27ToF66TtAa6acsh6lLMKatJtCXIzyZa36oJKkJw2PZggObSEfKTNmZ
 pJxw==
X-Gm-Message-State: AOJu0YxLOvWRk+/AOun7cMWbHbFTMwq0eAYS917m8Qr9j7KdARTLE05d
 vkwau1brLiTVOJyhzfRnSWjQwqBM1/o0R0eaEl9K+QwGcTpfVCLhvayg7w==
X-Google-Smtp-Source: AGHT+IH0wGJgFSE41ROt4icBg/qjjNjpVlKZtp2mwHZJ9/JwvUKwPvx+eoEdzWBux1uPHjFZDmnNZQ==
X-Received: by 2002:a05:600c:920:b0:426:689b:65b7 with SMTP id
 5b1f17b1804b1-42c7b5d8f8amr105411805e9.25.1725518688387; 
 Wed, 04 Sep 2024 23:44:48 -0700 (PDT)
Received: from cuervo.intranet.jlsalvador.online ([207.188.145.203])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42c9c3944cesm6982225e9.30.2024.09.04.23.44.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 23:44:47 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  5 Sep 2024 08:43:53 +0200
Message-ID: <20240905064352.893394-2-salvador.joseluis@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725518689; x=1726123489; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dIR/oCe7OIhD/of3+Nt7Fs4dyZlD/A44berlJnJpVgI=;
 b=iyCpJaBvfxz09owQdDpxpEzyR/R3+/lIvqTVZXOmg1EjS9vhDXCF05WkYss52rEndG
 zO+CrwjT4xWUQ+73QIOSe9oGP/c1OqvZmhMuzUMp3zYtFLMArdb0WnvTGJYA3Qp0AXMW
 Tq66kGojhSBWMbTbDNYUxBkFiUlyACg16jMDit1tmU/NLyQHFBonQIrDiNHf0RFq3nJk
 MFejDfQRaIvEA61JI9sjc/siD6w8TLt1f0HRcDGQ3x8AHVg6TQeU3f+yOFof4Nd+QO7G
 WnvlDFiHKDVNrI+hR4k/hDUFZxkhgHCWbrfHA9Rl6hnRJgQmW7Ze6ggY9zZQQ3KSNsqf
 +Ppw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=iyCpJaBv
Subject: [Buildroot] [PATCH 1/1] package/zfs: bump version to 2.2.6
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
Cc: Alexander Mukhin <alexander.i.mukhin@gmail.com>,
 =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogSm9zw6kgTHVpcyBTYWx2YWRvciBSdWZvIDxzYWx2YWRvci5qb3NlbHVp
c0BnbWFpbC5jb20+Ci0tLQogcGFja2FnZS96ZnMvemZzLmhhc2ggfCAyICstCiBwYWNrYWdlL3pm
cy96ZnMubWsgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvemZzL3pmcy5oYXNoIGIvcGFja2FnZS96
ZnMvemZzLmhhc2gKaW5kZXggOTU5OGFlZDk5Mi4uNTBlNTM5MTBmYSAxMDA2NDQKLS0tIGEvcGFj
a2FnZS96ZnMvemZzLmhhc2gKKysrIGIvcGFja2FnZS96ZnMvemZzLmhhc2gKQEAgLTEsNSArMSw1
IEBACiAjIEZyb20gaHR0cHM6Ly9naXRodWIuY29tL29wZW56ZnMvemZzL3JlbGVhc2VzL2Rvd25s
b2FkL3pmcy0yLjIuNC96ZnMtMi4yLjQuc2hhMjU2LmFzYwotc2hhMjU2ICAyMzg4Y2Y2ZjI5Y2Q3
NWU4N2Q2ZDA1ZTQ4NThhMDlkNDE5YzRmODgzYTY1OGQ1MWVmNTc3OTYxMjFjZDA4ODk3ICB6ZnMt
Mi4yLjUudGFyLmd6CitzaGEyNTYgIGM5MmUwMjEwM2FjNWRkNzdiZjAxZDcyMDllYWJkY2E1NWM3
YjMzNTZhYTc0N2JiMjM1N2VjNDIyMjY1MmEyYTcgIHpmcy0yLjIuNi50YXIuZ3oKIAogIyBIYXNo
IGZvciBsaWNlbnNlIGZpbGVzOgogc2hhMjU2ICAxZmZiNzBjMzNjNGY3OWYwNGU5NDdmYWNjNWM3
ODUxZjI4OTYwOTI1NmFhY2I0N2ZjMTE1ZjcwMDQyN2Q5NTIwICBMSUNFTlNFCmRpZmYgLS1naXQg
YS9wYWNrYWdlL3pmcy96ZnMubWsgYi9wYWNrYWdlL3pmcy96ZnMubWsKaW5kZXggNTQ5Zjg2NDFi
OS4uOWNlY2Q0OTllZCAxMDA2NDQKLS0tIGEvcGFja2FnZS96ZnMvemZzLm1rCisrKyBiL3BhY2th
Z2UvemZzL3pmcy5tawpAQCAtNCw3ICs0LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
CiAKLVpGU19WRVJTSU9OID0gMi4yLjUKK1pGU19WRVJTSU9OID0gMi4yLjYKIFpGU19TSVRFID0g
aHR0cHM6Ly9naXRodWIuY29tL29wZW56ZnMvemZzL3JlbGVhc2VzL2Rvd25sb2FkL3pmcy0kKFpG
U19WRVJTSU9OKQogWkZTX1NFTElOVVhfTU9EVUxFUyA9IHpmcwogWkZTX0xJQ0VOU0UgPSBDRERM
Ci0tIAoyLjQ2LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
