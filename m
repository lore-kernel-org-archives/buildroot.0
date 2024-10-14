Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B5AD18157
	for <buildroot@archiver.kernel.org>; Mon, 14 Oct 2024 23:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E29B6403AC;
	Mon, 14 Oct 2024 23:46:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BjNDUrLBD-M9; Mon, 14 Oct 2024 23:46:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80B01402E5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80B01402E5;
	Mon, 14 Oct 2024 23:46:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E6F661BF30B
 for <buildroot@lists.busybox.net>; Mon, 14 Oct 2024 23:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E238F402E5
 for <buildroot@lists.busybox.net>; Mon, 14 Oct 2024 23:46:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hedo_Iggr0Cz for <buildroot@lists.busybox.net>;
 Mon, 14 Oct 2024 23:46:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0E22240137
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E22240137
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E22240137
 for <buildroot@buildroot.org>; Mon, 14 Oct 2024 23:46:10 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-837b92bd007so272646339f.2
 for <buildroot@buildroot.org>; Mon, 14 Oct 2024 16:46:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728949569; x=1729554369;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tqhuBGsJoAFT2i9Uzjr023Gy6isZMPqVTtFmwvQi/Lk=;
 b=qI0tOZ2DhLAUqkX+xm3MpgAFcS3XNXnb/7oKLEX84CkyHY2vI7PQfpYcBNoVUbQekx
 ZwqMPFRugv65XXVMkt1C0crh2ybpmFeD7OjGm9amjh7pmBMH2Qvu3Q2fUPXSQZ4NmaAX
 gIiYc18vT5RBjx4Fd4A94zxw8IQAvcuWDFF1IF4AKuqwkpyV2FwIgEtArOjHyUMg+N+3
 NB2s/fwFAbvBqOqQfySk/c2VznySy5ToX8jGseL/Unsyc3bGwMoa84a/CanbTNrjmr7Y
 GuOuXneuJfVaNnYqj7Xo44+njVG3T2w1Z+8+80h5rMJ9UP4AMiB2mwZktXhRjyxC0n6S
 QFgQ==
X-Gm-Message-State: AOJu0YwHrLdVEuYs/tucW+P4PsOlYJdFj24qYc5yJvo2i1jrMpKRkIsT
 7Nrf/w2B/qvW1iKv3AKNMj1Sr9UIp4TNfwXizSVEoP+pHKIShU4ZFr8xvg==
X-Google-Smtp-Source: AGHT+IH52VJNTluFYU1MLtQYq3EU0RBTwHBk0ZbVGa6jSIldShPMefjXT6krHTcYgS9RcTGZagoMpQ==
X-Received: by 2002:a05:6602:2dc3:b0:837:7f8e:dfe3 with SMTP id
 ca18e2360f4ac-83a64cb655dmr779712139f.3.1728949569132; 
 Mon, 14 Oct 2024 16:46:09 -0700 (PDT)
Received: from james-x399.localdomain (71-33-159-223.hlrn.qwest.net.
 [71.33.159.223]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-83a8b50d10dsm3390139f.40.2024.10.14.16.46.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2024 16:46:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 14 Oct 2024 17:45:59 -0600
Message-Id: <20241014234559.3433222-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728949569; x=1729554369; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tqhuBGsJoAFT2i9Uzjr023Gy6isZMPqVTtFmwvQi/Lk=;
 b=aHRdU2uBMZ/wgK29vW7jqF8ym4Si7WoWZSMGM/aJsBBIRMyBMcE/x3L8g3ZBQeVq7h
 S440hW0cFGKK2WWnQJWREVJLGqETpSbELEJN2G9zD1JwERlwZ91Kj8zMNKOBJ+2R1rjk
 G8T1TSWab26xcbl9wBqsRfTPBEcFdI+qErcprrZ8mvgue+XWgWEYI8B4/P5620OD9Zf5
 tPQkLSjpitczeUO8ZgkjfllRPoHR856nQAGDmGqBjiEeGXw0Tba2NSl6JTEiDiRObvdi
 DD5/sCQ4cJYFRqO8DxDVa5p/WVUTsMsJjHch7cJv0rGFWUCsVSXQhYJWHHgtrL7Rf79T
 5faw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=aHRdU2uB
Subject: [Buildroot] [PATCH 1/1] package/python-uvloop: bump to version
 0.21.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-uvloop/python-uvloop.hash | 4 ++--
 package/python-uvloop/python-uvloop.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-uvloop/python-uvloop.hash b/package/python-uvloop/python-uvloop.hash
index 8b522afb90..24111e759b 100644
--- a/package/python-uvloop/python-uvloop.hash
+++ b/package/python-uvloop/python-uvloop.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/uvloop/json
-md5  c3395ddc1746e2bf4b2987d88c4707e8  uvloop-0.20.0.tar.gz
-sha256  4603ca714a754fc8d9b197e325db25b2ea045385e8a3ad05d3463de725fdf469  uvloop-0.20.0.tar.gz
+md5  adedf20cf065ff49a96813b783ec1d29  uvloop-0.21.0.tar.gz
+sha256  3bf12b0fda68447806a7ad847bfa591613177275d35b6724b1ee573faa3704e3  uvloop-0.21.0.tar.gz
 # Locally computed sha256 checksums
 sha256  377025287798f9dcd819e1f826fa5fc5e2f382528691ab0528c5cf8c8c282c27  LICENSE-APACHE
 sha256  6dd4c399f26de043d77a2ad7e31db4cb5bf08ea8368b0a42d6e158635cc8ab62  LICENSE-MIT
diff --git a/package/python-uvloop/python-uvloop.mk b/package/python-uvloop/python-uvloop.mk
index 3e2a84de39..fbdf74769e 100644
--- a/package/python-uvloop/python-uvloop.mk
+++ b/package/python-uvloop/python-uvloop.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UVLOOP_VERSION = 0.20.0
+PYTHON_UVLOOP_VERSION = 0.21.0
 PYTHON_UVLOOP_SOURCE = uvloop-$(PYTHON_UVLOOP_VERSION).tar.gz
-PYTHON_UVLOOP_SITE = https://files.pythonhosted.org/packages/bc/f1/dc9577455e011ad43d9379e836ee73f40b4f99c02946849a44f7ae64835e
+PYTHON_UVLOOP_SITE = https://files.pythonhosted.org/packages/af/c0/854216d09d33c543f12a44b393c402e89a920b1a0a7dc634c42de91b9cf6
 PYTHON_UVLOOP_SETUP_TYPE = setuptools
 PYTHON_UVLOOP_LICENSE = Apache-2.0, MIT
 PYTHON_UVLOOP_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
