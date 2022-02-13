Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F8CC433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 20:32:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28A4560BDE;
	Sun, 13 Feb 2022 20:32:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I8iYPO9wfYn7; Sun, 13 Feb 2022 20:32:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 627FA60BBF;
	Sun, 13 Feb 2022 20:32:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 662D21BF83E
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 20:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 587614026A
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 20:32:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tnbz5pBcqhDT for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 20:31:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 37ED140193
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 20:31:59 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id p9so3244238wra.12
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 12:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nh7Sbkv4XlN4T/j4kLh68SvqCsfyWBRMrMSvOhihV4c=;
 b=VA+bKXFUv+raH5jY6jpa2XfSm51wsRwTVWY7jxnIhStY/XuCExebZHXVbD/CMcn4Sl
 yYKG2xYVDeGC9j7hKP5GNdxvDvGIXIfGC/C3rB5b/Fz2vL4xX4Utp6uWDvCSHiyd7+aN
 sIZ9U0K2QQeQBPNvow9ES0JslINE74WXbWNxGylK0eMwIsrlwqcQRP5lCeIm+poxa4Ic
 EbG7eZ+b219Jc28weMMZSypgML1VkP6RIdkpH34JWoTGlmEh1AiQva5JN6aEornncWBk
 bv+/E49Xd/xe+Ohsq0zFV1DoEtpGRBT+0eT/4Zq3fhngyQEl6EkpqDrMLctauVInmvDH
 wosQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nh7Sbkv4XlN4T/j4kLh68SvqCsfyWBRMrMSvOhihV4c=;
 b=NvHx79laf8KAQv8FKZ4M4u52tphbko5pA3xpFQK6eKcQ5eWv6lFs77SIH/0EPGy6LM
 RPAXKPX2GWS0wlP5lK/as+ckepNJbYugezTtNkbNxCf0wep8xhffh4n4/WFgCGBcPMQg
 gy2mc3YscnyRvx9DSra4Ikv/REFzL48n0/66tnqdg/NW1KrQb7ZGtML7XNaudINPp4mg
 FlHjtLr1bizpZoKfy8tQh47pbTn+C2MWhs318SoIiz466kY7D3b1KQ8WsGdMCejFFCcj
 KfgpoSOBoyjS4QNJWkf16lwZi9SJKIjmuX6YTDDSQi/+HER0yRNthZxyObP4f2V2ezBJ
 YLEg==
X-Gm-Message-State: AOAM531GGfMmYFCNebjV1WptPljZd7DKMVdn3RYL/uZ/NZOuEVxNF+Nk
 F9bEddpzTsNwx9mMKRyL/Bw1gRANNPE=
X-Google-Smtp-Source: ABdhPJznQzbRfPf8DoS1vKM1JG72Pu/Quvi9G2MQLveS+VsYZh3C+A6x1b7zQK/JIY0kekGZWaJthQ==
X-Received: by 2002:a05:6000:170e:: with SMTP id
 n14mr799445wrc.165.1644784317260; 
 Sun, 13 Feb 2022 12:31:57 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id d6sm26777081wrs.85.2022.02.13.12.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Feb 2022 12:31:56 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 21:32:19 +0100
Message-Id: <20220213203219.1206327-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/zabbix: add ZABBIX_CPE_ID_VENDOR
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
Cc: Alexey Lukyanchuk <skif@skif-web.ru>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:zabbix:zabbix is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Azabbix%3Azabbix

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zabbix/zabbix.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/zabbix/zabbix.mk b/package/zabbix/zabbix.mk
index e72d831b46..e6564e68fd 100644
--- a/package/zabbix/zabbix.mk
+++ b/package/zabbix/zabbix.mk
@@ -9,6 +9,7 @@ ZABBIX_VERSION = $(ZABBIX_VERSION_MAJOR).9
 ZABBIX_SITE = https://cdn.zabbix.com/zabbix/sources/stable/$(ZABBIX_VERSION_MAJOR)
 ZABBIX_LICENSE = GPL-2.0+
 ZABBIX_LICENSE_FILES = README COPYING
+ZABBIX_CPE_ID_VENDOR = zabbix
 
 ZABBIX_DEPENDENCIES = pcre
 ZABBIX_CONF_OPTS = \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
