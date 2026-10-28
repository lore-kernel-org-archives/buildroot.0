Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178FD606A31D
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 16:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=R6pF7JSO
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E135D80FEF;
	Wed, 28 Oct 2026 16:15:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FF9cMutWvYZp; Wed, 28 Oct 2026 16:15:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 08D2480FA6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793204119;
	b=i/ysS87PC0Wp/k8FOLFgGb1IHNzXwS7A8MpOssLogxs98h38BDIXKqlRb980wk/P2mup
	 sFast3LAAJg3Tw03I9+BuJr5MLR8lx7ndjnNhSMCfoFcuNfdGkWI+avifk1NeD00B7ITM
	 42sfdupchUdARoCdPftTTIU2i3VLn2WSRFkEDxUS5Z7hmPc1+nAAIAcSZjUtFeeTznlDT
	 psF5MRDyehVxg0qKYqqIIyuHHBOqFTfDni9T/kfDiJPN6ayDQsLzfgfXWig5jpsOOkZJK
	 XjxiHYxi3NZ0cdT4PZetqjnhfpeykeXoaGKeTwHLzEbXyTPzO0zxxU57rulFN5TU4Xw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793204119;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=eh8FOKxPQsRvPq0pBsiwFelfShKR29ndhPIMFsDKu0E=;
	b=HcVapxv2V37zbg1t3+Yl3/Rcqi3xsiNt9E7mJLc9py697yv4Pk3vS9f6Q9CSrOdOdwk5
	 nAOcncfAAmBpjT3n0Q9p/uqvIJTM3v4YT+JtHEssfHxXeqd0JV7Sx2dMndx8mv8VCRGiZ
	 i26JbVNAQwNpQCrqyMxChPtW63UHnsLlwyGINvDu0Uf4uJsjWhfVFCKp6BV7YS4xtDKZz
	 EiddR3EQm7aFY3JIypIESRW5A58sn7H86cYSuGzm/yo6cZOT3J8hvyJ7Bavn4rnT0TT7G
	 AMHTAf+Jiha8/NThIMnknLEK4Gao0ui+fo0Svq8zxAMKX/bwx2QGNG0xMM+Rg3LQWMw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793204119;
	bh=eh8FOKxPQsRvPq0pBsiwFelfShKR29ndhPIMFsDKu0E=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=R6pF7JSOGOTwP8Cd++pAf3OpsyFN4v5VBFsssffleNX5a+7wGJAbC1LVfpOAF+v2C
	 vA+QtO7RJRQVgkURhVWx2XGmZXcwMMKn4ldxOxvxyqDhfP0IdUNtvC6oaRbhE8CDYq
	 XG7J/OST+HLDSBFVRuNm6y+S13193C7kF2l9AcrAGpEoFO575+QwiewUTQXBE+48FE
	 0VG79VfIIlpbfOsllumbLN6cJF7Eckp3VzgoxubVR45S7uHMwqkVnIkcVIkVOjfw0r
	 sgkTbrKvRb4ylucud/BfqYOweNGNJdu6kapx5n21WKjF6/cSKl98mFNi3vdFprYMmo
	 vOz7qPGS5Qq/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08D2480FA6;
	Wed, 28 Oct 2026 16:15:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B9274D1
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 16:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1CA906060A
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 16:15:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pu0jKKDnVqZc for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 16:15:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 53C67605EC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793204116;
 b=mjD1jRFuK3WyX4erTmIJEnKNF6dDWfg54A+sWQqfpz8GGqrJTRBzcq1bt/0CoxqYVg9f
 HCyk3l6BIJZAkM02jUpubEAGLWVjbinrHOo4ECW8DO0BYBBLS6jJDlePxeCbSCwrmLrS+
 /97VvkrOLdR/bT57R/V0gtpigO5A45zo+wm9bucQFt99MTmK1nnpWXJJo7w/kI5LMLtcC
 pIZxKpjSRfO9TNRBngQXWx0TX6PSk6nYfMVYqVoBPy5BVnPgTqQ8qHFCnEA9rBDv7LHXY
 1/Np/+FJlOrB0Pud17zjt1pIm+c4oP+D996W9KRh8hpTsk1iWwKGfYNNOwJDUfL54Yw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793204116;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding;
 bh=Ee7FJLaShSt9FptWteM9uxULlc739+op3aTb7b/tu1M=;
 b=TwuqCvjbzl63rAwlDGjWYUlZopFvK6y+L/ifTW/ft937kMq8H38M/mQlt4MUbxSdfc5H
 C/J48hOIh9HhU/Vw6+TSNA2bOJep/b6DFjuWuhqfdFyV4fTSgTt+6tU/zMxMFebxHNLR2
 rcR4IAouRCGUnBARU45ArdxspEVB7jSuIj5X4K5XLiqzm1d4L+VC+0xMd6ppgGjf04MFv
 +Cb2HxhGerhfqMvdMDipgD8f5vkIwCymnNJuz4dcN060kL+ELHQBxIvLpMcuX/gcgugqX
 JV6VTXbCtMnpPBOgavgShTyD8PGpVSSgt74W88Js8vb7TyMiIk99gRXjijFf9I3oseA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=huQfvU9i; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::431"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 53C67605EC
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 16:15:13 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-48af4d4e61fso727740f8f.2
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 09:15:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793204111; x=1793808911;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Ee7FJLaShSt9FptWteM9uxULlc739+op3aTb7b/tu1M=;
 b=ZwTri5jk6kblHcmSbq82n7oiHPJW8aYWIdZVLjRa+/Ch5UPDGg59IB0wy/DqsZftYW
 UbZzWX1cVSiyV3GMUnwmBGDIJc3BdOR2y9h55Vutpo+8gTWew8nXyJKrGCFlyrDmoyxI
 jPGDsShBvMT7W7sG+0vGm6q6i/AhzPgl6inzLQoxaIH+XVDj5Dh4Y/wUZfN7icnb8xAq
 sXYNjcr+WEn8oX6MoOsHOt5m8ZCjctl2eYNXLWBeCW0f9mlIYqmtuP+nRwCsU+Ki8XF6
 vXcoI2w31jgOvRTB16mPWZvtdyy1niIpN5XTpx4k5yy6npD1lIIFqaPsixtHgM9NQy91
 jrgA==
