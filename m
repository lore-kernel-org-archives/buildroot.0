Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46D3606A31D
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 20:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OSfFTlqj;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Sy0JfHzg
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF1E340F6F;
	Wed, 21 Oct 2026 20:34:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yvhL_xwr6Bo2; Wed, 21 Oct 2026 20:34:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C8C5040ABF
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792614869;
	b=rE3XYl5RcamuE9bOZJYt+KdCFLT//urYb4ldZ6BgkER655RZUaL3Z7Csml3lw69PgtMx
	 qyHvGh9i6YnOrRSHdU1fevjXxLvc3e201lE2dQ/zLxQ5KGALTgVkFoaotsfqbm5tRSeql
	 52ItbyW2DobhQNHhg9kM5gLGthELMDBAsMb8pPfMQNtG8KBAHyvSjtXK6Ht8AAdxWtxDC
	 27uhDukHqYMSRfSuj5Uk1own1jLU0LHWQ2f1sO9dgWdUnyHJ2oBRkzV4BKsFeUD0h8DzE
	 Qx4wG+iCyTXMZdLsNBGQbskb43p5tGeH/EijuUs3Pq7k77nMWVBpL0YJtyG0j8u7/Mg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792614869;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=4DrvNAeCRqZwK7KaB6rEmxmvpVCedZd57Re8P4uyB6s=;
	b=JCEM3mnBaIwJ7Rue3jGj6IuKQLxWlv62fMS8J/phGFRDIMdhy8SvXr2D3repD/L2/dKf
	 N0B0Y6sHum4cV4Qq4xckD/yvoMXzhS2iarmFLyrTq9JmsLTDB/njWAL8tUmBv3Y0hEfA2
	 rHW6+FwIuru0y++ozXWczuQqkh5dZmoXupQFAqjfLpvR2pyKWKQAe4/IwS997IqtvYUid
	 P9JTkLw3Wxu5OjVtjw3uOUAOsmme6Y2jHLUqLln8osp9HxPCRRfHXRvPpFropov++GczF
	 27UsSHYdgnXtsHD9pM06zjHd1JT+MCLIHhccynuDW+9QOs2bKcFH9D+R4GOzez/RnRw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792614869;
	bh=4DrvNAeCRqZwK7KaB6rEmxmvpVCedZd57Re8P4uyB6s=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=OSfFTlqjNbT4x//tGtOMeww2sRQvZdhmBEnA14cCUntPuOnULHeeAy+260db6F0Gx
	 iWUMmXy5C6EDx12NuOZC7VG2X/GLvdUqtZvfLk1SSRrIJyc8kLbInnqfs5T9IeHAQl
	 d5d9cqhp7QPtL1FMWGFMdCwqGOSqtitbnxXeY+oHA+r81egIlmqVtROZhEXV17nqFp
	 oZ8ByDm1JbTzMzYC6bzUtm5MM20WJxku4sRz5aQl+QH7sFKdPEwmF67KbcB/U0mGHV
	 sN/gIsciMbz6S3insrmzsuFH/X0p4huocT/R7vqROkU+XxYrqbBcKRTXF4mKNwJ1z4
	 1VzLb5qbZK4nA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8C5040ABF;
	Wed, 21 Oct 2026 20:34:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F2F25769
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E085181948
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:34:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 99L4X3I6G26h for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 20:34:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0AD6D817AB
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::22e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792614860;
 b=fC5pkmwNEb5J87uXWEXtM8I+akfppQlyDXvOAoKB7g+wvhtw2Way+IenkAHBVLvu0QSw
 1joAJlJtJl8yTw0AAGbJSoQdXiIGZYPtRMLXABnPwLlW1ZOvgRU5na/2D72G1PDIEqNIN
 kvMmCh7btdEcLdtf6wy1cxtuh6qsEK93XUT6p1br2sj4BPXx8gqJc2/VFgPz8Ro8eFP47
 blzGNyyS5U7bR2hBq8adezCYGvMRHkBhC1fCDLLiBAPhjbIyT1GQWv8RhYSlD2RVUXJda
 z8DaVDh6+dbjNSSLRngUbh5cqNejITC7rdalVF/7r6bwUTE5D7JjHv5jxG2Ie2oYwtg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792614860;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=qwgx2LEXtGQ72HDFT4f7kj0ILy03PQ2ZIdx+58vYW4c=;
 b=hl3P0DZwN7AvfSRpCo/+iegzU5NnL8SLN7dSuarEklHVWTuEaU8f98jJN/bg3cho3dMo
 6gNgkPLDYym7pmuSB2OcnnzWn6+ojrk+FvcrUKrlfVYgRnmg7UuOU99g+g/1q7iuTaAAV
 HDybwbOYYuqL2+8O3djnH+AhqjhEj4R1mu0Kvp7thH3LcM7dorM7qqq8TN51YsI0AQKl7
 iq9h097/99OC/dY+rmBII+bFrsRUvJvMSuIvBW6IFaKKjyasuV7ylJ+6rrAze7s4MMnZ0
 l6FhZnNsqc16TF6XgcBY1jERq64AKEoNrlUxVhNQe8BKZ3jTOh8ikaPLWBH5cF2MvgQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Sy0JfHzg; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::22e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22e; helo=mail-oi1-x22e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Sy0JfHzg
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0AD6D817AB
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:34:19 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-4e4a4d77e5bso175487b6e.0
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 13:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792614858; x=1793219658; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qwgx2LEXtGQ72HDFT4f7kj0ILy03PQ2ZIdx+58vYW4c=;
 b=Sy0JfHzgepN7ps2deBSGKhoEfTBNWXL40MoxMj8/ECmFZ3srzJnsDvuhy5eX1Ba3n8
 bCbnZKtxEg1VX0CwWEK8+fxmPMX+u58WSqmVyRaiMV04C3uJ1OJ5ZRLVSGwuK3vzFoPk
 LCJi3ZE/MRfeGP9exDDAQwkVljOvt2gShYFz180Q95ECUL2h2XzK5Ir5x2OEevYevGrc
 zYi34wOwvUS3HZGT1s4xvA3yM+9FJ0ghhylQRL/PPuqh0qD1WTg9c9qe4ma3OY5Tzyxa
 WPqVbkj3BAgRFExyXj6AZ90+iTv46DiYq9xtJ8mJLzz1rBZgMST8Tk2fDYWlboWUNE7n
 GlGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792614858; x=1793219658;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=qwgx2LEXtGQ72HDFT4f7kj0ILy03PQ2ZIdx+58vYW4c=;
 b=rS7HA9Xh8Iy04fvEjgirHAbxYf0wO9kYCfmi7XvKl/Rve9xL/TETpurXfgjBV3KQp0
 gpyy6CGJ+0jJqPMlFgHgpxqotYSC70wnwI9egexTgsTazIDzyieD106Z9gq9cqKpbyKo
 3+EFd2cXgmYouqFcGxewp7hRUU9a45Wshc2ypok/WvkQM0DEDOsvQ5X6O2PPq/ifwR5Z
 kzNZq22QmxakXcjtdu7elPYA6YqAGvAr5rIqfRx9VGpXmamEPE7ghPtCRPdjbnTJ+FSn
 +zl/tEP864epJEeeMcfnMPHeykqQFCdi5uErohqDgOvuO7U2k+gUKaHybZ0Qrhgr4DbU
 eH8A==
