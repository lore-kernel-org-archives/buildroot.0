Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41AADC5475B
	for <buildroot@archiver.kernel.org>; Wed,  6 Mar 2024 19:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA1D4418DC;
	Wed,  6 Mar 2024 19:26:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CVc_HMXfRNEQ; Wed,  6 Mar 2024 19:26:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E92334191B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E92334191B;
	Wed,  6 Mar 2024 19:26:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7E6BF1BF3DD
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 19:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A2FA405D2
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 19:26:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id booPlJQUErhd for <buildroot@lists.busybox.net>;
 Wed,  6 Mar 2024 19:26:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7C638403C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C638403C7
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7C638403C7
 for <buildroot@buildroot.org>; Wed,  6 Mar 2024 19:26:13 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-33d18931a94so4323582f8f.1
 for <buildroot@buildroot.org>; Wed, 06 Mar 2024 11:26:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709753170; x=1710357970;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X+4jN4JuZzosY9K0XV5mOz+J9rLNJrskTXmjKD+bMcw=;
 b=ZheiMKE5cJkTUTSwTszT8bjSmMPUwNyRGZ4eEsMoL8VmTvbcxATXnRjib6hn31n2IO
 wIR3AvdhbbH3fmoxMsfEz81VkhH+MVYpRHgG/cpkAyslgd6It6nxRgNRo/i6SHp8ZGg5
 dQ152oDI0M26SODew8xQv4JVPaH59iMGKiN/HvB08zWPqjd60vfgmOAykRYNlBma0PnN
 KAZu1HZYathYmUVAERZnJ5ILubXiAMdlyD1Sfcxx3/RvpPdIh1fU6verap5vWQa9RZgP
 +c0flKN82D77S08bUXFAfV0+do5A40aSrozdSQnmKp1sHiVBz1B/piiEclRnGVUARxI+
 SStw==
X-Gm-Message-State: AOJu0YwSqv2cRsCHgyPuEOmBB7voowpTeQDhDcQv8Ns384Bu8G8le4QB
 hllHdwqgtuVUDXmuf16SJzM7gTpMUDS37tOM0jWUqxSGnx32i5HrQjl4tfOb
X-Google-Smtp-Source: AGHT+IF7RL1TOITqkwD7+hyL6SBLdig8T7AkQ7VjBKO9zrb2FXX3cuMiz0Kyooo7hqQD0GHSgupH7w==
X-Received: by 2002:adf:e6cf:0:b0:33e:151a:39e1 with SMTP id
 y15-20020adfe6cf000000b0033e151a39e1mr11486730wrm.33.1709753170288; 
 Wed, 06 Mar 2024 11:26:10 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 bt17-20020a056000081100b0033e3cb02cefsm9316350wrb.86.2024.03.06.11.26.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 11:26:09 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 Mar 2024 20:26:04 +0100
Message-ID: <20240306192604.381763-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709753170; x=1710357970; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=X+4jN4JuZzosY9K0XV5mOz+J9rLNJrskTXmjKD+bMcw=;
 b=kVN5YfdMfgNwAvoJn/2Mq7AvtCHt+ac+vj1EwsfQIGZuFB+HsO0JmGI3qlf6JFmqV5
 1DX/7lwN9vSmQTuVm6ucVmA/FncLGan8X4i8a68bFq5l/5sf9xkTXYM5ZAuBW6ywlJ53
 HbD9v7LNzaobZn0SBZ7FmbbzdqnijealwOrpgwj3cpnyGq5HS/rejzVEUtv3dQZmRqfs
 UbqnoOhXtFRr+FvZufi2SBlxVpCNtTrO4nTHc0aA8yztymBRrZX4bb/KLvcVbL23+kQt
 YASloZ1TSs1fongMUfmbAFUarC0G3l1lCqh3e0fU6A1MY4np0geei/5Bj1W6lnbo1oWn
 9pRw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kVN5YfdM
