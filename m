Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C08E4C433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 19:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61D5D60AB7;
	Fri,  7 Jan 2022 19:51:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2d5dlZFi9AEH; Fri,  7 Jan 2022 19:51:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 768DE60AAE;
	Fri,  7 Jan 2022 19:51:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4F5D91BF317
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 19:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C47840002
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 19:51:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C8iJaKhLN3j4 for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 19:51:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2632A401C9
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 19:51:22 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso5565739wmj.2
 for <buildroot@buildroot.org>; Fri, 07 Jan 2022 11:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QSfSvmS3+w6rZt6y0ivCYjsJXoU8d06EkMa3PeL9yXc=;
 b=Kd7k3Msa1Z0vk1y2ubJcgVqjnt+UKcdb7rK/OqHK2qeU+wvEweJVGmCptbSl15aVvK
 Q5Ow02nYP+1wXt1UX7ZkAZoOu1PdixlpfQjtQTKMFkPsQjyCRs36wOJirOspIdQzwgM7
 w3c9sRin74dPhipfrdr6L46fU7AyJ2zOMcWB1zWiQthQIB6Z1sgaDx6DpWCfK/ojFTpk
 FH/yB7FF7D8NcndqQq2nSaSmCZldKbCIZE5esO20ZepWJrcPGmg86h2t2SYH9YwdUHtw
 +KvEdq/XBnhRNSpjON3yaAXtEvP3we6lrHI0ThEOQdJe5bLILJ+ylqeulkviPAp6Pa9U
 AwuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QSfSvmS3+w6rZt6y0ivCYjsJXoU8d06EkMa3PeL9yXc=;
 b=K4j9qk5ZVbIjvIdpSuIxmp7DkSd0TcQPpjnS6qZoKxh7jx4aCYyrtNV9nGLr2G3UiT
 WMXFBgmhiFrJTP3MMsy8rtQ7j82AWjl8sP3uRvN3ipFp7KOkRd5xMpAD8NAJwg4Li7Dg
 7cT9eNiXeNr7J7gcLphgqH7j9aGD7VcJOLZ8vVR+fm2S2OWMWmeypOYM50v8zGcRdHYX
 8I0pZjKa5i7SZFBOk7/UdGUBwHumq4eGVaYDDnc+bqavupS1kklXLcGpGrX/IJNGHKpr
 Is7FAheCM/nyEZrW9Z8I/RTiZpAXKGS2+EHQQG1d5SeWJQeWRLk/ynrn2a8/u2tuaZe0
 zGTw==
X-Gm-Message-State: AOAM531ld9yFTmEqlnzGf2vY20RKwmtScLHlLG0gzeI6aSS6NbiHUdB9
 SHAvv8emr4pe+6gmDgJpRLvks6Ma0oM=
X-Google-Smtp-Source: ABdhPJyfXJX+aJI2mVJ3j1Vcaiy7VkB546J+Dwl34VesH9y3cPSsj5JyV+LgvuA+B5ajGnjXLKLUcQ==
X-Received: by 2002:a05:600c:3d8e:: with SMTP id
 bi14mr12649616wmb.19.1641585080289; 
 Fri, 07 Jan 2022 11:51:20 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id bk17sm5518311wrb.105.2022.01.07.11.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 11:51:20 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  7 Jan 2022 20:49:57 +0100
Message-Id: <20220107194957.1320947-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220107194957.1320947-1-fontaine.fabrice@gmail.com>
References: <20220107194957.1320947-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/libeXosip2: bump to version 5.3.0
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
Cc: Gilles Talis <gilles.talis@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://git.savannah.nongnu.org/cgit/exosip.git/tree/ChangeLog?h=5.3.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libeXosip2/libeXosip2.hash | 2 +-
 package/libeXosip2/libeXosip2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libeXosip2/libeXosip2.hash b/package/libeXosip2/libeXosip2.hash
index b88a5b4c21..5cfee3ab29 100644
--- a/package/libeXosip2/libeXosip2.hash
+++ b/package/libeXosip2/libeXosip2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  87256b45a406f3c038e1e75e31372d526820366527c2af3bb89329bafd87ec42  libexosip2-5.2.1.tar.gz
+sha256  5b7823986431ea5cedc9f095d6964ace966f093b2ae7d0b08404788bfcebc9c2  libexosip2-5.3.0.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/libeXosip2/libeXosip2.mk b/package/libeXosip2/libeXosip2.mk
index b550e293ae..86d821b02f 100644
--- a/package/libeXosip2/libeXosip2.mk
+++ b/package/libeXosip2/libeXosip2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEXOSIP2_VERSION = 5.2.1
+LIBEXOSIP2_VERSION = 5.3.0
 # Since version 5.0, letter 'X' in library's name is in lower case
 LIBEXOSIP2_SOURCE = libexosip2-$(LIBEXOSIP2_VERSION).tar.gz
 LIBEXOSIP2_SITE = http://download.savannah.gnu.org/releases/exosip
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
