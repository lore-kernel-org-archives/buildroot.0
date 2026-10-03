Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DDFECA5FE6
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 08:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40DC381222;
	Sat,  3 Oct 2026 08:45:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8aUpRrHkdw2s; Sat,  3 Oct 2026 08:45:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org F00CD812EE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791017135;
	b=nyYO3Hk3z+VdQVVKzddAQHPEEiZL5yHYlhi7IAnu9PkHrNDrVV9IU9vhhxV846vofOrA
	 pyryRazBbmksRNtw7i8Dcrj/OK78AQcEfDpI+i0O/k9d9gdlBdoAtUPX/yVBOYcMb1eQs
	 OuCPwprXbD1T5axzAjnq3pJB1N8qSaNyxU1NV8qUGdml1IGNmLt6xnr3T8MFy7mOdteeF
	 e3AY8xpz3KWJ7LfuPOTx21fHawwknr51FXJ6yNMV+KGJgD8Gc53c9ut9E2na6Bj7Ccine
	 7oTmN09inCLqjq1+PfKJUE5hE8MBocoH/CZDfBf7KKJxBFjcakt+icE5XlQVI6LKVbQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791017135;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=CwdAO18KQsO+O2cOd7zIYevQ28YZMQzlpiJH8oz7mVE=;
	b=T0U3gcpVMXczRpfS2GKe+uqzAGsDtwWjRpoPrkniW2XvGhYEZJ+a3l/fg1vO3Fd7+R+M
	 pr1oSizbNAZCzxx5ATWsSAgd6HZPGO1eVcBnvKO+NB5LUD44keef9lHU12mTyyoN0BMPh
	 iguN7pFkZMBD7uaXOUOPb2tTZTDutmN3pWT50qvzYfl5nmWA8RwrV22Dh94288HuBYLWC
	 qjGRLEVKX/II1B0x3ET234ZkMut8nXYvaYr7eDl8MN397kAXuNkjPS/KFGFCvfqNEMZhi
	 J9EMiUbAlS6txQBxIdHNwzUquXWa2iu1n2asiRtb6zPgKNCDTc9g9lA6dWcj/eZuYJg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791017135;
	bh=CwdAO18KQsO+O2cOd7zIYevQ28YZMQzlpiJH8oz7mVE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=ZsQE4N0WlUExSAMJOOqbAKfEAd5V1byfDHAhr2PCf9L1t8C+oVjsa64gep152iu5q
	 hYEiuoP4s6qGX/6v5Il+z5wDMrAxN4Br6NB/VzLXNXUXw8lPyCv5TbFN20HOyPvy85
	 oWmqEI3mROdqTkLN7K8CosvZqXWM9Sg9WhQ70rI1iBHf1ofCUA5b4NcD514vcs0+yW
	 cxIZ4yunjS/tnX2GhXU17aKPgH/+bftWtRdXnfrZyDGOBEr3yKGCn+O50ghvXKj46u
	 uaKvyw7c0KdI7BOBO5CGg3EAoEY45NLwi+n37yQjzOnsak+S5ZO/14//NVs6D2DD9K
	 tjeep84u0T9ZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F00CD812EE;
	Sat,  3 Oct 2026 08:45:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 38C2C32F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F03E60DE0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CexYnbEilbiB for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 08:45:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1699560DB2
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791017129;
 b=X0JPs5cTSjOFjmw4rFTVvPq9MKeHOpX/gC4pLfYfTidAozu+cqgb3qDHRW7Pq6RWeHVU
 zXJ+dOQiFgiB9R4imJWSyaTf7dr073TenJ8dQIR5ZhgUN4dqO5d6r2wNDOrxe5rk0r23v
 kZrDjgtNvk98fydyA+P42lI0uZiRJQpkcnuWUE+uXoUV8uemRO4cZQDG7wrNnFmVOyP8O
 PqTv7WV5e1hWRe0noAnYmcaSAcIxHYPTd0cVKH3KGFS+jQ5XxLRFCQIvk/PVpivGb0zKo
 nd4xxBqff/q0QrHH7HyeBiiDxey6cLlhOSEy9zx4whol1MQH++0wF9StS9svCbRYEzw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791017129;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=oghJRjbOSimPQEKQQE5+kNG0TDxvqkj5Gi3JyuHUbH4=;
 b=qrZYt5EtWPFiiYeRtOvxtd1p7GToIrlurrFoWjgLUAyNWeWs2btIJ3FniE/dOgJXe1mP
 w2XmedVc/cjcNu2cZNvbdxm3PaSnr2pbv2+zMCwR4FLBXlzeXD9bk5zPD/1+mD4xChh0N
 fGG+9gr7DhsYclQ91/i/2xLnRgTa4tHAHB96qvvi/3xFjKOL57JNBioijcUbPSwmuU0VF
 oDcrUq2nfRc9XuGw0bDGqUM0723XhnEtfXyIu2c+sObabSAmwDmw/Au3n2IyL9nqNVxar
 BZ4/paIGtmEa/efNwJ+DGlEoRt3gPUAocwPEpowhztprB4rqd6/NzIXMZJ4OTCZ6JBA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=qp1TEI1p; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::c"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:31::c;
 helo=mail-oo2-x0c.google.com; envelope-from=james.hilliard1@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=qp1TEI1p
