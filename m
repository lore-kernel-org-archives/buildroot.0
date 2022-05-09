Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B9FC433F5
	for <buildroot@archiver.kernel.org>; Mon,  9 May 2022 06:07:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDB1F414C0;
	Mon,  9 May 2022 06:07:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xidZZgtaYoPY; Mon,  9 May 2022 06:07:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A299F4098D;
	Mon,  9 May 2022 06:07:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9A3F01BF284
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 06:07:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96A8E60F26
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 06:07:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Og0P4fvKxPoa for <buildroot@lists.busybox.net>;
 Mon,  9 May 2022 06:07:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4093E60F24
 for <buildroot@buildroot.org>; Mon,  9 May 2022 06:07:26 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id t25so21965090lfg.7
 for <buildroot@buildroot.org>; Sun, 08 May 2022 23:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AzlT0HMxt4GejD92OWlGWxmAmGnlBztIZHpjiBSjhEQ=;
 b=pngB4Dgn3th5Ge2RXf3ZWkSRjcY0F0UlQ2YlJ+xawnqBIWtMvfdajN4vnT6rf+ROVc
 3aSATamdS2kgu9SON1Fbvd+VCJ+e+d8yTSIeNsrq+SGiugScHz/IXGZAXzm+R3yjK+Yn
 BSTBMvonc5f7CeilFae4hm69EZO4QjWl48ywIDLrdbKkpOz5Pw1QGmKDW62/FvpbKcb1
 /v7dE1HEekQIKaalQMHA07ijSsGH3qEJtCrxfvGysIySYxDKk/EqAz5sLGM85M+4Zcxd
 v42prQgzNh8ilhyz0ovDArTPYKoMh2fStXm1OSy43r57KbBll+5m62wjKJU9HkeLldQX
 qsYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AzlT0HMxt4GejD92OWlGWxmAmGnlBztIZHpjiBSjhEQ=;
 b=H2IszBI+SBjtNcZ7RP96qjkTpuKLZfqFF9tP0ycsVmbmeTBQEb1wcL54rhc3V4PMW8
 yc6Q7Mb9xOQaV1hXBrKUs07An4moR5/iGPZen3NL4BbGSx6xDyeE9Q1BV7vhTYfVz+/E
 I1JgWALHJQBhKlKJxvhst6nzEF8NrPIpoS4sHxXKYvVE5/bMtf9ze+6un7R/zrawetQG
 IzyHAbSKFrjI/atfZvYXeJbDMTLpT1/CP6bBQKNGiRuPSSI2ZKAVkWZ6agNNShTTl8zS
 StOKlzwNwAZ8zq75YErzfqRqhe3TUftfjpTeOrFqwU5ymQvVjwK41mgVITSjyFacmWYN
 b3TQ==
X-Gm-Message-State: AOAM531FOIgoT1O/owUtOHlr5Lp0fkw36Z7Kekv4eSUfP6StrUQbVTe2
 dWk5NxH1XV/dAuzV4dDJRt26PpOWRKR8pg==
X-Google-Smtp-Source: ABdhPJyXJ/1OQsNA2Mws4zWT683ecp9nvNX/M2Jd7i8yBlvuE5ewLhcwZVuMqjfkECXI5QdXZ3OTpg==
X-Received: by 2002:ac2:4c8c:0:b0:472:34fe:f131 with SMTP id
 d12-20020ac24c8c000000b0047234fef131mr11557295lfl.565.1652076443804; 
 Sun, 08 May 2022 23:07:23 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 q19-20020a0565123a9300b0047255d211b6sm1824707lfu.229.2022.05.08.23.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 May 2022 23:07:23 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  9 May 2022 09:07:18 +0300
Message-Id: <20220509060721.2726047-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/3] package/rtl8189s: fixes for autobuilder
 failures
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

This patch series includes several patches that are supposed to fix
recent rtl8189fs build failures. Fixes include:
- fix rtl8189fs builds for big-endian platforms
- enable kernel options required for rtl8189fs driver

Besides, bump driver version to pull the latest fixes
for 5.1 - 5.17 kernels.

Regards,
Sergey

Sergey Matyukevich (3):
  package/rtl8189fs: enable required kernel options
  package/rtl8189fs: bump revision
  package/rtl8189fs: fix big-endian builds

 ...1-Makefile-remove-default-endianness.patch | 30 +++++++++++++++++++
 .../0001-include-disable-debug-messages.patch | 28 -----------------
 package/rtl8189fs/rtl8189fs.hash              |  2 +-
 package/rtl8189fs/rtl8189fs.mk                | 12 ++++++--
 4 files changed, 41 insertions(+), 31 deletions(-)
 create mode 100644 package/rtl8189fs/0001-Makefile-remove-default-endianness.patch
 delete mode 100644 package/rtl8189fs/0001-include-disable-debug-messages.patch

-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
