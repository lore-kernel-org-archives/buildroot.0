Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C06606A323
	for <buildroot@archiver.kernel.org>; Wed, 25 Nov 2026 16:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=sraRiMhO;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=V7fh6vOZ
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16C334085B;
	Wed, 25 Nov 2026 16:41:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NXimIz6ArGuU; Wed, 25 Nov 2026 16:41:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0F17E40812
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795624905;
	b=bLCaDLhz+3FHanLBqkwWwMv2cyYVRNeSmhvhgPzdwnGqzcJ5Ugd7UwE/KP2J1lIfWh8H
	 UyRTeRbHhT38+PZRbNAd2AJzSuz8Ca6tDOS1VxxkqvkF5Tfd0v9rR4U1PBNq8R1OPCiXZ
	 Y62E5h/2rp9BujyvSevamONgs3Nvs4JM+S8X3bwghTrw+RuHsxjrSby9Wi6VkLE5qgi9U
	 KqYGvgDEVF376BnMBgIqplhaaOR7w4kORBFrhr6+N8h7HTgqwggzxQah5Xa/MwSHnEqH1
	 wM37ij9bVM4g3xc7j/CmAJ6+fVP9fuCTtExeLYKpaVdoFl/zKI2Mr9vtJJ5divqhYEA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795624905;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=WrufSlL1vY7v9LwYC+9U9PSkv7ifmoGQqpIUnIgy+6U=;
	b=NN1HcECWyC7T63vqzyaBXwSa5/AHnPKfCTvfS8x4/7zbbepXcEgbT+Btqe8GPu9XYuBB
	 p+xZRzLHpQvXYX7BhT7zBQoAvyUXrMV42IuM4R0cfpxNngmAKBx0LjYFFzc7Yt1Hicq53
	 3jh75tZBbeBXYNHpDLth7ldnF7RbtY639BOoyegpXPhKbITWHMqD+SMwq/NA/CnwWBKn7
	 nKGHZEoF6KAaotYJvLzEntWTudY1YJPMJe7xWngvmP/BbOuj+TJHpFQ57oTopp3KC7ANY
	 uQ0ZmlSpHUv++VxoOQfJRryWtHhbwX/TTPnxJ1KIoMXKE9yGV8Z05XLPcFXVZWC3yuA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=pass header.from=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=V7fh6vOZ;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795624905;
	bh=WrufSlL1vY7v9LwYC+9U9PSkv7ifmoGQqpIUnIgy+6U=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sraRiMhO7281W3Nw2yTXlys5Ce7PRcKDzMfSvzyz6oeQDFXdCniZxHyM0hxw1feht
	 gaobGS2O2s5nAVUocAOucEn/jnoNZQvTgPZW9+Cwn/ouJVPLJWdp2e66PBuu/JYcWN
	 FXGWmpwuoqq7FE0skr+aQbSeXblxVVUXIlPZqes5VPkZJJaFbSi0SJTh2ujTbAU4gK
	 R2LszQPuQAagmW1EBiRvBVFrZM20aGqipWc5Cc8EhYaFfhMXaWBbk5SgV1xJY6VzTq
	 6DxtuNdIv99N1vlSQ88r94MSspjpAdGdWIn1iE338OfiG6FOA7Gd+Ed8Q7nxF1YeiH
	 BHcM35+ZVQ40A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F17E40812;
	Wed, 25 Nov 2026 16:41:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 654A132D
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 16:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43CBD40851
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 16:41:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BHm_bFHxDSjM for <buildroot@buildroot.org>;
 Wed, 25 Nov 2026 16:41:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3FE6C40847
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::335"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=V7fh6vOZ
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3FE6C40847
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 16:41:42 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4a2d6d01ecbso32673305e9.0
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 08:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1795624900; x=1796229700;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=lRxKDcxWE8Agooira60Q7tQB+EikI6b1bRzFl6F9FGo=;
 b=V7fh6vOZyhiuVJ2xObpPCi4f9KJDZ4D3w9tMU6bVTMJMh6w8oTr9YIbs6/XOfBenmf
 wWuuQKXprULqjxpJPLgYCCSYRpgAGLM6ssbg+nyZIFnSw5tf082AfGhu+sE0ibooU1VB
 /nPAEWC4VvRb7iuoRn0JjP/WpIMYvIgR/pXi4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795624900; x=1796229700;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=lRxKDcxWE8Agooira60Q7tQB+EikI6b1bRzFl6F9FGo=;
 b=tRPky1grUKjDc/L9FisgGwpUQe1l9xlR+V5XMJH7UMRjgGSNZtk3AVNdXEIna3lrW/
 AkjVQh93fc53wQeJDUFqb7NXouha25l4wfA6cQf/bJ7DvbXejhsagNuxAQNseYmHsUDO
 qReXC68dlAIUoZJh1j7/yVV/8+zf6cqhfWw4s8j1zxCD0GFnyK5zBw1zMh0DEOopbEUS
 pFl6+VrwuNp1/p4inf12JdqyyFzvlNgyvnEXjFy3KsuAu9FCeltGyMvZWVRB4H6UBq7b
 YtO9UC5+vPNYpSYa1FrPQ/JLL93cy5tqK8KvLHFGmUaqs+n0HSrPzqpQOCGgoBr8Gc7X
 ZcIg==
