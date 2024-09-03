Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A53E1CD37AA
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 20:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EFBB60680;
	Tue,  3 Sep 2024 20:22:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZO2UGkZvzwC0; Tue,  3 Sep 2024 20:22:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26E196072A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26E196072A;
	Tue,  3 Sep 2024 20:22:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5FFB11BF57B
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 549366072A
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:22:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3mEyFii71f_9 for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 20:22:01 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com;
 envelope-from=flavio.tapajos@newtesc.com.br; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B106760680
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B106760680
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B106760680
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 20:22:00 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-714302e7285so5224441b3a.2
 for <buildroot@buildroot.org>; Tue, 03 Sep 2024 13:22:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725394919; x=1725999719;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ejNMc9V8Jw830V2gt4RS7UwfdaMh2D+6MhwqURPvhvU=;
 b=Dki5jogQVXmQVVE/0XecC6aagbvMnaKV23HWqigApchBTcWUV8oqNjy0rF32qR5G9Q
 tEbmekdCKAwliDojK2H7LMJM0927KYS1xgarxTZpm2unDKHyNmZlDkyI9LMN5EKPwFEg
 3Ly+ri4RVu8IwvNn+qUOHG+RU6RdCGTBnilQdvhvsMejOv+uaFogr/qTKOJKc4UDbwmI
 I15yrki+iaNiGmdFn4xPZiS6cpE7WpjagbEDyCwcLbk3eoTnBgybMGPYwEF6aV6CB9mL
 11snaALk9YzVCCiQ+sQUUAj/6LSNeNgpQsnV//Qic9itHsOCLjPfBKBweMbkJ2kVRXWZ
 Rz6w==
X-Gm-Message-State: AOJu0YxaV3VVw77tWw0CdCO9NFxs/okfNcFy6VrOj8gzl8e5r2yB24k/
 oPAk6/zzSHoGWNflCBjp74vcazLbgxDFnTMHPvA4x+w+6fhc5lclJB9WBU1ajNZM/gfgIkAoSFv
 odfo=
X-Google-Smtp-Source: AGHT+IELbjLArTdyxsOQnv0b3WFlIVtsee6WxCQxGijUz927ZqTHdddiH00S8NE9eJkZ/1YOltu8eQ==
X-Received: by 2002:a05:6a20:9f95:b0:1cc:e6b6:802 with SMTP id
 adf61e73a8af0-1cce6b60e30mr20817927637.35.1725394919305; 
 Tue, 03 Sep 2024 13:21:59 -0700 (PDT)
