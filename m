Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57733606A31D
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 18:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Q3Bj5V7H;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=i6VUUJXA
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BD76811C9;
	Fri, 23 Oct 2026 18:18:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1BrxwLkUAQV9; Fri, 23 Oct 2026 18:18:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D9C8F8154E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792779529;
	b=kX8V6xOkmvQo60mXJ7ymaqM80w+4gPf5oPlpNZNhbSp5GhUpsbofnvjwbIMB73V3h6ny
	 wnw0CmvdDJWs++BY80Hv0HjBR6OkpwxTmwYBT4I7vOOMC43TMDt4wpmf6BfyDnwNSsPcm
	 thQGeDUqVJ9nScDR/yeXP/cLz/JBS32PI+v5Y5c5xhqAGGx25eZG1lT993I35v6yglT6d
	 sf98AZmCv60BICSkkJIar7VTcKKdYea5DNY4XpydngUBh/+lo9KbXfkjED6wrhFWqDf5A
	 L5LENzU4+33HKAGjSqmqJwFdtcSgCsUYLTeCPi8w69mEka989HdlKvGAODmNDXXdO0w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792779529;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=QQPdI3PzoRzd40YSbTNevfW7M00Q29p2oKplIDq/how=;
	b=FVkJvwP0uVdGkdOALk0Ayh6ulP9xYLr6IQ3+euEwmxZ2E0Di1W+Ob9Bcy+z4KtY1GoBq
	 nwpWSsYUOIiLSaZExe4+mjvzfuahhIpPfFgnT15SUUpvUoki9UDYo4pr9BLvzoWWNr/30
	 aUI0Hs1I6PYL+BhfoZeO/YyM521yFeevZdd2Ox1Kg6kvDfHND+usdGXrMrPg3wPJlk0kS
	 jbXX8ZdS339KSg4e9r35fn0vYYjsY2btN2jlDqj+vxppZ3FeGuASziVqUT98vzq6S1Rdd
	 Oiyo/2eDg6T6S2m9C02YLf5yzfwnT+v6O5wsvYtMA7tXN6F9kvmT6CqlOW63junHytQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792779528;
	bh=QQPdI3PzoRzd40YSbTNevfW7M00Q29p2oKplIDq/how=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Q3Bj5V7HVEVn/H3zzHhG2VLH8Z8S8XzETOYODRseZyIm+Fi0WnYyljLOBnH9t7sLi
	 d2nwxApVm1j6T1rAXttTFjJofTqbxhJcGOk6n70YlrD4fxW0/LWm5qTw7wTGinPMAo
	 TJGxS3B55MWShh/ZQt/eNfhXWJwXo0EcUqf8tgiHPq47Z9rQsfpzfC+grkhfO5CFcs
	 vUPOJw9lm5zUTW20mNQHDG0idbfmxWwJDsdxaaHRPl7XxHhto2eA6gUM/DzNvWXHwJ
	 7xbONyqY/UN8fkqzWnpvyqupuLYjEaBoec3uyjsn865OXobSkgEfx3Kpa8QTYCLXO7
	 q33LUrh/g1ofw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9C8F8154E;
	Fri, 23 Oct 2026 18:18:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 68FF6235
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A39D608E7
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mfiXfwyQRpY4 for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 18:18:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5287260905
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32a"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792779522;
 b=UV1vZn4SpHQg7tLW5FAHGiQ2wIIlqYzhKw19qtQ2mAyYMJMMebGiDhDceZA1sU0xIv4v
 T2tHaiHCJeqh0b7QNZb6StjYfT8BMO6ZfDtWRTf2jhRqN45v4cQWUbkuFpsc6L6qEtyVY
 +eCu6ZoktkKb4ciZBKH7BLDxTr0ldOybm3933a8cbWHVQw3kr2819D/2qhC2cSvwoUkT1
 OKR/mX13mesTQqmbB9rwxQ7j5LbfjsH5GEgDCPjEy1KsmBGcs3qBYnn1nAWHW1Ce8ZnrS
 dCsIGGPhpwwVDrRPhHyfxX9nq18xNBxTP9vTr+pqJtFeOr9UhYHybt1eEyv7AWyaiYA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792779522;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=/93+1iR4xfRsH7q0WOoZRlWQ7thad44Ip2IPwH1Fi4Q=;
 b=lY4cCUmrQk6kBIMCh6N918iUuwo9pPzdsblqq3A5raxsnrLEmBEeVx8e8wtn32O5HoqC
 Mb/ua/USFDb4/S+7SdA85HWrOgXUxcvXWt88mP1GBmWjauZUYhlZd9UwJzWeClzg57skd
 aT5NQIPx6ohAvh3zlqI0cPZXxQp7AiXbXPBn7MLjpnC+j2/PWatilM1SZQhmjRRIKtEOU
 z8EiMIG7vQ1axnv/IXU0lnGdcYY7bFsaRAjsOcrqTLZ+ecYdvRQmSvXcLnvi5xKF5r4NA
 rYsb6n7tDbN9gbnDhTJI9gJtfvyCiOrqVPQEz9PnDWsJcNBY5FAGXUbmRpF7ZI1fWXw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=i6VUUJXA; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32a; helo=mail-ot1-x32a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=i6VUUJXA
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5287260905
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:40 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-8198a3a54d7so1898662a34.1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792779520; x=1793384320; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=/93+1iR4xfRsH7q0WOoZRlWQ7thad44Ip2IPwH1Fi4Q=;
 b=i6VUUJXAwI0FvXlwgQ+z2NtKOzRgJkEQf4t6WgUUnYpWkZPZOjgEalPDbxbtOU5b5n
 kwrt0Uqj5+Iseu5BP8x/EglfYyc9u8//+ELyNZuZTGCrTubOGCwZgkoSH4zp+sZ7F68i
 7Jp+IOIbAf6liCvyCNBlnpyWaCjOI49pp+sNa1KRpzX/XwjnY+B2aiCWmpFM8ojoXaq9
 6OYDLJb7gOKhGRzynQsH2jS4tRfr6s2iav1u7taUDw9JvzqxAgYg53GJc8H6DO027OqU
 V+3gZEAEr0JOTRrvuEBLe5ODOVIu/c3gQkSw3FzlJ00lLkkLM3S3SGyaMEyv6jAW/Z1N
 clxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792779520; x=1793384320;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/93+1iR4xfRsH7q0WOoZRlWQ7thad44Ip2IPwH1Fi4Q=;
 b=svurrxob6cYS2NUb3ynwnznrZrZLjvVUTnmFkYUMVm7Rfi2ZbSOLQFyE4CWoqYu7Ke
 gtN9Ijuz3Vji6IBPeYbOCjP0coxZYaEsRiqrRAE/SBcvZXiYRKOCEMa6b44XKcTqYmJK
 0U59jeQNn0feli88MW1Tc9zCAiosgTEbXowO/sM3G4jNmYZf8DWYetN3sj4vjrosQhMb
 yG8TjUyLStZAAPiWG+GwTRehuuQ7zvHJfa6JnxzsJnXrnOSoAhxu2w2jvQ3cPBittpur
 2Ubw+gm19s8qRKz1Me5URXho+h68VZ/fdv5hWZ2xZL3rrWYSgM6yxY0uev1OvGxX+tob
 IYsg==
