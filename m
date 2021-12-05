Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 217D2C433F5
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 00:55:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B9038400E9;
	Sun,  5 Dec 2021 00:55:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yHd60wd-IdrP; Sun,  5 Dec 2021 00:55:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E76A140261;
	Sun,  5 Dec 2021 00:55:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2DCC01BF963
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 00:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9A5F40261
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 00:54:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qH2z7KdQ_kZJ for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 00:54:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CF8C2400E9
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 00:54:21 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id a11so6611449ilj.6
 for <buildroot@buildroot.org>; Sat, 04 Dec 2021 16:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wMWTncipjZD6XmNhrJs51V/M+may0ggYGSATpbnTrVk=;
 b=F50fscK9Mup7dHR1gSpCdNJZ6u4h33I1IpNW+CG03GXEUxF+nYh/5nZJiRTkQJtoDx
 R+dUfh8N0hz9iPqWCd+kSbsBkqBM13614MLoWUj8yWx2DJcVzzsuxep+TWKqeUPy3vN1
 WwQrDV/EVqxszo+ZAffjIbBD7W9VkkTXLZnQMYGZqtRjlhNw8Lz116ybDLZDnkuAqz5l
 xm3uwCp0gfmwMlXOF//kQswNASO8zGC37g9zk6LspzODLHL/vRZ02fEmSW3tPKmv//QF
 W3klOa79qtvl0Q5NXhAt3fikRM0+KsxYmfZ5X/qSXFWZ/tpoguuOTjrjxNq+gjzDEHtm
 QozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wMWTncipjZD6XmNhrJs51V/M+may0ggYGSATpbnTrVk=;
 b=n+ckNh97VWKhmfbOzZDac81e7kDS8THicx25iDmsWd0PKb4tLonw2xRwiavTeNbt9g
 K/umOhR5Nre7u4wx/h7MEzzExYp5my6sxXF9igNJv5GU4VYVUMBIglm+3tTnx+LITNaJ
 BkzLt+k+Ifvjdbazxzdp7GHwcUTDQ6bd9YzIUpOFCDlGrt2B02ET4vqUfiQWnd4D0aEr
 pClKYR6a4p+8ZmkwqXo8gZZ0SHc95H3kjW8i5eS7yquOBBsdV2BxCXMgf5Q/2xhILr6/
 tDfBB0AiNHKf2FKQ8iKyb+WHngSirJmMzbT/vTP8fVO1OusZ0v5hlGteCWG2HUojNBbf
 cRUg==
X-Gm-Message-State: AOAM532nrDiQ85g/0UPa4/3yC7kqoDdcVEgeE5sI1977VT8ybxMoa/9m
 fK9kSHX7/K1uTEvPIYBLoBETVnDUukI=
X-Google-Smtp-Source: ABdhPJxhB6hCVoevDZaP7vj/CYaMM9zPSXC9bCSkGeeHkjpxUKddQh5BpbOEJ90D5DOdTCqhC5jvFg==
X-Received: by 2002:a05:6e02:b25:: with SMTP id
 e5mr1989890ilu.304.1638665660759; 
 Sat, 04 Dec 2021 16:54:20 -0800 (PST)
Received: from james-x399.localdomain (71-218-107-26.hlrn.qwest.net.
 [71.218.107.26])
 by smtp.gmail.com with ESMTPSA id g7sm3903914iln.67.2021.12.04.16.54.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 16:54:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Dec 2021 17:54:10 -0700
Message-Id: <20211205005412.2888068-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211205005412.2888068-1-james.hilliard1@gmail.com>
References: <20211205005412.2888068-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 5/7] package/network-manager: add optional
 selinux support
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
 package/network-manager/network-manager.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 25dcb563c1..4ed66c2f9d 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -70,6 +70,13 @@ else
 NETWORK_MANAGER_CONF_OPTS += --with-libpsl=no
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+NETWORK_MANAGER_DEPENDENCIES += libselinux
+NETWORK_MANAGER_CONF_OPTS += --with-selinux=yes
+else
+NETWORK_MANAGER_CONF_OPTS += --with-selinux=no
+endif
+
 ifeq ($(BR2_PACKAGE_READLINE),y)
 NETWORK_MANAGER_DEPENDENCIES += readline
 NETWORK_MANAGER_CONF_OPTS += --with-nmcli=yes
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
