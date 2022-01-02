Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D332C433F5
	for <buildroot@archiver.kernel.org>; Sun,  2 Jan 2022 18:15:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E674181493;
	Sun,  2 Jan 2022 18:15:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Ba-QanBbl9V; Sun,  2 Jan 2022 18:15:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5500F813DC;
	Sun,  2 Jan 2022 18:15:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8EEEA1BF2B8
 for <buildroot@lists.busybox.net>; Sun,  2 Jan 2022 18:15:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D03840141
 for <buildroot@lists.busybox.net>; Sun,  2 Jan 2022 18:15:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CRhMV-5mKbeB for <buildroot@lists.busybox.net>;
 Sun,  2 Jan 2022 18:15:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B7B9C400A4
 for <buildroot@buildroot.org>; Sun,  2 Jan 2022 18:15:34 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id u25so6756741edf.1
 for <buildroot@buildroot.org>; Sun, 02 Jan 2022 10:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=edPZ48JsDMi8+aWBDswjLi2LTxVY1Nsyk5MBkcsP1no=;
 b=oD6j8GUoDESvJD5RrQU9ifGGjxZoW1LIAH9QumxMX+OtoFj9jIHybWYcDPYVrbCBts
 XjAmvHe1digDBFaK5z2zQNWJ1yk+/BwTYNQqnwN8g/1XHOw2wzWiHz2vjPRXhCDPliyx
 63rsKCnIggSPA2/UA98W7uAycYw9maQApjZGWRse8xbV04hfgLpZftahknTbzfGb+mj4
 ensfWHrBPLlEdCVGmjFPf4pWA9nKC/mvrZQXB34TphEHD+RvP/LuuULxjN9B/XTsg/pZ
 CMdWN778mq634W6HGGHfX9aRQMpQUHI3SzheHCQLYiAjxmXPBoT6+h1kJbQUP8NY13+z
 wqpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=edPZ48JsDMi8+aWBDswjLi2LTxVY1Nsyk5MBkcsP1no=;
 b=rEQb/En74/jMopiY7TZdKz3kU2k1Fzzv4YNISNsCo65OKLFzvEyAi+cu+LqoizLar8
 9/7lzJxqcWVrDPw4YbIaGoiSEOK/wsxW2+JoPHlP3MzmrbS6fTH3SEJpbOFMnNCg/SFI
 bVFX2lTzvZdKotNDVHVhKWtFkfR2oRZ2vPDdsNvMMLxLRZ+BvDVVFo+jw948UNZJ97P6
 I1THfsBuJbrk8gqm1SGqn/mp8ysIdV1+LxzKbYR/XnTugauwtQ9KNH8dPktqYgknaaOG
 xlAHyEGnqAKcAq/kZPVHXeF41wO/qV7oXV8w+DOOiSUxzKbMhzzHq2VpGTnXo0gARFyV
 9omQ==
X-Gm-Message-State: AOAM5318ZhlC9Bo96zP6Qb6ZleCdiY0dDMALsdqPANcXREZpMRar22cP
 HFU+VKpPc5yNG7w0D7kO36kw8WfTFNBZ1Q==
X-Google-Smtp-Source: ABdhPJzGaqCFAXm/hG96afRdIm+X2hXS3Xq05xU/my2jW118svAJTdGwxadeh2lkvSP/qxQGF2zvbQ==
X-Received: by 2002:a05:6402:34c6:: with SMTP id
 w6mr42662430edc.284.1641147332609; 
 Sun, 02 Jan 2022 10:15:32 -0800 (PST)
Received: from localhost.localdomain ([156.196.164.230])
 by smtp.gmail.com with ESMTPSA id u21sm12831445eds.8.2022.01.02.10.15.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jan 2022 10:15:32 -0800 (PST)
From: azxxza22 <amrtmoh2006@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  2 Jan 2022 20:15:25 +0200
Message-Id: <20220102181525.9494-2-amrtmoh2006@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220102181525.9494-1-amrtmoh2006@gmail.com>
References: <20220102181525.9494-1-amrtmoh2006@gmail.com>
Subject: [Buildroot] [PATCH 2/2] hash file added
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
Cc: azxxza22 <amrtmoh2006@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: azxxza22 <amrtmoh2006@gmail.com>
---
 package/nodogsplash/nodogsplash.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/nodogsplash/nodogsplash.hash

diff --git a/package/nodogsplash/nodogsplash.hash b/package/nodogsplash/nodogsplash.hash
new file mode 100644
index 0000000000..da059a854d
--- /dev/null
+++ b/package/nodogsplash/nodogsplash.hash
@@ -0,0 +1,2 @@
+md5 edafdd4ef89218261f29a9074891cf7a nodogsplash-v4.5.1-br1.tar.gz
+md5 cbbd794e2a0a289b9dfcc9f513d1996e COPYING
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