X-Gm-Message-State: AFq9FYJdB4GHsnQhUPNZBQOCjUFqMsV+DZcQeifQMfeQo4WUY23FuUXs
 aTXgp7YVI/6Sor/ucPUSMRWkkJ914Tfs2nr84YxzchLqYKTee61TpFyCiPejjQ==
X-Gm-Gg: AYBFou1T+9ij6E73kGtfa+o+ZV/NXNpKLYYyZvuukqsEPIUomT3/tf+HZCgxsRAwn8i
 KNQ9cC57NYH7Fau9ClCQh0wyOi2atWEsxBiJ7igGWCw8vACxbnplPN7x3PI6YPndwnLEfK9kdWw
 o18OCjaEjwZ1Lw3LFG2LLcplryySFWZqBE3dtjwvng1eyYlW8KJgLFyhx4IteNJq/U6O5vGUDPr
 Rgp/w/WFvPMR8ZmwGMPeueswwaEUEdxZ8dpXzMRuhUQ2rMQThEpumuQ6/2Y7KMm5F2jpLAfQxvu
 QGdMkL6LW2Z2eM5vo1cEBkoufto8SVB3bLiQ9P1tfa2m8mIkxgIUDPCR4BhCubzb/EGgjatE5uf
 W7URZf/k/LIulHYqDVfuZmA8d3uJM9zS8Wr2va7mlE8zsh9gLOW4qpUve3N4ZcMs0bN/jC7mdv4
 jhUqS12KOuhNy1ATftrVY9jXDtXxiUK2MKf7mHEMDCdAXq7h7wGOu2nhqrDs/81KO0PY2EpHQ2y
 vVu2QVaoqJRDJhsRfP6go7ib8O9+ZgIqiihX6yVMyfNA69NVjkphQjr4sY5BbdSbj/TY0UYaIQo
 sHImlMT7DdOQ683PMCLdF5ewppyVE0h0LIs1QsXqWYA9oAk8ZJ5WZBwDrceSDRIiTvE8zPi/AvZ
 TOowm37w4QsycBMPJ6LSSUydggfHlcGfI/nB84946n5/iRVwB99pK+6Ict7IXwfbkoXdsbe2rJ4
 MGQvbkIONUaz+NMj9xtklQ+iA=
