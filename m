Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 609E8C433F5
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 08:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF8F3408FF;
	Mon, 10 Jan 2022 08:59:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wO1SJ5bGq0Ui; Mon, 10 Jan 2022 08:59:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 521BB408E9;
	Mon, 10 Jan 2022 08:59:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0EADC1BF29A
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 08:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0A33408E9
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 08:58:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zmG5jnqPOwwj for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 08:58:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A44414031F
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 08:58:58 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id w16so50608308edc.11
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 00:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=6UhRikd20dR6nkoZZAegAoXfaKaIe8/QaufxGLUlJnQ=;
 b=RXh3M7tfSNKqxyDN7MzVFNMf9uECcatl2i9KPPyG3Xl5Ezt43Rn5x1aGXMvXEjacJQ
 i7eMXPJGCaCoQRF4bRpkzNe0HLIPQFH2crVAYTWlzrRqMn3g4SFvyOkRFUagt5y+QaIm
 ii6CaBhL1UmavPfqYQloVMeyP5VdQcxKg1qt5xyDp35mvH1b+RQBAXxe6zVsH3FEi8RX
 de4ED/XI62NJt5q5wc6F0GFJ947y6ycJ1zx5Zq48DGfxaahcnKWoQJmRNH+EjmxPviUG
 bg6l7jvQJrhqw9JW8HVrxqGq1IZT4zYAowyCp2eQzvV7gunhmhd0zuHqvdsIq7I0fEm1
 o4fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=6UhRikd20dR6nkoZZAegAoXfaKaIe8/QaufxGLUlJnQ=;
 b=C17uPl7QtEFcBg4nkRKLAbVFFcoPvX531N6PREFrJAM90tKDXPkcGPLmdAG0R0VFnH
 QJ3l9q99fuf7nsOVlxmnu7BH1uzRYgsLesw3vPkCfNauGSunCLI+Mn9MfF4sDbnUVpgn
 iuE2XrF4Rr1FwXWcJK0vrEop8XR6cGb5DcVnY+go7K0hiGbngo5eE4uD+XwlRZdDIR/a
 ReDa1EWMu1IVKcmn+AwyxsYya2DHr3PFFtyYhvYFRlnTpTQGsD7nyT7wybVqWl59eIve
 zIwkYXsXrKAVphVO+nEIG04wBxO6+fMUZ4HLVxLggPjgqZXpxJz93GMHY6fXoKvVcYlD
 nwcg==
X-Gm-Message-State: AOAM531JD/yFL+PfCQbse38og3W72hboRJgf4xU5dYgOG8RUTvWR3K1H
 0ZkD52I//PpRmjE0uU8oxj/MkNdEFXE=
X-Google-Smtp-Source: ABdhPJx3woITD8lxJz5+bv0YCY0gtQXM9v5D/LbRwgzufO9LSUDDY29rxyvB5yubI+KaZ/ebDtQqpQ==
X-Received: by 2002:a17:906:dc91:: with SMTP id
 cs17mr57280510ejc.568.1641805136642; 
 Mon, 10 Jan 2022 00:58:56 -0800 (PST)
Received: from development1.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202])
 by smtp.gmail.com with ESMTPSA id u11sm2552077edt.97.2022.01.10.00.58.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Jan 2022 00:58:56 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon, 10 Jan 2022 09:58:49 +0100
Message-Id: <20220110085850.11095-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
Subject: [Buildroot] [PATCH 1/2] DEVELOPERS: add entry for avrdude to Yegor
 Yefremov
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index cd0b54b041..7a9f0f7370 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2968,6 +2968,7 @@ F:	configs/beaglebone_defconfig
 F:	configs/beaglebone_qt5_defconfig
 F:	package/acl/
 F:	package/attr/
+F:	package/avrdude/
 F:	package/boost/
 F:	package/bootstrap/
 F:	package/cannelloni/
-- 
2.17.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
