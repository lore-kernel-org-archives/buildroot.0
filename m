Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDD0606A319
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 20:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JkCaEDe0;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=riOdUpq9
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5899940B20;
	Wed, 21 Oct 2026 20:34:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eUF7ayLMbflH; Wed, 21 Oct 2026 20:34:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7A08740A02
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792614858;
	b=FVDH7pDNUDAxw+FbaTQqjUXKS5Z/KqwEAhD7iRWkChnzn7TpWOgo62HwIVUhrOW0d0sj
	 tmF9vA6kt7ct84v7HqMGtstWf6mIeNbNIJHRh0lezCC5cBUfY8QyLSy/fK2vCq1dQf6an
	 Sd26qPnWgpRHt74otukBam+TdY7aXsBn4lRIqVV2x60nzlvAPnqaZWbAjkfHY+o74n/RI
	 yZ44JjW8EJWoTWB1V1VzkptGlEwAnZsaoMvBhSDHiImmuaP75DOgpmK3s7BJcZgtjez4H
	 JIFU2alNNiKawlyw0j2ei0o+VznNfedKzxnOz1BRXgAnRAckoX5joZIYJ/WvYWNKUuA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792614858;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=9042//7sA4l+KE9ombd+vmDIJwa59gx6j5UqbzNYF2w=;
	b=X6awXTi0DdjZ6KRagNKsKy8p+59+EV83d7Mr0GHKa+x+IMhQhdf4HU2gDIUrPVz3SRCn
	 T0PICz4WL3qr53+dfaItXNM6urASqBn69Dtrv/7d0apVZ9TH2FCKs4TWX/3G4RPUgyNiU
	 CXA1yn9pRAM15QrmTfu5SigPq3pdbtkUvybo3fFjsy6d03wcuDOl/vYt26eL70839kh3x
	 75Yl5XHNAc09CoVs0aw7DdJhhRq8HOvLMlRxwWZp7x3b7V+HpbpVoqcQxxDqA8Hb3R0x4
	 xXXulxRy3+VYGLp1kXM0bcY4gyy4YLYgrkjdxEeaWnLdM7j7AP2qAAa6qVUlQVEg4lw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=riOdUpq9;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792614858;
	bh=9042//7sA4l+KE9ombd+vmDIJwa59gx6j5UqbzNYF2w=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=JkCaEDe0lGP4WmOfCkPqQJd8IwwOuMHvP5kHWnEkDkBilWhdp4oyOgMfPhuLjjk8N
	 rUqQXBf4OwOxZjpEp8EGNafXZwseWFBUjLw7Il+U8W/J6upcHZNr2zCNrbMErixzH+
	 pNgsHd9M9343994Yew7lYmact9i3TcnsVCMCHcZibjR5gIdlFQht1xCXUdc9OpwK5U
	 DdMTj5C1LpqPzdteJleTiKTzwAWwzyio3IKJjKtfVt1wqZrY62New/Gf1FxEDLHOYw
	 5JmiIV0fmh2Kugm+gi34c79+Pttq2dpqDnUr1RuYfUG5d+j+8COn8P4lpPtb/+w9XD
	 YF8FmdPSMMiWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A08740A02;
	Wed, 21 Oct 2026 20:34:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 222C43A4
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FDF540A02
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:34:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kh54qai-kCDy for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 20:34:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6C04440B20
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::336"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792614855;
 b=o9pTC/MnRVRUoBwTVOY+tOev7HzTAxjpBbNCQmT8OEWyflKlhFk18dTlYNJqrfqbqZ9J
 4sqWoEudf/8V9qIUSdGSEDb/4u4qFksTOBblgXX2axEWtsJTriDABqoPzhUzU7xAOv0jr
 1AY377jx0WgzNVGVzFdKM4tF4ENv6cGVi+8NkaKffpEK3XU9QAThh19PbMe6oR2xMiOuB
 RRwu08W0KMCiVQbLVqCNw0MVbpTHrLMJo/1mzgU/VREkPbpSrhv7cFt/xPr8Y2KNi/Cql
 nVkyrKhKEUQ9kRaLLvqETI/79TitvU+12k++QYjh2uy/Hf/d/ef2tfOOSARHgKQ677A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792614855;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=pDiEB0xXMfxnnuQpcynpwJDQH1P+n6Gwlq9Tg/O4Zq4=;
 b=Fox9cppIjqJbeB/hMDhmgZgyXaXXhR85YCo0Gj/Sw2kbVgu6QbrKK4q4P30fC/2ytcY1
 53nOeZWogVt9xU+JIr4E56SUmN7xA/Z27gz0JoF/ZrXc8f0bIVRKoJRV4aVqsScqZ5A+p
 9yB5azwcB2ElDwKkIpAL3fKXmbTewF6V9k7M6TOf4SGKwo/FNoP+/3NQVLYhr5Dyz3ESF
 2dFsVWkoaEW2GuVqXaZ2VWrv5+uvB8HLbRPGKK2NgRD3JlDgd5Un7X6fuEovEkBqqc6Xi
 ZzT5u/RpDkyyhWf3evOMRFEzbOHLRHCzYLeIAk3YalsSh7fPiG3AbfG5wIbaPGYHZXQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=riOdUpq9; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::336; helo=mail-ot1-x336.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=riOdUpq9
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6C04440B20
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:34:15 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-847ac7ccd85so816082a34.3
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 13:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792614854; x=1793219654; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=pDiEB0xXMfxnnuQpcynpwJDQH1P+n6Gwlq9Tg/O4Zq4=;
 b=riOdUpq9qsA6m24n+6lFk4HlQ8b1mlvz5gnq5R/NQpmgaOeU6uZ6TdxrNXxfraSBAG
 Tc+ZrzRdGKjn2ADqbVPMZZ1NHyptK+TyoWuxKPQO0n4XxRyEF5e+C6QW/9vPacn5NO7i
 Au4dZjH/sGbe3Z436gbaKD5rrL8Li/loyT3KfmwDAX4SxjtaNUQ7Zo5GKMc9W6k22xL/
 B5SgiT01VKdt2zKMrK1r+6i8XuPwmVpXrA+wDih4liryFCRuD91B1VYFf/DCE60ti5Qw
 +7fu1V40ZdlR3/3QsIGi0Cox8U9tc+VDvfO79I0kAlQcBgc8fDGh2DyXa9BPrOfTW/tQ
 luQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792614854; x=1793219654;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=pDiEB0xXMfxnnuQpcynpwJDQH1P+n6Gwlq9Tg/O4Zq4=;
 b=nzVim+zt6T3vLxOjFLfxGVp3ThQTaW/LM5F1H4SqgmXrX95FW9wQ5s/6ui9UzeILTQ
 9pzSNwqZt3D8foHn2DltfpEVC53OOF0jzNB5v+S5EZuPVETyqP7cP/cjPvdKpiQjDxYd
 R/ezm0t32V5IJd/CheA5TSWHaw3WeM3zrUrSWVduH5vpTUilZpTzmsxC7j76GMvyMkwB
 jNACH8IwnsJIzmCYmRbVL9BvqK1X6PxmG6GiOfh9mee3HhQ9NqlmphfoRKrLxu7/UVOf
 D/b2h3ZwMbuh4tYDCLAkSws91474puIJKG+uzOtQ1wy6LrnQZzdutuqDPjDXNklwupHp
 fw4A==
