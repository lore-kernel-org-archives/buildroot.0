Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC30606A329
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 19:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OYqZhpLy;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=boeXWZdB
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBDA5608E6;
	Fri,  6 Nov 2026 19:16:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id enbvVNTXHbcZ; Fri,  6 Nov 2026 19:16:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 86879608E3
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793992560;
	b=Sr6CW6xG5Go9KFdz25LkKO7iirXbZUdZ0biToGRRoSwQgMdwgfupqm7f6yxmqtJ819yx
	 vLwbokI8XI6+zbjFJURAZ3aOOGhfREQfI16yNlaC6drNEISgNVobvC7KGgXbl4jf76ToR
	 iJQfhdKjNXbBAnIWRLqfNrmM5hq6CaUaR1J1IzFO0gD/HTY7g8vPqh0jQ7uoQ91Bi1bv4
	 Yu1U9X3/mj9LHaKsYr0lb+cj7PRpY1OIsDaxoDxU+6xlTl2zeTTCHiwFqNeV47yMzLYum
	 yydVxAM1Dz3KFDDJp2laVJ7mNgnCIQaitaFoxkiNcyN3UeSGZciIdtAlCp5TyRzyOXg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793992560;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=BR9pHO6BwDdvHpSriiqKQewJhDsATPoRt2BCjGKRCYQ=;
	b=Vdg3zMUngD1GYVgakcGrFX2ZYx1xVHTmbyeRtUgjNkbf4EvcEwK7uRxcrlDnEmnMtJuK
	 gGNJvGkile7uyloWYwCIP13TlldHTvopn3qB+5dkLbAKAlJ7zfb9GoSeeNsWUWgT5PAki
	 76ph0KL7GK5yH3zIiIG+gulWRrymFG37JbwInWZiz4FG995nutgcxLYOXCO3hL8k0Lfvf
	 aTvt+xmuwZ9x0ERvkEdba0MQzxWyfumfYUN1yxns/2TKBBJeEo/HQ7a0rAUuRu7RXv4mG
	 kfNuNGGzG2taZanQUfD7kxvpvLs9BlyAH7z2ImQZzVIUa3OMmNNNYI8lj7XqzEwUD1w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793992560;
	bh=BR9pHO6BwDdvHpSriiqKQewJhDsATPoRt2BCjGKRCYQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=OYqZhpLyzY11/60WJpPSHF/bU1tqQjEHPVwR/LntJJfvgZlz9le64p8hi9Tdb6YIp
	 PiXBLKVOgeOYSHQs9SQVpDHgWOZH1y3Hhxw+C4wKcsiAsl74T7qp8JssbrlaQ7t+N5
	 Ku+MOEU/g4AFSxK4rMTEom5fPYN8K5XYOQaxReBQobE7rdAQGn/frk+UrNlonJ0IiP
	 3coLNbXicRgA/p0deFmEJeQp70U2TzGvaVUkNzWDtCotcbz5Fw9SUhErdC1Hj8ECXS
	 ft2MZ5sHkYY4YBujgBT8NKF8m1v7VdNn97Vul35/bywoLns+27xH88T+3bq5VAxOFz
	 iE4TRJBJQ9osg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86879608E3;
	Fri,  6 Nov 2026 19:16:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 241C94B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:15:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 15B4A812D8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:15:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mMkkAhecV1_s for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 19:15:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 31A02812DA
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32b; helo=mail-ot1-x32b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=boeXWZdB
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 31A02812DA
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:15:56 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-847ac7ccd85so629856a34.3
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 11:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793992556; x=1794597356; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=qHWQ2EbjkZJHMupABEZshUjIUFqkuW2kJ9QmH/ps9Ik=;
 b=boeXWZdBbxF8g5gln5aya356Vb4Th7ju4tvVV+leSiwPQ5afCC2ebNQm8jr5ATp8e0
 0NNP3JQXZ7+SQ/efVn9GWQqxXJuoBGuIjJPAkaVveldko+T96zOzxdKgPMB44+pNeTVt
 kgXCbCrnCdQAjNwzgpvkBDqdMtchNND3OSLVqX4EYNNJ/2Z+Xom75MowzDCff4krEnx/
 nBDwt5HcrvTHDKkF4/VLf89YPwUuHHRR4tKiQD4xmnLRfWyv6kWd8FUArmJflHfEQWRK
 w7WvdQjKResnq2ZFYomu92WxbxIPfGBAjtYc6OPC1O7nGu0aQpXkOUrbV1Q2CPOFlGAy
 v7Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793992556; x=1794597356;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qHWQ2EbjkZJHMupABEZshUjIUFqkuW2kJ9QmH/ps9Ik=;
 b=F6eWP8j0MMlyEVZKHmanmcYro6ttI+O+3Aq8I7VrKrnu87tfohyh2XPyDtPdQC/qhV
 TCUbC3XyGzIj+bIfjKUuflK5HyIiZce78cDuGzCgRKO9qJcTnTxaGjHvio6dniISJFjt
 kknNTBS9zp7LgoOVYh+jSYR/2n1X8ERqQhK5nflGvKPyO/wRIhTV63qzScvzxbFDyEYH
 +cxe0MjqP8cTDVpfJB8Eu0QxKnUotI/QjpHeBgRnWv5vcTRe6ZTe+KOVtlXkAtyKXFlX
 AGwBIM0gpIpOhdqzHM5IrCIAZP5BUWbd0xxedByu1w2lOc9K7qUy0zUVDtDEx6vzfrtg
 VPWg==
