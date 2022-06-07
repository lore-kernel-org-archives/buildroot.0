Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB246C433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 15:17:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9092F83F6F;
	Tue,  7 Jun 2022 15:17:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DZviONnMfgp8; Tue,  7 Jun 2022 15:17:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8C8E83F11;
	Tue,  7 Jun 2022 15:17:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9583F1BF39F
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 15:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 847E241638
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 15:17:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o4yyFWXktcTG for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 15:17:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 79209415E5
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 15:17:27 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id n10so35904371ejk.5
 for <buildroot@buildroot.org>; Tue, 07 Jun 2022 08:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EqD4j7z2HILqzTEPoJu9cHn07o9BTKVMWLvzPonBYFU=;
 b=Zd9ca3Z08fabXyUuOlh9sC8dMIlM/ldzedaTPuscDRmMFZ8O+MMR/iWtQFqM3WiVC0
 GJoAcHELZf27RzbLLSFtt9Id3Y04RQDN98UQxrI5daWSxDdX8oBljRpJe7kfI8i1aPNk
 w1naHzDEmt4uZzI3ppfBhsLVTvbz27KNq2n7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EqD4j7z2HILqzTEPoJu9cHn07o9BTKVMWLvzPonBYFU=;
 b=whuAf+Fv8KdByObBALYwFrblaUS12WqBiehvHmTf/QIpl1oWMQt6VlMooLp1wpDtIF
 ECBO+YyPyVN3Zk4Rm5qZoxuvWbFqOjQbvEvBCsV9r5wk+GLEluuPQhaBt6Ividl9bdnC
 hu0trbPnkbc3oTAThxTzFi39ZnC+KiHwVbEKjrHBUUJMwNncbzMYjldCXCE+v2xtZwZV
 SH3qVw919UINjyGWtIF+K9HlHfAva6e94JYbd0rAiNysgGsqh81wlC0V2qrDDWvRRCB9
 JKEG9DNSZQAkp97QRT4Aos35o7T099nPbw6LIVSdgAR1Stjlftbf/ghiPZQ3v90RbvDy
 8vRA==
X-Gm-Message-State: AOAM533Y5akQmCqZdrO89AP75pQvDTzWGL7nIz074nsk7zUaqEwH0uEG
 C9HFEsu2uEq8RzUdEmiAlU0/P6bqKOJXvw==
X-Google-Smtp-Source: ABdhPJwpKUnCa2a8I9WMxmlRRH2N4si+2+MMSoVA/vEZ9rbP5LsleeTKPBu/uzYcF+SnlO7CRV6QrQ==
X-Received: by 2002:a17:906:7949:b0:711:f02e:c078 with SMTP id
 l9-20020a170906794900b00711f02ec078mr420281ejo.628.1654615045604; 
 Tue, 07 Jun 2022 08:17:25 -0700 (PDT)
Received: from angeloc.pdxnet.pdxeng.ch (host085115199111.static.fidoka.tech.
 [85.115.199.111]) by smtp.gmail.com with ESMTPSA id
 ay25-20020a056402203900b0042cf43e1937sm10588291edb.75.2022.06.07.08.17.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 08:17:25 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  7 Jun 2022 17:17:16 +0200
Message-Id: <20220607151719.2305134-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 0/3] Better wifi handling
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
Cc: jagan@amarulasolutions.com,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

While adding and testing for a new wifi driver, I could notice the sad
state of wifi interface bringup in buildroot, so I tried to have
something simple enough to work on the most common cases.

What problems we had:
* Wrong syntax for wpa_supplicant.conf when using default build
  options.
* Lack of a proper ifup/ifdown support to have wpa_supplicant
  automatically started.
* Due to this, the recommended way of configuring a wifi via
  the "interfaces" file wasn't working at all.

Angelo Compagnucci (3):
  package/wpa_supplicant: fixing "Invalid configuration line"
  package/wpa_supplicant: adding ifupdown support
  package/busybox: make udhcp discover faster

 package/busybox/busybox.config             |  2 +-
 package/wpa_supplicant/ifupdown.sh         | 48 ++++++++++++++++++++++
 package/wpa_supplicant/wpa_supplicant.conf |  1 -
 package/wpa_supplicant/wpa_supplicant.mk   | 10 +++++
 4 files changed, 59 insertions(+), 2 deletions(-)
 create mode 100755 package/wpa_supplicant/ifupdown.sh

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
