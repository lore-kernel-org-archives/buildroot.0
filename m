Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CD5C433F5
	for <buildroot@archiver.kernel.org>; Mon, 16 May 2022 13:17:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 558DB6109F;
	Mon, 16 May 2022 13:17:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9H9_tFvEehnZ; Mon, 16 May 2022 13:17:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5384061082;
	Mon, 16 May 2022 13:17:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CF3AE1BF37E
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 13:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBF2B40B47
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 13:14:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kGqi3r0CxGow for <buildroot@lists.busybox.net>;
 Mon, 16 May 2022 13:14:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0AE9940396
 for <buildroot@buildroot.org>; Mon, 16 May 2022 13:14:15 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id r23so4454984wrr.2
 for <buildroot@buildroot.org>; Mon, 16 May 2022 06:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gnS6Fcfze5REKQrzI9KbwLztDO/eeOR1KtP88yr6dEQ=;
 b=mVYQLXF2xrCHFx5uCa3FHOnZOui6JIm1u9671ipmOYJupolUsGgXZW5TeCN76Ej7HT
 tHDYgYYN2fCR5UXAC592JK/BrcHvkrULwZeUwwBG/E2QrhNne7f9XQMk6i/tc2M1Q6kW
 wlQHpJeMX0Z1prRBwFvnkJjLJS0T3oAwkpZqp3mAtJSS+AwTnYYmnlZw831y7dC1MX/x
 gZPGWB4H2Fvz29LJ/G0Xmz6I9QQ6I1sqLAYGgQwe7LHyYVSHTkJfBItYirQKw8zuPxpV
 fa0jVRX0eRnSiH0se8KxPiJUuUQ828XlRERwFsRqbEEInCJONmO+kmCzEoYYB9+h3URF
 yHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gnS6Fcfze5REKQrzI9KbwLztDO/eeOR1KtP88yr6dEQ=;
 b=XVYnbZ0UGMqqmKJXI/CRBa6sFlSsGrWMZo/Nv3c6bSdfgR+XlcpXaH9ce+lG8HRly+
 hdAe5BuuBDPDskq8O1VBuszsdXRPcrf291lv7EdnEukV7o2eIpQiVz9Zf+in495Cidwy
 lmJk/BslkkdLqB+BQD+PWeFPQIaNCH/DuF4/NrfxpwzmN0Va2vIqOT1hXU88PLBqKyLA
 dDYjgmxYvW0z97JyHXGbOxpwy8EmJfVAE5ehzi6yZ00hSM+eElcYMvwirHRG9XohABNA
 KIPHfxSYZSjNJ+ulwj9cMlGu43ZNBlHBYulKI17yhmY7QEaSUwwuLlewu3ivdY+tIu9P
 VvoA==
X-Gm-Message-State: AOAM530lt2tZzul8YeSuQwUvEcmgKg5YvgLNu+tttNF9gF/taXaRavQ5
 OmSlthRQ9llMh/Ck4vEkUIb44EFdt3U=
X-Google-Smtp-Source: ABdhPJzRzseY72sQzifc1u4z1yOElaEc6pEd8yQ0yWg6lFFmgqWky3R2J59LfxoIB+UdKSwWsY2ezA==
X-Received: by 2002:adf:df8b:0:b0:20d:af2:bcc1 with SMTP id
 z11-20020adfdf8b000000b0020d0af2bcc1mr2981247wrl.166.1652706854353; 
 Mon, 16 May 2022 06:14:14 -0700 (PDT)
Received: from shrek2.. (lmontsouris-659-1-42-116.w92-154.abo.wanadoo.fr.
 [92.154.77.116]) by smtp.gmail.com with ESMTPSA id
 ay41-20020a05600c1e2900b003942a244f51sm13023789wmb.42.2022.05.16.06.14.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 06:14:14 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 May 2022 15:13:33 +0200
Message-Id: <20220516131334.1910858-20-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220516131334.1910858-1-johan.oudinet@gmail.com>
References: <20220516131334.1910858-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 19/20] package/erlang-p1-zlib: bump version to
 1.0.10
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The copyright year in the license file has been updated to 2022, hence
the new license hash.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-zlib/erlang-p1-zlib.hash | 4 ++--
 package/erlang-p1-zlib/erlang-p1-zlib.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/erlang-p1-zlib/erlang-p1-zlib.hash b/package/erlang-p1-zlib/erlang-p1-zlib.hash
index 7ce58762f8..f48aba90ea 100644
--- a/package/erlang-p1-zlib/erlang-p1-zlib.hash
+++ b/package/erlang-p1-zlib/erlang-p1-zlib.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f0ac60336b2ddf55ac4f58934580cb8f02dba440d68feb607be312dd35d91269  erlang-p1-zlib-1.0.9.tar.gz
-sha256  6cd4871db940d055cf272c12c10e0c08febdc94362e404390758fde34b4ce01a  LICENSE.txt
+sha256  cef52f8f28229bf7229b53d225a6a9865acf5bdeaf16a40f81bbeb226615be99  erlang-p1-zlib-1.0.10.tar.gz
+sha256  a401e98a7eef1c741b3e8b1a46a21730b4a1bc7020e4ec1a8c2a44dbd7f0ba5d  LICENSE.txt
diff --git a/package/erlang-p1-zlib/erlang-p1-zlib.mk b/package/erlang-p1-zlib/erlang-p1-zlib.mk
index 0e6ee298ef..fdffb6ed3e 100644
--- a/package/erlang-p1-zlib/erlang-p1-zlib.mk
+++ b/package/erlang-p1-zlib/erlang-p1-zlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_ZLIB_VERSION = 1.0.9
+ERLANG_P1_ZLIB_VERSION = 1.0.10
 ERLANG_P1_ZLIB_SITE = $(call github,processone,ezlib,$(ERLANG_P1_ZLIB_VERSION))
 ERLANG_P1_ZLIB_LICENSE = Apache-2.0
 ERLANG_P1_ZLIB_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