X-Gm-Message-State: AFq9FYJNQ3ug9EXxoCdGJjQwSg81mkKku4kY8dtPHICMPc4QDw5YVqCG
 NgMM8r6xISHQv8LGuf7Olam0LsjKm2L07TxfzLPIp2JKMn/YU3AzWoWSBXuIFw==
X-Gm-Gg: AYBFou1VQerij7FytqAeuqzI2Y5psx1X2aMcp3gOPCSx21DR0OemJvg5uFLzthB3be+
 kOk4WZGWZlTSOPcUPBiZW7/SI+S/D2NO4sN84g/K8OGNfFS1Gxc0fsjE/eWqJAPTlurxlCqdci/
 JZok0AuR0AFnuxInHHsruTmMp2DbKy0Vu3E43w8lE9LBlUCQB431xLCCmUU4NKbmX1fIRHlYgAa
 hh2BcMxTydRlgZXcnmT903ipL+laj86m9JjkoGQycK8Voseq5KFSTrFAI+Q14qo8xH3YLE8b8Ul
 Q3AiOPnAC0p1Bi2dkVHJOnRBndw3cR1NUDxSyMm1/2X1dKJttXP0dh9IYbQe4jx2a6xIOP3mURd
 RSzu0QPFeiWZ98akMUsIM7aQHc2BxHeWaX4zEWa6WZ5c+zqP2vXFP/aZ/15oh6NnUy65whBhYvv
 iRARccZBtcZ4JWOd/vIPGhBPymHhtS4BIr6gkOu5BcmLS6PWP+LDuiuxL1XeCyGTXySL2iVtBUD
 glfSUmIZmCtjbMlyv2UsALE9HEK30UNo6IkjGxjtQgevG14eyYph7t5XcyYqn7HwaBXBTMS5+9X
 iNRyZrfcaDJXrXoSUrJ8h19G+lSpeD/S0+l6C/aR/tfvCo4hjGP+Yt06rnLhGWZEerPKwGmbHMs
 t2fJanvAd0cSL+eZuBX6k3L3NGWqNvzxIgVulNJQZHsQbdbP4Nazh35vUHmHaZOvPyJF9o6Rq7h
 dWefeDQK9F/nbLyWadjqKZTxY=
X-Received: by 2002:a05:6808:1a1e:b0:4f5:d3bf:edf3 with SMTP id
 5614622812f47-55360d297e1mr1997137b6e.59.1792614854060; 
 Wed, 21 Oct 2026 13:34:14 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-552ac8e9463sm2647696b6e.2.2026.10.21.13.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2026 13:34:13 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 14:33:56 -0600
Message-ID: <20261021203410.3114473-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261021203410.3114473-1-james.hilliard1@gmail.com>
References: <20261021203410.3114473-1-james.hilliard1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 02/16] package/python-more-itertools: add
 host variant
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Enable a host variant for host-python-jaraco-functools and
host-python-jaraco-text, which are needed by the standalone
pkg_resources package.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-more-itertools/python-more-itertools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-more-itertools/python-more-itertools.mk b/package/python-more-itertools/python-more-itertools.mk
index fa3d859905..6fe90f84ac 100644
--- a/package/python-more-itertools/python-more-itertools.mk
+++ b/package/python-more-itertools/python-more-itertools.mk
@@ -12,3 +12,4 @@ PYTHON_MORE_ITERTOOLS_LICENSE = MIT
 PYTHON_MORE_ITERTOOLS_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
