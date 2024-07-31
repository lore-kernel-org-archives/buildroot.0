Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B0E8C3DA64
	for <buildroot@archiver.kernel.org>; Wed, 31 Jul 2024 15:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 338F440231;
	Wed, 31 Jul 2024 15:12:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LYRHbJdNwow2; Wed, 31 Jul 2024 15:12:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0516A40605
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0516A40605;
	Wed, 31 Jul 2024 15:12:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6ABE81BF23C
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 15:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57A0840603
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 15:12:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Szjtxhhs9S1p for <buildroot@lists.busybox.net>;
 Wed, 31 Jul 2024 15:12:36 +0000 (UTC)
X-Greylist: delayed 600 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 31 Jul 2024 15:12:36 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 69FED40231
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69FED40231
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=45.157.188.11;
 helo=smtp-bc0b.mail.infomaniak.ch; envelope-from=philip-dylan@gleonec.bzh;
 receiver=<UNKNOWN> 
Received: from smtp-bc0b.mail.infomaniak.ch (smtp-bc0b.mail.infomaniak.ch
 [45.157.188.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 69FED40231
 for <buildroot@buildroot.org>; Wed, 31 Jul 2024 15:12:36 +0000 (UTC)
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch
 [10.7.10.107])
 by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4WYwBv6zTSzTB7;
 Wed, 31 Jul 2024 16:55:51 +0200 (CEST)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4WYwBv1hFNzTYp; Wed, 31 Jul 2024 16:55:51 +0200 (CEST)
From: Philip-Dylan Gleonec <philip-dylan@gleonec.bzh>
To: buildroot@buildroot.org
Date: Wed, 31 Jul 2024 16:55:02 +0200
Message-Id: <20240731145504.365492-1-philip-dylan@gleonec.bzh>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Infomaniak-Routing: alpha
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=gleonec.bzh
Subject: [Buildroot] [PATCH 0/2] Udoo Neo kernel update
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
Cc: Fabio Estevam <festevam@gmail.com>,
 Philip-Dylan Gleonec <philip-dylan@gleonec.bzh>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

I'm currently playing with the Udoo Neo board and have found that the
kernel in the current board configuration does not build.

While a point release bump would be sufficient, I took the opportunity
to update the kernel to the latest LTS version. Hashes verification was
added to ensure the integrity of uboot and linux sources.

The 6.6 kernel does not add any regression compared to the latest 5.15
kernel.

Thanks for your time,
Philip-Dylan Gleonec

Philip-Dylan Gleonec (2):
  configs/mx6sx_udoo_neo_defconfig: bump kernel to 6.6.43
  configs/mx6sx_udoo_neo_defconfig: add hashes

 .checkpackageignore                                    |  1 -
 .../udoo/neo/patches/linux-headers/linux-headers.hash  |  1 +
 board/udoo/neo/patches/linux/linux.hash                |  2 ++
 board/udoo/neo/patches/uboot/uboot.hash                |  2 ++
 configs/mx6sx_udoo_neo_defconfig                       | 10 ++++++----
 5 files changed, 11 insertions(+), 5 deletions(-)
 create mode 120000 board/udoo/neo/patches/linux-headers/linux-headers.hash
 create mode 100644 board/udoo/neo/patches/linux/linux.hash
 create mode 100644 board/udoo/neo/patches/uboot/uboot.hash

-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
