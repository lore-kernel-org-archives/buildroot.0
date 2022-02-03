Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CCDC433EF
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 22:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B232882591;
	Thu,  3 Feb 2022 22:29:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IJcHfUQZ-wIe; Thu,  3 Feb 2022 22:29:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEB0982612;
	Thu,  3 Feb 2022 22:29:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 05B891BF33B
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 22:29:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F035F81ABA
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 22:29:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vqk4mXIkLAg3 for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 22:29:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B72582660
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 22:29:09 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id s10so5222213wra.5
 for <buildroot@buildroot.org>; Thu, 03 Feb 2022 14:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XD0RgyDeXIl0zC7ys/1py90XZ+eV9K6Dv7E0ZTG7OhU=;
 b=AqetIcgTHtJnpwUEgKNhrzq6dZQKXgEeC6VouCBp6PS3nzUJ/bOebQOpYaagxR0ebY
 Z2cMfCpAuhI8t8tZEKiopYyR2iON5l0GwAkziH8gihpPaQb+EonhKs0Abc76TQSwmjQN
 nJnCl/ahOYDoZp9kybEBsrNKnwehksGkrXDKtZkzs2x1u/m19bm8LC+Gw9lxKWFaLnSp
 K08zFCc94kWC/KO4kB8XlS59liTT3LBoJ+nvQegPEFHaQ+/MOutDmITpVML51MwIq5/e
 WacoEEoW+omh9je0+kqaOHoIiqQnI6YnoQsCIQGG9stVkY6TeTI4+SVJeiJTe2niUPWN
 TFKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XD0RgyDeXIl0zC7ys/1py90XZ+eV9K6Dv7E0ZTG7OhU=;
 b=5W8I/x+ppw0ngwlVA7ECyX/qs2hSTSirA5qyNIV+KJkM46hy50v4P7nnEBqBoj6hEt
 RqjNTQPYbauACpG6VO87cig3N911s/GaiVsrvJBGW2HXS4OEnEN2IeauvjZGL6T+rcnZ
 caBuT6mC9KhVy0ZV/O+EwbWjQ1CZs3SpYOTtIHX5oGVwXSOZqxT86Xf96AwUT1XdudFw
 +j+sKvdkgrFZ1pTwKdhnjv0Lab5ePgLU2D15+G0+G4GYRyAXehUH1U39xbJp6rY9NRep
 How++rgFXIHNyyUQBn0O3wjyKJDN8Ehyy0pgbUjIZSgXHTPfLLawc+kKSi/ZapR8z6VD
 Cmwg==
X-Gm-Message-State: AOAM533eVGGikOlRqETT36r95UtembFaTDTOQjMxONJBSRJfoYVpy7Xh
 IsTRlbOuk0R7lzq0Q0/Xvv7KOswTEuo=
X-Google-Smtp-Source: ABdhPJzFyx4/hcr2VSQ4ZO3V9yXME0bCe17bWmuaQ+13dc0Ag1DnNg6X82pSuGOGKsppXfLtUuxPmA==
X-Received: by 2002:a05:6000:1001:: with SMTP id
 a1mr72149wrx.230.1643927348061; 
 Thu, 03 Feb 2022 14:29:08 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id w22sm80099wra.59.2022.02.03.14.29.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 14:29:07 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Feb 2022 23:26:39 +0100
Message-Id: <20220203222639.725822-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/dt-utils: use snapshot tarball
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
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use snapshot tarball so DT_UTILS_VERSION will match what is returned by
https://release-monitoring.org

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dt-utils/dt-utils.hash | 2 +-
 package/dt-utils/dt-utils.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dt-utils/dt-utils.hash b/package/dt-utils/dt-utils.hash
index 74819158bb..9fca594db5 100644
--- a/package/dt-utils/dt-utils.hash
+++ b/package/dt-utils/dt-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8b29d3a8799170afdb1b077e655528bf4e6afe0c789107b1eec8fff9d4482771  dt-utils-v2021.03.0-br1.tar.gz
+sha256  63cf47c70911bb3605bafac38a5a7e19eb753ac1c90de2abceaf2fdefd71be6d  dt-utils-2021.03.0.tar.xz
 sha256  a45932c79317d15116eadbf1c9c6fc59117ec3c4621db3a876066defa723963b  COPYING
diff --git a/package/dt-utils/dt-utils.mk b/package/dt-utils/dt-utils.mk
index bc7fd90631..d264e2cdc9 100644
--- a/package/dt-utils/dt-utils.mk
+++ b/package/dt-utils/dt-utils.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-DT_UTILS_VERSION = v2021.03.0
-DT_UTILS_SITE = https://git.pengutronix.de/git/tools/dt-utils
-DT_UTILS_SITE_METHOD = git
+DT_UTILS_VERSION = 2021.03.0
+DT_UTILS_SOURCE = dt-utils-$(DT_UTILS_VERSION).tar.xz
+DT_UTILS_SITE = https://git.pengutronix.de/cgit/tools/dt-utils/snapshot
 DT_UTILS_LICENSE = GPL-2.0
 DT_UTILS_LICENSE_FILES = COPYING
 DT_UTILS_DEPENDENCIES = udev
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
