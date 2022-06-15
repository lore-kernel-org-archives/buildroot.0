Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27EF8C43334
	for <buildroot@archiver.kernel.org>; Wed, 15 Jun 2022 17:12:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6C1961030;
	Wed, 15 Jun 2022 17:12:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KOmZe3JLdB39; Wed, 15 Jun 2022 17:12:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1B9260F9F;
	Wed, 15 Jun 2022 17:12:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3522E1BF300
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 17:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2361840AF1
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 17:12:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1f0IEAhfGMC0 for <buildroot@lists.busybox.net>;
 Wed, 15 Jun 2022 17:12:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 20804405DF
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 17:12:31 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id o7so24551588eja.1
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 10:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wyuf/4n29eFvRdQz8Xv8xnvPPZmg2f0W4vl7LYsuBjY=;
 b=JEjJOUpKhj5JiOj+HJtZFdjm/t1C2Yn4v13cjDsrbaxsQlOYTafhRga0aweJ4cA/Xz
 KtzcySGN73VH+zNSODWJmc7HhihNOQD0/+rsZVgoETilTjAtfjTI9sOWtmzpDTMmyVrB
 1bWO7tE0VLkapLMRx/Ubz14ur4nIvmEpvD5W69LfmnZ/gA70FqBn74q0kaaa9pu1J6km
 MKQgt5ZDMMqqd3lPcOR9FHZ27IVJu2Gy4Nhw19YWDTuWMxqWrwl2jR7spoYC9BgTgjoq
 a2bHSTxOrxs53lVxRKpPgrC373jKXuI6912eToT12nj5n9I1udJ137arPZEN6mCCZgVZ
 sOTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wyuf/4n29eFvRdQz8Xv8xnvPPZmg2f0W4vl7LYsuBjY=;
 b=NCl1jbFtonybMr7oFSleVMbL04t9gnC9BenqQGrS9s68sjLOHo3I371CjWMUNrUgt7
 F/TBKNCTv0hxcwNvbaZDYf/Zp54uCInoCJXUcEfNC/wW+2yzNbIpEwWPgGXaF5lOdEf7
 /bjxpeFQD6a6dtho7I1xvt3K7YaYjolTh7EH1cAhhAH61uL6CtNIm3QuFAZmf0RFnuzd
 9qK35D/2yNzDWoS/rdh1Jbm5iSEQSTquuOqzGbLrXFV/gtJD+8HNtT9ir6NnAqvw1iRU
 DoybEqLdgMDA2x84bv/Zt+3sbDShiuLrUZtn+Kx9DsgQPRfiBm2EW+TMZj8DZuMDUVtK
 iINw==
X-Gm-Message-State: AJIora+s8F6018FjswQ6wsQ1jjH84Z1xpuTanuyYvgMCbqlFpDU0+lqj
 LxokC/7WDwTSx+RTVr1A8F/1bZNpEowlcw==
X-Google-Smtp-Source: AGRyM1tXR0z/W65OA5TAJjqbh2bIABDFtoHfsCnUbA3nd7DA+rHD0QyyD9NgswFytxo/c8sJo0Vfsg==
X-Received: by 2002:a17:907:608b:b0:711:f36c:847f with SMTP id
 ht11-20020a170907608b00b00711f36c847fmr769540ejc.558.1655313150172; 
 Wed, 15 Jun 2022 10:12:30 -0700 (PDT)