X-Received: by 2002:a05:6820:4385:b0:70b:867b:e7a1 with SMTP id
 006d021491bc7-70b885a9bb1mr1261388eaf.0.1792779519900; 
 Fri, 23 Oct 2026 11:18:39 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-70b9af01512sm725956eaf.13.2026.10.23.11.18.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 11:18:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 12:17:30 -0600
Message-ID: <20261023181818.920329-13-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-markdown: bump to version 3.11.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-markdown/python-markdown.hash | 4 ++--
 package/python-markdown/python-markdown.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-markdown/python-markdown.hash b/package/python-markdown/python-markdown.hash
index eb43ffe260..c24d190e7e 100644
--- a/package/python-markdown/python-markdown.hash
+++ b/package/python-markdown/python-markdown.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/markdown/json
-md5  0a601cc89d8507e1409ed41ab718d929  markdown-3.11.1.tar.gz
-sha256  496f4f80f9ebd3395a04c8ec9595c40bbe8ec19e9c67d21fe071a1643e876606  markdown-3.11.1.tar.gz
+md5  80c89f34ab5bce047528900335301408  markdown-3.11.2.tar.gz
+sha256  87bf5d90f2d2882e2c02fcda182c2800456b985bff38913867c49706481514b0  markdown-3.11.2.tar.gz
 # Locally computed sha256 checksums
 sha256  7ba4eb6d10b32b2d11dce13821340351cdbbb30ba8ccc67841db2ffd86e79aca  LICENSE.md
diff --git a/package/python-markdown/python-markdown.mk b/package/python-markdown/python-markdown.mk
index e4f183588b..fb5926f13d 100644
--- a/package/python-markdown/python-markdown.mk
+++ b/package/python-markdown/python-markdown.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARKDOWN_VERSION = 3.11.1
+PYTHON_MARKDOWN_VERSION = 3.11.2
 PYTHON_MARKDOWN_SOURCE = markdown-$(PYTHON_MARKDOWN_VERSION).tar.gz
-PYTHON_MARKDOWN_SITE = https://files.pythonhosted.org/packages/4e/d4/f3f4b6ed70b7c7608fa026ff3bbe59ace9b1ebca43d8ae4886c87c95e81d
+PYTHON_MARKDOWN_SITE = https://files.pythonhosted.org/packages/f4/32/0b4d0297064244f04af4331b65de16237cc3cce07474171ee14222a28981
 PYTHON_MARKDOWN_LICENSE = BSD-3-Clause
 PYTHON_MARKDOWN_LICENSE_FILES = LICENSE.md
 PYTHON_MARKDOWN_SETUP_TYPE = setuptools
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
