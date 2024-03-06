Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F467C54E41
	for <buildroot@archiver.kernel.org>; Wed,  6 Mar 2024 21:36:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D682D41898;
	Wed,  6 Mar 2024 21:36:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AA8hJv2nMyZv; Wed,  6 Mar 2024 21:36:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BFC44189D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BFC44189D;
	Wed,  6 Mar 2024 21:36:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0E01E1BF95F
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 21:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE73E4183D
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 21:36:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QzbwWKEHCncZ for <buildroot@lists.busybox.net>;
 Wed,  6 Mar 2024 21:36:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.100;
 helo=smtpdh16-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3D9CD40701
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D9CD40701
Received: from smtpdh16-1.aruba.it (smtpdh16-1.aruba.it [62.149.155.100])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3D9CD40701
 for <buildroot@buildroot.org>; Wed,  6 Mar 2024 21:36:09 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id hyvnrMrp4EG7Lhyvnr90Qv; Wed, 06 Mar 2024 22:36:07 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed,  6 Mar 2024 22:35:57 +0100
Message-Id: <20240306213606.2149683-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfM9nQ5JT/KPaVpM3kBeY9SuPsn+gSy30bzF1nQ2f5YgQfaFGU21FpVx5JXskcq4uI/NPMdVWkIwiK1cFXq42dBTZed1a2E0/QQO6JaSmz2LhFUbFnzwh
 pUbyIooBSgrMuC4OgnFhjfAvUYglfg9eYXeENvlIsEkXBFT+gBS7KRkkBhgvpd/nAHsKW00LPmKd16KlS5PILBgMSRaK78mhsvuUlgzWj6ict/ASXgM7uW4D
 nd51RawseWTfrumnZ1QnFzdzYkHixpDiSedKfVGExm5HUWGxUzrImoth4xbhjPM65dPo1OGhP2LzWE5q4vWxjBwW3lLmMvsCE2hOpTv+b1bPPLuvc9uB8gaH
 LjwFbtgm+yekN4aEJPaC52FgEsZPbFkvyO1UbOzijdJFlK5YtnGDO8VdYzlpR//oK6fCyztxtRhApsEpJNb51T81YgkvlmxrfozQmPn+xeSu5NMAF91viZG5
 FMajSBayPNZL9bvcyou2aRoBYHJUFEjToSgyL+WDcQz1nBjeQD6P+sisOKrrBMNd6uQpqh9zsAs5YMtaKn6HgV2qpvJaXxU3xZWp1/rTYAXVckaec9vO+fQD
 t1Y=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1709760967; bh=p1FKKXR7iV1zZl0Ix5jVqmitfeFP5QCMfvtmxXfiSzA=;
 h=From:To:Subject:Date:MIME-Version;
 b=UjlSgxI9i7fGkd7oo7GksyrrbSDpFIDAL/807zWsOHLb5bmPOcAo51s43L2+Dp8RW
 HjegJ6lf5+iD3YIUNNY6hcg0VDrhhangcf8sMS1itxoRFLlZjV2X0vQqbaWp2iD/xq
 QV7XPry1KdzEUVcoiY0OdUsNljfnqW7v2Cleeb0vJTSGTF4iCN+PyP79/SMNK4Hf6F
 plkbyG2AHTotmGOTVowF3X+yoJB6loH3au2gV3kGcPqSGBgXpM72doOCy5vkXDBXqz
 noS6d9qSguUfpu/g2X3QckylWjXIsvFosyrg3D53lwP4YumxyHtzCnxNa9fNvr56dT
 IksM9Rfvp+Ivg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=UjlSgxI9
Subject: [Buildroot] [PATCH v3 0/9] Patch and remove Nios2 binutils bug 27597
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
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
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

* HERE patch [0] for Bootlin External Toolchain must be applied

* drop all bug 27597 bug depencies
* drop the bug 27597 itself

[0]: https://patchwork.ozlabs.org/project/buildroot/patch/20240303151239.185686-1-thomas.petazzoni@bootlin.com/

Best regards
Giulio

---
V1->V2:
* add patch to drop external Sourcery CodeBench Nios-II 2018.05
V2->V3:
* rebase binutils patch against 216e99e9b4fd4c015443bfe15c7be3f06b21fe86
  since binutils version 2.39 has been dropped while version 2.42 has been
  added
---

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
 create mode 100644 package/binutils/2.40/0003-PR27597-nios-assertion-fail-in-nios2_elf32_install_i.patch
 create mode 100644 package/binutils/2.41/0003-PR27597-nios-assertion-fail-in-nios2_elf32_install_i.patch
 create mode 100644 package/binutils/2.42/0003-PR27597-nios-assertion-fail-in-nios2_elf32_install_i.patch
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
