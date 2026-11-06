Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638E8606A329
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 19:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MFGuR5Hz;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mzC2mYyZ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E0CC60A41;
	Fri,  6 Nov 2026 19:16:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VFe3wK0L8wYm; Fri,  6 Nov 2026 19:16:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 67C21608F9
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793992592;
	b=EjQmsA3ZfzcuOAtqKg+JCur4N0cu/i0BztmFaIGcfHBQubJ18blssATAc3BgeB4+zmb3
	 QaHQ6qXjo1iPfrxo0xLJ8/k91+bZ/gTqWaCL1uxEQq3vjcWeMJtd1EH5Fk+KIqaNE3m3f
	 npVBHUQ70QTAP7+1dV8Qwa6+50ipzSTmSC6zXZuQGoKBlUVxrBzJ/lSszHOWJN/NWDZ3I
	 a5EPIrMPpO88icSmHXwBkquj2BtO7j4Cs6et24AjiVbk6szB9D0ZD45a495CzfoUgDUsE
	 mp6IWHLwnkgJIkuqgVvB/fjPZo6NX2qfA7wSQQb2HuUwFr7UONl3WwlU9MP22hL7e2w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793992592;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=mNDhsUr5k7kX83NwaosKLz9QhsdznV/KIBk5IaXkc3o=;
	b=YsqkVemYIE45nsGtG2jbPVP6VBqxswf5C4fmzdeRe5ZQGNkjb3ZDALhUVjFhrO7dpaoV
	 GwGPSZC9k66gx8qT2XBMCreLrFganwmP5PNVJNg8w35DaLdgLjWrh/8IMAXB9EGgkuLKM
	 HdLTMwcT+pIIvt4HkXtFCLIHpVfkU1msjcS+kLqpDPrzVV+tPYWgV4wSzVnjW5erky+/T
	 Rmcd21r0xwrB2q8jnPeuFLLgB+u8M6qkQ6km68/NMxH9Woigf4NJhGoxfI/cB1BJvNMGJ
	 QkWPu+1vY1XL1exeuf4bepnRftEqqfPRQ2bHeuBU8cTgisD+kt1B8NKBuK5FpaIHZog==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793992592;
	bh=mNDhsUr5k7kX83NwaosKLz9QhsdznV/KIBk5IaXkc3o=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=MFGuR5HzMtR5F5cfxCqIghkR1mehhzNgN98sgL8zRYtDp8UcccXC06O07+7tV89j8
	 F++flkXEQ4BD5LGJYLJaVlBSSjQf9r888F0z1I33YXJbifPrNKE0b6gZzzH2oPq5+J
	 noX/HSM1Ezzn8fjIXSc3uzYoTocvBsOkDYmkGl1ai1wraNNrp20+4xMIEI2vNMpx2d
	 Vd3MUl9Z+fbVRsAyq0cpFIdOGsRYoLUuLXvrNbOOrYf5G5tzkI3cTJeIbnnjA9c916
	 E7tSuLPTJyuCP8Btww7bhbSpQEC2vAbaWMkOpIRrfP3y0NCvSUMp3o9mGC0rzpmcmV
	 /5yoPxvt7wpaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67C21608F9;
	Fri,  6 Nov 2026 19:16:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1853A4B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F227440467
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NcrGqJFxRbdw for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 19:16:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0C11440437
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32e; helo=mail-ot1-x32e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=mzC2mYyZ
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C11440437
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:25 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-85d363fb73cso617115a34.1
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 11:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793992585; x=1794597385; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=a84PgJfPO9kdfiQqoEwQdlNUxWne5gWtmEFE7yImLb4=;
 b=mzC2mYyZutTKHRGRuuBb1F32qHaFn3rejoUnOwGEdMN50IUXZ5dTzZEs9AUeXD7JRr
 B6WSczJGbG0xUNxsnJU1Ak+x1ll6MrZtgIdZ+DG5CSwQv9EIT6JT/EQaig4jqsFFNIb+
 /tydVCxD/fF6CnIYXrMviNqO6FM3IksT04L6YdLBZiqOxQTVyXLrTRpwqbODvdNiJ+FZ
 YHrriB0BUGe4K1dMiw4GJ66FlzuU3yPDCraPbyZuPnXQFkRnxWRHkZqN1g8giQSGESig
 d/Iz7PHGC0GX/QB6268OxwQC5pUenAmGMHw45Yn9bmt6k+dRNCD/TgIQo20UoSpzoUwR
 joeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793992585; x=1794597385;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=a84PgJfPO9kdfiQqoEwQdlNUxWne5gWtmEFE7yImLb4=;
 b=tWjAv/ebzJqv8k7YMIlWapVDKdKAIrEO52sPYP7obw241uqMgWQzfr5VswNPyV07tw
 bUhn+BA7X3fOIKT+YNefXY6Ytjb7DPNMOCuY2m3t68SHBqcscBw5fUOe0XpPUVUqT2cD
 Z4nT6yZ489gyT5FwzdZ/xOYa4NVfX+JIGp6gOGuRvpmEJMY6fveqoAGQ9vDogIync83d
 zWBNhI6xJkprgOSuATLZZa0gwQgD/W6Of3Y0Ht70jTgnMncAcOPeVGvzFMufnH8bSFE4
 fNcyJki5ASbt8rFnWpYF8NIu/Ak+fX/eOgxdh+onwlySToWQ1it2vcnlhLJqliwnluCO
 gqMg==
