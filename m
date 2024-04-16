Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BBF7C4345F
	for <buildroot@archiver.kernel.org>; Tue, 16 Apr 2024 14:27:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 150304038C;
	Tue, 16 Apr 2024 14:27:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R-3UUUjzKiI7; Tue, 16 Apr 2024 14:27:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C79374077E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C79374077E;
	Tue, 16 Apr 2024 14:27:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D795C1BF27C
 for <buildroot@lists.busybox.net>; Tue, 16 Apr 2024 14:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C1127406BC
 for <buildroot@lists.busybox.net>; Tue, 16 Apr 2024 14:27:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OMcHb_kfYOLc for <buildroot@lists.busybox.net>;
 Tue, 16 Apr 2024 14:27:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C74C3405FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C74C3405FA
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C74C3405FA
 for <buildroot@buildroot.org>; Tue, 16 Apr 2024 14:27:28 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-516d6e23253so4935810e87.1
 for <buildroot@buildroot.org>; Tue, 16 Apr 2024 07:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713277646; x=1713882446;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kbqgBPrgpNxbPJtQmNNavE0KAaePj54vB7RjOPbmZHU=;
 b=cMp8hUS3b4KA7Nif57fPOyVoAD3aS2IerudwtK3gpQ6p20xxtVUwcYC2ZsD4ylOQ21
 qs10GQ+9p5+6edk/lES98HNPdsdHgdjLHROxKkkk4nSxsDa9M8OfjosU9Q16vM44/k1k
 LTVW/DCdy71iSTjxj8EALe09Gj8q8V7xpiSiEnNlVRsxK6ijrZOOca3RwFaL4/7z9Ov6
 SG0KZN4t3iH7MjqADx/WMErh4k+wPgI0KaYB06XbFe9YsPKOuz125bBE8zvNEEs3VTYF
 e3aLrX3LUxCu/1P4j8uWfEQzBxeHN/oIEZogY0OP+cwFaaVnVG+fqIctg1+8OP3MNDGp
 BgHQ==
X-Gm-Message-State: AOJu0YxRC0Rre3r2VNNxIxlCJXTUBftTfYeId1bDf+eEJzblTaEDAMZo
 KxntBOTo6pOnKnNnmEXYISsYlyj6O7aLDl/z6gS/OJ0M/29hAkfXiwteWNg3
X-Google-Smtp-Source: AGHT+IGzOp8wrr+o1WYNA+U3g7TISlkRMvzIs7d0pMidrXAwqoO//cW+YI+i0a3+IWxCnCkjnH3etA==
X-Received: by 2002:a05:6512:21aa:b0:518:9ce0:e621 with SMTP id
 c10-20020a05651221aa00b005189ce0e621mr7712299lft.1.1713277646202; 
 Tue, 16 Apr 2024 07:27:26 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.12])
 by smtp.gmail.com with ESMTPSA id
 b19-20020a196453000000b00516b0051e6esm1629403lfj.231.2024.04.16.07.27.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 07:27:25 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
X-Google-Original-From: Roy Kollen Svendsen
 <roy.kollen.svendsen@akersolutions.com>
To: buildroot@buildroot.org
Date: Tue, 16 Apr 2024 16:25:58 +0200
Message-ID: <20240416142620.1751773-4-roy.kollen.svendsen@akersolutions.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240416142620.1751773-1-roy.kollen.svendsen@akersolutions.com>
References: <20240416142620.1751773-1-roy.kollen.svendsen@akersolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713277646; x=1713882446; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kbqgBPrgpNxbPJtQmNNavE0KAaePj54vB7RjOPbmZHU=;
 b=mmd8tmfvsujtoEp9LEEwUxPSnR7J1vaOS5eqOgWr4J51s7455lnUzol2P4V9+fa5jn
 tpQBmXxx/FyGxapX9PDNpOY4aVnGY8iZ0g8XAkrtzfu7HdQt/BBJFo49Cr7Zlige9wd2
 etLHU4nfdXlfHeeMA4pUqQ90oLHcpF+DgZkG4Y5CeFWdz5cP0kOhJKb0iu0it9vMULQc
 9gcVbl9gNUnJ26QhqzuFye+AlYrAZ0TwGc172VFvYuMUq4hxM2u5XuuGdQhO3xA3ODWq
 O02VCkUTOdRreHNZgR9txA8gpAnvUE4RX4LrfwGSB2KJCKvbuWwqGEILAzLRRTSOaaPC
 Iqpw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mmd8tmfv
Subject: [Buildroot] [PATCH 04/11] package/qt6/qt6svg: allow building for
 host
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
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>
---
 package/qt6/qt6svg/qt6svg.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt6/qt6svg/qt6svg.mk b/package/qt6/qt6svg/qt6svg.mk
index 25e87dd208..a9d7eaef51 100644
--- a/package/qt6/qt6svg/qt6svg.mk
+++ b/package/qt6/qt6svg/qt6svg.mk
@@ -37,3 +37,4 @@ QT6SVG_DEPENDENCIES = \
 	qt6base
 
 $(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
