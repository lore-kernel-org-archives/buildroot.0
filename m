Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28372CD98CF
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 20:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F117C8162E;
	Fri, 12 Jun 2026 20:51:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yN3bXIbL2pSo; Fri, 12 Jun 2026 20:51:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 733738414C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781297479;
	bh=QmUEY1PRbq0FBp/leaUFEm+j7kGzsjPMhBrcJfcasrY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XlIN8fEjIK24+fvCcmXrmkgNeYKlFVd0J18Er+a1tOuNfXTNFeRbvV6uPK1V2WS+2
	 E2fdeW7DFikUzeiWm7uIiwVbwMKkap1fVo15IedyMFKJAO4cNwGpPRlv84wavsftzH
	 xxiCnwmrpXOKYN3KXa5RaRxgDD7ehud8ELESXxa0BRkDg/qqztbtAJcOGCvAv933MM
	 aE6FLIEjOSujJ1BqYzn3v6vTh5cF0MIdQrVYLwiHzbqKbgqB6SZJjyyCTU7heDPkVX
	 qNnJf3bC2MxSnbbm13xat+cn/6V4yd3S+kSXNYewdCAz0qC7n0Jhffrf/DD2IRSazk
	 okS/afIgcaWhw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 733738414C;
	Fri, 12 Jun 2026 20:51:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DC671E9D
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 20:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E4DB84143
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 20:51:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GAIrHwEtb7nC for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 20:51:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DE5258162E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE5258162E
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DE5258162E
 for <buildroot@busybox.net>; Fri, 12 Jun 2026 20:51:13 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-490be03d47bso14636685e9.0
 for <buildroot@busybox.net>; Fri, 12 Jun 2026 13:51:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781297472; x=1781902272;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xkOGNML7VCANbBtBXukr2es+jQg4k6eD/llgkqys7Ms=;
 b=WWT25NkwlUrO7iPXwNnRkd8lbYu1ZYEL4sHlOGjY92ncjbHISagRD67yWPoIYDG5Hf
 3tO8VtU4/oRyKs9YHNtX533D0TCgKC4EfW1cVeaAtH/YwVZexSuzVYlNMNv2hTVqlUml
 uavFACaU39G2i0/ccnEWvqOd3NZiFxdCc1IKzpuDCw3bMTkMk9rA8DG7KCYVmLncViS4
 znMWfB71gcMIKWUvEKaRmfISDg665ZGhyf8ajcmN4E1kYPjKwcO//ZE2fXe3nLJxPGBq
 o35g26STVGc7FPkdleybIiXAxoHOo1KORFSWA1x9O2X/tsd7uTvLsDslMcVOKQ3zj4gK
 gGCw==
X-Gm-Message-State: AOJu0YxQqbmT386Z6FR+bJ5Mp+UVkZm4qDpnueGp43fNuGeDYQ4oWank
 PYP6bivfVg+Ek3O/viZX0ewMCXU9u84dz8i3E0RNTLzrKMagj+Js/w6LByzJkyA+imz0fJqKmdK
 cHJb2dA==
X-Gm-Gg: Acq92OEkc1mthQg6iF6K46mXZYLT8HsTFhdb0WXOF7g7qOk4coTMf4CAF4WRKxGWN6q
 sM9liW3J91upWEAODe5b8sa4+f9sUQcU/qEmIWvEvvz3TvBuAnpuKyUH01j70rJ8RBpLGvLT1CK
 lvBJt6mqtcbXEbS5fkytzViFrc4cl3idcbWgVow1ILIouUSZjyfn8fuf2p9HFquXYSWNDcQoK5d
 Q0S06FJ6anuWMmH1lveyMLTQRXwY1bHxGQM0/xT0I6VlIUWb7ZSuX53v1mmB/RdB6kTaPYE+d+f
 I2sZo/vD4pG4KzYk8nwIEbgBpSg/vwHhnwBIeS6KuW/Rb4RY9uuP5WMnzmWDw9uT6QgVkivWy25
 N++Vzh2YLyGh+48Tt6oqVJoYNnzzyftuKbkFOtoKC3nCegf+64HWblfstolsIuPnhhG6WfVFnpb
 y526L+blBPhSXYWq6VA/71r6NsAzUlbdIj4CUwAJSss82Sr7H0Ew/d9KBtkwJc