X-Gm-Message-State: APuU4Z+OjD62qheNSBN+ufHTw8TTuIHmTdCdFLs58xD08LjmoS/puKBP
 i1ZSQsw34xH0yFec2sqyZ+zEniYmjhBND3guOsFHFL4sRQIdvCRAf2ctzMhAOBDvG24FvnshfVo
 p6BeY
X-Gm-Gg: AZFdTZdXBCycJfL5A5v86tyPpVQaUi05iBM3qB5h6/XF1eKQEJYWmMhpJigHU5zYT37
 N/idjuGrerHh1YKo6mh4xAJXSV817llDbLiZchhIi830ge90xbRnZ/L8jsvJkjOcnn27SJBoKPf
 bTkh3kClw5Um5vzONUJLZIFBy/Ikauo8uCIbcMsDW/J3wfh1RpiCznquWMbP/PAxF4ZlBONQoet
 rWMW5oY37CUZHz/k4CfliAH4QgTCRZ7bJEkmweOtVFjELI7EKHqx+UzTQIvHYF25kd4OIAqVBWv
 5+y+ZbF9tnMBhOzZZwbg/eINDKSJl6bhXjCrrn3f17iGye0pu7uCCHBs4DnoqUtm2vCXoutHQSv
 rjdxA8duQt0JYTvovJoTxlqn1a2jhB/Y7sqJjHMTkXtstkthMsbNBxoi6cQNOL6mhf1Spg0IrwF
 1S+efW8QqSvO2TCPY+w3W0J9oh3eKS7Rxn6gyIuKLGbkEwG3RqDLav9e99zlMG4tyPYm6MUcNq5
 28VwXDdhqK8YqnDtPyEAZZYRcp31r+bSNiqS6L++ZpuQBP51CXL6YYhn6pPQG4AtkOsKWdGI6eA
 WVOZFEco4AEqULxITbZKVmNP+dv+oPNoojDccXQMorP1Kony+POTaMlnEAcLmJy8AASPRFaWIoq
 Cg9/2wAUZOC63wyG2LQt8lTsuw5vV+ykvg0nPilBVE0nSpsTcpzZtWDidusqwvVsmf7iFg901pd
 eWO8gfsGuT+IhLWvoUz+bS
X-Received: by 2002:a05:600c:6219:b0:4a1:d087:f6ab with SMTP id
 5b1f17b1804b1-4bb8880badfmr354845415e9.18.1795624900058; 
 Wed, 25 Nov 2026 08:41:40 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com
 (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb9067a0e6sm247988765e9.4.2026.11.25.08.41.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 08:41:39 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>, Sergey Matyukevich <geomatsi@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Kory Maincent <kory.maincent@bootlin.com>,
 linux-amarula@amarulasolutions.com, michael@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 25 Nov 2026 17:41:24 +0100
Message-ID: <20261125164127.863713-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125164127.863713-1-dario.binacchi@amarulasolutions.com>
References: <20261125164127.863713-1-dario.binacchi@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/5] package/uboot-tools: add fwumdata target
 tool
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add an option to build and install the fwumdata tool on the target.

