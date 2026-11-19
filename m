Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E5B606A334
	for <buildroot@archiver.kernel.org>; Thu, 19 Nov 2026 09:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=a/Obgkos;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uWV5TSVr
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CE0081135;
	Thu, 19 Nov 2026 09:56:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DYZsY2WczWVB; Thu, 19 Nov 2026 09:56:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 031BA81244
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795082200;
	b=XnMGa1zRnWOpJu1Ce5bzqi77vHkkw2Aoq2MAY2NDpcsaQb1mzZXypqi7xFQ7WJzC2gMY
	 Kjyyc9BNiwKkLGXnwmGGlzaQlimwXY5XsNcVH5ZavyxFaLp0UB96FENY5waC4bBauP6m3
	 QoUaUnPRV1dfQS64GnB0a+EG5HQpK9WvGogxpSgDbMeaQ/QrUF/7BbnWWdrUlqJ3vU8Dt
	 52Ft95BvAm3vDcEUdoOMNCp0sbvBDnMdoCjIyl/DTz8K/ekpFkTbiwseDpl9KsK6P+fbW
	 ijsufap3EWQAhFsIYdanpNE82QcYC7DIpmL5TbAF93HyBbrkxdM4dm9GvRa3QP/+BIg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795082200;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=K6dKalXUE7rKhVG5sgv0hOPrBxtgPWAhMimI+3kQWjU=;
	b=CSHXwMiBIfi2qw1OdNYxZRQFDmtFkeJ7Jc3w54YnX7iPRyXgRg6kmT5pYagHX+1zvNFb
	 tkD4HnQHHuolKjlx7GmQWzyF2BN7aH2asBKTneKrDeLR0fawzDsRdleKxoNCBlvGCnyDJ
	 1B5Y1Yq01KqiX8AJ9L//M8nbuU45VBGApepUffP/YnF6N3jnWXaRP46UtlN4vLlhBPWyZ
	 RG0H+AfuBG6rFKZszXQFBiPwy094O9o4nM5xwsh3yDiYIVn9+i2epENED4v6TDsJFz7ZG
	 amtVpenoh1aZNvZDIbj2GCb4H88yAi83YkbuvCDI0ZIMRcqRLZMz2ByhAXwXajH9VAA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795082200;
	bh=K6dKalXUE7rKhVG5sgv0hOPrBxtgPWAhMimI+3kQWjU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=a/ObgkosSsizyzIERJITBZ2Ym6sL9bNs16K2RvfpLRMJQF0CM++U65YYixBBYjC7c
	 Gb94COIWdI57/kkBVoxqyRKwzGTBSYdmCugmL5BIoUny8wJFpRiJq3B3MyXGZsdU/l
	 mOwD/KHV9lkOsRjyW3uCdJgsbYQ+WpYAHW/jE2pFXPo9Vh5lY7Xli/TjnlmC5BmEMm
	 JM8trq2dxxZXPmVSBIBxMQ8AgzK+4ICYqdpzzroK9YxbdHOgtuvxRtvBBEZ43n5rXP
	 FbXXAe/a2JnelcHSbvuspSj/Q//0vNT0qx2Yi1c7RWezU5YzmWepCts+3WP41ra1eR
	 lX5IAOKz+cKZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 031BA81244;
	Thu, 19 Nov 2026 09:56:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 114821C9
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 09:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EBDBC409D2
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 09:56:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rkSztbJ7ZdmL for <buildroot@buildroot.org>;
 Thu, 19 Nov 2026 09:56:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BCFAC409AD
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=uWV5TSVr
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BCFAC409AD
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 09:56:34 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-48e47347279so1198060f8f.1
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 01:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795082193; x=1795686993; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bflCSzKdFgMKg2o2BNEMrA/OLSl3qiboa/4E280Vlwk=;
 b=uWV5TSVrBYPvxomLUNPKVp0ick09vbt/8xMha3zo69f+Q7OyzFP3FLqRnlTkGAv+Zq
 np70tIFMjlkDoP069ANypeSrUX2kYhlCCb6xbzM+05/9U7p871jEUAHf5kFIHJcb+Ciq
 xLIyaVZIO86TUWtXmWkK4TsRGoUaZ6kd20gU0uXxWH37dWCamuxElA+0Nb2kDWO42IgK
 BwykC0Di8T3uAtAsaAL0ZCIIPLtJPmKczOKPbUCUlt8T6WuQBTXw+5HjCBmKOsc7vhy+
 ZQXkOjLpy9pcrZQDEcp5ueD/MSGOpv1+6eiva5uhnk6p6LgvtMjzhs3V/v0m9btwfBsb
 cZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795082193; x=1795686993;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=bflCSzKdFgMKg2o2BNEMrA/OLSl3qiboa/4E280Vlwk=;
 b=NK7wjI2yoAZK4gJ1rgVRvWePL1DdpJ/NS/xxKLe+9iC1lov637bD3HJLZMxpNcU3Px
 lNYdvl36jVZ0h+P2hJrA5JZ5qczGjoGAy3uY/COjzjUtxneEGZwgqsZ3B7cleyc/4Krq
 8rEdeuNlWCv6iU08tkQT48COn17CJy2754ufB0DQ7hLsgZoEgoaRLrbA6KOpGli6Oblr
 MtoDQwqaqXQuRjMrrjDHEWE3TLItmNa/G0b8euRyj6dPGzqNTcvVWkkOxWl/fRoOKgJz
 Cs1T2qlaxz1v/IIB/VAqYqSanqlkUy5wmAN9E7du4H1PqII60QUUMHeF9ivGTLA9QwDk
 S57A==
