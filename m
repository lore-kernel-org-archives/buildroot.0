Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7CBC433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 21:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE793409A6;
	Mon,  6 Jun 2022 21:26:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y7kZZOySQWC6; Mon,  6 Jun 2022 21:26:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C5D744014C;
	Mon,  6 Jun 2022 21:26:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 58E001BF279
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 21:26:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5365B40925
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 21:26:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xTOgwQtrRafr for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 21:26:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 088EB40904
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 21:26:21 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id h5so21543199wrb.0
 for <buildroot@buildroot.org>; Mon, 06 Jun 2022 14:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cbrJDfj41D/RAcHV/kt71TrAZX6HmqJn7fezfCFPI7E=;
 b=RpSlX2q0TFIaez60ZY4nuUqtODeeqeil2tOcvHqmCgMdaTBoUmde5Wx2N+B410FEBz
 SvghWU8eJ0fug2pBREMlEqNRbC3esg7PlLg174RUmy0y9E6TbRuxZapE7xE7f9hDFVlj
 5iMI5659N5gosdRerjF0SKPrh0PaU10UZr9HlbxsI1tZPf8Y79v1qVMDmtA96wuj6AcV
 B0QEtQOyIPGL+Fra0axa9Le0oC9KbQcnxWzrYvZDWOQh9Z0uJ88eK4nkmAbTUV04O3PD
 0OIE9Kl7F97UtJjoZl24rQGf4i5QU5kWuyEQHwPe9D6IKMsjEs23GzufgWWoh1UgRc96
 cIvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cbrJDfj41D/RAcHV/kt71TrAZX6HmqJn7fezfCFPI7E=;
 b=GBPL+2FIgGJvPHb7KATMIFjh2lUaMhsfdN36izg3iOctdRw6XKDu3RyflAVcHqUl8M
 2RRXM62f2DtQyssxhAjhxYE7mtitv2432Pcl4w5ZurQoTVIckamFMH34O6Ul0KwvwGeO
 YzwQJ5cQXPOJ6a5vYyrfkMur+CevW1gza8LM98HG6N7g3HkpCTBr8E+yFNBkOvsBVlwk
 kxJMm3S0urCzXi3SsWDw1TtG8ASfRQBKCCdqBOZA55NvVU5eIONdgcnSVYtlxPlMHOvw
 VjHFJD6VB07JCDw9VBTD3qTN6k3Fh40oTrX+2d16hsZXNsshpeB6KNJ2qH4zHRPRCPHu
 W1wA==
X-Gm-Message-State: AOAM530HGMWe5VZQlVU7dCxRaeSFgfvYNVQXsYt4giUFPYCNlxWUISBx
 H4mErQ6MXXSqOKwfe4DXHVn/n3Hr2js=
X-Google-Smtp-Source: ABdhPJxmblfkhVVLV2j0utM0u0Tr2fQxy02eDM4QvuVaW1y3rPaMeC9M1qJswSsmNtKTh9YQtJL5uQ==
X-Received: by 2002:adf:d1e7:0:b0:215:2126:dede with SMTP id
 g7-20020adfd1e7000000b002152126dedemr17779088wrd.297.1654550779971; 
 Mon, 06 Jun 2022 14:26:19 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 s19-20020a1cf213000000b0039c4945c753sm7039911wmc.39.2022.06.06.14.26.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 14:26:19 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Jun 2022 23:23:42 +0200
Message-Id: <20220606212342.3981-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/haproxy: bump to version 2.6.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a long term supported version that will be maintained till 2027.

https://www.mail-archive.com/haproxy@formilux.org/msg42371.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/haproxy/haproxy.hash | 4 ++--
 package/haproxy/haproxy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
index 18834c29b1..4b00438190 100644
--- a/package/haproxy/haproxy.hash
+++ b/package/haproxy/haproxy.hash
@@ -1,5 +1,5 @@
-# From: http://www.haproxy.org/download/2.4/src/haproxy-2.4.15.tar.gz.sha256
-sha256  3958b17b7ee80eb79712aaf24f0d83e753683104b36e282a8b3dcd2418e30082  haproxy-2.4.15.tar.gz
+# From: http://www.haproxy.org/download/2.6/src/haproxy-2.6.0.tar.gz.sha256
+sha256  90f8e608aacd513b0f542e0438fa12e7fb4622cf58bd4375f3fe0350146eaa59  haproxy-2.6.0.tar.gz
 # Locally computed:
 sha256  0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28  LICENSE
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  doc/lgpl.txt
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index b498549e20..44fc9320b7 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-HAPROXY_VERSION_MAJOR = 2.4
-HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).15
+HAPROXY_VERSION_MAJOR = 2.6
+HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).0
 HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
 HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
