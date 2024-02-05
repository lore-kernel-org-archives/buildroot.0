Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE00C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 16:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C7E940459;
	Mon,  5 Feb 2024 16:46:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C7E940459
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id musdKTwr5GWa; Mon,  5 Feb 2024 16:46:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 01CA040468;
	Mon,  5 Feb 2024 16:46:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01CA040468
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0A07C1BF2C6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 16:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3A5D416C1
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 16:46:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3A5D416C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z4Y7YGXJJ1oV for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 16:46:23 +0000 (UTC)
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 08315416BF
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 16:46:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08315416BF
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-7bff28b2937so187582839f.1
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 08:46:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707151581; x=1707756381;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2B/L8q224XKeJFOobZprdM2W23NdYE0N1mDI9LmkRCE=;
 b=cYjnV0ZDbTna2zm/ZI8BJEtAit2yzrXv+oKyhLFZ+nmsGput50UkYO5AdctH7m82fd
 GiNg/AUj2X31S18NV1+04HFIs7bUWHN2za5wPBjLabVZES6Q16CpccZHOyMNmdmlsKji
 SMjvrsQ9iJJew6ZomV3Jq19Lqtl7OJJHShI+gwQPyLHBQf7WRuVH/07VsvGo3izTlYqX
 1GX/aYdf80vLlNn7T6F+3/Y2NomnmjtUHjoKFwsxphTmwFY6Lt01uXWw74aIPD85C1Oe
 9FumCNmuimV2e5WWplxdU8MsZ6WC3SkMDYEfNbCD6EQllFCc54gRlxr520IniSCHa4Lt
 So8A==
X-Gm-Message-State: AOJu0Yz21X96yMcu73RFq+yLdDvH+aCYSMKC2zdZuA5cT8nOWp/hJlcX
 YX+Omx3yuNlEBidgnJBkujrEF66flbECws5LsqL2vklBMCoeBX7G2DuymzvQ
X-Google-Smtp-Source: AGHT+IG249OzDAu8wv+oZ9rkiaJ6WB8FyfDvb9sA1EZZvdozbasiE1cRAp7frzsYewYhQE8z3HnQFA==
X-Received: by 2002:a5d:8ad5:0:b0:7c0:1fe2:da9d with SMTP id
 e21-20020a5d8ad5000000b007c01fe2da9dmr133720iot.19.1707151581532; 
 Mon, 05 Feb 2024 08:46:21 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWePspZTebLKLFGvFHSz7GlRPxjePu8qudf3M/gZIQ3/Bze1EWj+rHZ4KUm61Vkcx0IedDmReVWLDDJY4+q33eVYKJYaBi+E4tSUMQiCnhdoDYMhqpX0Iov67zG5g==
Received: from james-x399.localdomain (71-218-247-10.hlrn.qwest.net.
 [71.218.247.10]) by smtp.gmail.com with ESMTPSA id
 dp40-20020a0566381ca800b00470ef7f3ec1sm36573jab.1.2024.02.05.08.46.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 08:46:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Feb 2024 09:46:15 -0700
Message-Id: <20240205164615.510688-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240205164615.510688-1-james.hilliard1@gmail.com>
References: <20240205164615.510688-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707151581; x=1707756381; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2B/L8q224XKeJFOobZprdM2W23NdYE0N1mDI9LmkRCE=;
 b=lAhHfihJ9k+Uy7k3IccF4nk4kV8KfgHTyzPHUU7WcppYWAnrPwKFpM6SKYVHLpPBAP
 d6gx+R2yG9DIGcNgY76SlBxJbltITkzURDju88BBQUr0GpoByaIDZBs6ijBoMbgq2nUg
 fITnwJx4elhUMns1t1AoPNkaEVyDGwxWBcZJSS9EgnXQAsp3O84EojaCLx5gNGgo2iSM
 dPTQSggMT1OwGIGKnw1KMgEoPukziKRGyfxHMIHIyzHdpPII7UpsgCcki8JOltuuNGrc
 1LHD60hCC80WCbcKeODDC4pQeviLP0gaD3suXkLplmDOqeLi4uRIj4T7t6Wd2GnyUCB2
 gb0A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lAhHfihJ
Subject: [Buildroot] [PATCH 2/2] package/python-fastapi: bump to version
 0.109.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index 3dc1578cb7..c16b7d22de 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  06bfa7c610fc9e81d05b0319eb70cae7  fastapi-0.105.0.tar.gz
-sha256  4d12838819aa52af244580675825e750ad67c9df4614f557a769606af902cf22  fastapi-0.105.0.tar.gz
+md5  b48191c0322fb5479773925af005b2c1  fastapi-0.109.2.tar.gz
+sha256  f3817eac96fe4f65a2ebb4baa000f394e55f5fccdaf7f75250804bc58f354f73  fastapi-0.109.2.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index dc6d919926..a2191c73b7 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.105.0
+PYTHON_FASTAPI_VERSION = 0.109.2
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/77/bb/5941e6e2ce3020f64b539a49d39f49be05de17d0c47fea95012589f812a5
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/01/d5/33a8992fe0e811211cd1cbc219cefa4732f9fb0555921346a59d1fec0040
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
