Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC5FC25B10
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 21:30:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72749605D2;
	Mon,  6 May 2024 21:30:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7vpNka_GPk2D; Mon,  6 May 2024 21:30:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5616160A41
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5616160A41;
	Mon,  6 May 2024 21:30:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 25A401BF46A
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 21:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 120E440217
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 21:30:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L9t74GrDP_oh for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 21:30:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E2D6840118
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2D6840118
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E2D6840118
 for <buildroot@buildroot.org>; Mon,  6 May 2024 21:30:42 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-34dc129accaso1862919f8f.0
 for <buildroot@buildroot.org>; Mon, 06 May 2024 14:30:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715031041; x=1715635841;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iFqV1P0Ppr/FSrlG9Vii1ojyDytMn1AmOkcWvkS9Mrk=;
 b=MBxLfZXmuCddy8QEPKWpu3R6fELMmD9wdRfmJ7SzyNpn7DQtW9NuM5BhDZddY9zRQD
 8Yj8fL16epTqgXRIZUdYCVb8y6sY+5ZleuzZLqHdV/aquJiada2pMj+CBOgpiQTZ/gep
 TxP9K3uKlPNlI/vHq2/DNTn4rPpKtp0M1xNlMxA1ODY/PX2MsKbetVu1aV4HJSDkh22U
 KBPzuAIwjd7PSoMVUf31WqV+OMuMM2PJwpQ0DeUicDWmX4kaf3WoZKj6+M/ktBntVTQ9
 itow5XBR3FXzSrNcu5DX07ltVcT5TiuBp03MXRJJ3ImfLLesC5ocypLdUtZqBoFEJaMZ
 GDBg==
X-Gm-Message-State: AOJu0YxThaLUPQ9agRRoLGHKwvN+Zly+BTYbZjdWRjnQN5542Ran9lXs
 0T0/C4FlJxdJhiw93pAXCyE04/M81dMs00mBb3Oojw6i7gM6l/WimzSqD7iF2wEH92UeUCSlao1
 p
X-Google-Smtp-Source: AGHT+IGWR/Q95MM5bFPRtknyRMEt576mnXhmDXJjpnAzIuAhCNW5BpXbh10cTHRGTQIl66aP2Nt5wA==
X-Received: by 2002:adf:db4f:0:b0:34f:5d07:ebd1 with SMTP id
 f15-20020adfdb4f000000b0034f5d07ebd1mr1901627wrj.56.1715031040688; 
 Mon, 06 May 2024 14:30:40 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 bf9-20020a0560001cc900b00341b451a31asm11495643wrb.36.2024.05.06.14.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 14:30:40 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Mon,  6 May 2024 23:30:38 +0200
Message-ID: <20240506213038.418213-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1715031041; x=1715635841;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iFqV1P0Ppr/FSrlG9Vii1ojyDytMn1AmOkcWvkS9Mrk=;
 b=g0SKgekRLOamwW20zPcTNo2Z06fr06hLIqQFxSiHuLIdsPjCpU6VvtaJFlStgg7jD9
 /oDYvrUQ0NS18Go76nUVR0so5l52EEWe8S6D2hNQZgnTLc4ePII0WtxrX8gHjm8lc2Un
 1iPIU2vGzxF8uT2h0aLoCibmzn1zRtiURCfu09Ubh86TjfNIaeZ6xmaLJTwJdi/Z++NY
 KaFqctAnYLPrcsc/4tYTBlpH5i5XkougXW4n/M4nOXaLDqmXJ4znD5qON40KiI6jlU+w
 g4kFIbbmD2TOixFbGOqh7uA6UdRWl1iZuzrT+kZZBted/abJvVPRcMTYBpkdntmHAjg/
 3kZw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=g0SKgekR
Subject: [Buildroot] [PATCH] package/python-rpds-py: bump to version 0.18.1
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
Cc: Antoine Coutant <antoine.coutant@smile.fr>,
 Romain Naour <romain.naour@smile.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As reported by Antoine Coutant on the Buildroot mailing list [1]:

rpds depends on the crate pyo3. This crate uses

  "std::sync::atomic::AtomicI64"

which doesn't exist for 32 bits targets.
That leads to an error as reported by Buildroot Gitlab-ci.

An issue have been opened on pyo3's github [2].
A fix have been accepted by pyo3 [3] and merged in pyo3 0.20.3 release
[4]. This pyo3 0.20.3 uses crate portable-atomic [5] to provide atomic
types and compare and swap operations for all targets that can use std.

python-rpds-py 0.18.1 is the first release that use pyo3 0.20.3.

Before python-rpds-py 0.18.1 release fixing this issue would require
that we be able to patch a package during the Cargo vendoring step [6].

[1] http://lists.busybox.net/pipermail/buildroot/2024-February/684867.html
[2]: https://github.com/PyO3/pyo3/issues/3614
[3]: https://github.com/PyO3/pyo3/pull/3619
[4]: https://github.com/PyO3/pyo3/blob/v0.20.3/CHANGELOG.md
[5]: https://github.com/taiki-e/portable-atomic
[6]: http://lists.busybox.net/pipermail/buildroot/2024-February/684886.html

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6783811842 (TestPythonPy3Dtschema)
https://gitlab.com/buildroot.org/buildroot/-/jobs/6783811860 (TestPythonPy3FlaskExpectsJson)

Reported-by: Antoine Coutant <antoine.coutant@smile.fr>
Cc: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/python-rpds-py/python-rpds-py.hash | 2 +-
 package/python-rpds-py/python-rpds-py.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-rpds-py/python-rpds-py.hash b/package/python-rpds-py/python-rpds-py.hash
index 4650d9c385..62b508ae6b 100644
--- a/package/python-rpds-py/python-rpds-py.hash
+++ b/package/python-rpds-py/python-rpds-py.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  760b05720269195d86071ac7cf627b3a4ab9366680d8d449a6a63b84d96a5bc0  rpds_py-0.17.1.tar.gz
+sha256  d9b542bf5321495737005a78d9fbf40541b898d1e2b3309cbe36a2431977be8b  rpds_py-0.18.1.tar.gz
 # Locally computed sha256 checksums
 sha256  314e4e91be3baa93c0fb4bccc9e4e97cd643eb839b065af921782c2175fe9909  LICENSE
diff --git a/package/python-rpds-py/python-rpds-py.mk b/package/python-rpds-py/python-rpds-py.mk
index cee2ff290a..c38f749521 100644
--- a/package/python-rpds-py/python-rpds-py.mk
+++ b/package/python-rpds-py/python-rpds-py.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RPDS_PY_VERSION = 0.17.1
+PYTHON_RPDS_PY_VERSION = 0.18.1
 PYTHON_RPDS_PY_SOURCE = rpds_py-$(PYTHON_RPDS_PY_VERSION).tar.gz
-PYTHON_RPDS_PY_SITE = https://files.pythonhosted.org/packages/b7/0a/e3bdcc977e6db3bf32a3f42172f583adfa7c3604091a03d512333e0161fe
+PYTHON_RPDS_PY_SITE = https://files.pythonhosted.org/packages/2d/aa/e7c404bdee1db7be09860dff423d022ffdce9269ec8e6532cce09ee7beea
 PYTHON_RPDS_PY_SETUP_TYPE = maturin
 PYTHON_RPDS_PY_LICENSE = MIT
 PYTHON_RPDS_PY_LICENSE_FILES = LICENSE
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
