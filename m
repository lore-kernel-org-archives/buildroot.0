Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB8AC4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 16:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD4D94048B;
	Mon,  5 Feb 2024 16:54:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD4D94048B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZvWDpErQJ7Lg; Mon,  5 Feb 2024 16:54:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C8DFF40528;
	Mon,  5 Feb 2024 16:54:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8DFF40528
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7BA881BF2B1
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 16:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61DBE60E6A
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 16:54:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61DBE60E6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w0HVqu5zIcw3 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 16:54:01 +0000 (UTC)
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 83C2760EA1
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 16:54:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83C2760EA1
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-7c00cfd7156so190790439f.0
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 08:54:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707152040; x=1707756840;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SqjQcCfRVZacgug9XFkci5pqS9jNlCz3ke9UnxCJl3E=;
 b=kZFpYSkxlU9okmUFBDkifQ3GAG0LFdZ0fGWrwHsmqdI8/OjuRxgK/ToeOC27B/m1rn
 yhTE1GhrFANeU+ulqrhCQrCw7iZXLA31dt0hNnjul9aVqlFLP03/0bN5LEVgGnaRzh+d
 Wbus5Yj/h1m3DitqHyhXaleAjcFD25KdoOKh4uJi9562dOgyIkuMx5Y+kE7hs534MU3B
 aHya0scGF1JjoT1iH3dhl9dmkwKldU5z49fNKWoBchnbLJykxZnrLIaVjLqM320nHp6q
 JGYuIcK2KhZ1G4wutSvxDS0Adqw8D3lBz5U3qHF0fCZe1ZPH534NFWSPyjTJyK0xPtZd
 Nybw==
X-Gm-Message-State: AOJu0Yw/Sd5CThqok9N9tT+Mwq8jyxDBgyk7opJEPa9Cyc5oKwniMrjN
 s+gGqmqv3c1HoRj6LZIbupcV6m2z8jh0Jp5g4JByX3Y8R4RWK6G2hrfYi7iR
X-Google-Smtp-Source: AGHT+IHSMUjLwe9Rpq5xclPCl2Lu5xI2wwXd74D6bJKKDw1SsUBCPOQNhJNNyfrJHSdlF2HwrqoAYw==
X-Received: by 2002:a92:cda3:0:b0:360:11a:850f with SMTP id
 g3-20020a92cda3000000b00360011a850fmr457999ild.0.1707152040261; 
 Mon, 05 Feb 2024 08:54:00 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVh4XHYsieoF1zwS1oMTsP43lckwK8yt1QHZ1aplYUy+simjazAjGqMqhwNgfOQTv9ZeKA9W2lpt/BsXbW/NAmXahBlOrIbUUasqlYJ1r7RyMgXHnzJJYGzqJZ5+AJ1cMH23wfjfA==
Received: from james-x399.localdomain (71-218-247-10.hlrn.qwest.net.
 [71.218.247.10]) by smtp.gmail.com with ESMTPSA id
 h28-20020a02c73c000000b004712d122b44sm41621jao.64.2024.02.05.08.53.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 08:53:59 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Feb 2024 09:53:53 -0700
Message-Id: <20240205165353.515894-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707152040; x=1707756840; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SqjQcCfRVZacgug9XFkci5pqS9jNlCz3ke9UnxCJl3E=;
 b=hk5IFXzA9jgsukcf+5jLaIV5Sa7LiuYmVUAzavU7wFqikk1SqtHCkUPxC46EeqBo3J
 d/TjWFWJ3/yh+v6z1K8vsOyVWF1a5PDDZwOoC+VdtQyqUHruw7SVhJ0HFI/eodxFWyIG
 S2AW7n5bQdrZRSO0lUUc/JcC20xsdhIC2PXf8ZdhzOTKXiLrcyOT2IcIxD74cBCWUbVG
 P4A3lMtlTP42e6MZ8HhIkZ6xr7XvZDCz5pCpfGEvVnuz2MIiiUiBvV5Kn6E71DIaPM4G
 LM0SLlB+NJxSUvWSY0NHgHuo0OslrWwdVzhySeEC9qNbty/2V6S0EGI15bShb6am3ssk
 xrlw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hk5IFXzA
Subject: [Buildroot] [PATCH 1/1] package/python-rpds-py: bump to version
 0.17.1
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
 package/python-rpds-py/python-rpds-py.hash | 2 +-
 package/python-rpds-py/python-rpds-py.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-rpds-py/python-rpds-py.hash b/package/python-rpds-py/python-rpds-py.hash
index b04aa210d3..4650d9c385 100644
--- a/package/python-rpds-py/python-rpds-py.hash
+++ b/package/python-rpds-py/python-rpds-py.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  87361601241744fff6235e35050addfe34d00508172d2bd4f178193a28727287  rpds_py-0.12.0.tar.gz
+sha256  760b05720269195d86071ac7cf627b3a4ab9366680d8d449a6a63b84d96a5bc0  rpds_py-0.17.1.tar.gz
 # Locally computed sha256 checksums
 sha256  314e4e91be3baa93c0fb4bccc9e4e97cd643eb839b065af921782c2175fe9909  LICENSE
diff --git a/package/python-rpds-py/python-rpds-py.mk b/package/python-rpds-py/python-rpds-py.mk
index 6f71d02047..80670f2e4f 100644
--- a/package/python-rpds-py/python-rpds-py.mk
+++ b/package/python-rpds-py/python-rpds-py.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RPDS_PY_VERSION = 0.12.0
+PYTHON_RPDS_PY_VERSION = 0.17.1
 PYTHON_RPDS_PY_SOURCE = rpds_py-$(PYTHON_RPDS_PY_VERSION).tar.gz
-PYTHON_RPDS_PY_SITE = https://files.pythonhosted.org/packages/75/be/e3f366aa4cd1e3a814f136773e506fc5423eff903ef0372a251df34e6e45
+PYTHON_RPDS_PY_SITE = https://files.pythonhosted.org/packages/b7/0a/e3bdcc977e6db3bf32a3f42172f583adfa7c3604091a03d512333e0161fe
 PYTHON_RPDS_PY_SETUP_TYPE = maturin
 PYTHON_RPDS_PY_LICENSE = MIT
 PYTHON_RPDS_PY_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
