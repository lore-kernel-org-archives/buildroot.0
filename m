Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6CE606A31B
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 20:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bjg0uN7G;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DNs3Oe4q
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59E6740F7A;
	Wed, 21 Oct 2026 20:34:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4i1rfrh9BxYD; Wed, 21 Oct 2026 20:34:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8079540F56
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792614874;
	b=tWT6ZZInjivuPp3a3LFADwv0IH47llw/97OWhMTtxbHSEav9Col9jzfYhQf8gnce/a+b
	 MO8B1q1HEXmpvXMvnMmH6suO6ZPfSRSabdNiRN1ekFkQqIlFONzyjwT4P+ocZkM2izm6E
	 g5R7y2Oz5ojA/PIxQZBB1OsTew4RUNjgNeCt3HceVOe/yoCe7TJXKFSNVRGJHRWOrzUZg
	 zPrST0aadmc/WonUnbWY+2bMu4vUq8avIHxl++0ZsubTL3qQjUzh6OIc8fLyf4quO1bFw
	 zJpCEFcvJ/WLZmzD9Q4YExnsZSQ7D/3kfN1yuEjFo4ohnd790Npp/NukUqt9RhQkzaw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792614874;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=1avbFOVlOmmOQKaa7EU4QT0lfy/kyvDkMmgrNKDkqa4=;
	b=MSvja1xTi3VOK4talYl5vWRXlFqPILYa1iakq7gvKyE2j0SVQc6nQAWmbTdGD25bhvb6
	 NsK9/56BZ0gCiITMAuVGq4VN76fPpi7wrE58nPNAi/gpP5sHGOGBlaUPDlqABHxPyjft9
	 x9Hvy2ou/3irPOXtFy+a4aO8MB5Z1iQBcnxPvlsHR7t/Fdr7NdzF9U7DejC4OBnuFetHp
	 kB8xiWP7dWzOwyBlItgnYe5eBs9aUkQNJe5N6/x4lCNfBtSo5ZrnyHHFgO3lqQz+L/KoN
	 6+CJS7vawtmHnqmH10VkI8dphRwUH/b23bVI3y9KpGk7rzeLa/MKJiJWdYuojdSEuKA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792614874;
	bh=1avbFOVlOmmOQKaa7EU4QT0lfy/kyvDkMmgrNKDkqa4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=bjg0uN7GWy+0UGDoRCY11UNnCISUKYOq78b2zbY7my5f5yVQhQrmB+6LxhSq9uBZG
	 KBjif85aHzxQ5Y5XmlvsuECB9WRJr7GPatcUIuGkRbb8Lm8qvj7vLx3egO2eHHvzWJ
	 A5eooULpEVwqWXmQIiMVP6Sgqm75BYXFHZ2TiBuAW7FG0fm5aETlIvl2QiCIYULm2H
	 wmQePrSoI8W02ZoF19D+8J7bVzrVIhrflGR2TSvcepnckkusyGlKn+PDTSquSvO/Gw
	 psc4nKkwhVU4aXEM1OCUhLFJQtzoImfBOeqVw5G+nolUHR+kunjAqr8fa3c5nVE2Oy
	 Csb1uJY/Yjmmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8079540F56;
	Wed, 21 Oct 2026 20:34:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C36E7769
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B533B4016D
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:34:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BrwBAudE0KNS for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 20:34:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 1202F40042
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::229"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792614863;
 b=GFMtS4bKiMDKFxAyPdEQjzBt8iM/4N8jrGwNXcgqno61t/ydmEcMdXRhq2w914S5mzsG
 szkyo3GVgZE0W8ybuBAkxe6hNi+yU++8UJWP6eFL22951Hf8tOroXQfIB/YagM3Ry/60d
 ciHLq9VxfLEX/t93R9VVe9xhHBANpz5CgjA2XCq+n7i5boMP4lPE9zhe01h+vxKZle6pO
 ZErlr/igWKFabiOew5Fb1cbXdwrrJ7cgVRJBkpgz/Yf42vyL2/tqI6N/i9dNXNC+oClqd
 nrmhCGlhPNOhKbFSQZugY9l45IjumrTmqAzl/CtTAV4IA7FogjuFtgBNB7LaKz4xO9g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792614863;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=zIUaWi+TP5Ra245b2THoLRDuzC5ZJSbbnAOXNTkiGyM=;
 b=RE3A0lQfYgTZCU8HQc026YP1l8Kb/rkN6WjhiJKSkpd0iDYdpDbE6BTYp7gj0IwyXBeS
 Am7X1NIz/Dcp16Krkaq9d8l2WnSEjiyOMqcvGssYpCYZK9ThQp/lZr/d5v7RdkrjYLYJA
 nsYQz7WQ4foT/V/EtCdzvz8Q9D6vMSjQrIczbRfQprEg6H7384wRxm96/BiPtseGELd73
 3eAapDux/niGCl8cX4Nf4TRgyLigcnlCHViY/AfQ7W2RfocZ7H9AxazNJZUvuIfQgARaH
 idp7ELZNjiOJ13DI0QtGMPq3JM2+bz5mwcWqdDbz9RiN3HB5XgLBxIuEXK0qVmqkLzA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=DNs3Oe4q; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::229"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::229; helo=mail-oi1-x229.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=DNs3Oe4q
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1202F40042
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:34:22 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-4e4a4d77e5bso175514b6e.0
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 13:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792614862; x=1793219662; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zIUaWi+TP5Ra245b2THoLRDuzC5ZJSbbnAOXNTkiGyM=;
 b=DNs3Oe4qg6neVoRhxupJ9G531EcoJaQK9VFRiAtIaSto6qC/pTE885QsTNY0Ct9pZD
 jKxTns+6lJ3iyMhlbiddhAGyVbm5SiDt9jekjasgeTtd6AiC15SVtvtPU6Cq1afc7HT5
 vXRtXXgdoYtuJ4+qbnerg1YwaBBDcxneTx9i5kabZ+MlAPKyjpjnX+rkZ+yhCTnYTnaf
 zswPZ6UT4z/ZIz8hC8z/sqdFIhP7gxSxUTOsjlKHoC5WncrnzxPk1+7s3dfcRvgJXjnn
 6aZrIZPSzmUEfCa10wX2Z7LKetxYy8/Ldu9Szntw6/x4AK5puJAFx8CpkuD0zKwJ1Lra
 OLFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792614862; x=1793219662;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=zIUaWi+TP5Ra245b2THoLRDuzC5ZJSbbnAOXNTkiGyM=;
 b=mHHbi3uG4bHuMZdJ1IppoqxW0jeAs5m3t+RZ5DZbDVAzMW3qdDOpcoeX6WhcpN/EJg
 drNE/m4CbRjsL9vWhYAqfLE3r0GGMLDZjvAEtII+O547JDQgSXpcJVrfSz9mnYJ1vBtk
 KbbqXhmpSF2vo6ydgV+UF4nMjrjw+Wbb7g6wGSMj0pR69ZqsZjBcy8EOBgX3QFywJxpS
 by0wqWSK5vUoA8cRqYdXc+movCTAQtBKX9F8vQfy0zhhmgESTLd79n9pUOuJYdF4b3DI
 pU8+BveNeCKY0AmWq8I3zZD8uYr13ymX2vUz+o6TMOmon9Ks9LOQ1V6qP8uq6itYAJiT
 oiEg==