X-Received: by 2002:a7b:cb87:0:b0:491:a220:6e48 with SMTP id
 5b1f17b1804b1-491a2206e91mr30360855e9.32.1781297471116; 
 Fri, 12 Jun 2026 13:51:11 -0700 (PDT)
Received: from vm-2404.. (165.186.66.37.rev.sfr.net. [37.66.186.165])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f26434dsm9353447f8f.1.2026.06.12.13.51.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 13:51:10 -0700 (PDT)
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad@gadz.org>
Date: Fri, 12 Jun 2026 22:50:22 +0200
Message-ID: <20260612205029.269642-4-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612205029.269642-1-francois.perrad@gadz.org>
References: <20260612205029.269642-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1781297472; x=1781902272; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xkOGNML7VCANbBtBXukr2es+jQg4k6eD/llgkqys7Ms=;
 b=JMd0m9DXn4zy0BGI7BaW9qimTtsTgwB/Ltm6GBMqUvgfCpKzCJ0XgSrZx3+2VCcgq4
 P0vqH1SFG2hIwWcaBz2A9FYPXDrk+/VXbugdH5JfM5ctfX1LDz6eivqMdpQ96/eYxY0W
 /VJxR4xEs/KoYc98gUAXWwM8+hCBfbBQraAyItS5+jlDN2i2UTNhqXSzOD53giUSzTgk
 4PvxyajSTZuaDdwM3f7Y8Gvg8v+YxV5wIvFBNdmzKVkR3wMQPCfQ9zS+GgYJH2mC2ypO
 iWjonFaFnQbHaOIbWdM4I9bzQa9cJUa3rFuwibu6fcUZF6sdRx/5C5AxP3OEMPEH6A2A
 5WtQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=JMd0m9DX
Subject: [Buildroot] [RFC PATCH 3/9] package/harec: new host package
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

dependency for host-hare

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 DEVELOPERS               |  1 +
 package/harec/harec.hash |  3 +++
 package/harec/harec.mk   | 26 ++++++++++++++++++++++++++
 3 files changed, 30 insertions(+)
 create mode 100644 package/harec/harec.hash
 create mode 100644 package/harec/harec.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 56be32544..681469716 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1176,6 +1176,7 @@ F:	package/copas/
 F:	package/coxpcall/
 F:	package/dado/
 F:	package/ficl/
+F:	package/harec/
 F:	package/janet/
 F:	package/qbe/
 F:	package/libtomcrypt/
diff --git a/package/harec/harec.hash b/package/harec/harec.hash
new file mode 100644
index 000000000..0c3679bfc
--- /dev/null
+++ b/package/harec/harec.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  5581bc16dcf22969c7d33b0f2a9535ba37d4cf1bb39dec252e98ff2781175629  0.26.0.tar.gz
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/harec/harec.mk b/package/harec/harec.mk
new file mode 100644
index 000000000..faaf913a7
--- /dev/null
+++ b/package/harec/harec.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# harec
+#
+################################################################################
+
+HAREC_VERSION = 0.26.0
+HAREC_SITE = https://git.sr.ht/~sircmpwn/harec/archive
+HAREC_SOURCE = $(HAREC_VERSION).tar.gz
+HAREC_LICENSE = GPL-3.0
+HAREC_LICENSE_FILES = COPYING
+
+define HOST_HAREC_CONFIGURE_CMDS
+	cp $(@D)/configs/linux.mk $(@D)/config.mk
+endef
+
+define HOST_HAREC_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) all
+endef
+
+define HOST_HAREC_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
+		PREFIX=/usr DESTDIR="$(HOST_DIR)" install
+endef
+
+$(eval $(host-generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
