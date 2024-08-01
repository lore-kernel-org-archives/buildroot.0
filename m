Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91437C3DA64
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 15:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 015E640114;
	Thu,  1 Aug 2024 15:35:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dpfxAd2QRHHr; Thu,  1 Aug 2024 15:35:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB2054024E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB2054024E;
	Thu,  1 Aug 2024 15:35:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C7E3F1BF3D9
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 15:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B47CB40C4B
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 15:35:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o6oeFuYwXOnB for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 15:35:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=45.157.188.13;
 helo=smtp-bc0d.mail.infomaniak.ch; envelope-from=philip-dylan@gleonec.bzh;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BCD4A40926
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCD4A40926
Received: from smtp-bc0d.mail.infomaniak.ch (smtp-bc0d.mail.infomaniak.ch
 [45.157.188.13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BCD4A40926
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 15:35:14 +0000 (UTC)
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch
 [10.7.10.107])
 by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4WZY1r2dTqzr82;
 Thu,  1 Aug 2024 17:35:12 +0200 (CEST)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4WZY1q6YLjzhDJ; Thu,  1 Aug 2024 17:35:11 +0200 (CEST)
From: Philip-Dylan Gleonec <philip-dylan@gleonec.bzh>
To: buildroot@buildroot.org
Date: Thu,  1 Aug 2024 17:34:30 +0200
Message-Id: <20240801153432.1741409-1-philip-dylan@gleonec.bzh>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240731145504.365492-1-philip-dylan@gleonec.bzh>
References: <20240731145504.365492-1-philip-dylan@gleonec.bzh>
MIME-Version: 1.0
X-Infomaniak-Routing: alpha
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=gleonec.bzh
Subject: [Buildroot] [PATCH v2 0/2] Udoo Neo kernel update
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

Please find attached the corrected patchet for the Udoo Neo kernel
update.
This fixes the linux hash to use the correct version.

Best regards,
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
