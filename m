Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA322EB64D8
	for <buildroot@archiver.kernel.org>; Thu, 22 Jun 2023 16:55:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BB7D42127;
	Thu, 22 Jun 2023 16:55:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BB7D42127
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5mOidRhmwYAe; Thu, 22 Jun 2023 16:55:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2484741F81;
	Thu, 22 Jun 2023 16:55:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2484741F81
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B81661BF97A
 for <buildroot@lists.busybox.net>; Thu, 22 Jun 2023 16:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9ECCE83B89
 for <buildroot@lists.busybox.net>; Thu, 22 Jun 2023 16:55:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9ECCE83B89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0pNKYLhjWbZR for <buildroot@lists.busybox.net>;
 Thu, 22 Jun 2023 16:55:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E476383A89
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E476383A89
 for <buildroot@buildroot.org>; Thu, 22 Jun 2023 16:55:25 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.160]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MbAh0-1pfVg23Q0u-00bbSS; Thu, 22 Jun 2023 18:55:22 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 22 Jun 2023 18:55:22 +0200
Message-ID: <20230622165522.16397-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230622165522.16397-1-ps.report@gmx.net>
References: <20230622165522.16397-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:5YWbiHoPs3jWUhnjAv8HVddmryeQ3LHTrA3aJEohvgeTL8fh8Pg
 L7ZlB4NzwJuFb3y+i787cKzIYGvZpyqMXn+A60yqj0CU7UfZwb9VKfyx6sPDP2dyFa++FTF
 zH3mVs4uYDOZTjJmrtVtawtyhNRnavkyuFaeC25DhkgRWQvZtYz4h4ykLzQjdnbKyBJvQnT
 lh4CS6+9jp/ATsHSUIN6g==
UI-OutboundReport: notjunk:1;M01:P0:XKMr4AmCMsk=;OLs0hBFtRkuOOd4I8VBfBJb4u1j
 XZgr1bRn31ZHSuW5lLvLuEWHI/tEeI/33RgJegL0F90jR3sThip7LfuyYWBsnO6lxHEOmP+X0
 YWHSugXy5bzmP6jyMlzneaU8UfcqlA21k/avTtCP6/ayMScsNakybditC6KGzLKjXK6TEKYDp
 NhctuFcwmyhgI3zIpwPKXEx4WuZn2Eu3odPjROTuKTgmfLDOoNVZSz4yOoVoQsu8G7zInTcJS
 PbvXUjYr/h1Myv/B3xg6LSujm8ZmxtvIo/YMOvjqtM3vnOrv8szGbbzx2LQ/EzFx/PW+6dlrz
 KhLAbr9bRrlMPiYuU9aJmh++ruPKBHvpvSxg9iL8uJ1Z7XH8oEtOuX4cOCVZ6XhmWsrhqY2rS
 Z6rZQhQko4OuEu6shZfYuiH0CwEtLkz/3Uzp09xVsVBAu8gahBIPwtHUSIc++VOELchnmDtld
 Qh5u+qhgnNBI6Q8jHRIrHY376rwBzv/dx9fvOXuHeOt+cd6WDD84v3tghag5Igz/NfbBugtmV
 CQYrfrKEBObC+qYPKgV8ycMGmoGfCTUf8dr57KaUIBTa6wcKNxp0b9VbdEBnSpiaMPk1Xn9w2
 FfwjXoN4mDoKLpcJsLukoOKkHBNIj1TN08IV4kUOUHGp2tVYvqQDLDqJS7ekD8BZKnBbsCbuI
 yiv10XY+Wk5RPD46OrTxvYytsN+xYJCfe8Xe7EvShmGt1vMW97npgzXQMX/cOUaZZ5LmyAWKl
 nIpfMPyQjX80+a0XKnLB8DgryIBelIv+cmXjCIzmnCCq4Q2sHj3B3YhbZnKWA+RPF7qXEdTIG
 8bsORk8f+Fm9Z4Wtwvb2UFrAqbT2zD8Hd2mxizxuo/5R+vPkUSLd1J7aDl/8ZPYadB/98jsFD
 ZlLTUT80118c4JEZyY9uqL5vJC87fvnlBt9gf57dPLKE0pkYlq43BTyPqw59HMZYfVzq1FOD8
 HwY2yckQ1PACqt/eevZbNtcHFtI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; 
 s=s31663417; t=1687452923; x=1688057723; i=ps.report@gmx.net;
 bh=wuDl/Z/ICcKnsqHdRvvrvH3AJtL7nYbgl2xBEuaqkBE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=cB3HVKae2tFIewIj2yTp38KQTiPGHwRiA3nxhxXbQx9qFZwA87N3AWF31TSyff3tvpuTla0
 R6FNdqt49/u/x00WShDormhI1HyvmpaQ2vu7e3FXQl7lH9OlEJdy2MThzgTvzUftS1jhMc7SO
 3rojiFFibXC9DwfHKerfK9ors84+xLL5ntI/t+x8zkhf5TAMTiTA8lervBV/hJzHc2N1iRRA1
 FT40h3haMscsH33inFtyUjMuGDVjtO+j6AYSU38n56xfpVBIGedIhxY9jiljp0EIuf8WuMgIv
 3tODT85nwBG2tS8fpINtEkDqXNN/OEkzD3c5tS9A3LHBg0K5cntw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=cB3HVKae
Subject: [Buildroot] [PATCH v1 2/2] package/ubus: bump version to f787c97
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:

  - 66baa44b8dee libubus: introduce new status messages
  - b3cd5ab4c010 cli: use UBUS_STATUS_PARSE_ERROR
  - 584f56a23314 cli: improve error logging for call command
  - 2f793a4eb063 lua: add optional path filter to objects() method
  - 2bebf93cd334 ubusd: handle invoke on event object without data
  - 9913aa61de73 ubusd: add lookup command queuing support
  - f787c97b3489 libubus: add missing uloop_fd_delete call in ubus_shutdown

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/ubus/ubus.hash | 2 +-
 package/ubus/ubus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ubus/ubus.hash b/package/ubus/ubus.hash
index 2b7181e5d2..faa2e2626e 100644
--- a/package/ubus/ubus.hash
+++ b/package/ubus/ubus.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  275d184006f2f60c9b0172d8fd0ccc8952f182960c0d3d0945be640873c1bef6  ubus-a72457b61df045d3c499a6211362b751710590d7-br1.tar.gz
+sha256  e3022aa3cf6c38a4d3c0d798d9a9c7069ada063a0a5fe6894b466b71b17ce9cc  ubus-f787c97b34894a38b15599886cacbca01271684f-br1.tar.gz
 sha256  a3caa6c0e90c87b7c97c2ac3d0c0d416082ef777215faec2e9b24ea6e68f6988  ubusd_acl.h
diff --git a/package/ubus/ubus.mk b/package/ubus/ubus.mk
index fa856fb36a..1f9891411a 100644
--- a/package/ubus/ubus.mk
+++ b/package/ubus/ubus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UBUS_VERSION = a72457b61df045d3c499a6211362b751710590d7
+UBUS_VERSION = f787c97b34894a38b15599886cacbca01271684f
 UBUS_SITE = https://git.openwrt.org/project/ubus.git
 UBUS_SITE_METHOD = git
 
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