X-Gm-Message-State: AFq9FYKLYLUwN+rzZwOPahV9lJw5r4D0d9norITu0ZpIFCWHRFt1lfTE
 iJqSGrX/zktUKGLJKgze/xI8E9cs+7wFkFXZikkF2wsQHrb71p3Xf6s6eQba5g==
X-Gm-Gg: AYBFou27CHElTPUD6hmHmCRDxxHWc7+YvABxc8kyDDFCNNA3/Cepo0bNMWdbZy6kAkO
 C6AtDTMrTX6m0yPRf6nI+7h5lZ15sKQOS+FQ/BGZyBAn5SPQciW5jmcjUE+f4RDepsz9S45NXBv
 H9e7XoenD/pYbsU8pgyynQOUDgPQklL56mQ3s0qEw0IrMyRfu9WobOUEl2KGuV44RMgi2ngk/2D
 fhzDkURqZepWh94QyNWpycuKi8JgWXmVvg/NbonxJj+Xe00ypLIb+wi/wgRuH5qvvD8/vBOaF+a
 pXtCcGfli7ZMj0OIz/oCojJJGHkYWjUMvz5XhkIqWZAGYq2ZkKMyhtBjHvsUBQDTNZdRJ8/mOKZ
 unDSLZhuf3QUJwHrqEx7YylR6PBaFV/tSs0lQWWAQDhQ2i1GXq/DSVJjIwVQCAcqUiAybWdLQ9V
 zuEtDkttU9J/WaULuTGa4TZ6xuCkZ1kDhQFR266OTKpyMsfEQmGWjAcSe1LQEGobQLrH346b9Rb
 wnpppLByp4fLUbeC38ZNBo5cD6xnbIx+hcjALAQzFKlva3oZoGQ6iYw4wbQ7wVdCfjKOgHj7c+Z
 D5PsMdh4YPTW7RQWPmIks6lnUbLG89afXsqz0sfC2PBVusQolhqvZLojVsbY8lvKbXTdyMiJL+O
 pFeB9k7prt3VTjgA21G4nd4c0MDkOaryVGfCNRQVqjxZarWCO6HZrfnUvnPigm/6ymo7CDNoCBS
 hSS/ZZ6jHB00LVgr4pVy27+Bc=
X-Received: by 2002:a05:6808:6614:b0:4f1:a3ac:a637 with SMTP id
 5614622812f47-557e5f4cbffmr302456b6e.27.1792614858602; 
 Wed, 21 Oct 2026 13:34:18 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-552ac8e9463sm2647696b6e.2.2026.10.21.13.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2026 13:34:18 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 14:34:02 -0600
Message-ID: <20261021203410.3114473-8-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261021203410.3114473-1-james.hilliard1@gmail.com>
References: <20261021203410.3114473-1-james.hilliard1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 08/16] package/python-rich: add host variant
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
 Manuel Diener <manuel.diener@oss.othermo.de>, Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Enable a host variant for host-python-typer and include its markdown-it-py
and pygments runtime dependencies.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-rich/python-rich.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-rich/python-rich.mk b/package/python-rich/python-rich.mk
index cb98d0ff3e..61582a55e8 100644
--- a/package/python-rich/python-rich.mk
+++ b/package/python-rich/python-rich.mk
@@ -10,5 +10,7 @@ PYTHON_RICH_SITE = https://files.pythonhosted.org/packages/c0/8f/0722ca900cc807c
 PYTHON_RICH_SETUP_TYPE = poetry
 PYTHON_RICH_LICENSE = MIT
 PYTHON_RICH_LICENSE_FILES = LICENSE
+HOST_PYTHON_RICH_DEPENDENCIES = host-python-markdown-it-py host-python-pygments
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
