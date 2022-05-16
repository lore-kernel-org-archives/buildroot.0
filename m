Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 183A2C433F5
	for <buildroot@archiver.kernel.org>; Mon, 16 May 2022 18:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89E4D414A1;
	Mon, 16 May 2022 18:40:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UT-ROqegwnNX; Mon, 16 May 2022 18:40:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E30840929;
	Mon, 16 May 2022 18:40:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D7F4F1BF377
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 18:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C5D2C40929
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 18:40:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6eQXLPn-YLeS for <buildroot@lists.busybox.net>;
 Mon, 16 May 2022 18:40:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B574D40925
 for <buildroot@buildroot.org>; Mon, 16 May 2022 18:40:41 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id w4so21657989wrg.12
 for <buildroot@buildroot.org>; Mon, 16 May 2022 11:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6UoLy2hM5JMNpRm9UQgmv/6HkjR0RzYbpiwvy9B8cJU=;
 b=RgNGQcOBj0S9oT+e3R/KR5WY7kKvh6QfawIzwdLdfNbvQfJejM8t2q1HfLQQm/S1xu
 Xv7HgdU0Y78SjmCJ4QL8TPJsEvVMOswpgmHTlgoGRj+TiI14rQKk9CEqMFUri+v1iLbp
 5qJZtaREyhx5CkEU56dXv396vmkr67OOHN98Mmi4Sy1tGknEXO+x/k8M7H/HBf9JRP+h
 PaMGSJTFb6Plx5PIz/UIywMTA5HWqUqB0fUvzFeF7zS7du2gTAHiNUeiTQkHcjp+cMBe
 lkJiIC0E3QCai+Qh/7X607a9IqzZGgaI7hhN0WjPzQAhnGpQ1oOE3WFYWgvEGjB5xEBn
 pkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6UoLy2hM5JMNpRm9UQgmv/6HkjR0RzYbpiwvy9B8cJU=;
 b=VQ/n7c1xwDcIUT7LeRdeK34OX66IH8qOQquLduToUfqBzqKf0NvFoI4QyAbFQITHzs
 yM4Z5Ntt0/JzmKvFJ1+uvCgHnRg4xBZ32bvP516DSu7WJQJLBxgAbxBUv5lnOuY7R08u
 zzkFtnbMMb/ip34gZAApu1JOoC8WYGODMM8Xf8IKQOV/ntzwzn0F/e7hoQejtR8d3D3Q
 kER9+Ft5uW0slaxm+6xqG3T2Zqo5LhmvzafiOfr8VCsjV3otyNf/v+N+NcMmB5KHLdnN
 T4YudDpSzhhyvwS8stb2VkhjIlWqFAGeeTHVH2npQ6i7F3Ll/henqgUWt+4eVdqD7pLv
 sFqQ==
X-Gm-Message-State: AOAM532l+nzO2ZdiHQD4Yh/lMoRgVWOgonsZYnjCXl8FBH/t8QI0NSsI
 ZfYBzMwuRYl/jV6EArkKOgiE23kazcs=
X-Google-Smtp-Source: ABdhPJzsp2CoTHlj8qiweoascn5qKbVCFbN7BGvnGiF9AVC/1HuGogruyVII9s7Y66agwEgCtetf7A==
X-Received: by 2002:a5d:4d84:0:b0:20d:1172:a240 with SMTP id
 b4-20020a5d4d84000000b0020d1172a240mr2198583wru.120.1652726439887; 
 Mon, 16 May 2022 11:40:39 -0700 (PDT)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 k20-20020adfb354000000b0020d110bc39esm1489733wrd.64.2022.05.16.11.40.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 11:40:39 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 May 2022 20:40:35 +0200
Message-Id: <20220516184035.187445-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] DEVELOPERS: remove Gerome Burlats,
 e-mail is bouncing
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

Gerome Burlats left Smile in May 2022 and his e-mail has been disabled.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 DEVELOPERS | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8988688beb..c33959fa45 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1071,10 +1071,6 @@ F:	package/flannel/
 N:	Geoffrey Ragot <geoffreyragot@gmail.com>
 F:	package/python-pyyaml/
 
-N:	Gerome Burlats <gerome.burlats@smile.fr>
-F:	board/qemu/
-F:	configs/qemu_*
-
 N:	Gilles Talis <gilles.talis@gmail.com>
 F:	board/freescale/imx8mmevk/
 F:	board/friendlyarm/nanopi-r2s/
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
