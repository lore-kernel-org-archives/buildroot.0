Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A07C5C433EF
	for <buildroot@archiver.kernel.org>; Mon,  3 Jan 2022 21:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B1B140894;
	Mon,  3 Jan 2022 21:01:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uOQFM-7R8SPt; Mon,  3 Jan 2022 21:01:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD8AC40892;
	Mon,  3 Jan 2022 21:01:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6602E1BF983
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 21:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 554DF60B3A
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 21:00:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h78RNqx4Zo0h for <buildroot@lists.busybox.net>;
 Mon,  3 Jan 2022 21:00:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A309B60615
 for <buildroot@buildroot.org>; Mon,  3 Jan 2022 21:00:55 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 b186-20020a1c1bc3000000b00345734afe78so466778wmb.0
 for <buildroot@buildroot.org>; Mon, 03 Jan 2022 13:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IKgcoohITxhvwB+tXV9AGBcN565PMuQ29+a5YeOE6b4=;
 b=b/xAgEzmSbk7qtp83CHZzOU5VS6nxWaoKmNVY4hB2xic+nOl9FzO7ykzOR6+K8Y2TY
 yeQdIyJPWCOL8uVj2jAq7zcUeUsOXUJMCrNZG3YqalGS/O0/eThU26bOA0gN3v4FFPo1
 RfA5Q7i5z4UzqaBNdb7Mn/jwNO6G9b1hbZcnL/9QGN1nGS9GI53FKjYm7/Hnw8g6GxNf
 S6FmS0S05qW1wvNOI5/X7f2OwCOumtAHUZLdFv9uh+MHLkttmyY11SYikts2QRSsid21
 Yh75oEypalKKVcF+/eL8Zp1TRV+Y7ZAw0CJxgn5jgXX6iAT05DtV+Po/Fi7OW3STkCpk
 xSxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IKgcoohITxhvwB+tXV9AGBcN565PMuQ29+a5YeOE6b4=;
 b=HguGQwEwwxQJdFB5bI7VF+lPcyAUb1tx51LMQMzYWPGH1a+3hx2Ze0R/vWUE2VwNm4
 DEtoGXY3YnWNaOhgUhVbttJCEmBc8CbnyJKo1h92WsQn+BskbwR9pY82TrzvClXfPSPV
 d30G5xcad8VLdH9MTCwhKbUkamdbhr2XIoS0DheWlq6ZnR9TmpjWkATH9zD/TGiDBY8i
 zKeeMEmXuZnNCcSv2h88sbpEWojpQ0YIjAtevg3eK0tfwc3IH9QdLftP9cey4bm+XIb/
 WW4C6dctswQHIRG2fVGiYF2M4dfEK6eyccJ/wfU4GQvet9l+5X0egb9UIe8EghQOLgHZ
 LbvQ==
X-Gm-Message-State: AOAM533KVxzxX1sf5gvUN5qGJKQLt96lt/wUy7fZ01xdVM0WMiB68ehM
 v+7btV/STMrWZOIUhnb9VZ90jU64RLo=
X-Google-Smtp-Source: ABdhPJzvS+llZhojrz44TZFpkQ2Tz9OBJcMopQ6LDGeQKSOT21Ejpb4sOYNT0t30fhbi1bdhJct49g==
X-Received: by 2002:a05:600c:1f0f:: with SMTP id
 bd15mr39453936wmb.2.1641243653982; 
 Mon, 03 Jan 2022 13:00:53 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id a204sm38219140wmd.39.2022.01.03.13.00.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 13:00:53 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  3 Jan 2022 22:00:48 +0100
Message-Id: <20220103210048.7879-3-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220103210048.7879-1-romain.naour@gmail.com>
References: <20220103210048.7879-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] package/qemu: reorder patches
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

The commit [1] removed patch 0001.

[1] 85c7bd0602715dc6a148cc79db8910dca27c4e76

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 ...atch => 0001-tests-fp-disable-fp-bench-build-by-default.patch} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename package/qemu/{0002-tests-fp-disable-fp-bench-build-by-default.patch => 0001-tests-fp-disable-fp-bench-build-by-default.patch} (100%)

diff --git a/package/qemu/0002-tests-fp-disable-fp-bench-build-by-default.patch b/package/qemu/0001-tests-fp-disable-fp-bench-build-by-default.patch
similarity index 100%
rename from package/qemu/0002-tests-fp-disable-fp-bench-build-by-default.patch
rename to package/qemu/0001-tests-fp-disable-fp-bench-build-by-default.patch
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
