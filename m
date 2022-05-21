Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63754C433F5
	for <buildroot@archiver.kernel.org>; Sat, 21 May 2022 12:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 051E060FBA;
	Sat, 21 May 2022 12:38:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DXFuD5n_wwnh; Sat, 21 May 2022 12:38:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E45460BD7;
	Sat, 21 May 2022 12:38:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6BCF31BF2C0
 for <buildroot@lists.busybox.net>; Sat, 21 May 2022 12:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A2C660BD7
 for <buildroot@lists.busybox.net>; Sat, 21 May 2022 12:38:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zNsguuXsRM-G for <buildroot@lists.busybox.net>;
 Sat, 21 May 2022 12:38:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA9C560BAE
 for <buildroot@buildroot.org>; Sat, 21 May 2022 12:38:48 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id y13so19305475eje.2
 for <buildroot@buildroot.org>; Sat, 21 May 2022 05:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bWzW7DT3csi7zWxwEFRetKPiPsw2VChSVzv0ZvTk9IE=;
 b=jH+TPfLkmmeTEQix+6VRxd/6GJDN4kg9Q/yDVexR5x6JlgopOQHtVoKGOooLmt5Fi+
 c0SEUIq9d63BFuhHMMpLVpIU11E/Cyo1z/E1cMV7mnS4rIe/8nUWgAYh5twfbJ/y+t8l
 KpXrQuz7mG+oUh3cJu1rqWDzsUwKBOVlrc1FYAobqAERQBsm8mcL28ZZEO+J98G3m3uf
 K57J798BFl739qSO+qERSEegUXiysL9OzRp8YgumIlj2kcf/K5fsJNRmTkJVm9KPDZn8
 CUmK0C9JbtTs5xe5KbPUJTHZh4NN4AzOf1l9s83ZbVU1pvypDmHYcFYGAa+ElFZR8f0+
 /Nmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bWzW7DT3csi7zWxwEFRetKPiPsw2VChSVzv0ZvTk9IE=;
 b=viCOY1adSoqF2LfetNSTLTMbr+sIfqsjn2yvRndt1iQEdJd7Wk5X6/clhKSmDKeEPe
 Qc/2FvuEpwZy++cUljxQ+ShjOk57FAOKHfxHhpSUL+lPNo+mc2wLXvt3LIblNTCAAKpL
 mk1V3ghFYOBZx3CERCfjYR0vhYCaFgXPSW129hf4bBIizY5o9AQrQV/1aCvsGVp1J8NZ
 FwQYgidGYuQBQcEBL0jRiAcLd6L1EiAu8O5MaaOFNStu5jINor2fUIrCLMJ1RVQOt3qz
 CSnthpal7/krMUv8rhf89SR3buyza4NNLONDPWTWg6QbfjUPALkmdeStXkBtVT7lkeZV
 2DLg==
X-Gm-Message-State: AOAM530U2mqc21fZ6IX9xpIhrLaRCVMauNoV+pJmA5FaEy6BE+6RKTcv
 gLq1D9WZuBbFwOJSn/UCAFW0HNpfrJE=
X-Google-Smtp-Source: ABdhPJwMm3ssxxVoX4IjcaB4OfjSFX8uwaMqQuXmL+43O0OdrrGgFkJ4RttA2QLrMWvhx0V53U2nXQ==
X-Received: by 2002:a17:907:3a11:b0:6fe:c56e:6c66 with SMTP id
 fb17-20020a1709073a1100b006fec56e6c66mr655815ejc.175.1653136726185; 
 Sat, 21 May 2022 05:38:46 -0700 (PDT)
Received: from t450s.fritz.box (ip4d15a215.dynamic.kabel-deutschland.de.
 [77.21.162.21]) by smtp.gmail.com with ESMTPSA id
 jx4-20020a170907760400b006f3ef214da3sm4110479ejc.9.2022.05.21.05.38.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 May 2022 05:38:45 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 May 2022 14:38:35 +0200
Message-Id: <20220521123838.2881-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/4] U-Boot bump to 2022.04
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 Matt Weber <matthew.weber@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since U-Boot 2022.04 the host tool mkeficapsule requires gnutls. Thus the
dependency to the host variant has to be added. Unfortunatly this adds
additional indirect dependencies to host-libasn1, host-nettle and
host-libunistring are added and will increase the buildtime.

Heiko Thiery (4):
  package/nettle: add build support for host
  package/libtasn1: add build support for host
  package/gnutls: add build support for host
  boot/uboot: bump to 2022.04

 boot/uboot/Config.in         |  4 ++--
 boot/uboot/uboot.mk          |  2 +-
 package/gnutls/gnutls.mk     | 26 ++++++++++++++++++++++++++
 package/libtasn1/libtasn1.mk |  1 +
 package/nettle/nettle.mk     |  1 +
 5 files changed, 31 insertions(+), 3 deletions(-)

-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