X-Gm-Message-State: APuU4Z9WzsGliPt9JwZEEbmnttI1Xx0bmAd5kZ/9IYEjSzgISW/mt2rt
 X6xRbeK+kvHtwVprpHqsFPu2GsS5x0DmasMOhZ/2DQ+AsRhL8YeyNY8GomgueA==
X-Gm-Gg: AZFdTZc0LNrS/WSII9Et5FW6S6BRAp9VS7O/XsI+ILzRRUcY53kol/XfgsR4wWTRpQZ
 167tT7hCBqQ1xDMfxpMQHWU8FPCTQTnEturTUIrvfIhpHHLCmFzTlvl/SSAzKzoBF5/KNt3x6U1
 +9P+zGRZ7AyFXgU70KBhEfJC59IzqNiiSf4XuUnU0PIGWuENID2cjB7iu0MDm0H70rxoggzFIbI
 r0CkaoAUW9sZbAqUwroaI6HZL0bO1hDkfmEGkCsMh8zJRX/yAHL7rrRM51mmjcEPJArdvEod3Gh
 R5f0+lhTAiig6DwN31K/spO1LHT8aHHm8x6g6uyVAm2Qwx5523kti4ESoRWZzmNLexVNcX/tiWY
 NKUXmlPMJqZCUsJ6QQfJLt2v3cWqLSPYJaKscYm3zqY6Mjxky7bi/xanZsQAsZF1/ELD29ONwye
 tPBymSStVZILkAIspWgsVk5INHlnSMUDgcriqFCemmNVNkZsLPviROsX4kKe8ztwQ3pDCOQkVEO
 /pyinkPfsEgwzPJle9J1WMIeqG5QGJGu4DOgXguE/pJAlFhnSQwjgCrvUzqkm1sSK0eQDrcf8E8
 dMA0qV/hF+zmcbFprE9yRVadwEUImS0AiBMrToBOrKuaax+f+6emLalJioeA0ZH7B2PIfdyQrwF
 7byx8KD+e4JVGjlceKHGbBu0qOZBwiaSNYYY91JPt
X-Received: by 2002:a5d:64ed:0:b0:4a4:14db:233b with SMTP id
 ffacd0b85a97d-4a638ae26abmr9842670f8f.12.1795082192678; 
 Thu, 19 Nov 2026 01:56:32 -0800 (PST)