Received: from mail-oo2-x0c.google.com (mail-oo2-x0c.google.com
 [IPv6:2607:f8b0:4864:31::c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1699560DB2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:28 +0000 (UTC)
Received: by mail-oo2-x0c.google.com with SMTP id
 006d021491bc7-6b4bff33ceaso452415eaf.0
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 01:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791017128; x=1791621928; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=oghJRjbOSimPQEKQQE5+kNG0TDxvqkj5Gi3JyuHUbH4=;
 b=qp1TEI1pO9fqRpoU5rqZToG7YcpqvqAFypR3Y/36SnnnZTtv9KANC8cmOdwNMbC92c
 bBPSrRL+DzUOrrXu1HSwb3l3j8rJNCbcL0jKuM5M2524AZnYCU7kUEa8cDS1sm8CTE/j
 euQk4NyYXS+R/goA0fZfonSPe/DPyHFcwHAs/O42ZiJvBRIUJauDBIsPLMuLuHBUVCfB
 whX1U/owZP3ATuGPHLbLDJkt8xY6hKX76MTJuXKdOA/W70/h5wonUGmjtzgD64mP3XBC
 EmKxM+7YFpnZjKeOXbpW02J8GXLdqfvONQYJtGW/HIX2srfpFPSCHbPLPDwcM0f5TC3g
 91ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791017128; x=1791621928;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=oghJRjbOSimPQEKQQE5+kNG0TDxvqkj5Gi3JyuHUbH4=;
 b=sW7YjEd23VcPdkb++MjNfhO85UpgA6c1vKUOSHc7wCPJKmiNyGSpyPn0JYGgT4Wrv5
 3fSNcYbkLez/tfUrXuMcSzZdFo7dQ+VgfVdTazk5X/gJRglKnNfqe6RC7ktrYPB548Lk
 xLfO4aQ91ySD7XKUOLjdEbk8MoLWOMPmCGkuH0D4HcB2Dku8fLGY2VDl5vwn6rSp+2WZ
 6fuXzqQ9GnOpyhGNEB7x57VFdkg4gV7q/KTwopD0TBMDVgdBU1+4Z+QTqIKG8mwDDUBv
 nOYNcDOIHeE1qKIIm9+r7Td7IBQqNi89K5OAJFePiehKUfks+kCxBb84Cuhrw2Q7ARR7
 9aVw==
X-Gm-Message-State: AFuF++mtaFiCs27WpBZpo388ZbVpcS+mMqV/UU7njIWJk4FZjdoFUuvk
 UZdeDtSc5+rBvibgj5VMM7SDeD92jh5WWvMauvdtYQTkiTo12Ynoh+I0rr7b/g==
X-Gm-Gg: AYBFou1wnx9ZKYKJd8hjla7Cwt9RykDH9uUos1cQ2cmCV8lw4CB8WzL0T85F37suCbo
 /MnjVnmXYSVlJLGKsZBnjRHsghwK3fDqt1X0juDPNyKKeggBs7yNi6epDqc8y1G/1hkJB/36HZ3
 henQY7J7WrUSCqwDxsvKL6yQSVNNM75NPTqDw/FT7BauiQRw8PPBHJaRQFmTx9fTlV9ZhrEjiWV
 oa1/5/qwOnaWHSDus/nN7Ncc0os8a/K4ruzEjEP6j8St64RTpDn7rquFQviu8O2OF/uzo3yKy0x
 WRwxPHYgsRQ6D/O9iXq0AUYPQ+UIj4RqILh6RXB8QbFobOtGiCqWNZlOw9j3A5p6gKi3h/43ZWR
 bvlHCQc3pKRRpEmc8875+r5sjjYl17qosXdfhiGV5BTN2lYOjWi8xaO9iUJuKK/pkB5KTfL6LcP
 aNmssZIiyAVbOhAsTKjhcpOyig6iXttmHWm3AAKbWFPulxPQM5yuWKbi9//OgDHSMtpiBhSnkQn
 dv+88RK2wmGFIJXW7Krnw09trfe9lCAQCcdMr0Tw3PeQ421C3vm+eXX3fJF7LYqeN0/pgSxVDlk
 m/6YvSvaeh9MEaCN6f/EBASOIank/WS6yTmXWaptX9CAPg4R7UoA1wHsWeBWz7K0VPbn247xGou
 H1zko3pMGuYvasg4bH2AJ//wMSOdVqtfCF4YsztJAsg==
X-Received: by 2002:a05:6820:80c7:b0:6e0:1599:a4a with SMTP id
 006d021491bc7-6e015991e64mr2735796eaf.35.1791017127738; 
 Sat, 03 Oct 2026 01:45:27 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82273e27adesm5208385a34.0.2026.10.03.01.45.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 01:45:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 02:44:02 -0600
Message-ID: <20261003084453.545653-17-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1]
 package/python-magic-wormhole-mailbox-server: bump to version 0.8.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add the python-setuptools runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-magic-wormhole-mailbox-server/Config.in        | 1 +
 .../python-magic-wormhole-mailbox-server.hash                 | 4 ++--
 .../python-magic-wormhole-mailbox-server.mk                   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-magic-wormhole-mailbox-server/Config.in b/package/python-magic-wormhole-mailbox-server/Config.in
index 1ebcdb85a4..5a7e1b8d7d 100644
--- a/package/python-magic-wormhole-mailbox-server/Config.in
+++ b/package/python-magic-wormhole-mailbox-server/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER
 	select BR2_PACKAGE_PYTHON3_SQLITE # runtime
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
 	select BR2_PACKAGE_PYTHON_AUTOBAHN # runtime
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_TWISTED # runtime
 	help
 	  This package is the main server that Magic-Wormhole clients
diff --git a/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.hash b/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.hash
index d701edfc72..c40de3b68c 100644
--- a/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.hash
+++ b/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/magic-wormhole-mailbox-server/json
-md5  29a3ab90583e6858a74f11c3f485a77c  magic_wormhole_mailbox_server-0.6.0.tar.gz
-sha256  b1bf145f3a26d905ebff6820407976d57614f1ad8b9806210e9c4e36579a1f79  magic_wormhole_mailbox_server-0.6.0.tar.gz
+md5  3e99431631c57ff9ceb54dbdd1f05a74  magic_wormhole_mailbox_server-0.8.0.tar.gz
+sha256  c6426c4658cc66722bec0f4231bd52e8088e43379a8508776208dd0252a58273  magic_wormhole_mailbox_server-0.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4a9cc2415c52cef591b6822eee68fed36d7e6d80284b09638cff61d762d99060  LICENSE
diff --git a/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.mk b/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.mk
index 616d72dfbf..10c6dcf360 100644
--- a/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.mk
+++ b/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_VERSION = 0.6.0
+PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_VERSION = 0.8.0
 PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_SOURCE = magic_wormhole_mailbox_server-$(PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_VERSION).tar.gz
-PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_SITE = https://files.pythonhosted.org/packages/source/m/magic_wormhole_mailbox_server
+PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_SITE = https://files.pythonhosted.org/packages/ae/ad/6670956e0e464c43b6366b274e12839ba6cae17e714dd68a73cd2a9d81d8
 PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_SETUP_TYPE = setuptools
 PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_LICENSE = MIT
 PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
