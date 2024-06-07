Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA2FC27C53
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 16:32:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C58842750;
	Fri,  7 Jun 2024 16:32:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LWiYdJxsYEI1; Fri,  7 Jun 2024 16:32:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 345F042766
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 345F042766;
	Fri,  7 Jun 2024 16:32:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2E8FC1BF47A
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 16:32:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 118A54270B
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 16:32:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8OQd8F-QZwoY for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 16:32:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 64C3B4270A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64C3B4270A
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 64C3B4270A
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 16:32:35 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-42163fed884so12226185e9.1
 for <buildroot@buildroot.org>; Fri, 07 Jun 2024 09:32:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717777953; x=1718382753;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KgPciTO8HDkbK0gGfreJ0D0fWee2HpBooNBbRqR8cRQ=;
 b=Q6j0R86lR5tafFzO4KKjaXqJn/F8KolWzzW/kK/exuqK/1NtshOamBfnMciju0IBW+
 ksTJ53UST9TRekvKg66uAm1P6jafqJ0gw6euG+xhPvWB60yB6d3gZMBKu6xRrwkSJvlJ
 IFmMdrE+idG7vUk7ViAPI5fRx4G0nFboxJJDIs6HTVzA4oS1P+QVRBudfwyk4Lo6QJjB
 WD2HpD/ZsmyVkL6LyW/spc/7cg1KUn3Hh5moXUaPG4OIOhQNw2pAYQ4cMiGhCIgjxqQw
 QKtkjgvJvhdM5I+1xkxcV2Ohn9HrKwfZzH0UTcWtHuep3gTXL5AR4QpZ7lTBGHnLQYGH
 BlEA==
X-Gm-Message-State: AOJu0YwIwqz0qMfYjjtr9g21JylAYS/AMxgyd6457fwQ98UB/oinVpbX
 HW79uuZdllgp7xzKQn/tUf7jG2SDRVRblEb2jCDDuDOXmeepxgG3+aia6dOOotfoXxoENWyAz4c
 NHeI=
X-Google-Smtp-Source: AGHT+IEiF4zmOJZqlbqqNRbmV6J4KNeG8QyfYrP6AVqi4zwpYgBM4WZ2cKuRNPHFVQgl1YEWdUGVtg==
X-Received: by 2002:a05:600c:1551:b0:421:4786:eb0c with SMTP id
 5b1f17b1804b1-42164a44b35mr24892935e9.33.1717777953006; 
 Fri, 07 Jun 2024 09:32:33 -0700 (PDT)
Received: from junian.fritz.box (94.105.103.7.dyn.edpnet.net. [94.105.103.7])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4215c2cd7e7sm55804205e9.46.2024.06.07.09.32.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 09:32:32 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri,  7 Jun 2024 18:32:03 +0200
Message-Id: <20240607163208.1445715-2-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240607163208.1445715-1-raphael.melotte@mind.be>
References: <20240216211344.1807353-2-raphael.melotte@mind.be>
 <20240607163208.1445715-1-raphael.melotte@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1717777953; x=1718382753; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KgPciTO8HDkbK0gGfreJ0D0fWee2HpBooNBbRqR8cRQ=;
 b=URowmKVTUmCVYJE04rUgYGh7lwbLPBrAalnuOgfHXMbm2n08r5vCKl1SzZ7kRwHylo
 0RXlY8IeCQPFa3UK3tYEWM7wd9JsNbc1dFafha15b4842vEiMVI5yVtIr30O6i3iBL/h
 CxiFx4asCDAlv+aMVK47LgfZ8vva9ueAXvXzPcZbN/vYc9EbqMfa5oCBteZ7Tvybuhok
 jObsAYjiZuD5KBFWEFzLpne+qopR/14T3pm2UcqU075N9wHSHFRyymwVd69L4sAZ9ApT
 J8vbMwIaoNVFZQQGrcMjqvXbFgLJuvrqsdvAEIuhB6XGgtAezNhNOuciBVaj652DeU0l
 7y8w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=URowmKVT
