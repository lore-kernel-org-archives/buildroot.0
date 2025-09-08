Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0518ECA1016
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 19:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CECFF409F5;
	Mon,  8 Sep 2025 19:25:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qnx_rQiFeo_f; Mon,  8 Sep 2025 19:25:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69483409CF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69483409CF;
	Mon,  8 Sep 2025 19:25:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 948E0186
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 19:25:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8679980A67
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 19:25:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s4dzofYWpZ4d for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 19:25:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.147;
 helo=smtpcmd13147.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6030A80BF6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6030A80BF6
Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6030A80BF6
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 19:24:39 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id vhTgurtBI6z5ZvhTgunOZw; Mon, 08 Sep 2025 21:24:36 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Christian Stewart <christian@aperture.us>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Kris Bahnsen <kris@embeddedTS.com>, Sergey Matyukevich <geomatsi@gmail.com>
Date: Mon,  8 Sep 2025 21:24:30 +0200
Message-ID: <20250908192435.214306-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfE0HR1ihY2NquXSLp/W0DFklDZ1XolNnbg1Euj/K/qJRaSp/zsczjHGNqVr2eb5JSwGfp4K6caE3fL0u6qRDbsdCMGuUS9IP4lNRHhpCQH4MnE5rcOS8
 LQbcToPu7VlrrIQoKesw01BDC6ZE4FGg1p10UcXRVrGC7Yk0QRSNvq3jmzhN+ien0N4MABwY8GsdMt7VGnlVp0OrcwkxqvlwWR4OUcl8Mp5Nag02ztlb/H/u
 t2VablxNv5X2zSeJxWrJWTEmJMXu+pMp5j4Dkxw/zRlPaCZpb+jXIC7w8xoZ/wmQcNMCQgfdXgqdfGB8fze7zOgmAJKOOXbFewFnc5itZRUUThERql0FaW9y
 ueOeiqqnUhS6bm5vunUswPvDuJjdluEZ5VJJCFEa+8kUtD7BrKti7r1d84UysvyD9cHtfJwT
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1757359476; bh=JrMy3nE/wr3p+SM9KnhG6ZrRjTu4CqF0XEl0FFCS6AY=;
 h=From:To:Subject:Date:MIME-Version;
 b=k+0rKPnmLa9+a5/hBg14J9K+TGZzclLI+241ZdWhyYMHfnnXU49cVsHmEgkqVpiJj
 WqWTTH8QCqZncH1GBSfoMRKVFYJwr72yzLmEkoPqK9cosL9D45TeJxU3P22SN2EEBz
 n8ZaM2fuHhv2oYxXHUAh7wCnkqzDDZGHGhhyRA2qkOX4fGJO1LmWovvMXT1umqXHSx
 hFc4cbT7OMPhOXtYryCjn8wcOa5m9UBfFI+hhB/2r5sj+AHVDqBW/oaAM0DiybP9Fn
 BDqyCqceDTAer0QvXED5K4KnxGmvQpvA0jbLiaH3KvAkhSUuugDh87Fyjhf1iEoEpM
 OaQIQ3L/2jhnw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=k+0rKPnm
Subject: [Buildroot] [PATCH] Some WiFi driver fix to build with Linux 6.16
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio Benetti (5):
  package/rtl8723bu: bump to 2025-09-08 version
  package/rtl8723ds: bump to 2025-09-08 version
  package/rtl8821cu: fix build failure with Linux 6.16
  package/wilc-driver: fix build failure with Linux 6.16
  package/xr819-xradio: bump to version 2025-08-08

 package/rtl8723bu/rtl8723bu.hash              |  2 +-
 package/rtl8723bu/rtl8723bu.mk                |  2 +-
 package/rtl8723ds/rtl8723ds.hash              |  2 +-
 package/rtl8723ds/rtl8723ds.mk                |  2 +-
 .../0001-Fix-build-for-kernel-6.16.patch      | 34 +++++++++++++++++++
 .../0014-Fix-build-for-kernel-6.16.patch      | 34 +++++++++++++++++++
 package/xr819-xradio/xr819-xradio.hash        |  2 +-
 package/xr819-xradio/xr819-xradio.mk          |  2 +-
 8 files changed, 74 insertions(+), 6 deletions(-)
 create mode 100644 package/rtl8821cu/0001-Fix-build-for-kernel-6.16.patch
 create mode 100644 package/wilc-driver/0014-Fix-build-for-kernel-6.16.patch

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