X-Gm-Message-State: AFq9FYJHZI1BeZqFWYk6vtrjnct/wzatXU8xwf4HPd/GOEq+gSBtF1gv
 n2r6U4mLYaylL+CEzPtxCDL4swWh3bxL9l+9Lw/UIcJ2yZ5Ngn7EJ3XrKWNtLJetwlS4+ZbOJkg
 0c2jc7tk=
X-Gm-Gg: AYBFou2Lej+bdBB0xX4VfciaAjDFZD/+rdH0A+FIKbSc+lH2OQgxpExBisQ3qJ9K7eu
 vKIfn7SA5O1/mU0wgrAntYZ8GUvPcYNvmBhONfs8XCVRwt8L23wgmRQQdR2VFPQzrWR3EXK/ZdH
 bzK5MbcOudl3ITnrmlMbmRuAdvYhLz4ex1FTE2tMdT2mriM53rzj04xDEQBEiwaqSnLYxZsReuF
 EcQSASB/P/3jyMf/7omHuHQaqPiVSKdpwgO6gIWoTQZkm/sYU+MJHT+SsJ6H2tY7a8CWaJoPJr1
 MkeljUZnsaFCUknn6EatToBVOxWCFu5nbrmpirWrwL9M0gvNWc3e8kDG0tTdLZvq8Co3EVHToKM
 WKpmR8iQJLQ+kIYPiYqtmBfG5Fkdmx3IZpXOEL70PmXI5lIPuOyznukMkH2RnqcknIBnaPpfvlA
 kRP4wj/Kw0YRenkhV9GEGZkXkwSPxeaptmaet6/DS0Oaoxv4Hj2B9p61ysdXBFhWfssZHhB55Ag
 NtGLK8C9DRKopDNIj7Jj8kU3RQItImZ9fb9xLWpD6UErYanwfi/VqOCFxvL8ehSLVJI4tg193My
 g1H/Z/jbfzPGpBGDktJXxf2x9+2R0uflvcw30PaPZ2/MjQ==
X-Received: by 2002:a5d:5d0a:0:b0:488:83f7:6352 with SMTP id
 ffacd0b85a97d-48e5d58cca9mr7813073f8f.4.1793204111236; 
 Wed, 28 Oct 2026 09:15:11 -0700 (PDT)
Received: from debian-hp-1.fritz.box ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e412cc164sm27616654f8f.7.2026.10.28.09.15.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 09:15:10 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 17:14:42 +0100
Message-ID: <20261028161447.330533-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261005154047.413898-2-raphael.melotte@mind.be>
References: <20261005154047.413898-2-raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 1/2] package/python-pipcl: new host package
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
Cc: James Hilliard <james.hilliard1@gmail.com>, vfazio@xes-inc.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

