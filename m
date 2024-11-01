Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0149E6F092
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 22:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A9EB60716;
	Fri,  1 Nov 2024 22:02:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x8D7Th85DlWK; Fri,  1 Nov 2024 22:02:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 964496071A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 964496071A;
	Fri,  1 Nov 2024 22:02:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 03F21112A
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 22:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E53F160719
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 22:02:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1iBHB1J_2E2f for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 22:02:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::131; helo=mail-il1-x131.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0FD24606EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FD24606EB
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0FD24606EB
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 22:02:24 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-3a4e5a7b026so8533965ab.3
 for <buildroot@buildroot.org>; Fri, 01 Nov 2024 15:02:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730498544; x=1731103344;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OKQHXoFw+ihlqyix5UVM/kbXmcj9XCfht4IzHL69Bw0=;
 b=rrzpfhgx/haVK7tDpbEqhLD7ExUF+cKTqGn5E8FicCUW7qbmwsTPZ2D4KCj1wCr87X
 sppPmda51Q1LE+qZ1C81h8GZa47NS5CFqkWB7zT4mAMopjbIOOKDjmrWqrppvQAbRFOV
 ZU92X7sdewEYj/WrdFphSTGpED0DvFG9AheisSWOZKz3lOa7IYqbczU/a0ClFuPPAd0d
 7UMw/tJd0F8B80gMIf3PY/tqfBMY3UUWq5FA/1tbN8cD4njQO2RFUj9FNCOPgbIzv3mP
 b7lq7zDkAPUjQrJHEXKNygdqjiMn9dxrIXaeveif2VDdM1LWjJD/pz9U+cTQQ/c6B3m3
 +K7A==
X-Gm-Message-State: AOJu0Yw1XJkKwRg5lEidrEtJTiz7O4zS7BxXHnpJTj/cuoF8bZva2fnU
 JhVvxtd90DacErfngzEr1huBvDe9OcxiLTo1sjU8wvJmW+d2TMY0FdRy2Q==
X-Google-Smtp-Source: AGHT+IFcAuz9GDZetyCkFvkTmseFy6+0QAppfQzFZ+0puHyfm0GHx1cJ2rrfja2hDo9oDKcVj6fMaQ==
X-Received: by 2002:a05:6602:2cd0:b0:83b:2b89:a14e with SMTP id
 ca18e2360f4ac-83b65057c06mr935854139f.13.1730498543648; 
 Fri, 01 Nov 2024 15:02:23 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de048e4d3dsm913882173.75.2024.11.01.15.02.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 15:02:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Nov 2024 16:02:19 -0600
Message-Id: <20241101220219.1298999-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730498544; x=1731103344; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OKQHXoFw+ihlqyix5UVM/kbXmcj9XCfht4IzHL69Bw0=;
 b=HsyV0YpWI8OQzv2Os1E1cmtHYsaLFf0SQMdYGDsFzBbpEpmYcGy7Equ9/aLXYlVE3P
 sPwEP6cBpINKdiTaTGURrYyq2kaHmnBQ0nD3/9vpjagYFnPvW5vt2EeB+RjDXazTR219
 k0n8H1Go4AHDv/AQUOfLKE39eJg5fxUJjAsXC3xFMqqiq6ZbKDwy0iSEUJrxUsKU2uX9
 Sgl2LKq5R7bSYyz1ZOz6YWnx4tEgYiYAJ1iLKzY8KCKIqAQMPxARyVpLrRa59ePT851h
 9KT79hb0h/HSMOo2go27nnUqMrUwB47nZWqUE4bdeKcQpOTbCj68SJ/vExfBJcG+ZyS6
 ncDg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HsyV0YpW
Subject: [Buildroot] [PATCH 1/1] package/python-typeguard: bump to version
 4.4.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
 package/python-typeguard/python-typeguard.hash | 4 ++--
 package/python-typeguard/python-typeguard.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-typeguard/python-typeguard.hash b/package/python-typeguard/python-typeguard.hash
index aa7549e2a2..6bb7c031c6 100644
--- a/package/python-typeguard/python-typeguard.hash
+++ b/package/python-typeguard/python-typeguard.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/typeguard/json
-md5  cfc79d64f7f21f999e220f208a856ca5  typeguard-4.3.0.tar.gz
-sha256  92ee6a0aec9135181eae6067ebd617fd9de8d75d714fb548728a4933b1dea651  typeguard-4.3.0.tar.gz
+md5  609f7e69f381dcbe600d971a3c43d4db  typeguard-4.4.0.tar.gz
+sha256  463bd8697a65a4aa576a63767c369b1ecfba8a5ba735edfe3223127b6ecfa28c  typeguard-4.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6163f7987dfb38d6bc320ce2b70b2f02b862bc41126516d552ef1cd43247e758  LICENSE
diff --git a/package/python-typeguard/python-typeguard.mk b/package/python-typeguard/python-typeguard.mk
index 27600de276..928a34e395 100644
--- a/package/python-typeguard/python-typeguard.mk
+++ b/package/python-typeguard/python-typeguard.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPEGUARD_VERSION = 4.3.0
+PYTHON_TYPEGUARD_VERSION = 4.4.0
 PYTHON_TYPEGUARD_SOURCE = typeguard-$(PYTHON_TYPEGUARD_VERSION).tar.gz
-PYTHON_TYPEGUARD_SITE = https://files.pythonhosted.org/packages/8d/e1/3178b3e5369a98239ed7301e3946747048c66f4023163d55918f11b82d4e
+PYTHON_TYPEGUARD_SITE = https://files.pythonhosted.org/packages/79/5a/91b7c8cfc2e96962442abc9d65c650436dd831910b4d7878980d6596fb98
 PYTHON_TYPEGUARD_SETUP_TYPE = setuptools
 PYTHON_TYPEGUARD_LICENSE = MIT
 PYTHON_TYPEGUARD_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
