Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31FCEC433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 15:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1F9D60A9C;
	Sun, 13 Feb 2022 15:52:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MSxTLC4BhAKr; Sun, 13 Feb 2022 15:52:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2459160A7D;
	Sun, 13 Feb 2022 15:52:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DDFC71BF3F2
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7AB540343
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:52:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Wa3xpDA5c8S for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 15:52:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 128344034D
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 15:52:12 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id j14so19052700lja.3
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 07:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j2SPLPuo/DitgA1JQRFPNNlM1q1M2CqyqAiNPQvhUqw=;
 b=lvNY2UPxaPaVkqb77CqPTf3RhuEniXx+G8pUENBU8PmN/1FLmtWuQkm9BCQknuEk5Z
 u/AlhHK++NQtaR/w1NpnDJqtwm3sP1lKxcQTDrmDsSan3cN5J62bAj7b3Aytovm+01eV
 V/kAAe/58n06axeX5p/5MrM/JWp+1XCe1YDz1mJXpxBnhumIuCuuIaB8g6GgNPIYDbNu
 lTqxDc5gkM88swPl3K3QB/fRcthT2btZIjUPpQshJZGQfuvaE3tzEiu8qjMJI6FxtgB0
 HALfDt4R4NRNwCvNbpZoKgWifIgdRUiJ+U4vx7EMihtzqijA61+4AC8NrNIM9e5utl4G
 h+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j2SPLPuo/DitgA1JQRFPNNlM1q1M2CqyqAiNPQvhUqw=;
 b=QtJDVpTbD4Sba2iVpt4Emcnb/0U4dhwDftah5Ns9Pr9iPLOQ/Y/zfdMolgqDSED8+C
 xi3lLZ4Ox9uu9OUMQ5o7g0Vr+wYJlhPz1PR1D4aqmKPK8X+3zm+eJU75Jx1R+LC9A4N0
 pU1KkBq2P1uqFglU7AzqnAWbRoa3m1jciRkw62BXwn5ObGvHhGYGWb6uXqUqffI1nCMy
 5gBoVId40tE42PL3aMtJK92eQwvYoK+MH2rx/yiNm0kwQVdTzwQtBCLvoO4kkrj5SYB3
 oF2+tS8lok3g9o3bM7UimNkGmCaXmanpRN940AhMzy56P2k1h5PIWCB5wpjwVF7iSYKm
 hefA==
X-Gm-Message-State: AOAM5339o2DygGhIc23TzX5tg8NlLViuBsMxYcOmcGSo9sBia5WVM6Zc
 /PwX6ABOOnirc4YdNx0vLcHSzX0yup4=
X-Google-Smtp-Source: ABdhPJxdk32hKNuFlHyOpwzKyi9Hv8ZF0AKfEeP6O6os+w0WK6rJKzCQnfVXvMoJbcw7vIzHjmSctA==
X-Received: by 2002:a2e:9c04:: with SMTP id s4mr6711959lji.431.1644767530835; 
 Sun, 13 Feb 2022 07:52:10 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id k18sm1935723lfg.217.2022.02.13.07.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Feb 2022 07:52:10 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 18:52:06 +0300
Message-Id: <20220213155208.560001-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/2] hostapd/wpa_s: fixes after version update
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

This patch series provides two fixes for hostapd/wpa_s build issues.

The first patch fixes hostapd build regression caused by its version
update. New hostapd version requires updated handling of CONFIG_DPP
option. I guess I failed to catch this problem because all my random
hostapd test configs enabled openssl. So I overlooked basic minimal
configuration that did not require openssl.

The second patch fixes specific configuration of wpa_supplicant reported
by Yegor Yefremov. For now a patch is added. Yegor already posted patch
to hostapd mailing list. So some time in the future this problem will
be fixed upstream.

Regards,
Sergey


Sergey Matyukevich (2):
  package/hostapd: update DPP option handling
  package/wpa_supplicant: fix build for mesh configuration

 package/hostapd/hostapd.mk                    |  3 +-
 .../0001-mesh-enable-HMAC_SHA384_KDF.patch    | 30 +++++++++++++++++++
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 package/wpa_supplicant/0001-mesh-enable-HMAC_SHA384_KDF.patch

-- 
2.35.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
