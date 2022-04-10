Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC4CFC433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 03:17:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A4F38434F;
	Sun, 10 Apr 2022 03:17:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kir_lDGTjNIl; Sun, 10 Apr 2022 03:17:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7911484345;
	Sun, 10 Apr 2022 03:17:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DAFA01BF983
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 03:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D822B41865
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 03:17:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AcWMQRwidyBJ for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 03:17:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 056C14186C
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 03:17:22 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id b16so15057665ioz.3
 for <buildroot@buildroot.org>; Sat, 09 Apr 2022 20:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tIuhi3O6q/YhoeiEZI/BiEin8glZsBnIrM80OakzRBw=;
 b=JnlV3Kg0ypUm7P5zVVspSeP+oL61rdtEpSAFByyP3abrgtr+R6iQszUPlL304gdn92
 abj3d3C5bBUdqP9Q0sZt/xwUVhlzP9swIxdjHe9/kJ9Nn7Ut/pg0dUNWv6EEH2ef5VQ+
 dSzBECR70fbDSU+/ZGHaKRM0YxnThEIh4923s/0UPGI2lBYyzzgUzHY8zl1z+SRRM22x
 BdBIw+6H/SGe48vHQYYbAh6AQUTyDMWMg52Ke2sBUV/a7sVXlht6ZT7LGlG/HEf3mNsa
 qrC5H2HRzxGqWKVjiGTcKX0RH6RHFim1ue6SuWeNjuaAiDf64O4x+nu9hXqN6ZA/Ypuy
 WwRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tIuhi3O6q/YhoeiEZI/BiEin8glZsBnIrM80OakzRBw=;
 b=cppO1ukupQdhC5KgjRs0w0A5veN908n9cHN2gtiOpTPjxr2BMOlEtz69jW1MZbtpzh
 ur05RZ8TeMCX0iSC4Sa5jcLAZpA/U1gTpRCNYC4hkefa/B8WEc1QoUBJSIDFizNOUcK1
 lPnpQlLNYX7yWJoRZiML1oRH2mXfJvn38OwpnnCOuh3HD9dFvk8znt2TLjQ7wrdEcf3k
 VigHnggRyGuqyapGzr7eguo0xL7VMfmBfLWTzLnOV4RdmtQ9D1AstSespsP5rdHWufB3
 TEpbbfc/z46RtdptQmQA4d5B68aKoEFrVNSgzhbXIZRCdlW2gODDFNLU9iJxUCiKkesV
 NIIg==
X-Gm-Message-State: AOAM532svXeovZKjj/pUpsP+iCk9qQnP1kL4JrPc0bxzJzR0EbS1JkcX
 bRQu7cHc6lOM21XDH6f2FTyGB4uOKdDK6w==
X-Google-Smtp-Source: ABdhPJwzBVy8pob9YZBAObb09J5/gG/+8g5/wnGCxqx4jZdUNAeMJIFl4xiRMDvmdHkQ6/6JaG6I+A==
X-Received: by 2002:a6b:fd0c:0:b0:645:d261:ba25 with SMTP id
 c12-20020a6bfd0c000000b00645d261ba25mr11362839ioi.124.1649560641807; 
 Sat, 09 Apr 2022 20:17:21 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 ay18-20020a5d9d92000000b0064c77f6aaecsm19300511iob.3.2022.04.09.20.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Apr 2022 20:17:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Apr 2022 21:17:12 -0600
Message-Id: <20220410031713.3662393-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] scripts/autobuild-run: fix and default to
 python3
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 scripts/autobuild-run | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 346928f..9219134 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 
 # Copyright (C) 2014 by Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 #
@@ -794,7 +794,7 @@ class Builder:
         while True:
             try:
                 self.run_one_build()
-            except URLError, e:
+            except URLError as e:
                 sleep(30)
 
 # args / config file merging inspired by:
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
