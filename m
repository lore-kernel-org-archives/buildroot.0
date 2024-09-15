Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25CD1C35FE7
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 09:14:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBEDB40686;
	Sun, 15 Sep 2024 09:14:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GdEB_4Nzv8h6; Sun, 15 Sep 2024 09:14:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A6474065A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A6474065A;
	Sun, 15 Sep 2024 09:14:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 318F01BF357
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 09:14:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D59440672
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 09:14:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9d7CcGkx_q6I for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 09:13:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::135; helo=mail-il1-x135.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 05A0240652
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05A0240652
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 05A0240652
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 09:13:58 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-3a09dd37ceaso1081225ab.1
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 02:13:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726391638; x=1726996438;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SCCWl7s97KuiWRj0UyXIANx9vFpEEfmAitavpC9uRww=;
 b=MYqMAMPsueSRQu2Cqo7NcJ4IG/yQTYo5EkKHHm5rpRbIY8OgLCzZl1WjYB5D1xbtfr
 11pVluMiW1pAqjU42IgCt79pCjBjiIJy2HGbaq9tBHOD7Uk3Dzs180Qz8dFzS9TB5Wfc
 ZZwUkNJJFpYylY63t5rJpDy0adSB+o4q9odVHgUPxdPJ5VAaIqZxZcjBYt2JOrDDImCx
 vp5O41JiXwEsZl07gpxTFVS/xXa/wwfrd34SQSORUO+IUBWTWyfZJ/3akyZ25sSxZk6I
 aaU2Ilz+/7OL9moCsj6fYVdAbhun9+PMu1rPiPRZ3ZDQd7evXNfksFhd99gVS8wXNrJG
 o85A==
X-Gm-Message-State: AOJu0YxOTeQbDt0uXpjWunniLUt6SOkde1dmyyYwiBu1HFbQAsDFrG/c
 QGk/bLQOICgP0Xuk4OFpjEhq6wlTpZcpCjYeS0HkqEks5ft3MEy1vDdGYg==
X-Google-Smtp-Source: AGHT+IEEgzy3KZqmyR4IFHOvpM0NAXEZvxOgENU9iaKZ3TtFOg9XCz9mEB3JV9FENxCMMmaliO4/XA==
X-Received: by 2002:a05:6e02:2143:b0:39f:53b3:ca63 with SMTP id
 e9e14a558f8ab-3a0848e5d43mr104850215ab.3.1726391637616; 
 Sun, 15 Sep 2024 02:13:57 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed13c0asm838992173.102.2024.09.15.02.13.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 02:13:57 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 03:13:55 -0600
Message-Id: <20240915091355.1588212-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726391638; x=1726996438; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SCCWl7s97KuiWRj0UyXIANx9vFpEEfmAitavpC9uRww=;
 b=Tcj6kH8kw64u6n0ey3m5ZipWi19iNzZRlQrad+RgmxUxdsEG6X8zfjuOMwbJ72/dYH
 nt91mokTagvXVZoX9Pkbjr02M9TYegLb+bED/R5rsK5mnaPW8oWmrwfpnqWlHs5pbhvs
 wIb8+jVnEKSf8YYqb00VflvHKmukYlr/lEIcoXiYjyVwF1ZhZgKsMU6ERRTNLTSYXTeL
 8T/GOGE4VvhPncgq8yFQNgJ8Qb6ATRyqeroGousn+ObW3RinidnHkyFWGdfyQhv1GggA
 D2D5+HrbdGHtDJNkFuYpJ5JpobgcsS6Zl0EyopQeyCmKLnEgcRMC94GBzTZWfJlO6pVM
 fTUw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Tcj6kH8k
Subject: [Buildroot] [PATCH 1/1] package/python-jaraco-context: bump to
 version 6.0.1
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

License has changed due to copyright notice cleanup:
https://github.com/jaraco/jaraco.context/commit/5957d58266e479f124b31f30e4322e798fdf386b

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-jaraco-context/python-jaraco-context.hash | 6 +++---
 package/python-jaraco-context/python-jaraco-context.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-jaraco-context/python-jaraco-context.hash b/package/python-jaraco-context/python-jaraco-context.hash
index f8daa91364..a6b32260b2 100644
--- a/package/python-jaraco-context/python-jaraco-context.hash
+++ b/package/python-jaraco-context/python-jaraco-context.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jaraco.context/json
-md5  b40aeeda6a07dd283f2a407f622cda5b  jaraco.context-4.3.0.tar.gz
-sha256  4dad2404540b936a20acedec53355bdaea223acb88fd329fa6de9261c941566e  jaraco.context-4.3.0.tar.gz
+md5  bb22ef027077b1fa8528ef1d9840b838  jaraco_context-6.0.1.tar.gz
+sha256  9bae4ea555cf0b14938dc0aee7c9f32ed303aa20a3b73e7dc80111628792d1b3  jaraco_context-6.0.1.tar.gz
 # Locally computed sha256 checksums
-sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
+sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-jaraco-context/python-jaraco-context.mk b/package/python-jaraco-context/python-jaraco-context.mk
index 668855c98a..d33521afdd 100644
--- a/package/python-jaraco-context/python-jaraco-context.mk
+++ b/package/python-jaraco-context/python-jaraco-context.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JARACO_CONTEXT_VERSION = 4.3.0
-PYTHON_JARACO_CONTEXT_SOURCE = jaraco.context-$(PYTHON_JARACO_CONTEXT_VERSION).tar.gz
-PYTHON_JARACO_CONTEXT_SITE = https://files.pythonhosted.org/packages/7c/b4/fa71f82b83ebeed95fe45ce587d6cba85b7c09ef3d9f61602f92f45e90db
+PYTHON_JARACO_CONTEXT_VERSION = 6.0.1
+PYTHON_JARACO_CONTEXT_SOURCE = jaraco_context-$(PYTHON_JARACO_CONTEXT_VERSION).tar.gz
+PYTHON_JARACO_CONTEXT_SITE = https://files.pythonhosted.org/packages/df/ad/f3777b81bf0b6e7bc7514a1656d3e637b2e8e15fab2ce3235730b3e7a4e6
 PYTHON_JARACO_CONTEXT_SETUP_TYPE = setuptools
 PYTHON_JARACO_CONTEXT_LICENSE = MIT
 PYTHON_JARACO_CONTEXT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
