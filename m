Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C8C606ACC6
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 15:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lNUuZh4K;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=V7wJu7MI
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 705B1606CB;
	Thu, 22 Oct 2026 15:14:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r0BPA8ehK5Xx; Thu, 22 Oct 2026 15:14:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9191A606B6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792682053;
	b=K8YX1RyD8D7yA3iK0xSFu2lOPWxvyYMim3roDCRvXImVUVC85HuPJqlmG7lVfYFZoDgk
	 cE6z2cFndUzXv0hs0ZXFNwpKYsn8xeifQ3EV7KDOWUSXuq4cywzVbm4Vdzrm3N9EOOk55
	 2niDN9pNeXcn5WGO8LJsiF1RPvs8YMq4NWTGg3Evp3oR4H+mCk95SVT6bfVIzMBOYtOhh
	 gaeJg2UgMoc6hOvQf+DYUfekoUrHTsRay2+BjPl661x7zCr5s9Y7+wbNOgR3bbuodikTl
	 4weuGBOFXAkZT6qhzRMZ3nLHjObbqoMLJOBCB34CwMqQMNS+Lan9iGK3HfC8u6/V/7w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792682053;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=3wYoGLHCbGJj6YzY7WcJduPp/oBFt4szFDnBQ+xN26E=;
	b=N88M9EEM5MJXwqei5qB/kj20hokXo3dp8JPxzP+m9Ch74PPOdP6lhwhpe05iQ5FU4ksd
	 UvdzhNAGIPS8fwTCMXZ+nE1ItAjAq7SUcHjek0lJ3gCRDhdtDfxxRsue1zuTFhDXdC1dW
	 UrX/9w+RDePG6/RbliuW8jLjWOBwOvDpvXfDWkmWexM/V9Jgsrb96fRZGApG9JhNEWET4
	 vy5QT9ktxM+Z74mbLy2JNqtdLe3d9B/0vCTRI2H3sH08nMHEh4BfkRtLmF3UfG/v8QdFc
	 5oNrwtrN5naGbVxIpwfYoobZ75HZJyScxcyeDdrZziqWREKh+Tm2rHe/llaETCZ6vcQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792682053;
	bh=3wYoGLHCbGJj6YzY7WcJduPp/oBFt4szFDnBQ+xN26E=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lNUuZh4KvN+X2HCdiajy+sKsbNpCcy7Nc1JVlVkMw9Gd5UXDXZy30m6/GNxYy45ep
	 +6OHCys+f0iDH2QkIk5K2RKowHVIvOLgMrEHZfeoC3FW7jCjme87iq64nzpfOvtWH7
	 aEpd6QfuQe7gJyLa84n2hICoj4M9brfO382hnkum6TX8cCVcqcUNMLWZFKrDyRcMmm
	 MSED6uZkLgjbirdqH6cd19JhQHiIplvLsskj9eiIccxoTjyDbTqLCEIMpgF8JAaFve
	 U/woy4GJ6W8noHIbhcozykhte6sUCs/BhM3he/3UoNWJLwrASUOZlA6Pn92pgcc4K1
	 /JFhfWSvD1gnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9191A606B6;
	Thu, 22 Oct 2026 15:14:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A43CE95C
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:14:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A35140082
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:14:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XZYZmJBwcQJG for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 15:14:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 8EA9C40024
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32a"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792682049;
 b=ilfIW1iWIlgIcAIl6eMmBQ6h5l1Di8O4px0i5SE41Fx1gzgllDK2gm7naZph+YGJRqmd
 Ef1dsKXeWfxSNsBy9eXxd7j8vH8HAEeEOu53OSOJTPYhBXGqpi9nuHUMM1udi9DJ7YeXd
 5SBcNLwDsKt+GKXLPmY/5/TMHsoNu6y1F9PxxIn85EDUuBAfQ8bG/cIzJHwTHrVxRRkJ/
 DjHSe6XNnvvI6OPWlOndxxFc0Y6betGmi3FOY/CaSBiFHwclFV+bkbMhI+C1SzGyUCc0I
 gIjKIUrdTP4GR1IT2ZUpF0QCReBPuynshG+kgALsbh3YDuU2gloeox3CQe46ib6Xveg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792682049;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=Xh71o+qs+CyLQmiSl2lVccnOqKyBT5h33FozGotL7ys=;
 b=j6JMrGlzjWEJXqYCiBylOWtL+BWTcRGUgwtRfFTcAASmaSEXbpateENOGpEzdTbbpdwM
 EsJg0Q+35dAsCsNaUr5UaoqLBHuon/ad13BkDxMRL/87u4ouK7siSMr6fsRl+nB9krQ/z
 mbRQb8OS6ppkK18/A/cbYljRFzgnHTR5Pw2yKi9IpWbLrz7CQA7MnWclvl8r4nhJMHofr
 U2vXbNHEB3u+pBmQZRf/cI31EgD0nfRJPeNEt4FTq20+aqucKmPnOOLNsG25wMfOiU1qJ
 yu7UYDW7XA7doexncv2nFHoO3U0T3WO2LpRxJSXcunueRJnk8t4QY1JY8WernvQ7lBw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=amarulasolutions.com;
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=V7wJu7MI; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=V7wJu7MI
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8EA9C40024
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:14:08 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4a018792ab3so16101415e9.0
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 08:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1792682047; x=1793286847;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Xh71o+qs+CyLQmiSl2lVccnOqKyBT5h33FozGotL7ys=;
 b=V7wJu7MIPu9gDdoO+2KxqoaltkETM51qt8LFATxxZjVpT+Yry9RHLsm0+X/H2IMTHO
 JMnfHRFwVAKVFS5+Z2MBuuS5awi141TjEywhlHpqWz46T42lxiKTFmjwiLPmuo4VZHYT
 uxBZzc9MuwfKkWFQ10tG5cKUrubidbJaKbZa0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792682047; x=1793286847;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Xh71o+qs+CyLQmiSl2lVccnOqKyBT5h33FozGotL7ys=;
 b=os/mJXwhhI61QjgJUlLN6O+UjqDQ3iWfYn7MHroRjfOnREZxKYxO8N4LsPhM9EfXCf
 XMQDd0RLfLOzeyA0xWxaqBoiibP4ikRW4eaIt65gEQ58f6d+NO2BMn5kv5XPP1cuhpoj
 XDecvgtelIdx6AROM88nZ55L7wNXEnzwmq38vdogQjhyHE5hed+MhnP+NS9GFpVg50UN
 SNvxlYNZqd+OiAxp4CgStvJC3eQMOj4gV1niHkKqvKQhuxRU/gc2YtkKHLbn6mgJwouK
 JFh2dkhjmjjv+Ujfcj45Huunu8IsUEhHlYoOo4Pk5QpipULxAe7gcqm21HfeRxv9iFJP
 KtlA==
