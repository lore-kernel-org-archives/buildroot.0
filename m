Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8325AC433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 09:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2AFE4174B;
	Sun,  3 Apr 2022 09:05:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FtLghZPzfi5Y; Sun,  3 Apr 2022 09:05:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 421CB41748;
	Sun,  3 Apr 2022 09:05:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6F0EC1BF599
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 09:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5BDB841748
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 09:05:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xtZQc2jcN3iy for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 09:05:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3339F41721
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 09:05:45 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id j12so2557169wrb.5
 for <buildroot@buildroot.org>; Sun, 03 Apr 2022 02:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I42Y6qMagtOtjC/q9sPT64CU/nelcFRiJaz/JB8TpVg=;
 b=hvZwMft3p+2C1qu4garyt4xVSBxXBPl/7PGORI5QN661P2i651lo755pPQCq2+bgLO
 DEIHaj+buvbvoAWHEjwb5AcwBXXNL6DpxHxO9AuqP0wAwCLyTArbfLFsbwW+HXCKukHW
 Q9YvGJoq5d8bJcdJvdlc/qXES8fku3MHI1hAm/VT6/9zJaZY7mIZWYIXwoH+9cweq3E3
 OTGrrYGWDYoYXBoMgaBmvLmcp3r/kjLsw5yhfk0MVsqqlkFAWNrk7hXbu4xMtv88Qrqa
 azMWF0sFhXDPSTGW37XZnK45jv6kNm+OjtLuTX35gAyiqlVlVILekaTPgfd58+AlTty1
 qtng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I42Y6qMagtOtjC/q9sPT64CU/nelcFRiJaz/JB8TpVg=;
 b=oA9PH3ieTXA5zyU0BzojjMnvOP8En45VRAuZlQlBCdjhZiX9o27oEEk6ThEEFitXeh
 7RtH1FG5LYUpglFRqQnC0rGP1EpS9L5W0yHrgxXI+0FqbuYi8KdIkgfnP6ob9p+cYoDt
 qpzeZZsE3P/iyYXwALrCpT9ocdMT2/UTLcQTI7Gkj+jjdC/ZtwFDcmOX1qxGF/vbLYEc
 LwtXOFqmSzX/fiPLpC5e4PnRyc/KFhRKuOYPVNEnfkk563Rak8gKNyQCqVNw91ItAaCW
 oNbag+qsRue2JVIO1IAF8V/JS0kAvTZZueXaACjIoN1DaU3Rk0JVUZqxZhaCZjKkWsYL
 /OUg==
X-Gm-Message-State: AOAM530rvl9ZqwKAzPawMI8hbjKfuAO0/byBUJMqDsF8Vers+41oNFn6
 86lUS6Potf8ZQBk7gFbzC606E2dAYjM=
X-Google-Smtp-Source: ABdhPJwALctvpXNLzLefLGPbT6g+yhKUXijrfAFe4FyO3RyPoWL+w8xnG1omdOodLiEPVPn3h2eG7g==
X-Received: by 2002:adf:910d:0:b0:1e3:9484:1601 with SMTP id
 j13-20020adf910d000000b001e394841601mr12662145wrj.419.1648976742959; 
 Sun, 03 Apr 2022 02:05:42 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 p18-20020a1c5452000000b0038e70261309sm741639wmi.1.2022.04.03.02.05.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 02:05:42 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Apr 2022 11:03:40 +0200
Message-Id: <20220403090340.2319112-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/cloop: fix build with gcc >= 9
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with gcc >= 9 (and -std=c++17):

./file.h:70:43: error: ISO C++17 does not allow dynamic exception specifications
   70 | bool file_exists(const std::string& file) throw (error);
      |                                           ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/8320edd448cd1f7c14a65734f63a2df5d4b0d442

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cloop/cloop.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cloop/cloop.mk b/package/cloop/cloop.mk
index f3c4954ead..6f6d5fe6a8 100644
--- a/package/cloop/cloop.mk
+++ b/package/cloop/cloop.mk
@@ -14,7 +14,7 @@ HOST_CLOOP_DEPENDENCIES = host-zlib
 
 define HOST_CLOOP_BUILD_CMDS
 	$(HOST_CONFIGURE_OPTS) $(MAKE1) -C $(@D) APPSONLY=yes \
-		CFLAGS="$(HOST_CFLAGS) -D_GNU_SOURCE"
+		CFLAGS="$(HOST_CFLAGS) -D_GNU_SOURCE" CPPFLAGS="-std=c++14"
 endef
 
 define HOST_CLOOP_INSTALL_CMDS
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