Received: from localhost.localdomain (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 s22-20020a1709064d9600b00705cd37fd5asm6502763eju.72.2022.06.15.10.12.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 10:12:29 -0700 (PDT)
From: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
To: buildroot@buildroot.org
Date: Wed, 15 Jun 2022 19:12:16 +0200
Message-Id: <20220615171218.1032413-2-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220615171218.1032413-1-raphael.melotte@mind.be>
References: <20220615171218.1032413-1-raphael.melotte@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/python-botocore: bump to version
 1.27.8
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJl
PgotLS0KIHBhY2thZ2UvcHl0aG9uLWJvdG9jb3JlL3B5dGhvbi1ib3RvY29yZS5oYXNoIHwgMiAr
LQogcGFja2FnZS9weXRob24tYm90b2NvcmUvcHl0aG9uLWJvdG9jb3JlLm1rICAgfCA0ICsrLS0K
IDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL3BhY2thZ2UvcHl0aG9uLWJvdG9jb3JlL3B5dGhvbi1ib3RvY29yZS5oYXNoIGIvcGFj
a2FnZS9weXRob24tYm90b2NvcmUvcHl0aG9uLWJvdG9jb3JlLmhhc2gKaW5kZXggOWQ1ZjcwNmZl
Zi4uYmI4MDZmZTI1MSAxMDA2NDQKLS0tIGEvcGFja2FnZS9weXRob24tYm90b2NvcmUvcHl0aG9u
LWJvdG9jb3JlLmhhc2gKKysrIGIvcGFja2FnZS9weXRob24tYm90b2NvcmUvcHl0aG9uLWJvdG9j
b3JlLmhhc2gKQEAgLTEsNCArMSw0IEBACiAjIHNoYTI1NiBmcm9tIGh0dHBzOi8vcHlwaS5vcmcv
cHlwaS9ib3RvY29yZS9qc29uCi1zaGEyNTYgIDAxMTM2MGU3OWE0Yjg0M2FhNjU5MTU3M2NmYTYx
ZThlZGRjOTliOTFhZGFiMWRmZGI5YTJiN2YyYzg1MTExOTMgIGJvdG9jb3JlLTEuMjIuMi50YXIu
Z3oKK3NoYTI1NiAgZGI2NjY3YjhkZmQxNzVkMTYxODc2NTM5NDJjZDkxZGQxZjBjZjM2YWRjMGVh
OWQ3YTA4MDViYTRkMmEzMzIxZiAgYm90b2NvcmUtMS4yNy44LnRhci5negogIyBMb2NhbGx5IGNv
bXB1dGVkIHNoYTI1NiBjaGVja3N1bXMKIHNoYTI1NiAgMGQ1NDJlMGM4ODA0ZTM5YWE3ZjM3ZWIw
MGRhNWE3NjIxNDlkYzY4MmQ3ODI5NDUxMjg3ZTExYjkzOGU5NDU5NCAgTElDRU5TRS50eHQKZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLWJvdG9jb3JlL3B5dGhvbi1ib3RvY29yZS5tayBiL3Bh
Y2thZ2UvcHl0aG9uLWJvdG9jb3JlL3B5dGhvbi1ib3RvY29yZS5tawppbmRleCAxNjI4ZTA1NTYy
Li40NTllZWZlYWIxIDEwMDY0NAotLS0gYS9wYWNrYWdlL3B5dGhvbi1ib3RvY29yZS9weXRob24t
Ym90b2NvcmUubWsKKysrIGIvcGFja2FnZS9weXRob24tYm90b2NvcmUvcHl0aG9uLWJvdG9jb3Jl
Lm1rCkBAIC00LDkgKzQsOSBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotUFlUSE9O
X0JPVE9DT1JFX1ZFUlNJT04gPSAxLjIyLjIKK1BZVEhPTl9CT1RPQ09SRV9WRVJTSU9OID0gMS4y
Ny44CiBQWVRIT05fQk9UT0NPUkVfU09VUkNFID0gYm90b2NvcmUtJChQWVRIT05fQk9UT0NPUkVf
VkVSU0lPTikudGFyLmd6Ci1QWVRIT05fQk9UT0NPUkVfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0
aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy8wZC85NS9mMmU3NGU0YTkxOTk0ZDllYmU0NTc0NmY3NWE4
YzVjYWZkNzIzYTg4MjcwYTk3NzJkOGQ2NmUxYThiYTEKK1BZVEhPTl9CT1RPQ09SRV9TSVRFID0g
aHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzL2QxL2IwL2VhOTI3MDNiYmJm
ODIzNTNkNTcxNjM2ZmU2Njk3YjE2MmMzODgxNTc2OTg2ZDY0NzQxMTlkMDNmY2U1MwogUFlUSE9O
X0JPVE9DT1JFX1NFVFVQX1RZUEUgPSBzZXR1cHRvb2xzCiBQWVRIT05fQk9UT0NPUkVfTElDRU5T
RSA9IEFwYWNoZS0yLjAKIFBZVEhPTl9CT1RPQ09SRV9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRS50
eHQKLS0gCjIuMzUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
