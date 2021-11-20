Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2011CC433F5
	for <buildroot@archiver.kernel.org>; Sat, 20 Nov 2021 11:29:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB70081C2F;
	Sat, 20 Nov 2021 11:29:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rTof5rTLye1E; Sat, 20 Nov 2021 11:29:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25B74817F5;
	Sat, 20 Nov 2021 11:29:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 83F5E1BF28D
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 11:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 815A5817F5
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 11:29:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TiI24I0paj4u for <buildroot@lists.busybox.net>;
 Sat, 20 Nov 2021 11:29:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC408817A9
 for <buildroot@buildroot.org>; Sat, 20 Nov 2021 11:29:02 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id c4so22810978wrd.9
 for <buildroot@buildroot.org>; Sat, 20 Nov 2021 03:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8NiCfcOzXH4OtEbHmjfTYxUhcppzAjR3hsvraHWzB58=;
 b=IEYiU8YRtagQC9KLt8b/YwZAY3Ti0i9MnVjvbMnrZlOWlrylY1vpyBy3E19YCxPnmx
 3D8zRs9OB45ENuTnSCKh/YZQYifYcd7xpwWnWZpGrlkBILjrjR+zyRy2D3hZqwY0eZjy
 dBuH3vBMySTeTy1letZNI6tpOljfjD+yPkLP/4GTRIjLdYJFLQE9goe3e0RUNfRcJKjA
 l0mDkzJ6Vg6FuZta2/9LnxBHotKDO8ilRnLOsUguFWgvhBse8rZ+HcgTYN00lAViDPbH
 IKxHP2qGuugaO7BwcKe2aqfQbn1xl1mvJlf8wzNXvWetdYSUf0WQ0Lz99771ctoLYWAC
 iQgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8NiCfcOzXH4OtEbHmjfTYxUhcppzAjR3hsvraHWzB58=;
 b=y/ezEDgN/f2Q4lhq+rPWHbMxjNL8VUJaHKoAAPCqKKPv8lQ0SEwx8dOJgVqel/OtJF
 ruQh4AVIV4ukrdvnKccxWycru3HgwwtaN5eBERYUscS2/gu1KD0TiPfc0iNLPSQM+qjP
 WaSsW6vWIirL9X4SHjI0nRoUNlgo4R4aPwjMcro5vMVOoa9UEZ97dmFz6Yehr+x2iUlV
 goxlg4/yHbwHRxgo5mzGqo8d4MUOXN476Pgz4sUIhqdHWAb4v/Hdj6GjRkEO2yUdPNRc
 Mvms3TfOdOBFsaDemx7gne237gYxwxwekgzmeKPvY404VJcIrVXTFmLA747K4BeVu6Tv
 Y4Qw==
X-Gm-Message-State: AOAM532EEPLi0TpzQ5bDZKLo4ELz1qvC7nkhsTxDqFzTMIDCspTSfxR2
 afJ3IIjOEHQoJM259c0i+bv92GmMoBQ=
X-Google-Smtp-Source: ABdhPJzZlbKUESwqIAd6vnUyhaho3YGEwSfp07k4qEAHcjeBn9vw/NEIyjAK42/gorCB7fgJI1VlFw==
X-Received: by 2002:adf:df0d:: with SMTP id y13mr17126437wrl.176.1637407740724; 
 Sat, 20 Nov 2021 03:29:00 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id bg12sm211586wmb.5.2021.11.20.03.29.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Nov 2021 03:29:00 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 20 Nov 2021 12:26:45 +0100
Message-Id: <20211120112645.2885991-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/asterisk: replace BSD-{3,4}c
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Replace BSD-{3,4}c by BSD-{3,4}-Clause

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/asterisk/asterisk.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index d3a1cd08ff..a8f9127c94 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -14,7 +14,7 @@ ASTERISK_EXTRA_DOWNLOADS = \
 	$(ASTERISK_SOUNDS_BASE_URL)/asterisk-core-sounds-en-gsm-1.6.1.tar.gz \
 	$(ASTERISK_SOUNDS_BASE_URL)/asterisk-moh-opsound-wav-2.03.tar.gz
 
-ASTERISK_LICENSE = GPL-2.0, BSD-3c (SHA1, resample), BSD-4c (db1-ast)
+ASTERISK_LICENSE = GPL-2.0, BSD-3-Clause (SHA1, resample), BSD-4-Clause (db1-ast)
 ASTERISK_LICENSE_FILES = \
 	COPYING \
 	main/sha1.c \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