Received: from angelo-Precision-7550.fritz.box
 (host-94-86-174-214.business.telecomitalia.it. [94.86.174.214])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4a65560bd46sm9439635f8f.31.2026.11.19.01.56.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2026 01:56:32 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 19 Nov 2026 10:56:25 +0100
Message-ID: <20261119095629.1990220-2-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119095629.1990220-1-angelo.compagnucci@gmail.com>
References: <20261031143617.445438-1-angelo.compagnucci@gmail.com>
 <20261119095629.1990220-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 2/6] package/python-rocket3: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>, Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

rocket3 is a multi-threaded WSGI web server, used by web2py, which
bundles it as a git submodule.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v2 -> v3:
  - none

Changes v1 -> v2:
  - new patch

 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/python-rocket3/Config.in           |  8 ++++++++
 package/python-rocket3/python-rocket3.hash |  5 +++++
 package/python-rocket3/python-rocket3.mk   | 15 +++++++++++++++
 5 files changed, 30 insertions(+)
 create mode 100644 package/python-rocket3/Config.in
 create mode 100644 package/python-rocket3/python-rocket3.hash
 create mode 100644 package/python-rocket3/python-rocket3.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1d2960f9b3..e4c7e494cd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -251,6 +251,7 @@ F:	package/python-can/
 F:	package/python-minimalmodbus/
 F:	package/python-pillow/
 F:	package/python-pydal/
+F:	package/python-rocket3/
 F:	package/python-spidev/
 F:	package/python-web2py/
 F:	package/qpdf/
diff --git a/package/Config.in b/package/Config.in
index a24c73c2ca..4e022d24fd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1406,6 +1406,7 @@ menu "External python modules"
 	source "package/python-rfc3987/Config.in"
 	source "package/python-rgbmatrix/Config.in"
 	source "package/python-rich/Config.in"
+	source "package/python-rocket3/Config.in"
 	source "package/python-rpds-py/Config.in"
 	source "package/python-rpi-gpio/Config.in"
 	source "package/python-rpi-ws281x/Config.in"
diff --git a/package/python-rocket3/Config.in b/package/python-rocket3/Config.in
new file mode 100644
index 0000000000..5e7a636613
--- /dev/null
+++ b/package/python-rocket3/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_ROCKET3
+	bool "python-rocket3"
+	select BR2_PACKAGE_PYTHON3_SSL # runtime
+	help
+	  A multi-threaded WSGI compliant and secure web server, used
+	  by web2py.
+
+	  https://github.com/web2py/rocket3
diff --git a/package/python-rocket3/python-rocket3.hash b/package/python-rocket3/python-rocket3.hash
new file mode 100644
index 0000000000..b00553fcdb
--- /dev/null
+++ b/package/python-rocket3/python-rocket3.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/rocket3/json
+md5  4bd413cb4a6ca32fc4d27046fda804da  rocket3-20260526.0.tar.gz
+sha256  5828422badec10e45bf18f837f14d3022c98b19ac66dbb8fbaafdb17f8d4cdb3  rocket3-20260526.0.tar.gz
+# Locally computed sha256 checksums
+sha256  1f711e93f1e0c2eec576e2e60597dc2ed6f0a661e4749c6b8a39f0d4a72be468  LICENSE.txt
diff --git a/package/python-rocket3/python-rocket3.mk b/package/python-rocket3/python-rocket3.mk
new file mode 100644
index 0000000000..00e1f07ed6
--- /dev/null
+++ b/package/python-rocket3/python-rocket3.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-rocket3
+#
+################################################################################
+
+PYTHON_ROCKET3_VERSION = 20260526.0
+PYTHON_ROCKET3_SOURCE = rocket3-$(PYTHON_ROCKET3_VERSION).tar.gz
+PYTHON_ROCKET3_SITE = https://files.pythonhosted.org/packages/ca/f7/fed13d11a5c93e19daddf1fa73ce09fcdb58b43ce2ae95a653150dd3bcca
+PYTHON_ROCKET3_SETUP_TYPE = setuptools
+PYTHON_ROCKET3_LICENSE = BSD-3-Clause
+PYTHON_ROCKET3_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