X-Gm-Message-State: AFq9FYIZ1q5o9hHSagyxsUlYb3OWRZbMqvThFsAGjq3zPJvWRfukkc2F
 iSuL63PF6iiRuS1InQXM6qgixSAJ20fcKVrf36MwJzbkdv3Nui4ndmy2u+eW9g==
X-Gm-Gg: AYBFou2y7A5w7CD0YR7gz1fP/aBrv/pT1LdZme3+pkycvyW5+9bFPsvH36D+eyOWFwT
 XjJDXANIPDFCOXiP+7GjxJ8j31yui7V4oMap8/z3+yC0V1xpF70MaHvy7rUTSja8fKoFyC8RRQi
 CnyM9BrUQchAjHn17niod6GnvMuKGtp9zIwarekT0aXzzRK+JKf5A0TOXs284A8rqZ15M2sq/aE
 BycsqGgurH/5UI7cn29EDR+OC5kkj/YgMfFnLCUOMJHbegGzHr8x1QMJPMn07TveSRM2WdqK7JK
 ttAGOkAopVLGhvH1I91nrzr1ntp4eZIkahcBY1JqlaKOEkAQ/W9LJR6kKIlHJY3/Jl6EKSKduMI
 b+a2MvU2jBZSgqdlG8b6gS4hp/LcmSKWRHWuTpKw2tZ7TXgcC/nD5ejfbm6OqCshfj16hExlcsM
 1dS7oup2vcDN2X9CeJVRp0DaEyto0LcOP2hgvS4m39MzdzMnGgIcnBlSbcCpSrXGbunQ/OJs646
 BwykAc1UjVyCPYTXyN9HXstipuWfPbN1G9rReCm//Z0/thmVAfm3L7YabaXazGu5/fM9GNRGeDE
 L2cvfhHYzl7bB12c9yt8JIYpntlI5wxUf62KhCdw9CUI+ZxaMGmFXRy8f/gyP3xUCXI2b+QEcin
 xjNxNNBnMiO3R/PVy3xyUnDgwVu02sOIiBRcMZfyUzkIDcKGaYHMAPxgp1cUjO68PCn3+mpJBN9
 nsJkgkaFEgnJJDx6wOPPaM7wfxCj9cdqJ2AeJW7vOMLbwR
X-Received: by 2002:a05:6809:141:10b0:4ca:97b8:62e7 with SMTP id
 5614622812f47-557de999ca1mr209391b6e.3.1792614861838; 
 Wed, 21 Oct 2026 13:34:21 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-552ac8e9463sm2647696b6e.2.2026.10.21.13.34.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2026 13:34:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 14:34:05 -0600
Message-ID: <20261021203410.3114473-11-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261021203410.3114473-1-james.hilliard1@gmail.com>
References: <20261021203410.3114473-1-james.hilliard1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 11/16] package/python-typer: add host variant
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

Enable a host variant for host-python-typer-slim. Include its runtime
dependencies and the pdm-backend build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-typer/python-typer.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/python-typer/python-typer.mk b/package/python-typer/python-typer.mk
index ca0d1c6ee7..f9f9af59e8 100644
--- a/package/python-typer/python-typer.mk
+++ b/package/python-typer/python-typer.mk
@@ -11,5 +11,11 @@ PYTHON_TYPER_SETUP_TYPE = pep517
 PYTHON_TYPER_LICENSE = MIT, BSD-3-Clause (vendored click)
 PYTHON_TYPER_LICENSE_FILES = LICENSE typer/_click/LICENSE.txt
 PYTHON_TYPER_DEPENDENCIES = host-python-pdm-backend
+HOST_PYTHON_TYPER_DEPENDENCIES = \
+	host-python-annotated-doc \
+	host-python-pdm-backend \
+	host-python-rich \
+	host-python-shellingham
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
