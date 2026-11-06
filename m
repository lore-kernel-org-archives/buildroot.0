Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE5E606A32C
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 19:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Y5/PoK0m;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F4tPq9yO
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FA78608BE;
	Fri,  6 Nov 2026 19:16:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tn4wX6ISL2a6; Fri,  6 Nov 2026 19:16:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org F4101608D0
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793992577;
	b=fWn0sj/6fvHBAk/i8tMRpHEzFz/75WGWT52KcBglZxc98qSBdUqX9iZzMgxQWSkAanw+
	 eXoABgzWqx+atQTcHxbB0Cyj9MKowOEI8xjJIKiwaneo33sDUAXBeD+HrrV53SOzj9J+N
	 lSf0Eq0WMs+czMXIP/jeW5u+I0yjK6hM7doA2pT0i4S51pw0fe7fFj4HJUgV7JpdB40EZ
	 LOJ65vk/oa51kkwscQ9TY5qKXOjvpaZcqe8RqfDunNq20WdEnNlph/NlS2ifeGy3wkjGl
	 E5GWYWBGcFq0AGj9Q7APFLlzBGrVpJRyMv0mIwWiWmHcvYkLpZRwYJpRqwKX1alwftQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793992577;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=C/9lN8qQ3T8ujW2/mYnAnojmCUnq8VTPbfuOF3KTQac=;
	b=ncvhg7OeW7dFCi5Ci2b7FJ83IPMYyacv+Ft5L55lqlEsIQxNW5izlfEx52X8o2oodQTo
	 q4f4MTGrbA7ayWM4zO2mVyvlgs/EV7/5fHbKTwttX7hMbEY7MVQxG2m20islUFw5Ghgvr
	 okZFoGOnsuemLfmGuH2HxtV03C1h/E7zlKLS0Ubk2ivRWx6o/y7JTm5UozMI/l4WnalAc
	 wKDEhIVoPzlsWfLqOTW7fi4C1S/QdhGgXRaVM2GiyKbnVYxd7mYEelP/saynoGsL4yOZp
	 RDM9AssEnHmCmlcwN2QBpock6AvGAYqtuuwcIzTSW1/5DJQSUchtKfx4K4uTn1JqqQg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793992577;
	bh=C/9lN8qQ3T8ujW2/mYnAnojmCUnq8VTPbfuOF3KTQac=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Y5/PoK0mZ5rmoTplwXo49rtHChAVcGlFlEOF/oYlDd+RBpvme10HWZk7NowCPcSSR
	 mJDsGcqzl4aUhzE8LNfDuSStkOQXnECi4y+x9TKcXSpRs4yhtrIjLkrHj37+a4jzu7
	 I9ED6ldxE99odXzJW8NIYsk3YW87aaflzCf6n9765YDdPxl7HQD9XT4dSuQ/X6zRbI
	 ylfDJyyDwchBY0Df56SS8ix79IjXhmSXUMF5gPbg9Oz454+hUFVc+JlXJCNuIm0coe
	 2xsSRMFSOI4KX2UMn5kJye0E0fbUm14j5t3zT0SgQCsGEv2c9WxyVmhwKucxIKIOJ0
	 JDPm6S+czY+CA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F4101608D0;
	Fri,  6 Nov 2026 19:16:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9CD54362
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8314E403FE
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XRGRVhJFEnDx for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 19:16:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org AA19540400
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::334"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::334; helo=mail-ot1-x334.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=F4tPq9yO
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AA19540400
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:11 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-846566246e8so908407a34.1
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 11:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793992570; x=1794597370; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=cXdr9kyeV41XXtbo4/VxcduABa8IoLmd0qCuV6cBZyk=;
 b=F4tPq9yO+B9XopHUHwtRbr/OB0myVmTsjGboGxPBGRbR4MjsROfMQwoC4lsDHGp4O9
 1xOdgcqthVxXtLlIf8XE70zQFEc2p0lK6pbRx35ZCguDnE06v6lVZMZOYA5tv2T5fkBR
 4bqqafSSs64TRxBESQI0AFqMzrKaL1G3NZFsb9emr89MTB4C8esF/a+cJmhZxS8s4ujx
 2H2TLgfUNZQ23Nsy3uufDQZQbOaOTrjkqXSuT0pUW/2q4sP5ysid/1JE7O94Xponpq2R
 p9UnYussAU3Szy3lEOPhnwGWLceL9KqVLzjTLWQxy8FHKp1HWy0W1dxEr0CWVh0mZgS1
 e6zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793992570; x=1794597370;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=cXdr9kyeV41XXtbo4/VxcduABa8IoLmd0qCuV6cBZyk=;
 b=hfmwiWYdLGjEqLxjyhiPeMH7wdrdrfnkLMsnLQ3RyJrT/3yAgImB7EXwcpmnAqRuh1
 t6F1LfRUz1C14EH0qLiPWZFKuEYvXjonT2Gq809TcVIblJm2dzq/8xXTtXH6EG1AfBPq
 zrtsZ8Xb2BstzxQUZT8DdnpKbuWwuavgtN2rY2VVBBsaFhpysXjbEc+s8gI2O/NYdf2D
 /jHbTuY5MH4eaQRHIhxnYOMvWIiH3neczgzrkls/kou+b3Ol5WJOHO+78ZX7HIKAYr92
 76EQQg6bgd7e/7+QDO7CsfDhSjDrfOXmyEmbwtQbrRPwaRiBshPePytnJWn4YJLEKhEZ
 R9/Q==