Subject: [Buildroot] [PATCH v2 2/5] support/testing: add new test for
 python-pymupdf
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VG8gZ2l2ZSB1cyBhIGNoYW5jZSB0byBjYXRjaCBydW50aW1lIGlzc3VlcyAoc3VjaCBhcyBtaXNz
aW5nCmRlcGVuZGVuY2llcykgbW9yZSBlYXNpbHksIGFkZCBhIHRlc3QgdGhhdCB3cml0ZXMgYSBz
YW1wbGUgUERGIGZpbGUsCnJlYWQgaXQgYmFjayBhbmQgdmVyaWZ5IHRoZSB0ZXh0IHRoYXQgd2Fz
IHJlYWQuCgpMaWtlIHNpbWlsYXIgcGFja2FnZXMgdGhhdCBsZWFkIHRvIGEgYmlnCnJvb3RmcyAo
ZS5nLiBweXRob24tYm90b2NvcmUpLCB0aGlzIHRlc3QgcmVxdWlyZXMgYSBzZXBhcmF0ZSBleHQy
CnJvb3RmcyB0byBhdm9pZCBmaWxsaW5nIHRoZSBkZWZhdWx0IGFtb3VudCBvZiBSQU0gYXZhaWxh
YmxlCmVudGlyZWx5ICh3aGljaCB3b3VsZCBjYXVzZSBtaXNzaW5nIGZpbGVzIGZyb20gdGhlIHJv
b3QgZmlsZXN5c3RlbSBhbmQKaW4gdHVybiwgdGVzdCBmYWlsdXJlcykuCgpTaWduZWQtb2ZmLWJ5
OiBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+Ci0tLQogREVWRUxP
UEVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKysKIC4uLi90ZXN0
cy9wYWNrYWdlL3NhbXBsZV9weXRob25fcHltdXBkZi5weSAgICB8IDE3ICsrKysrKysrKysrKwog
Li4uL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25fcHltdXBkZi5weSAgICAgIHwgMjYgKysrKysr
KysrKysrKysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCA0NSBpbnNlcnRpb25zKCspCiBjcmVhdGUg
bW9kZSAxMDA2NDQgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl9w
eW11cGRmLnB5CiBjcmVhdGUgbW9kZSAxMDA2NDQgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2th
Z2UvdGVzdF9weXRob25fcHltdXBkZi5weQoKZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZF
TE9QRVJTCmluZGV4IDAzYWE3YmZhNzQuLmU0YzM5MjBjZTIgMTAwNjQ0Ci0tLSBhL0RFVkVMT1BF
UlMKKysrIGIvREVWRUxPUEVSUwpAQCAtMjY2Nyw5ICsyNjY3LDExIEBAIEY6CXBhY2thZ2UvcHl0
aG9uLXB5bXVwZGYvCiBGOglwYWNrYWdlL3B5dGhvbi1yc2EvCiBGOglwYWNrYWdlL3B5dGhvbi1z
M3RyYW5zZmVyLwogRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5dGhv
bl9qbWVzcGF0aC5weQorRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5
dGhvbl9weW11cGRmLnB5CiBGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVf
cHl0aG9uX3JzYS5weQogRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5
dGhvbl9zM3RyYW5zZmVyLnB5CiBGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0
X3B5dGhvbl9qbWVzcGF0aC5weQorRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVz
dF9weXRob25fcHltdXBkZi5weQogRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVz
dF9weXRob25fcnNhLnB5CiBGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5
dGhvbl9zM3RyYW5zZmVyLnB5CiAKZGlmZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9w
YWNrYWdlL3NhbXBsZV9weXRob25fcHltdXBkZi5weSBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9w
YWNrYWdlL3NhbXBsZV9weXRob25fcHltdXBkZi5weQpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRl
eCAwMDAwMDAwMDAwLi41NzRiZDI3OTY1Ci0tLSAvZGV2L251bGwKKysrIGIvc3VwcG9ydC90ZXN0
aW5nL3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl9weW11cGRmLnB5CkBAIC0wLDAgKzEsMTcg
QEAKK2ltcG9ydCBmaXR6CisKKyMgV3JpdGUgYSB0ZXN0IFBERiBmaWxlCitvdXRmaWxlID0gInB5
dGhvbi1weW11cGRmLnBkZiIKK3NhbXBsZV90ZXh0ID0gIlRoaXMgaXMgYSB0ZXN0IHBhZ2UgZm9y
IHB5dGhvbi1weW11cGRmLiIKK2RvYyA9IGZpdHoub3BlbigpCitwYWdlID0gZG9jLm5ld19wYWdl
KCkKK3AgPSBmaXR6LlBvaW50KDUwLCA3MikKK3BhZ2UuaW5zZXJ0X3RleHQocCwgc2FtcGxlX3Rl
eHQpCitkb2Muc2F2ZShvdXRmaWxlKQorCisjIFJlYWQgYmFjayB0aGUgZmlsZQord2l0aCBmaXR6
Lm9wZW4ob3V0ZmlsZSkgYXMgZDogICMgb3BlbiBkb2N1bWVudAorICAgIHJlYWRfdGV4dCA9IGNo
cigxMikuam9pbihbcGFnZS5nZXRfdGV4dCgpIGZvciBwYWdlIGluIGRdKQorCitwcmludChyZWFk
X3RleHQpCithc3NlcnQocmVhZF90ZXh0ID09IHNhbXBsZV90ZXh0ICsgIlxuIikKZGlmZiAtLWdp
dCBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX3B5bXVwZGYucHkg
Yi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5dGhvbl9weW11cGRmLnB5Cm5l
dyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjVlOWQ1YTY5MTIKLS0tIC9kZXYv
bnVsbAorKysgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5dGhvbl9weW11
cGRmLnB5CkBAIC0wLDAgKzEsMjYgQEAKK2ltcG9ydCBvcworZnJvbSB0ZXN0cy5wYWNrYWdlLnRl
c3RfcHl0aG9uIGltcG9ydCBUZXN0UHl0aG9uUGFja2FnZUJhc2UKKworCitjbGFzcyBUZXN0UHl0
aG9uUHkzUHlNdVBERihUZXN0UHl0aG9uUGFja2FnZUJhc2UpOgorICAgIF9fdGVzdF9fID0gVHJ1
ZQorICAgIGNvbmZpZyA9IFRlc3RQeXRob25QYWNrYWdlQmFzZS5jb25maWcgKyBcCisgICAgICAg
ICIiIgorICAgICAgICBCUjJfUEFDS0FHRV9QWVRIT04zPXkKKyAgICAgICAgQlIyX1BBQ0tBR0Vf
UFlUSE9OX1BZTVVQREY9eQorICAgICAgICBCUjJfUEFDS0FHRV9YT1JHNz15CisgICAgICAgIEJS
Ml9VU0VfV0NIQVI9eQorICAgICAgICBCUjJfSU5TVEFMTF9MSUJTVERDUFA9eQorICAgICAgICBC
UjJfVEFSR0VUX1JPT1RGU19FWFQyPXkKKyAgICAgICAgQlIyX1RBUkdFVF9ST09URlNfRVhUMl9T
SVpFPSIyNTBNIgorICAgICAgICAiIiIKKyAgICBzYW1wbGVfc2NyaXB0cyA9IFsidGVzdHMvcGFj
a2FnZS9zYW1wbGVfcHl0aG9uX3B5bXVwZGYucHkiXQorICAgIHRpbWVvdXQgPSAzMAorCisgICAg
ZGVmIGxvZ2luKHNlbGYpOgorICAgICAgICBleHQyX2ZpbGUgPSBvcy5wYXRoLmpvaW4oc2VsZi5i
dWlsZGRpciwgImltYWdlcyIsICJyb290ZnMuZXh0MiIpCisgICAgICAgIHNlbGYuZW11bGF0b3Iu
Ym9vdChhcmNoPSJhcm12NSIsCisgICAgICAgICAgICAgICAgICAgICAgICAgICBrZXJuZWw9ImJ1
aWx0aW4iLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgb3B0aW9ucz1bIi1kcml2ZSIsICJm
aWxlPSVzLGlmPXNjc2ksZm9ybWF0PXJhdyIgJSBleHQyX2ZpbGVdLAorICAgICAgICAgICAgICAg
ICAgICAgICAgICAga2VybmVsX2NtZGxpbmU9WyJyb290d2FpdCIsICJyb290PS9kZXYvc2RhIl0p
CisgICAgICAgIHNlbGYuZW11bGF0b3IubG9naW4oKQotLSAKMi4zNy4zCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