X-Gm-Message-State: APuU4Z/f+z1JfQ1TNgUan7OEn8yo/veCSzYmtsDuU2hGNUwBGQcVyNzU
 EBh5A6ExUqJrCU6gl+kPK5QtCEwZYSwWKGX3LQeq//wrgLjFNfhs0GZLbsIOQg==
X-Gm-Gg: AYBFou2gDxpwK6WyvKh66Oie+q6wDtvU0flWzSbfMU1UmyhD0HjRYZ8P7sKERsnmSFg
 L5KX4kBUn8HtkOcQeP1cDHl3AJGTHGM8nYD58LOAk0VIypSXElvOWm0t+s3TsgmJT/kKTyxz6ow
 Tv5kjF9ygJ17rnjck5sHgDmg5A99cELQwXpA/S5/sW2bc0b8RacSdGi5T/mWpgT41QcyURh2cnN
 V5lITHP89s5Xt0IbLOBZvH8rHoKHLJZ01YWe1rqp6GZ2z+/3dc3RQdOm5mFtk929/jIX3bgacB0
 sKPgWW+3Zw0QE7lZ9nUb2ALezTu/+cGCVIIIfu6Mee2I+E41zpZP35RX4U6K1z0owZPlj45QLWl
 BbUQxuzkecnirQtIfto5ENcHzScg9ZEGLkQWnRY3S8PWwO/73c0HFNKPC+3GGnwi+VEY70UG08L
 nl08a2jDkoPr0sAUqVeqKNoopQhj/NyHOb3o85Z7j3j+pfGZBxE5xNZGOy7NwVpNFjU7PKQfZUY
 iZJKD8STkcpaHq7ejAvS1Jw8/7oRescYf6sYZWZxuLFShTOnuBEFww0q9Zd6eQiqI+QT5bOeg1g
 ZoHCLw3j11zadvS+g8NsiOqDZst35N5oilDTr4ivnS053f2tzcWcSuvbSI16WkgqhYQ2bQ2UIIw
 XwDQTpeOT2bpKrFoF3o9gb1eHnoYzG9T5o76PwExi03p0XZDK6ws+A6/s1tH/aQns/pEPWEnNbq
 nStke83cQnm/VS0bV1hBJuH1y78k2XKaAX+h55tzhgcKgQTmVKWGq3R2h+Pf0LgFkYD4+EumWHD
 w==
X-Received: by 2002:a05:6830:4487:b0:81b:8032:716d with SMTP id
 46e09a7af769-85f1d0861ecmr3224848a34.20.1793992584694; 
 Fri, 06 Nov 2026 11:16:24 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85f1de4e53dsm2478655a34.20.2026.11.06.11.16.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 11:16:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 12:14:50 -0700
Message-ID: <20261106191536.2120153-24-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-pysnmp: bump to version 7.1.31
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
 package/python-pysnmp/python-pysnmp.hash | 4 ++--
 package/python-pysnmp/python-pysnmp.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pysnmp/python-pysnmp.hash b/package/python-pysnmp/python-pysnmp.hash
index 13686eba23..2e215c7f99 100644
--- a/package/python-pysnmp/python-pysnmp.hash
+++ b/package/python-pysnmp/python-pysnmp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pysnmp/json
-md5  af979cb67cd5fc816e90ca8eedbec289  pysnmp-7.1.30.tar.gz
-sha256  db72f439b066725d2586dff068478dc8e9b303a4dba3294462b0e76b3cb63bc2  pysnmp-7.1.30.tar.gz
+md5  ba51c0ef0a1a1df294554a56a4d5b599  pysnmp-7.1.31.tar.gz
+sha256  97ae3e8dbf05937fa7fc69b85c03c0b2cc020a15d16b66e54d5743d895109597  pysnmp-7.1.31.tar.gz
 # Locally computed sha256 checksums
 sha256  aadf5d3f4d90a949f05e2c185b783b877efbf625874992c361f70a536bed83ee  LICENSE.rst
diff --git a/package/python-pysnmp/python-pysnmp.mk b/package/python-pysnmp/python-pysnmp.mk
index fa6cc9b341..1b31966a62 100644
--- a/package/python-pysnmp/python-pysnmp.mk
+++ b/package/python-pysnmp/python-pysnmp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYSNMP_VERSION = 7.1.30
+PYTHON_PYSNMP_VERSION = 7.1.31
 PYTHON_PYSNMP_SOURCE = pysnmp-$(PYTHON_PYSNMP_VERSION).tar.gz
-PYTHON_PYSNMP_SITE = https://files.pythonhosted.org/packages/55/2a/ab68df5b1a2f673da731da7caf39c29d924735359e7d50eacb80d2d38e53
+PYTHON_PYSNMP_SITE = https://files.pythonhosted.org/packages/8c/da/1fc15bc8255dbe8cb3effe46896e92a52db76c1ef53ab37c4e8ae9f09320
 PYTHON_PYSNMP_SETUP_TYPE = flit
 PYTHON_PYSNMP_LICENSE = BSD-2-Clause
 PYTHON_PYSNMP_LICENSE_FILES = LICENSE.rst
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
