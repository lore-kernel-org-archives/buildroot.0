Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01361C001DC
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 22:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8F0241FFD;
	Thu, 27 Jul 2023 22:26:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8F0241FFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kou41rP08Wwe; Thu, 27 Jul 2023 22:26:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D0A942003;
	Thu, 27 Jul 2023 22:26:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D0A942003
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 755C41BF3D4
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 22:25:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CDD5B60E59
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 22:25:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDD5B60E59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Maw9OCX1q7a6 for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 22:25:52 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 493F460EC2
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 22:25:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 493F460EC2
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3fba8e2aa52so16604295e9.1
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 15:25:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690496750; x=1691101550;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/sg7GfMqapw7fWMhICqeDOWOKL8OywRjYdZsx4Vuw4U=;
 b=jlzbSH/x1OgRmG1k9RD/X0voJkZFTj6VK6cUFY7YUHaOGQaEwnMojD37wX+y2gNgOq
 xK9/G0bn68WEzAofaGobhhNOpsMz8irECwRzXYPnNrd1LKP1ioQ92JcbOSW4mWBGKBX7
 ThwY9GdMp/CQWnDZTgXculos9XYzJ+37jP0wVtTrvGKKMH3rGO/lqLaKa1yneXWIMuIp
 mX5Foi4iXXQTZ9k98Q1tJr/xQazXP03ThR8Kon7uvOQgG92swAE0EEyjw5tkVYMDOUqm
 LBCESJml6FztJecmYF3M3zXnNw+wGtgAiPqV6VIzSg6J8BCaopayiBO1H54dm6e+Gu/Y
 U9VA==
X-Gm-Message-State: ABy/qLbD6oTGQnihM6tbXDmDaFYO0Azf7eNA9HgYX5mUY4XIlqX0E2T2
 BILaEUeaY7CWAAEAJ82GE70BqIUx/nM=
X-Google-Smtp-Source: APBJJlFlfuSQoPcxRHeY5GvzIferwhaRNWs6imgKaRnDM5yik5VDJvOwXcTHdiTWpxWjdBs2VQpQ5Q==
X-Received: by 2002:a05:600c:210b:b0:3fb:fb88:974b with SMTP id
 u11-20020a05600c210b00b003fbfb88974bmr293214wml.6.1690496750297; 
 Thu, 27 Jul 2023 15:25:50 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e00eeca726b991c1980.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:eeca:726b:991c:1980])
 by smtp.gmail.com with ESMTPSA id
 s18-20020a5d5112000000b00313e59cb371sm3218163wrt.12.2023.07.27.15.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 15:25:49 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jul 2023 00:25:41 +0200
Message-ID: <20230727222544.196562-5-romain.naour@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230727222544.196562-1-romain.naour@gmail.com>
References: <20230727222544.196562-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690496750; x=1691101550;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/sg7GfMqapw7fWMhICqeDOWOKL8OywRjYdZsx4Vuw4U=;
 b=rllsXOZ96+SaCp+Tkt3Fuz4iSaFbQxpQBl1z71BV/tm5wkZpQzw9j9Mm69LMl4+JKq
 yq71VAztWHE8U6tX7sNMNbsVhVfXc032oucN2+gkr5uwOss95jhRsfoe1zpkZtuhxwsP
 rPjbaNK+GRjJo7o8PUGiazrqL/XVk29g9tHzD60Aeo53DkNYXe8RDUeB88yt9VFxoYL1
 +cZGPrbwr2BIaXHx8N2yNl+ZkSQz2tdInEOEDTdV9n7dwqZJ4YrdaM7p+xVUDDSUw5uQ
 PIi410XpIDm5O1kK/ySohVnqIBhQilqZ18PjrCjhybQ1RccHgadjNgda/qJQZex/i3CI
 tmqw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=rllsXOZ9
Subject: [Buildroot] [PATCH v2 5/8] package/gcc: switch to gcc 12.x as the
 default
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Even if gcc 11 is still maintained for some time, switch to gcc 12.x
since it has been released since 2022-05-06 and gcc 13.x is available
since 2023-04-26.

We have been having toolchains in the autobuilders with gcc
12.x for a while, so the vast majority of the problems should have
already been solved.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/gcc/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 5c356e7cbd..bf2ecbde65 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -5,7 +5,7 @@ choice
 	default BR2_GCC_VERSION_ARC if BR2_GCC_VERSION_4_8_ARC # legacy
 	default BR2_GCC_VERSION_ARC if BR2_arc
 	default BR2_GCC_VERSION_POWERPC_SPE if BR2_powerpc_SPE
-	default BR2_GCC_VERSION_11_X
+	default BR2_GCC_VERSION_12_X
 	help
 	  Select the version of gcc you wish to use.
 
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
