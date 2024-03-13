Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A18CC54791
	for <buildroot@archiver.kernel.org>; Wed, 13 Mar 2024 09:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2AF7341521;
	Wed, 13 Mar 2024 09:15:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fx8X823Bgahe; Wed, 13 Mar 2024 09:15:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99D6D415B1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99D6D415B1;
	Wed, 13 Mar 2024 09:15:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 10CA61BF3DF
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE6B481380
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8GDZPjgP0rNL for <buildroot@lists.busybox.net>;
 Wed, 13 Mar 2024 09:14:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=fperrad@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0F31D813B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F31D813B0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0F31D813B0
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 09:14:31 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4132a4360b6so15863245e9.3
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 02:14:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710321270; x=1710926070;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eDaajo+SFmEaPEX+0EMUU9KTEh21Pr1Vpmjzb1lmhcQ=;
 b=G0JlyOoBg+RLbUKb6tI4Xo1V4d5f+5RvuxW1flLANKcOHCdA0QTuZ54Qeri98ZiZ0A
 GOhUd2+Yd2H+5uVvZeSGb+jzolPQ3ig+Z50laroRZvVFr3zflIGlgHtU7q+7je1NYl5p
 0XiT5nNtOAG5lewMe7hTnPE0uhtxZTSvK6/H+qdfl9ENf8IqfwSXSdEmRi925BiYHb35
 G3zStiOsJ0+RiGX7fxcU37UJ7/uyrR2tDk1wG3s1VrqCvg1DAByWYVoOVRrB33J4HdkL
 m9BfNI3IaPioZ24D6IE1vnhBjlc3VHUwI6ZPBQKsO6CK+5CutuhouUtWifMxC0slBGEP
 d9wg==
X-Gm-Message-State: AOJu0Yz4eN8MWWClYxjwlp5Z3iZCSMQP2sF2mx8qoAZ+1Yvsg1NhwH56
 NqjoeuTmsNDiKUAKPKA5Mrz5GncUaik/BAijMcFBmkeii3D9oxIw7Zu20Zedgow=
X-Google-Smtp-Source: AGHT+IH6xprZxkprxaByY7yCHsSBdN8Gj/yKivlKU5hmKSB7+CbsqlEQ3DSUr6dA5XyU5zFR4YCH3Q==
X-Received: by 2002:a05:600c:1f94:b0:413:1dcb:b618 with SMTP id
 je20-20020a05600c1f9400b004131dcbb618mr7994965wmb.39.1710321270126; 
 Wed, 13 Mar 2024 02:14:30 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.92]) by smtp.gmail.com with ESMTPSA id
 u1-20020a05600c138100b00412e5f32591sm1699799wmf.28.2024.03.13.02.14.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 02:14:29 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 13 Mar 2024 10:13:57 +0100
Message-Id: <20240313091412.20865-16-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240313091412.20865-1-francois.perrad@gadz.org>
References: <20240313091412.20865-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710321270; x=1710926070; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eDaajo+SFmEaPEX+0EMUU9KTEh21Pr1Vpmjzb1lmhcQ=;
 b=GIbSd/iM6NddEXGo7n030ul1/j5nFGMfkZm68JDBFLRuS17AseDn3tO9huperPZmhE
 IHS7xrm0NZZVLGeb+KxEQqY3PsExpz3JHvD8xyTHpnNPQJA2qLyrXbiCu6T+OACm7T1W
 bp1zHFvPUzAqg5jbvqPx1dC/eyY1iTbOeHmJJrETeb81mL9n9BI51DkQbF7djU4hLDq+
 Vv0w7Zr4ZjGOXs0vn59HjRgmB4/KoJzX9lYHGhoUP8mN251wOQ0JnNdnsyFnv7qBGLDl
 +X7GTekNFP2Ezy815+F6QzZVO4Q+XhPJSJB4IdfCJCEFMzvttfqho5twNS4p+SOqilCo
 XXsg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GIbSd/iM
Subject: [Buildroot] [PATCH 16/31] package/ipcalc: disable busybox ipcalc
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/ipcalc/ipcalc.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/ipcalc/ipcalc.mk b/package/ipcalc/ipcalc.mk
index c1eba5d59..17c819cd0 100644
--- a/package/ipcalc/ipcalc.mk
+++ b/package/ipcalc/ipcalc.mk
@@ -30,4 +30,8 @@ else
 IPCALC_CONF_OPTS += -Duse_maxminddb=disabled
 endif
 
+define IPCALC_BUSYBOX_CONFIG_FIXUPS
+	$(call KCONFIG_DISABLE_OPT,CONFIG_IPCALC)
+endef
+
 $(eval $(meson-package))
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