X-Gm-Message-State: APuU4Z9MYp7pnPUldk2egENwjSvkjrE8cnPmb1G+12TVZVamt5r0uhjt
 z3/VVR2y/NccUXnAiAHGBsxRrmNkgQINi5qL2cV0yXsJzlY00vQeqGUKtfFmcA==
X-Gm-Gg: AYBFou2YML57rLxOJGD/NO7YznOA7LazymMKw1+YL2b5VNKTng1hg7thAHph0Uk+5NM
 D6DxcC8ZmOte+U59NYWbvZb1xZzOfk/8VWg9NGCn7KEVVDvF8x6tI8ZdKAM6BbI0SRY5ECQFCDS
 mcrr846GfqLhrSM3ZyDnX58A8SDLkcTJevd2rj6L/GP+6B2aQ4/LkHFtszxnmvn5lSJP7d1PWQJ
 TbhjNvuwd82P8dROfkec1rIfmxcYOinJzHMXnphwzXUnnt7OHoloDz+p3Fu7UYVHmUf7yoyPRVb
 +Gjv5KjsjjwYDeshUU8Ivj26EwblgPlbVFRmuzQiJb26wVC/UCE25rRtj/X7+DIqDOI2IqsCjlL
 THD4YatPSXO5V5DgLcWj0AmZTewftJLXMvsavLzteIZoOAveKRYUozDFrSTzJ26202ckxRdflqK
 CuFQ4ylFy/01LZUe2/tpGnwA7Fu1TJzjDXCQ857OdFtCB6jv3Kmo0XCPtugV0e7cF/KnVQ97Ibr
 ucsk0PR4cbFw5cWY8PWYKCGxEOiDuR0faIPAp9+UQP1yG4nRetqt+97piTSxihwXtwloLCWsDla
 KOLAtgfQOv+1B34MqeKlQ9ZERrdyiXSfoJ5I4G/f+Mwmne54DF5yhrtnlTrobrQC4m7BwvUQwJQ
 KivoLJCcqO3PPBhsSgsp1isdofJi+3/6jbHjC3iTmPuUpUVmbA5dla3L3rRyFs7UyZoaLsUrvUi
 y6VEKu3CcnpgvOa8ACswTz8wE/F8HbT7r278dRLA/Ytt95EwW7xXu0nBDJf4ckurIzdd2iLOKqX
 FpZonjHsdVxqgPRhlGyTDQ=
X-Received: by 2002:a05:6830:82f5:b0:83f:2c3e:e157 with SMTP id
 46e09a7af769-85f1cfb6b9fmr2120664a34.9.1793992570632; 
 Fri, 06 Nov 2026 11:16:10 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85f1de4e53dsm2478655a34.20.2026.11.06.11.16.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 11:16:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 12:14:41 -0700
Message-ID: <20261106191536.2120153-15-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-ipython: bump to version 9.18.1
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
 Philippe Proulx <eeppeliteloop@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-ipython/python-ipython.hash | 4 ++--
 package/python-ipython/python-ipython.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-ipython/python-ipython.hash b/package/python-ipython/python-ipython.hash
index 3a5d5fe34d..921e9db6b5 100644
--- a/package/python-ipython/python-ipython.hash
+++ b/package/python-ipython/python-ipython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/ipython/json
-md5  05d70129fbbf763d51ad3d61f179926b  ipython-9.18.0.tar.gz
-sha256  93ec98e27d5ce494c962758111c7dff1ef45f9efdd55604ae70a7d4cabb3e1ea  ipython-9.18.0.tar.gz
+md5  ce98d6db5d3019576ff79b47aace5851  ipython-9.18.1.tar.gz
+sha256  6319c0f5372c196397899479e6db1783dd7937abae06815d1317e8d5d51aaaaf  ipython-9.18.1.tar.gz
 # Locally computed sha256 checksums
 sha256  8387aac32433e5b121c355aa9e6ce2b9a399da7edd59ab94b19d4f5326b1ced0  COPYING.rst
 sha256  e0e390748ed440ab893ca1f135a88a920aaf5409dbb90a5b427c75c5e51268fb  LICENSE
diff --git a/package/python-ipython/python-ipython.mk b/package/python-ipython/python-ipython.mk
index 716d75d386..c6450f9810 100644
--- a/package/python-ipython/python-ipython.mk
+++ b/package/python-ipython/python-ipython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IPYTHON_VERSION = 9.18.0
+PYTHON_IPYTHON_VERSION = 9.18.1
 PYTHON_IPYTHON_SOURCE = ipython-$(PYTHON_IPYTHON_VERSION).tar.gz
-PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/c6/9d/fea7fe7e360b6a4992f00600445849374675d82d665ffc194aee50c314ab
+PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/38/04/0d945c72d5b77527273ecb4c66aa2436de7a3b3bbe3da345bf053232b886
 PYTHON_IPYTHON_LICENSE = BSD-3-Clause
 PYTHON_IPYTHON_LICENSE_FILES = COPYING.rst LICENSE
 PYTHON_IPYTHON_CPE_ID_VENDOR = ipython
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