X-Gm-Message-State: AFq9FYJggk+0EUczEh1ZhLpOUR7micVLwtUMYyIo0pwE0PADrofcoCKW
 tAPEqIYdFmQVEMEAr+JUziAHh8+fgA9/MXsbWlFQ9u2jyzTJFjOhABgaRItcQpQLxkedN14aR11
 GX1L2
X-Gm-Gg: AYBFou1VL6TNx1/0BGHLSoRelVsTMrlD4Hw2rToAnC99qvOR8Z+CkcgNFR3jPOAXs8D
 FlDoHdSXMYJrgnihR9xDArJKsAYcN1UsfbezitK3+yNveCR8V7La7oy1VicVJKoi/5vi3Hwa8mJ
 fuVpOMMWYCGN54TADosbqvfcFCdrseqzr/oeOAPHOXZhG7EjJenF7VFrld0Lk47sRsc28WvRZfS
 zoDPsWJBjx1F8cWK/go9MY8lX1htLVxkf3Co4C7707YB/M/SHLG8TJmv57g4am2/OozCq3oeU7N
 386odPMe9nxO23MIpeYchHk16wfZm4ERA/J2M2eiQNCli5cfEBo85v1oc+kW7EyLi0PTBN3I5hf
 TmYVfWFuna/aZu4yJSnmmvTBnJemEREn9qdW5R90crPGILc8cCgS+SJk5/DBH/GRllfBga8S2UI
 z7s1KwRSgP77X2Xt7QrtX07iyg1v59BH+yL39xrbpoqbI2NIEwlkdqchpKuSw3ZBmHjEEE26THg
 QMtYiJ//oprxcdt4BRbeyGeNbqXTadc3hpkPZ8KBBE5khENpr0YkOWZq/X6Wh6b9ynWzBLVbD01
 9ViPRNG5T74OsHwNG5H0yPU4YKv4d767CKdEoQ1y0N7tdxhwVk7TfJRrjXy86ZKM2hA55QbVVZx
 dy9Y+w0fFxR1HPPME4P9iWjWyMvZRQ5Au7HAW26Jllwh5F/3leHGD2WutRJjNagEEa1uFLb5nug
 ==
X-Received: by 2002:a05:600c:5247:b0:4a1:a2c0:7b73 with SMTP id
 5b1f17b1804b1-4a1fdd5b0f4mr104293765e9.30.1792682046999; 
 Thu, 22 Oct 2026 08:14:06 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e25827087sm12732367f8f.21.2026.10.22.08.14.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2026 08:14:06 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Dick Olsson <hi@senzilla.io>, Sergey Matyukevich <geomatsi@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-amarula@amarulasolutions.com
Date: Thu, 22 Oct 2026 17:13:54 +0200
Message-ID: <20261022151358.2260712-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022151358.2260712-1-dario.binacchi@amarulasolutions.com>
References: <20261022151358.2260712-1-dario.binacchi@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/6] package/uboot-tools: add fwumdata target
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
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
---
 package/uboot-tools/Config.in      | 14 ++++++++++++++
 package/uboot-tools/uboot-tools.mk | 11 +++++++++++
 2 files changed, 25 insertions(+)

diff --git a/package/uboot-tools/Config.in b/package/uboot-tools/Config.in
index b7fd6ff17da2..ac785261c523 100644
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
index 7c6ee0f3c467..5849e07a990d 100644
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
