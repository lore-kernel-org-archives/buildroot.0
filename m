Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8902B606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 16:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=B7ycSHxS
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 541DA80DEC;
	Sun,  1 Nov 2026 16:21:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Z8OXYfVc_QH; Sun,  1 Nov 2026 16:21:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 65FC180DE8
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793550066;
	b=VJQhWu4DJ6+TI0Wu5NGDYA943bp3c02nYGfgW9zHLzsKLu+hZ+Wmyxi+wi1YPQt7/07D
	 S2tfMawab4VnU6M8YDXBky0NItyMWKLulvnyg7B5QF/sVYL4C3w7aOR5cGcsaFd2lmkUI
	 udZCLZ5aoaUdp1XQRfXwZqTH25Cf80zdk+uCZ9nuNa7wnFg9AHBeGtHEC3HC3XkYqOdyB
	 zpCPZKJKQ8QVYOG0s06ZvhM8MUDFK97wSvMroj8+r3G7OW9DBIqBo8WslgfliVZT4lHpt
	 8LGIdmjTVwAoBTBitm6r6FHpBG9ijOKxu6SH5GoBB2mdmfVQKoeRdyH9+0kmO0JST3g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793550066;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZG6KQmq+byyAtmIfPZyveDP+ckTD+yfNp9cda3Cy71I=;
	b=mTNjSCzUFtZ8YhGYe1EOt7kLLHRsFsJAa0U+7mjGzGCkAGWBg/x22Iiwb2JPoTDCvyHJ
	 ltwGCObCCj4va18Tsj2l2B3VtyHvDZlneW5ILUrQxfoPGP77J5FGCc+cZEr7NqOqHmKN+
	 DElCd3ABmMY1psog3fhjRvna4mep0tEFKgVsllLTAH6UKhN7aZ+6ZrNf18pcDns2nIpHb
	 jbDezKH/G9/V+u1d+YoK5NA4ZPc64wLh6fiQ6su1ios18Afu8Y5lwBvdZkrZ6ANGmfCOh
	 QhdeFHnhuC+3v77h41oAjuqaPkezLjaJ3IPX6ucTup7jd5EmVo0uVyJKzzjcKgLMlWg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793550066;
	bh=ZG6KQmq+byyAtmIfPZyveDP+ckTD+yfNp9cda3Cy71I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=B7ycSHxScSKO84750AWL6rI1ndIGgrLNbuXDskwYoUNujEHQjKy549p80beJltV4o
	 K2K5bzvhTH/bQHg8nz2F7qDppNjVVvV6wC3rxdmM8m2GqsAlu1Vu+7HKBAKN9VjEdx
	 XcrWS24NwGycQCVko2kH8sm4rf/lOWYUdPA1Vk8QRgpenCkrGk7egcX23PA+KDM2zO
	 G8A1sXkBpck8zxS4IXwRdzecK4RK2hqJGUq6QTF3PVNgLLIAGbKqy2JbRVmgf30AlF
	 n4FLfFjjeXcfvSVUxqEPoCpKr0gQlIqpEeMys9VvB/gLy2bx/Kcx1DVCEtMrnRvy1m
	 dHnQMHAufXpyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65FC180DE8;
	Sun,  1 Nov 2026 16:21:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EFAEA3A7
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D588E6061B
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:21:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VW5nauSyLDQF for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 16:21:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 277AF605E8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793550064;
 b=qg3z3FU152/Qr78scY57N3GBWzgJvGaea5yS49ddu0sYHlcLgX7yoiir1TA/YpLs9U1t
 nE9s1Psh5WyQlJqeY3yBfS2dkP8geTkNSC/NVXQ1vqC/MEkrnOhEBqZXYcq2hWTZnuMle
 b1RcAEfla7MTJr/WgVZIxWQJps9j4isMOHaRSs40TrEZDLOixjnL2K1KY0a3R5S9Bbd3y
 XkHmdcu8wq+fynGOHaMUpb6gVc6MZTPJQh9NdlpKZh4Ja7cEs/92wyJ5ndO+4UcULLz6s
 1F0qU/iI/D6XF9V5P9n75gqWnPM9PVmPNJ0DTtkIYNO0YCnOO+suPqbns7ALuLxrBJA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793550064;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=2CeAA4+XvL1B6PEjCvwdNJUIUw4oTP27bVRYYlgT28Q=;
 b=rvBUqJfrXpjS+BfHtSVr6Spe7UaumNo5DxhclPnP/dq2tq7MEGzlBZaI3fdsohgGabjS
 bOBmXIz/2xx6MNk1ElLpYb62MG/8Gob5WaaQSQwkx44kTaI9TeL18HbHZE9ZR0E8uZTYM
 QKK59wnzh2VA4XnkZV7KOgC2KLaVjTuWceMoZ5UEAJx1duOgcNoxAloY5W4L2o6HfLcJX
 PAFnKEgiyfRyfuaar3/736gMKy1kggc6QaqCNlS7JN0U6RT3jgnRufRuZp3LzwyjI1I2I
 yHpY/ZfOYzj94DfVuN9slBTijOx0YsNIzdvugEEj/IWzSUjcnYUu2gCsVGFDjBxb4Qg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 277AF605E8
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:21:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E50AE9D4BB; Sun,  1 Nov 2026 16:19:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 17:13:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f538f0164cc81ec803684041de65004885eaac15
X-Git-Newrev: d7fe7315835da41d02d19198e6a6ec9bca23ee77
X-Patchwork-Hint: ignore
Message-Id: <20261101161934.E50AE9D4BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-inputstream-adaptive: bump
 version to 22.3.24-Piers
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	TVD_SPACE_RATIO autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d7fe7315835da41d02d19198e6a6ec9bca23ee77
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/xbmc/inputstream.adaptive/releases/tag/22.3.24-Piers

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash | 2 +-
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index 146457ef55..26352262e0 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  4aa567ce2de1eafcac02e341a726ecd0fb91be81c8c06f9e503cb6d36f818eec  kodi-inputstream-adaptive-22.3.23-Piers.tar.gz
+sha256  374403df391a6a6053667653dc9e032622da4ccdebc908c8ec1a3853b51e17c1  kodi-inputstream-adaptive-22.3.24-Piers.tar.gz
 sha256  48632d57fbb6ab8f50cbf4deced5c91e733fa7ff292687c4816b77f28e483df9  LICENSE.md
 sha256  02f864f3e07456785625968022ce811c5640301bfd2ae70963efea89d306790a  LICENSES/README.md
 sha256  0b7f5dcb3d2c28ff78d999786028930e762df0baa2f52955782e378ec5b636a8  LICENSES/BSD-2-Clause-Views
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index 08db94c031..59fc228e4b 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_ADAPTIVE_VERSION = 22.3.23-Piers
+KODI_INPUTSTREAM_ADAPTIVE_VERSION = 22.3.24-Piers
 KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,xbmc,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = \
 	BSD-2-Clause-Views \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
