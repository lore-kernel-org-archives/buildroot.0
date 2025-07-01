Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE12DC83038
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 19:37:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71251611E4;
	Tue,  1 Jul 2025 19:37:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O-i9YnOy9svg; Tue,  1 Jul 2025 19:37:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81BB1611E0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81BB1611E0;
	Tue,  1 Jul 2025 19:37:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B588179
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 19:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51D5D611E0
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 19:37:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yDi2quzrNofW for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 19:37:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.131;
 helo=smtpcmd12131.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5087F611DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5087F611DA
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5087F611DA
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 19:37:07 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id WgmvuUCdh8eo9WgmvuM2Fq; Tue, 01 Jul 2025 21:37:06 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Christian Stewart <christian@aperture.us>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue,  1 Jul 2025 21:37:02 +0200
Message-Id: <20250701193705.761121-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfNM7FXeX9BVs6OmrdUjdkvdjK5vDf7NoZXFNYfM0U2YLAHoAss4K4ZJsfxSkMvFqZasYpGxZTg8T/OmMlXzJ6ZdvGaf8deaxjAc18aq/vz30SmpUwKMI
 wrQloefsk39aEkxmQq3tLjIO8Dh96KxgtVZU3QQXXz/Mla15HOrSaLGuYjQlcj2TTMtRNKtmYEoJdR6/F2jaYJ43Hw2uKtiOgz3hqhzRJr0nQvpTihfvQ217
 kIwfc9md7sbUbbYV9lAuqE1Tgt2TCDZLoJ2cj6hmuzy+zq/rfJgtBxesXRt9dUENadkxpv0S24od7ui4nwum1506RIhtDPvJEgVcEt7ORyWeeKsfkhzeFNbb
 qB8/jaJA
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1751398626; bh=3a3+hucVeX/jrQ7UTZfcqE+BUqGK8cyX8DPAYKNUcyY=;
 h=From:To:Subject:Date:MIME-Version;
 b=ntbC5TuGI/waFtzhEUrJ0aw83q9oW2YIrTDZOkmeTXDRF1k4gdVXPKtOiiNIfisza
 B6yXNouwqT6g0ZPKkadOOGBAfWxIL9Tru6+8LLB53UXrH5YgImp4btqk1YZC/8FuFU
 FRFljbTFIOgxZqXK/3Fssz4IPLOTD6MiKBDe2ut2sNpPy0XLt71eI0LG/TIbbACg3b
 RCTZwPoCYSpoqIbHIpixCiRpmzTmdYu0pMK/THMLzklRtJi549T5VHsqfdeTI0qsBt
 VUuRuarc5lXLNV9wipbwIjEEnXFl3ScYOFp3s315lbqCgggKtY/qadub3MS3gM5EB7
 WWLMJz2lOkTnw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=ntbC5TuG
Subject: [Buildroot] [PATCH] Taking over Larry Finger's repositories
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

I hope to do something nice by taking over Larry Finger's repositories
I've contributed through last years. This is a series of 3 packages
that move URL to my company Github as done for this pending patch:
https://patchwork.ozlabs.org/project/buildroot/patch/20250618145857.1206836-1-giulio.benetti@benettiengi
neering.com/

Best regards
Giulio Benetti

Giulio Benetti (3):
  package/rtl8723bu: fix build failure with Linux 6.15
  package/rtl8723ds: fix build failure with Linux 6.15
  package/rtl8821au: fix build failure with Linux 6.15

 package/rtl8723bu/Config.in                   |  2 +-
 package/rtl8723bu/rtl8723bu.hash              |  2 +-
 package/rtl8723bu/rtl8723bu.mk                |  4 +--
 .../0001-Fix-build-with-Linux-6.13.patch      | 35 -------------------
 .../0002-Fix-build-with-Linux-6.14.patch      | 33 -----------------
 package/rtl8723ds/Config.in                   |  2 +-
 package/rtl8723ds/rtl8723ds.hash              |  2 +-
 package/rtl8723ds/rtl8723ds.mk                |  4 +--
 package/rtl8821au/Config.in                   |  2 +-
 package/rtl8821au/rtl8821au.hash              |  2 +-
 package/rtl8821au/rtl8821au.mk                |  4 +--
 11 files changed, 12 insertions(+), 80 deletions(-)
 delete mode 100644 package/rtl8723ds/0001-Fix-build-with-Linux-6.13.patch
 delete mode 100644 package/rtl8723ds/0002-Fix-build-with-Linux-6.14.patch

-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