cGlwY2wgdXNlZCB0byBiZSBidW5kbGVkIGluIHB5dGhvbi1weW11cGRmLCBidXQgaXMgbm93IGF2
YWlsYWJsZSBhcyBhCnNlcGFyYXRlIHBhY2thZ2UuCgpTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBN
w6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+Ci0tLQogREVWRUxPUEVSUyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgMSArCiBwYWNrYWdlL3B5dGhvbi1waXBjbC9weXRob24t
cGlwY2wuaGFzaCB8ICA1ICsrKysrCiBwYWNrYWdlL3B5dGhvbi1waXBjbC9weXRob24tcGlwY2wu
bWsgICB8IDE1ICsrKysrKysrKysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25z
KCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24tcGlwY2wvcHl0aG9uLXBpcGNs
Lmhhc2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3B5dGhvbi1waXBjbC9weXRob24tcGlw
Y2wubWsKCmRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwppbmRleCBiNGFkYTRl
MWY5Li5iZmQ0MTJiOGZlIDEwMDY0NAotLS0gYS9ERVZFTE9QRVJTCisrKyBiL0RFVkVMT1BFUlMK
QEAgLTI4NzEsNiArMjg3MSw3IEBAIEY6CXBhY2thZ2UvbXVwZGYvCiBGOglwYWNrYWdlL3B5dGhv
bi1ib3RvMy8KIEY6CXBhY2thZ2UvcHl0aG9uLWJvdG9jb3JlLwogRjoJcGFja2FnZS9weXRob24t
am1lc3BhdGgvCitGOglwYWNrYWdlL3B5dGhvbi1waXBjbC8KIEY6CXBhY2thZ2UvcHl0aG9uLXB5
bXVwZGYvCiBGOglwYWNrYWdlL3B5dGhvbi1yc2EvCiBGOglwYWNrYWdlL3B5dGhvbi1zM3RyYW5z
ZmVyLwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tcGlwY2wvcHl0aG9uLXBpcGNsLmhhc2gg
Yi9wYWNrYWdlL3B5dGhvbi1waXBjbC9weXRob24tcGlwY2wuaGFzaApuZXcgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCAwMDAwMDAwMDAwLi5mMDFhZjBjY2VlCi0tLSAvZGV2L251bGwKKysrIGIvcGFj
a2FnZS9weXRob24tcGlwY2wvcHl0aG9uLXBpcGNsLmhhc2gKQEAgLTAsMCArMSw1IEBACisjIG1k
NSwgc2hhMjU2IGZyb20gaHR0cHM6Ly9weXBpLm9yZy9weXBpL3BpcGNsL2pzb24KK21kNSAgNzY4
ODMyNDM2MTAyNzhiNzc3MjVmZWIxODEzMTQxZjggIHBpcGNsLTEyLnRhci5negorc2hhMjU2ICBj
NzU0NTQ4MGNmYTgwODUwMGQ4YjYwNmRhNzNkYjdmODlhODcyMjU4YmNkYjI5MzcxNjEyNmUyY2Nm
ZjFhNWM2ICBwaXBjbC0xMi50YXIuZ3oKKyMgTG9jYWxseSBjb21wdXRlZCBzaGEyNTYgY2hlY2tz
dW1zCitzaGEyNTYgIDU3YzhmZjMzYzljMGNmYzNlZjAwZTY1MGExY2M5MTBkN2VlNDc5YThiYzUw
OWY2YzkyMDlhN2MyYTExMzk5ZDYgIENPUFlJTkcKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9u
LXBpcGNsL3B5dGhvbi1waXBjbC5tayBiL3BhY2thZ2UvcHl0aG9uLXBpcGNsL3B5dGhvbi1waXBj
bC5tawpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5jMGU5N2VlZWIzCi0t
LSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9weXRob24tcGlwY2wvcHl0aG9uLXBpcGNsLm1rCkBA
IC0wLDAgKzEsMTUgQEAKKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCisjCisjIHB5dGhvbi1waXBj
bAorIworIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKKworUFlUSE9OX1BJUENMX1ZFUlNJT04gPSAx
MgorUFlUSE9OX1BJUENMX1NPVVJDRSA9IHBpcGNsLSQoUFlUSE9OX1BJUENMX1ZFUlNJT04pLnRh
ci5negorUFlUSE9OX1BJUENMX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcv
cGFja2FnZXMvNjQvMWEvOWFiMmIyNzJkZWY5ZGI5YzgwYmYxOGZlODI4MjExOWMyYzRjMDc0Y2M1
NDIwMzBhMjhlNDEzNmRkMTNiCitQWVRIT05fUElQQ0xfU0VUVVBfVFlQRSA9IHBlcDUxNworUFlU
SE9OX1BJUENMX0xJQ0VOU0UgPSBBR1BMLTMuMCsKK1BZVEhPTl9QSVBDTF9MSUNFTlNFX0ZJTEVT
ID0gQ09QWUlORworSE9TVF9QWVRIT05fUElQQ0xfREVQRU5ERU5DSUVTID0gaG9zdC1weXRob24t
cGFja2FnaW5nCisKKyQoZXZhbCAkKGhvc3QtcHl0aG9uLXBhY2thZ2UpKQotLSAKMi41NC4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