Received: from niltesque.newtesc.com.br ([189.113.44.122])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71778521040sm290380b3a.11.2024.09.03.13.21.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 13:21:58 -0700 (PDT)
From: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
To: buildroot@buildroot.org
Date: Tue,  3 Sep 2024 17:21:53 -0300
Message-ID: <20240903202153.346589-1-flavio.tapajos@newtesc.com.br>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1725394919; x=1725999719;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ejNMc9V8Jw830V2gt4RS7UwfdaMh2D+6MhwqURPvhvU=;
 b=cJDc2F/wf06wQ8KL1RxtIxhxPb3sxJTQV/nZsLs9p2+/loNVSKLNQrjFwoTbRUPms9
 w7ec4B5AI/3Z0uQxs59PPyo9wWceOnEZrFP8jVD20UbsellS/kFiPd8mM7fCyNxU5gWr
 6Be2csAr7Zh7t9Dm4rwHoP58n2lNv/1QK1hlD/4CPfMvkUNQ4D6Mno61WQK0FTkmXnNO
 oRw9wOkcBZS2NXX91GbJ2elLEusJEaBDp7wlKNsfYDyMFYGwqklcw1qAQzDiouoDuwNn
 i3Plq6QVUHlYpbzxXQrsEk5+3lHRdgj2oYd+LhRLqbdHAD+AB0QNe71fyqKnvhrlIYjE
 bOXQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=newtesc.com.br
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=cJDc2F/w
Subject: [Buildroot] [PATCH 1/1] package/python-sqlalchemy: bump version to
 2.0.33
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
Cc: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogRmzDoXZpbyBUYXBhasOzcyA8ZmxhdmlvLnRhcGFqb3NAbmV3dGVzYy5j
b20uYnI+Ci0tLQogcGFja2FnZS9weXRob24tc3FsYWxjaGVteS9weXRob24tc3FsYWxjaGVteS5o
YXNoIHwgNCArKy0tCiBwYWNrYWdlL3B5dGhvbi1zcWxhbGNoZW15L3B5dGhvbi1zcWxhbGNoZW15
Lm1rICAgfCA2ICsrKy0tLQogMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tc3FsYWxjaGVteS9weXRob24t
c3FsYWxjaGVteS5oYXNoIGIvcGFja2FnZS9weXRob24tc3FsYWxjaGVteS9weXRob24tc3FsYWxj
aGVteS5oYXNoCmluZGV4IGQ5MjI3ZjA1MjguLjdmZmRmYWYxYjUgMTAwNjQ0Ci0tLSBhL3BhY2th
Z2UvcHl0aG9uLXNxbGFsY2hlbXkvcHl0aG9uLXNxbGFsY2hlbXkuaGFzaAorKysgYi9wYWNrYWdl
L3B5dGhvbi1zcWxhbGNoZW15L3B5dGhvbi1zcWxhbGNoZW15Lmhhc2gKQEAgLTEsNSArMSw1IEBA
CiAjIG1kNSwgc2hhMjU2IGZyb20gaHR0cHM6Ly9weXBpLm9yZy9weXBpL3NxbGFsY2hlbXkvanNv
bgotbWQ1ICBmZDllZDM4MTQ0ZmNlNDc5ZWE5NmI2NjFlMDQ4YTAyZiAgU1FMQWxjaGVteS0yLjAu
MzIudGFyLmd6Ci1zaGEyNTYgIGMxYjg4Y2M4YjAyYjZhNWYwZWZiMDM0NWEwMzY3MmQ0Yzg5N2Rj
N2Q5MjU4NTE3NmY4OGM2NzM0NmY1NjVlYTggIFNRTEFsY2hlbXktMi4wLjMyLnRhci5negorbWQ1
ICAyZDdjMGRiYjRiMjFhMWNiMDU0NmQ1MjBlNzc5NTAyMiAgc3FsYWxjaGVteS0yLjAuMzMudGFy
Lmd6CitzaGEyNTYgIDkxYzkzMzMzYzJiMzdmZjcyMWRjODNiMzdlMjhjMjlkZTRjNTAyYjU2MTJm
MmQwOTM0NjgwMzdiODZhYTJiZTAgIHNxbGFsY2hlbXktMi4wLjMzLnRhci5negogIyBMb2NhbGx5
IGNvbXB1dGVkIHNoYTI1NiBjaGVja3N1bXMKIHNoYTI1NiAgM2MwZjU5YWI4ODdkMDQxZGU2YTRl
NTJmZmUzZTllZGI1ZDk1MjJkZTkwOWZhZTlhNmNkN2FkYjZlN2JlMzI5MyAgTElDRU5TRQpkaWZm
IC0tZ2l0IGEvcGFja2FnZS9weXRob24tc3FsYWxjaGVteS9weXRob24tc3FsYWxjaGVteS5tayBi
L3BhY2thZ2UvcHl0aG9uLXNxbGFsY2hlbXkvcHl0aG9uLXNxbGFsY2hlbXkubWsKaW5kZXggM2Y0
ZTIwZTY2OS4uODQyMDFjZjgzMyAxMDA2NDQKLS0tIGEvcGFja2FnZS9weXRob24tc3FsYWxjaGVt
eS9weXRob24tc3FsYWxjaGVteS5taworKysgYi9wYWNrYWdlL3B5dGhvbi1zcWxhbGNoZW15L3B5
dGhvbi1zcWxhbGNoZW15Lm1rCkBAIC00LDkgKzQsOSBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMKIAotUFlUSE9OX1NRTEFMQ0hFTVlfVkVSU0lPTiA9IDIuMC4zMgotUFlUSE9OX1NRTEFM
Q0hFTVlfU09VUkNFID0gU1FMQWxjaGVteS0kKFBZVEhPTl9TUUxBTENIRU1ZX1ZFUlNJT04pLnRh
ci5negotUFlUSE9OX1NRTEFMQ0hFTVlfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVk
Lm9yZy9wYWNrYWdlcy9hZi82Zi85NjdlOTg3NjgzOTA4YWY4MTZhYTMwNzJjMWE2OTk3YWM5OTMz
Y2YzOGQ2NmIwNDc0ZmIwM2YyNTMzMjMKK1BZVEhPTl9TUUxBTENIRU1ZX1ZFUlNJT04gPSAyLjAu
MzMKK1BZVEhPTl9TUUxBTENIRU1ZX1NPVVJDRSA9IHNxbGFsY2hlbXktJChQWVRIT05fU1FMQUxD
SEVNWV9WRVJTSU9OKS50YXIuZ3oKK1BZVEhPTl9TUUxBTENIRU1ZX1NJVEUgPSBodHRwczovL2Zp
bGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvZDUvNzAvNmRjNDM3YWZmMjBlNDU0ZThhYzM1
Y2RjYzc0NjIwZmFkNTU5ODViNWVhMjgzMGZhMmQ3M2IwMmQ1ODA1CiBQWVRIT05fU1FMQUxDSEVN
WV9TRVRVUF9UWVBFID0gc2V0dXB0b29scwogUFlUSE9OX1NRTEFMQ0hFTVlfTElDRU5TRSA9IE1J
VAogUFlUSE9OX1NRTEFMQ0hFTVlfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKLS0gCjIuNDYuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
