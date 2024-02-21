Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC22C54788
	for <buildroot@archiver.kernel.org>; Wed, 21 Feb 2024 21:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 240DC6069F;
	Wed, 21 Feb 2024 21:40:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0oPTdryhNr4i; Wed, 21 Feb 2024 21:40:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FD6760FE1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FD6760FE1;
	Wed, 21 Feb 2024 21:40:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B8FA41BF36F
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 21:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A5493417C0
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 21:40:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id boISDWL3K3Dm for <buildroot@lists.busybox.net>;
 Wed, 21 Feb 2024 21:40:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.101;
 helo=smtpcmd02101.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E3BDD40C3F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3BDD40C3F
Received: from smtpcmd02101.aruba.it (smtpcmd02101.aruba.it [62.149.158.101])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E3BDD40C3F
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 21:40:10 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id cuJyrqwWLMMFBcuJyrhA3W; Wed, 21 Feb 2024 22:40:07 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 21 Feb 2024 22:39:56 +0100
Message-Id: <20240221214005.176433-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240218230524.639348e6@windsurf>
References: <20240218230524.639348e6@windsurf>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfIry4oDHVBJMSk3f+p3aZ7EnqYLm4M2ugcOIivsRjseQWlWBf5cIDR+aTUIciXDTEMGMzEs/q82v8QYVBBOtjd7JkXT2ypjwemRDRc1r8q9wT9FGGrK1
 2piI3dwsLQIMadeodfTPHyn+OXgxd1k40y6QexRgEnrIGUYogKHBB9ly0hkSsLVrtzjP21I06JBZQk92fBk6Cw38x+ZukyLx7qxp2nhsgmuupBRXn4TzLkHd
 7C3qKbFlMS3/MGRtOGKo0iMFaYDFykNNiCxIkf8ybA0Rre5unX9+5NGieMtBy5GuvEXYRuFn9QQ3k1Y8pttvvrkqELMQkJCuJUBgvOvrfKi7D5zIkA+h2ZAa
 JMOfn34qmNSIVKPzWrfm/VlksNhZdH42zNoL9dq3PoWHdR/qo0E0soVGQlZ29PzT4SqmSMAWYurg5YBfd/97px6GWdX/ZZcmCew+kqGF0bOomwvvT5TobesV
 lbb9uMUJW9r9vYNPTjl4YJAgCjPJCN02K+S28NGg8gXmSqNg6H7rgCtmrwH9C47CphJRMlFjOa1fAIRChj3XZGIbYmDzjK7vHQWZKxNYpwMCPU30sVPmsuz6
 xBag+5Z3TgQ7D99FlQd8IE9sV/5uBWSikUBQ87tjrhHozaDCii8WTfcoDq4WyTVA1cI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1708551607; bh=4iStyrYqKi7hFVmsKVTsgvsCaY7EAG7eaPB54v14hqs=;
 h=From:To:Subject:Date:MIME-Version;
 b=fqWQTES+2JktURyfW/oZJX6PV4+61Zu9JP1Yiwp17TMM3yHRmkutfoFa7Q/JR0q00
 q3MwxIT7F7scsRKyEIOkQ1rAvpyFZrcgfESDYTGOMj7jREKZXYZ6drRUZVoWqH/b7Q
 7VGcoxF+mjy+zVac/FTwdcHWcV1cR/XO7x+gJgkT9d/NzE7jz4oW36O2s16SCHSkkX
 2xRP+AJ9xi4ruvwcP+8yF9rRW1T6UCSPlNbhUN2lm0OF/g77w6ZKXqU98r9P7POMQb
 R9DFL+Qan6gshGcz789+/4PDmu70ELd12iOTPFBywIE5am4viucUVfkgL/icnu3qSb
 PwqoY5WFUHtMA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=fqWQTES+
Subject: [Buildroot] [PATCH v2 0/9] Patch and remove Nios2 binutils bug 27597
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Dominik Michael Rauh <dmrauh@posteo.de>, Maxim Kochetkov <fido_max@inbox.ru>,
 Vincent Fazio <vfazio@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patchset:
* add backported patches for Buildroot Nios2 binutils bug 27597
* remove Codesourcery Nios2 external toolchain that is affected from bug above
  (I've tried to update to latest 2023.09-5 just for testing and yes, it's still
   affected by that bug, maybe once they will release toolchain based on latest
   binutils 2.42 that has patch applied to fix bug 27597 we can add it back)

* HERE we need Bootlin Nios2 Toolchain to be patched, rebuilt and updated.
  I've opened a PR with binutils patches for bug 27597:
  https://github.com/bootlin/buildroot-toolchains/pull/2

* drop all bug 27597 bug depencies
* drop the bug 27597 itself

Best regards
Giulio

Giulio Benetti (9):
  toolchain/toolchain-external: drop external codesourcery niosII
    toolchain
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
 toolchain/toolchain-external/Config.in        |   6 -
 .../pkg-toolchain-external.mk                 |   2 +-
 .../Config.in                                 |  16 ---
 .../Config.in.options                         |   9 --
 ...oolchain-external-codesourcery-niosII.hash |   6 -
 .../toolchain-external-codesourcery-niosII.mk |  13 --
 16 files changed, 383 insertions(+), 74 deletions(-)
 create mode 100644 package/binutils/2.39/0004-PR27597-nios-assertion-fail-in-nios2_elf32_install_i.patch
 create mode 100644 package/binutils/2.40/0003-PR27597-nios-assertion-fail-in-nios2_elf32_install_i.patch
 create mode 100644 package/binutils/2.41/0003-PR27597-nios-assertion-fail-in-nios2_elf32_install_i.patch
 delete mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in
 delete mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in.options
 delete mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.hash
 delete mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.mk

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