X-Gm-Message-State: APuU4Z/kAltO5ZeCVF+szHgKuiCOfyI37BvpXhGgpkJXpWSG7aF4CE6S
 hxL//8aDa8bIG0bdKTzMAJmlgnKco4CP2WZxQDjwQ7jC0NQZNpQavu6ppRshEQ==
X-Gm-Gg: AYBFou2D/5Me3dgUYS4Ogozw+m/9RHdfSlQJuN+MpLhKI9o5M5OuaUrbggmmFwA74eV
 B7VbhsR0qB07otua81yOWM100RtjxdnYoxlpHBb2U/XvikdzcXZm6amE+gHx7UuWzuA//1TBNtJ
 XW9F+YWdQbkWPPMiMfdzmGwFZtI7KHJM/z11pmWrHiS/r8B2QfmYDbVLJiaVLFD2pLUUK/5gvkG
 SJ6F0IqJeV3K+8Lr+ejA8Rth5eJTlyk1SFLM9KETtJaSZaSO/S0jSNtJxgaHCwE2Jk1oTPwOEEL
 FhMbfQFa2j7EbP0jqR5bUT//DnsqzGwsvLJU/j+IfbPGv6+6eEYaSkOnmsTXpexuBg+OhS7+N5/
 lpn4mTg/UlsUH2508uXRtVR5Di8ctQ2Tc7tK9td9fbvO+ZDAG16i6oAO83GscRqmRMN/iWYfGez
 MfSy9BYp1BLODzmOi8Qe5i284SyR4K2K89CawcAuQ8IrdNcXoPYalSAc8Xd5hbQDovnciyOzwt/
 nmOy8yzO3jNmozSulv6TNfjlF1nkMj71Jd/i6uZ2jjDEj379g2wz3sAYd38wT1Ux8pBnfLmDjiY
 a4O/92OaI/afKbyQBG72KtXvSyCHVBpvkN20vUaEEBTt3CzYBIdvZOASbxzg3ZSnQDWwFnJ+p55
 3CrJntqV/qSXUz+xmLI1Radk97qeJKLOPxsrKv5ftLIoi5zWxa/IfvFbkwmm9nPRlyxeK1Ol88K
 DXELcS+Mv3nBP3pUw84hehB2sUNhv4wzTb7d6ttatT/jve5QU5hAz87FZJl1kSca1DX+5xKmVyr
 g==
X-Received: by 2002:a05:6830:43a2:b0:821:8e71:1bb5 with SMTP id
 46e09a7af769-85f1cfe1eddmr3229721a34.14.1793992555882; 
 Fri, 06 Nov 2026 11:15:55 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85f1de4e53dsm2478655a34.20.2026.11.06.11.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 11:15:55 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 12:14:32 -0700
Message-ID: <20261106191536.2120153-6-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-cachetools: bump to version 7.3.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
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
 package/python-cachetools/python-cachetools.hash | 4 ++--
 package/python-cachetools/python-cachetools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cachetools/python-cachetools.hash b/package/python-cachetools/python-cachetools.hash
index 125da449ba..50072a055e 100644
--- a/package/python-cachetools/python-cachetools.hash
+++ b/package/python-cachetools/python-cachetools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cachetools/json
-md5  07b2d6da1fe4690c42c2580076ac0cbc  cachetools-7.2.8.tar.gz
-sha256  3f9b146b2160975da273e7c23ec882f3996b65df608150d52083c07de0682075  cachetools-7.2.8.tar.gz
+md5  033d407f2c6216c9ad7aa017a36bb861  cachetools-7.3.0.tar.gz
+sha256  3f63fc208410f0c3a3b37883c4903ecdacd6f0b259134e6d2e82debd5b2e01de  cachetools-7.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  28c000b52b0ee27138a68ef778227e4057046e86b65f62f1cacb99b0cc49e0d2  LICENSE
diff --git a/package/python-cachetools/python-cachetools.mk b/package/python-cachetools/python-cachetools.mk
index e059b3f9d6..a7b1917e20 100644
--- a/package/python-cachetools/python-cachetools.mk
+++ b/package/python-cachetools/python-cachetools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CACHETOOLS_VERSION = 7.2.8
+PYTHON_CACHETOOLS_VERSION = 7.3.0
 PYTHON_CACHETOOLS_SOURCE = cachetools-$(PYTHON_CACHETOOLS_VERSION).tar.gz
-PYTHON_CACHETOOLS_SITE = https://files.pythonhosted.org/packages/93/6f/faa5e0606769105e70e0478031a8f9a6b729e329f42ce2462585c6d9aa52
+PYTHON_CACHETOOLS_SITE = https://files.pythonhosted.org/packages/5f/6b/6c1553e1e8f672f9423344a1915aad1537439ad3d14a3fbc1a02159cfd94
 PYTHON_CACHETOOLS_SETUP_TYPE = setuptools
 PYTHON_CACHETOOLS_LICENSE = MIT
 PYTHON_CACHETOOLS_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