Subject: [Buildroot] [PATCH v2,1/1] linux: disable -Werror
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RGlzYWJsZSAtV2Vycm9yIHRvIGZpeCB0aGUgZm9sbG93aW5nIGJ1aWxkIGZhaWx1cmUgd2l0aCBl
c3AtaG9zdGVkCnJhaXNlZCBhdCBsZWFzdCBzaW5jZSBjb21taXQgYTM4MmE3ZDU1NDMyOTE4ZDJh
MWU0N2FlNGNiZTdlZDUwZmExN2EwODoKCkluIGZ1bmN0aW9uIOKAmGRlc3Ryb3lfY21kX3dx4oCZ
LAogICAgaW5saW5lZCBmcm9tIOKAmGVzcF9jb21tYW5kc190ZWFyZG93buKAmSBhdCAvaG9tZS9h
dXRvYnVpbGQvYXV0b2J1aWxkL2luc3RhbmNlLTQvb3V0cHV0LTEvYnVpbGQvZXNwLWhvc3RlZC1j
ZTNjNTBhMzNmYTRiYzU2MmExYjZjYmNlZTI5MmMxYWUwYjBhNDA0L2VzcF9ob3N0ZWRfbmcvaG9z
dC9lc3BfY21kLmM6MTQ2NzoyOgouL2luY2x1ZGUvbGludXgvd29ya3F1ZXVlLmg6NjM5Ojk6IGVy
cm9yOiBjYWxsIHRvIOKAmF9fd2Fybl9mbHVzaGluZ19zeXN0ZW13aWRlX3dx4oCZIGRlY2xhcmVk
IHdpdGggYXR0cmlidXRlIHdhcm5pbmc6IFBsZWFzZSBhdm9pZCBmbHVzaGluZyBzeXN0ZW0td2lk
ZSB3b3JrcXVldWVzLiBbLVdlcnJvcj1hdHRyaWJ1dGUtd2FybmluZ10KICA2MzkgfCAgICAgICAg
IF9fd2Fybl9mbHVzaGluZ19zeXN0ZW13aWRlX3dxKCk7ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCiAgICAgIHwgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
Ci9ob21lL2F1dG9idWlsZC9hdXRvYnVpbGQvaW5zdGFuY2UtNC9vdXRwdXQtMS9idWlsZC9lc3At
aG9zdGVkLWNlM2M1MGEzM2ZhNGJjNTYyYTFiNmNiY2VlMjkyYzFhZTBiMGE0MDQvZXNwX2hvc3Rl
ZF9uZy9ob3N0L2VzcF9jbWQuYzo0MDg6MTc6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDi
gJhmbHVzaF9zY2hlZHVsZWRfd29ya+KAmQogIDQwOCB8ICAgICAgICAgICAgICAgICBmbHVzaF9z
Y2hlZHVsZWRfd29yaygpOwogICAgICB8ICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+
fn5+fgoKRml4ZXM6CiAtIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzZh
YzdhNDYwMTkzOGQzMjk2ZWQxNjU3YzA2ZjhjZGY0MzM3NTdkNzMKIC0gaHR0cDovL2F1dG9idWls
ZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvNzk5N2NjOGE2NzY0NWE2ZTFjZjRlMjRkMTcyYzZmZWFl
NDU5ZGNmYgoKU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmlj
ZUBnbWFpbC5jb20+Ci0tLQpDaGFuZ2VzIHYxIC0+IHYyIChhZnRlciByZXZpZXcgb2YgUGV0ZXIg
S29yc2dhYXJkKToKIC0gTW92ZSBkaXNhYmxpbmcgb2YgLVdlcnJvciBmcm9tIGVzcC1ob3N0ZWQg
dG8gbGludXgubWsKCiBsaW51eC9saW51eC5tayB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvbGludXgvbGludXgubWsgYi9saW51eC9saW51eC5tawpp
bmRleCA1M2UyYWQ2ZDQ4Li40ZTEyYjM2YzFmIDEwMDY0NAotLS0gYS9saW51eC9saW51eC5tawor
KysgYi9saW51eC9saW51eC5tawpAQCAtNDM2LDYgKzQzNiw3IEBAIGRlZmluZSBMSU5VWF9LQ09O
RklHX0ZJWFVQX0NNRFMKIAkJJChjYWxsIEtDT05GSUdfRU5BQkxFX09QVCxDT05GSUdfTE9HTykK
IAkJJChjYWxsIEtDT05GSUdfRU5BQkxFX09QVCxDT05GSUdfTE9HT19MSU5VWF9DTFVUMjI0KSkK
IAkkKGNhbGwgS0NPTkZJR19ESVNBQkxFX09QVCxDT05GSUdfR0NDX1BMVUdJTlMpCisJJChjYWxs
IEtDT05GSUdfRElTQUJMRV9PUFQsQ09ORklHX1dFUlJPUikKIAkkKFBBQ0tBR0VTX0xJTlVYX0NP
TkZJR19GSVhVUFMpCiBlbmRlZgogCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
