Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FF7606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bnVb06Tx;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CrNW6H34
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C349A81667;
	Fri,  6 Nov 2026 21:19:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fGvxqVG9E0tF; Fri,  6 Nov 2026 21:19:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DCCB981663
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999965;
	b=DBchkON524xC1oEmfYsC+25qtgOtZKEcUhp98Kh5V5nH2eCK4JgVB8XN5Kpf4DWSaZW9
	 aiAprydROST2FA/tecgg3GbtcVjPA9foWWZ0jptca01tjPQEw7+q/+HzyZQYdaa768bZ0
	 Riiez3JkWjUrIbJtTjkDgHA60dARaho20AJ7MRxOKYV7/H/uWa8//GtW5UKsifrxt7/v4
	 zxEKXBoy7j1HlUcoRBUb69hiBP/V/4CNlzs2zUlDwhe2y4yJIv6S/xQ/R2kqz2+V46Pom
	 btcQugZSz/TxgVjO0j1VsK4tf1cWkHIwcfb7Shew+5noWzyXYW6nQvzmJNGcayEAPLg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999965;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=rLm/LRhzNV/sJ8KZQOkFy+4h3PeFXYSvKTmMaIFTVO8=;
	b=M8v+RPfUe/IocLsueLz192y78xApkVTSjHwFlw5s9YBPQgg9Tp1wu9k4/QegevRDwOUd
	 6BjjBmSV2Qgreyi2v102k7+hAWdOtR6cNnScinUQIOWyEbf28qGUtHMxyDdfpIr/4aT95
	 xBZUPy8Q4ClQvZN2K8orwe9Q3Gb8hfz87CVwQhtfZgFTQxQG8KrayHQO3SNcHJp27ZY5D
	 gsMsFqweKBHf7kto0ajJgxtpDg1JrZTff2TxmT3CUOTqrlY8BBvMJbQFtF4j/U0wT429e
	 cbE5QG3z3gj8ZiIEWEiMk+55uFfxkP0L0ZIKbz6v4E18phG99SDYe6/0jJqOlm1YZYA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999965;
	bh=rLm/LRhzNV/sJ8KZQOkFy+4h3PeFXYSvKTmMaIFTVO8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=bnVb06TxE/FC6b81WniknQbve4b+HQqckffEVxZ8mtnhZDVQg5LL4mySEKCwnEOcm
	 fxYFgEZlEOLWMA2VywCy3C1Zu52Kc3JdbaQOzM1gb64p1sf7T3x3Ci/Zy0NhotN6fc
	 P15uUDsbd8Dx0yZmTJrW0vUu9GxlzW6GSoqAx5vLcRBGb3uzi8sm2fGPkHpicbH1Yv
	 /KSgH7nGvp3KhhxHR1qSDsQesSHpf6LzfI/bIikhh83V+JSzJQdl5xUgsgCQVVi+IX
	 Tsc021UHKpE4qnKIKIwwMtpNqKWBIwDPzYI87KfaMXjTVFYbLVfzyQnXD4vFzG6Bhj
	 tpuCJCcVfO4iw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCCB981663;
	Fri,  6 Nov 2026 21:19:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BCA131F
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:19:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2DAEC403FE
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:19:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oQR2tcYotTts for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:19:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 31150400A2
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2001:4860:4864:20::32"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::32; helo=mail-oa1-x32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=CrNW6H34
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 31150400A2
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:19:21 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-4adaa0f72abso63617fac.1
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 13:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793999961; x=1794604761; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=PKrbKMHtuLn7Mg8kZ7Yr52PiyPIMrZFXvNOmUR4kQ3U=;
 b=CrNW6H34dCxW6EbZdDC5EMTl/ytRtuc/xQVqKOCwTLPtDZEzfAd6HKm4wBoV4gtJ+a
 5tv2tcM0WFthBFD4shXQ1t6/9OW/B4mhpb/d31fLnBVFIxlnkIKnQqEAeooyer+1OQeu
 wpYgYtqVqR6Ze/5bkrr2sg8ZCFbVs04ov9lmd6qAnLpra/o8qY9e1OB3Ukf/9y/IgtgF
 ivZrKf+Dy6sBkoqigNFwZh3j55CT8klGW8E+e5GY6q1Ka14rokFej+wRDWNe7/i4Vw1S
 kb/ZfRS11oNRlGHuIqjdqCjT/FQXt/jaG456PqhQA50UZPqeJTy0V61EsNmME7rOAfYR
 lvfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793999961; x=1794604761;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PKrbKMHtuLn7Mg8kZ7Yr52PiyPIMrZFXvNOmUR4kQ3U=;
 b=a9hS1mjnNrRjUKePgNtg9bbzye6dK9rR9Fui9rx7AF9PJYTbnnF9J1W/vjGF0HhbzW
 pq0pU2y9Rtk+nTFGwaKdzw33/WS0Mw0diJjvvS96QX1u9GU9K9bCqyECVRJn3QrhJl0b
 XxHMbOJbOscIX27Og//3bhO9dxkNU7hpkWSU5qcuXfdmtEeBso7oop7NIR1QGUsCZdE7
 hr/kbdLXAt+GSc+Nn5312/ha8w6sVzv96yDn7zUYFQlCL0TlWbxLOZh63k3DLCr6Pq90
 P6WrzUfroEO++1QzVtRonrSxF+z/KBE8ND/+fDusGzpFPgasInKjpjbcBPZW2d3sMeBh
 fB/w==