fwumdata allows to read, display and modify the FWU (Firmware Update)
metadata from Linux userspace, similarly to what fw_printenv/fw_setenv
do for the U-Boot environment. It can be used to change the
active/previous bank indices, the bank states or the image acceptance
flags, e.g. by an update agent after writing a new firmware bank.

The location of the metadata is read from /etc/fwumdata.config, which
is platform specific and is therefore not installed by the package: it
has to be provided, for example, by a rootfs overlay.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
---
 package/uboot-tools/Config.in      | 14 ++++++++++++++
 package/uboot-tools/uboot-tools.mk | 11 +++++++++++
 2 files changed, 25 insertions(+)

diff --git a/package/uboot-tools/Config.in b/package/uboot-tools/Config.in
index c99ab9825ef3..bd066fd5a50b 100644
--- a/package/uboot-tools/Config.in
+++ b/package/uboot-tools/Config.in
@@ -104,6 +104,20 @@ config BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV
 	  bootloader, which allows access to the U-Boot environment
 	  from Linux.
 
+config BR2_PACKAGE_UBOOT_TOOLS_FWUMDATA
+	bool "fwumdata"
+	help
+	  Install the fwumdata tool on the target system
+
+	  The fwumdata tool from Das U-Boot bootloader, which allows
+	  to read, display and modify the FWU (Firmware Update)
+	  metadata from Linux (e.g. change the active/previous bank
+	  indices, the bank states or the image acceptance flags).
+
+	  The location of the metadata is described by the
+	  /etc/fwumdata.config file, which must be provided (e.g. by a
+	  rootfs overlay).
+
 config BR2_PACKAGE_UBOOT_TOOLS_DUMPIMAGE
 	bool "dumpimage"
 	help
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index a508e61c53c8..c655095b4771 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -63,6 +63,10 @@ UBOOT_TOOLS_MAKE_OPTS += CONFIG_TOOLS_MKEFICAPSULE=y
 UBOOT_TOOLS_DEPENDENCIES += gnutls
 endif
 
+ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_FWUMDATA),y)
+UBOOT_TOOLS_MAKE_OPTS += CONFIG_TOOLS_FWUMDATA=y
+endif
+
 ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_FIT_CHECK_SIGN),y)
 define UBOOT_TOOLS_INSTALL_FIT_CHECK_SIGN
 	$(INSTALL) -m 0755 -D $(@D)/tools/fit_check_sign $(TARGET_DIR)/usr/bin/fit_check_sign
@@ -101,6 +105,12 @@ define UBOOT_TOOLS_INSTALL_FWPRINTENV
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_FWUMDATA),y)
+define UBOOT_TOOLS_INSTALL_FWUMDATA
+	$(INSTALL) -m 0755 -D $(@D)/tools/fwumdata $(TARGET_DIR)/usr/sbin/fwumdata
+endef
+endif
+
 ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_DUMPIMAGE),y)
 define UBOOT_TOOLS_INSTALL_DUMPIMAGE
 	$(INSTALL) -m 0755 -D $(@D)/tools/dumpimage $(TARGET_DIR)/usr/sbin/dumpimage
@@ -117,6 +127,7 @@ define UBOOT_TOOLS_INSTALL_TARGET_CMDS
 	$(UBOOT_TOOLS_INSTALL_MKEFICAPSULE)
 	$(UBOOT_TOOLS_INSTALL_MKENVIMAGE)
 	$(UBOOT_TOOLS_INSTALL_FWPRINTENV)
+	$(UBOOT_TOOLS_INSTALL_FWUMDATA)
 	$(UBOOT_TOOLS_INSTALL_DUMPIMAGE)
 	$(UBOOT_TOOLS_INSTALL_FIT_CHECK_SIGN)
 endef
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
