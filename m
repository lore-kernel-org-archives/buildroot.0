Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FFB8C48BC4
	for <buildroot@archiver.kernel.org>; Sun, 18 Feb 2024 18:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDA5081F22;
	Sun, 18 Feb 2024 18:45:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iP4fEB9FMkra; Sun, 18 Feb 2024 18:45:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5899B81F9D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5899B81F9D;
	Sun, 18 Feb 2024 18:45:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C648D1BF86D
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 18:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B45D260675
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 18:45:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ayph6ejtUO8f for <buildroot@lists.busybox.net>;
 Sun, 18 Feb 2024 18:45:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.117;
 helo=smtpcmd11117.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 30E9B60671
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30E9B60671
Received: from smtpcmd11117.aruba.it (smtpcmd11117.aruba.it [62.149.156.117])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 30E9B60671
 for <buildroot@buildroot.org>; Sun, 18 Feb 2024 18:45:40 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id bmASrFAK1ce1vbmATrHZIH; Sun, 18 Feb 2024 19:45:37 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 18 Feb 2024 19:45:28 +0100
Message-Id: <20240218184536.1922309-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfOG9F0+y85GL8UeSgqzJAQ3KxMMjfa96pKTDK0acHVpVtQHixtpw0eV+F3CUK0bcKi2xTe51uenQE1jqTjiSqPAvDRzWd3ZODDFXIro/4jO90COt/zbO
 l5T094pNzZK/+/b2bfjrdU010kNNF3fNagBkIUQz+dsFQFnuBeSnF7WLpal1pr8No8E6EJqTJEBPI0DzCZ9NA1BKIgRKiwyy6kk5+qLxsoWD+wkqUgrmJ6If
 /69rg9ognzrpcYQ3it8FirwptafvNQCnvrGcM7s3F4tJk35NgdaXjWVQUiGJNmmq1BmXoNbYy7piGroYTz1ZkAo43gRlHeJdvwYNWj1OCjNN+CAZsPVP+3r0
 54mmcxh//HfvqLxnW9/GSm6UBdojZz58WA5R9Nbqw3VLMpE89961zPQvyqDLJr+A+dw8JLLHk8nfdNn1iI9E/ipZzUcVRmRlboFz5cvkkXi8aPtPZBVc+jzD
 ai2WSSUkKGGLoplwpAz/qtrKG5syR2KAcf4i7Znc31EkMJ6ISG/mlOC895Ez7DK0V7+Wz+Hj7Uc/nL5wpbGN+SuFovBY60Pi/eLCeXX48cEwhDHwz3WNIYFg
 m2Y=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1708281937; bh=Ot3Zl0CMhgKj3sd1id/ghLFwPH1ChZPdIUsyaanE6lQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=NOTQVS86MKvk4zF4AqV8zbRXHyhATgNsllfch2alhPXpnq5W7MLSJmZDZzGQJEc5/
 Uv3Otzntxjloe0NaNLerKA0kMUbd8g9Dn0Vf4ATYhdaBvSm5OFzNuPRm+fQPhYjmrh
 emkjvBVM/xpstbYt0I0km1GrEDDHcNwY+CCQ4u4mxhDDbfKZpGCjpCyueHsvwJvun8
 xBdQWhaWN59F0GwtT/ugiwScADyvGnB4zhOOjMLa1k2OIOiwWJH8HhaVeqgQMDLNsT
 yeie31VwV2LLxcUwhawepH7cuw9GFYpbGAQYuuzQPhJYqrgv12QCJPV7OmY2zzEZPS
 2eVpiUqDDbf+w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=NOTQVS86
Subject: [Buildroot] [PATCH 0/8] Patch and remove Nios2 binutils bug 27597
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Pierre Ducroquet <pinaraf@pinaraf.info>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Dominik Michael Rauh <dmrauh@posteo.de>, Maxim Kochetkov <fido_max@inbox.ru>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patchset add backported patches for Buildroot Nios2 binutils bug 27597 and
drop packages dependency on it. Doing this the external toolchain will fail
building those packages, so I'm not that sure how to deal with this situation.
The same happened for OpenRisc and as far as I remember the first patch of the
series has been applied, then Bootlin toolchains have been patched and rebuilt/
redeployed, in the end the remaining patches have been applied. But here we also
have Sourcery CodeBench Nios-II 2018.05 toolchain that contain the bug, so I
don't know how to deal with this situation to avoid build failures.

Any ideas?

Thank you!

Best regards
Giulio

Giulio Benetti (8):
  package/binutils: add local patches to fix Nios2 bug 27597
  package/gdal: drop nios2 binutils bug 27597 dependency
  package/kf5/kf5-kcoreaddons: drop nios2 binutils bug 27597 dependency
  package/libcamera: drop nios2 binutils bug 27597 dependency
  package/libgeos: drop nios2 binutils bug 27597 dependency
  package/pistache: drop nios2 binutils bug 27597 dependency
  package/postgis: drop nios2 binutils bug 27597 dependency
  toolchain: remove binutils bug 27597

 ...ertion-fail-in-nios2_elf32_install_i.patch | 125 ++++++++++++++++++
 ...ertion-fail-in-nios2_elf32_install_i.patch | 125 ++++++++++++++++++
 ...ertion-fail-in-nios2_elf32_install_i.patch | 125 ++++++++++++++++++
 package/gdal/Config.in                        |   4 +-
 package/kf5/kf5-kcoreaddons/Config.in         |   1 -
 package/libcamera/Config.in                   |   1 -
 package/libgeos/Config.in                     |   6 +-
 package/pistache/Config.in                    |   6 +-
 package/postgis/Config.in                     |   6 +-
 toolchain/Config.in                           |   6 -
 10 files changed, 382 insertions(+), 23 deletions(-)
 create mode 100644 package/binutils/2.39/0004-PR27597-nios-assertion-fail-in-nios2_elf32_install_i.patch
 create mode 100644 package/binutils/2.40/0003-PR27597-nios-assertion-fail-in-nios2_elf32_install_i.patch
 create mode 100644 package/binutils/2.41/0003-PR27597-nios-assertion-fail-in-nios2_elf32_install_i.patch

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
