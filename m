Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5369DC4332F
	for <buildroot@archiver.kernel.org>; Mon, 30 Oct 2023 10:11:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C2E04F3EB;
	Mon, 30 Oct 2023 10:11:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C2E04F3EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oj-6KwL5Ie2S; Mon, 30 Oct 2023 10:11:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36A774F4B0;
	Mon, 30 Oct 2023 10:11:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36A774F4B0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EEB291BF313
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 10:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3BF5437FB
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 10:11:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3BF5437FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n6GYEoRWbl6x for <buildroot@lists.busybox.net>;
 Mon, 30 Oct 2023 10:11:21 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 405FF4380D
 for <buildroot@buildroot.org>; Mon, 30 Oct 2023 10:11:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 405FF4380D
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qxPEr-00ErHG-2d; Mon, 30 Oct 2023 11:11:17 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 26abfb09;
 Mon, 30 Oct 2023 10:11:15 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Mon, 30 Oct 2023 12:11:04 +0200
Message-ID: <20231030101115.2214402-1-aperez@igalia.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dWf3dr2F5orquOI0GCRo7q3DxZuAgfFiiNAldzG56Rw=; b=ilvFJwyoz8yfATSFsR2AQC2b38
 MuUUBwMqQHZSHsqB0EyvZrWY1AwYAdXsMp5+S26TxZ7MqLhdZn/pcorwlDdQulE4HvuepT3ecN3hS
 AeRIVhPRjsaQAZZPfMlJaZLRzdXikZTaNm5hv+D6rfaG0/mtcQw3HBLgsA2GDw5GtwCJSDiRDBFCX
 +h6Qn9r+JEqjNAUS0KmSuvrDj304VLd1sg9b35QIbX/4bjAt0Bd5DLck7425m/XyeigyYQgNnxk4f
 QXes9D8pheMUbCEDKX2k8xmymAfTrYoMfMxz30RnokZYBdyzUEogKD4KeW2CGfTGFHRD0DoOJZNcF
 qcySKDvA==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=ilvFJwyo
Subject: [Buildroot] [PATCH 0/3] Update wlroots to 0.16.x and dependent
 packages
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello!

This patch series updates wlroots to the most recent stable release,
plus the cage and sway compositors to their latest releases as well.
These are the two only Buildroot packages which depend on wlroots,
and part of their changes includes support for building against
wlroots 0.16.x, which had some bits of its public API changed.

Cheers,

Adrian Perez de Castro (3):
  package/wlroots: bump to version 0.16.2
  package/cage: bump to version 0.1.5
  package/sway: bump to version 1.8.1

 .../cage/0001-Upgrade-to-wlroots-0.15.patch   | 312 ------------------
 package/cage/cage.hash                        |   4 +-
 package/cage/cage.mk                          |   2 +-
 package/sway/sway.hash                        |   2 +-
 package/sway/sway.mk                          |   4 +-
 package/wlroots/wlroots.hash                  |   4 +-
 package/wlroots/wlroots.mk                    |   2 +-
 7 files changed, 9 insertions(+), 321 deletions(-)
 delete mode 100644 package/cage/0001-Upgrade-to-wlroots-0.15.patch

-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
