Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C247C433F5
	for <buildroot@archiver.kernel.org>; Tue, 10 May 2022 16:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CA3241735;
	Tue, 10 May 2022 16:33:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iJcIR-bZZrQ9; Tue, 10 May 2022 16:33:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 153A0404AA;
	Tue, 10 May 2022 16:33:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 067B21BF3A3
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 16:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02A3740239
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 16:33:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0pWsUg1Kx0al for <buildroot@lists.busybox.net>;
 Tue, 10 May 2022 16:33:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 463A740AA6
 for <buildroot@buildroot.org>; Tue, 10 May 2022 16:33:03 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id k126so10540722wme.2
 for <buildroot@buildroot.org>; Tue, 10 May 2022 09:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ohNzHUlK5lzbedyaWSzW7VzGTHlWG3ZeoGTb0pQWtxc=;
 b=btImdb31DQzyBv+DFEAdMlzuSaL7Q3ei10kX6BpAiZ8WdnvnjToaxxeI0c5ZlxQx7I
 EpO1bqDEoj+yof7aonWFayWUD9IYSt9engmDT5xiPVMz9T4Io6/H+Sy6OuRL+78Ehobz
 iznoiVRzjZFs1g7DYDjKkWDyV2ZBsOy+ua8ngydJ/fIw0uzzumdM3KL7b6+nQhQOD7Hx
 BDfitPc2c//4UaevgVtZDqZfaILspAeqhCWqu5BOzQcdRtVv4ma3he5EBJVj81I3ffQg
 dZQ5aex0U6uJLlCrbg/gYsn+PTR10+wpNjYiRtJfiF5lOrI0Jq4JyJKGeQZIXxoRv1gN
 EvYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ohNzHUlK5lzbedyaWSzW7VzGTHlWG3ZeoGTb0pQWtxc=;
 b=MIlSjn/EmaOa9VnGV6fF2Aa1A1/jFoSyHUGf61Pnh5kzM072e9DY38y2fnmZXfmjTJ
 CL3YUEateGRR1vOJIyH3nAr4bNRAhlH3zPxxP0PAFqBhJwoqW+/JfahCfCXbmmroe0uy
 sxYt+etz3qXI0zQNw/NYE8qBn44FSe1U7TYQQcHscPApooLeAQMId8HsTFuS+tb9Njrn
 bFi4Pm3vo0o1gXVgVpfd/qQ8zeufbl3JCVDWVDzfjc9bB8eSMaFMNA0AMwRlTJ8FceAb
 o1GCxQI5l1QXC9sPmrn35oNbNORYQDUesd3Nt4KU2Ww/2spB5GJFcLSYei2muxCK8hNL
 4Y9g==
X-Gm-Message-State: AOAM532fI7dHBex6Um5fJ9tWNowPysI+8L5qaDdL1hRGGUuOTRvSXFSA
 0sQl4JFzxdM11x0nJig6LKk2qj3ERT0=
X-Google-Smtp-Source: ABdhPJypzrmh9/kCSmtDrNPLZT7TyBm3l/eOloPIozuHWS6KP5do1dl4Q/84jCoG7sVR2HOwhSFQxg==
X-Received: by 2002:a1c:a3c6:0:b0:392:a630:286c with SMTP id
 m189-20020a1ca3c6000000b00392a630286cmr814366wme.72.1652200381317; 
 Tue, 10 May 2022 09:33:01 -0700 (PDT)
Received: from dell5510.arch.suse.de (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 l29-20020a05600c1d1d00b003942a244f53sm3260126wms.44.2022.05.10.09.33.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 09:33:00 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 10 May 2022 18:32:49 +0200
Message-Id: <20220510163249.21272-3-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220510163249.21272-1-petr.vorel@gmail.com>
References: <20220510163249.21272-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] musl: backport netlink macro fix
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
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

8cf87b30 ("fix incorrect parameter name in internal netlink.h RTA_OK macro")

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 ...rameter-name-in-internal-netlink.h-R.patch | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 dl/musl/0001-fix-incorrect-parameter-name-in-internal-netlink.h-R.patch

diff --git a/dl/musl/0001-fix-incorrect-parameter-name-in-internal-netlink.h-R.patch b/dl/musl/0001-fix-incorrect-parameter-name-in-internal-netlink.h-R.patch
new file mode 100644
index 0000000000..fa3057ff08
--- /dev/null
+++ b/dl/musl/0001-fix-incorrect-parameter-name-in-internal-netlink.h-R.patch
@@ -0,0 +1,33 @@
+From 8cf87b3027009c0acac591d9ae80262dc25daccf Mon Sep 17 00:00:00 2001
+From: Ondrej Jirman <megous@megous.com>
+Date: Wed, 21 Nov 2018 17:29:21 +0100
+Subject: [PATCH] fix incorrect parameter name in internal netlink.h RTA_OK
+ macro
+
+the wrong name works only by accident.
+
+Signed-off-by: Ondrej Jirman <megous@megous.com>
+Signed-off-by: Rich Felker <dalias@aerifal.cx>
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+
+[ upstream status: 8cf87b3027009c0acac591d9ae80262dc25daccf ]
+---
+ src/network/netlink.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/network/netlink.h b/src/network/netlink.h
+index 38acb178..873fabe2 100644
+--- a/src/network/netlink.h
++++ b/src/network/netlink.h
+@@ -86,7 +86,7 @@ struct ifaddrmsg {
+ #define RTA_DATALEN(rta)	((rta)->rta_len-sizeof(struct rtattr))
+ #define RTA_DATAEND(rta)	((char*)(rta)+(rta)->rta_len)
+ #define RTA_NEXT(rta)		(struct rtattr*)((char*)(rta)+NETLINK_ALIGN((rta)->rta_len))
+-#define RTA_OK(nlh,end)		((char*)(end)-(char*)(rta) >= sizeof(struct rtattr))
++#define RTA_OK(rta,end)		((char*)(end)-(char*)(rta) >= sizeof(struct rtattr))
+ 
+ #define NLMSG_RTA(nlh,len)	((void*)((char*)(nlh)+sizeof(struct nlmsghdr)+NETLINK_ALIGN(len)))
+ #define NLMSG_RTAOK(rta,nlh)	RTA_OK(rta,NLMSG_DATAEND(nlh))
+-- 
+2.36.0
+
-- 
2.36.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