X-Gm-Message-State: APuU4Z/A/8SFkRu7RO8k8h1acCuYENvqDoD4yx5ZvUEyqAbdqN3oFo5J
 u+WilmAfps4xPyxUlonuH4IG3O2+7qoQWV/De5H1C7qvJD9HX3U8aiUm3XZHOg==
X-Gm-Gg: AYBFou1Sd8SSjEz4epzVnUYNFaqzUKx8gzGbCJJgwrMOv3VI3TAAF/u8xuS3DaJNyct
 80U4AigxCdHEzTMIgl4FsrXtw0rMhojiCRJpHbKctoky+jIyT818TO0JjaaIFQvVFBrgZMQX+Xf
 2ms6ycs08DWm0fPRCTz4Lm1wUgIgLOEP9KFqunsr9+2wR/3Qf+DLzbW8Aog+8TvZPIN8VRA1/MG
 nELOLjR1Apy3Ghzq5dt9gQ5GX1KZKaMO/g8DDc2oznSM67Ps2aPzQ8w6w3gJzWMFBetaNFCyL6+
 pmJDhTByzQzU+h/kSjO7MEe1ZE1cMVSGRHSMXk6whfxNF8ZT8WKL1J1KMclbEhenIzGaLBA3hTZ
 VpiG1XFPiPlnLzpjy2gdT0U4+lGT21HrCrIF+ocSgWlKmPdkirX6OoCKGn+c5VUzDXnen+hdLAw
 3vaMl4etPH9XOVXy43llvZ97RHuo3GngAcpjbkaHnAjH3d/OR57SdjelBSYF1TsgQyYGDqGe4JM
 AC3Lp2+747kFI53bpW1FPB1UASJ1qXvin0HdcK3vbWz14IQLPJypk/9TqUd3uzVoDz0n2TaP3ca
 wFYBOs02KNHJVLFUlzvwkZEMW9gBuph5LXyH5LwbTPY0dqHV3Wh/a8E2rFpvf4PUvVPsfKrwqkw
 LQkXUSdZDh6UU6pE+rrhG+UC/MMsjqUEYa3oZoqgCEJKi7IzC8I6nuSEco6dt+YDY7eVaU789ar
 4W2TJOX1F44/8XWRrJC/WbfZcxLI+mgbOVEI+GV/CwUtk/pM35Nz9F9I2yDnjNwMFiMh4Fizfr
X-Received: by 2002:a05:6870:268:b0:494:c059:f55f with SMTP id
 586e51a60fabf-4adc0abeb09mr134820fac.7.1793999960056; 
 Fri, 06 Nov 2026 13:19:20 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4ad979d7032sm2873593fac.7.2026.11.06.13.19.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 13:19:19 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 14:19:10 -0700
Message-ID: <20261106211918.2606369-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-click: bump to version 8.5.1
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-click/python-click.hash | 4 ++--
 package/python-click/python-click.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-click/python-click.hash b/package/python-click/python-click.hash
index dc080ea79c..e1e0d1154d 100644
--- a/package/python-click/python-click.hash
+++ b/package/python-click/python-click.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/click/json
-md5  39f57e4f423de0d075dd968c29b01539  click-8.5.0.tar.gz
-sha256  ba0d2089de75ea0310e2dde03160e6ca10009947fb95a182f9b54021bb272e34  click-8.5.0.tar.gz
+md5  c14d89eb9273f2ece4ae6cb7d3b0ed90  click-8.5.1.tar.gz
+sha256  9bbfada76703fd1d784b83eea012e3e8c6a001a876543ef104fa56aaaeb072b4  click-8.5.1.tar.gz
 # Locally computed sha256 checksums
 sha256  9a8ad106a394e853bfe21f42f4e72d592819a22805d991b5f3275029292b658d  LICENSE.txt
diff --git a/package/python-click/python-click.mk b/package/python-click/python-click.mk
index 8dd3d25f3f..f6854abc17 100644
--- a/package/python-click/python-click.mk
+++ b/package/python-click/python-click.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CLICK_VERSION = 8.5.0
+PYTHON_CLICK_VERSION = 8.5.1
 PYTHON_CLICK_SOURCE = click-$(PYTHON_CLICK_VERSION).tar.gz
-PYTHON_CLICK_SITE = https://files.pythonhosted.org/packages/c7/0e/7fa0ef50764b67090eca4114772a2abf8b6148198475e54c660b97caeee6
+PYTHON_CLICK_SITE = https://files.pythonhosted.org/packages/45/37/edbf1b0707709013c0cf2e8317e03d97ed29bf4cac709fe328904ae92a38
 PYTHON_CLICK_SETUP_TYPE = flit
 PYTHON_CLICK_LICENSE = BSD-3-Clause
 PYTHON_CLICK_LICENSE_FILES = LICENSE.txt
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
