Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A669C4332F
	for <buildroot@archiver.kernel.org>; Mon, 30 Oct 2023 09:22:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF7AB4F531;
	Mon, 30 Oct 2023 09:22:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF7AB4F531
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V0bOBUuQpTtV; Mon, 30 Oct 2023 09:22:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7BA44F52E;
	Mon, 30 Oct 2023 09:22:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7BA44F52E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 374E91BF37A
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 09:22:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C3974002B
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 09:22:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C3974002B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B4uO5O5BN-_f for <buildroot@lists.busybox.net>;
 Mon, 30 Oct 2023 09:22:52 +0000 (UTC)
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2025D435E1
 for <buildroot@buildroot.org>; Mon, 30 Oct 2023 09:22:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2025D435E1
Received: from unknown (HELO opfedv1rlp0c.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 10:22:49 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0c.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Oct 2023 10:22:49 +0100
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 30 Oct 2023 10:22:47 +0100
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Mon, 30 Oct 2023 10:22:47 +0100
X-IronPort-AV: E=Sophos;i="6.03,263,1694728800"; d="scan'208";a="60216042"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Mon, 30 Oct 2023 10:22:47 +0100
Message-ID: <cover.1698657764.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX203.corporate.adroot.infra.ftgroup (10.115.26.8)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1698657772; x=1730193772;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7OYV5+ne2PxYf51CXRSiY0qsHF5X4WtcTprPZ8J7C2E=;
 b=jx47bGtB31D27iyaacRajh0otDaKYQ9daYFSLXUUvIl68S3bUEawn5ZC
 OH4jGJJQlkL4+sOIO9jz2gyohVPP+LRT9NAhQxh5V1MyeO2LqNE3jv4Dm
 xJJtvEedftKFOFZEcRGgBODsWKx4TQ1F2wpK1Nv6VnvfCL8OSRcIXWi+Q
 491BjU6pY9dpkaTR0jxiT30HJk0uq0Z5koCjPAZsh0Om/8ntBTrFTUKMW
 GV9xpkIF1f4PIgNZ0QRnsZnkpGwuakJDCi0IBMxq/+PtfnZcEnxtLze1J
 UD44OR2j2eoF8oTBN8gseuhHJVrtQfh1PhU67NLSqraQKZUhBmaXOExVn
 w==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=jx47bGtB
Subject: [Buildroot] [PATCH 0/2] package/filebeat: new package
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
Cc: "Yann E . MORIN" <yann.morin@orange.com>, Vincent Fazio <vfazio@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

Hello All!

This two-patch series introduces filebeat, an ElasticSearch-related tool
to grab local log files and send them to a remote ElasticSearch server.

It is a bit convoluted (see commit log), and requires a little extension
in our golang-package infrastructure, which we introduce as the first
patch in the series.

$ echo BR2_PACKAGE_FILEBEAT=y >filebeat.cfg
$ ./utils/test-pkg -c filebeat.cfg -p filebeat -d $(pwd)/test-pkg -a
                             arm-aarch64 [ 1/45]: OK
                   bootlin-aarch64-glibc [ 2/45]: OK
               bootlin-arcle-hs38-uclibc [ 3/45]: SKIPPED
                    bootlin-armv5-uclibc [ 4/45]: OK
                     bootlin-armv7-glibc [ 5/45]: OK
                   bootlin-armv7m-uclibc [ 6/45]: SKIPPED
                      bootlin-armv7-musl [ 7/45]: OK
                bootlin-m68k-5208-uclibc [ 8/45]: SKIPPED
               bootlin-m68k-68040-uclibc [ 9/45]: SKIPPED
             bootlin-microblazeel-uclibc [10/45]: SKIPPED
                bootlin-mipsel32r6-glibc [11/45]: SKIPPED
                   bootlin-mipsel-uclibc [12/45]: SKIPPED
                     bootlin-nios2-glibc [13/45]: SKIPPED
                 bootlin-openrisc-uclibc [14/45]: SKIPPED
        bootlin-powerpc64le-power8-glibc [15/45]: OK
           bootlin-powerpc-e500mc-uclibc [16/45]: SKIPPED
                   bootlin-riscv32-glibc [17/45]: SKIPPED
                   bootlin-riscv64-glibc [18/45]: SKIPPED
                    bootlin-riscv64-musl [19/45]: SKIPPED
                 bootlin-s390x-z13-glibc [20/45]: OK
                      bootlin-sh4-uclibc [21/45]: SKIPPED
                   bootlin-sparc64-glibc [22/45]: SKIPPED
                    bootlin-sparc-uclibc [23/45]: SKIPPED
                    bootlin-x86-64-glibc [24/45]: OK
                     bootlin-x86-64-musl [25/45]: OK
                   bootlin-x86-64-uclibc [26/45]: OK
                   bootlin-xtensa-uclibc [27/45]: SKIPPED
                            br-arm-basic [28/45]: OK
                    br-arm-full-nothread [29/45]: OK
                      br-arm-full-static [30/45]: SKIPPED
                   br-i386-pentium4-full [31/45]: OK
                br-i386-pentium-mmx-musl [32/45]: OK
                      br-mips64-n64-full [33/45]: OK
                 br-mips64r6-el-hf-glibc [34/45]: SKIPPED
               br-powerpc-603e-basic-cpp [35/45]: SKIPPED
               br-powerpc64-power7-glibc [36/45]: SKIPPED
                       linaro-aarch64-be [37/45]: SKIPPED
                          linaro-aarch64 [38/45]: OK
                              linaro-arm [39/45]: OK
                     sourcery-arm-armv4t [40/45]: SKIPPED
                            sourcery-arm [41/45]: FAILED
                     sourcery-arm-thumb2 [42/45]: FAILED
                         sourcery-mips64 [43/45]: FAILED
                           sourcery-mips [44/45]: SKIPPED
                          sourcery-nios2 [45/45]: SKIPPED
45 builds, 23 skipped, 5 build failed, 0 legal-info failed, 0 show-info failed

Analysis of each build failure:

  - sourcery-arm, sourcery-arm-thumb2:
    => the failure with the sourcery-arm toolchain is expected: it is
    very old, and uses binutils that did not not have a ld.gold, so no
    ld.bfd either, just a plain ld, hence our workaround against the
    go workaround does not work, as expected.

  - sourcery-mips64:
    => host-go does not build, so not a filebeat issue

  - bootlin-riscv64-glibc, bootlin-riscv64-musl:
    => filebeat has no implementation for its internal atomic ints on
    riscv64

  - other skips due to go arch dependencies: no go, no beat.


Regards,
Yann E. MORIN.


The following changes since commit bc8d214e988b95b125ad2b9409286cbf820370b0

  package/python-django: bump version to 4.2.6 (2023-10-22 20:37:13 +0200)


are available as patches in this mail series,

for you to apply patches up to dd3cad7bdab3590524ea1273910c66812cb4f4d8

  package/filebeat: new package (2023-10-30 10:21:47 +0100)


----------------------------------------------------------------
Yann E. MORIN (2):
      package/pkg-golang: allow packages to provide extldflags
      package/filebeat: new package

 docs/manual/adding-packages-golang.adoc |  6 ++-
 package/Config.in                       |  1 +
 package/filebeat/Config.in              | 14 ++++++
 package/filebeat/filebeat.default       |  1 +
 package/filebeat/filebeat.hash          |  5 ++
 package/filebeat/filebeat.mk            | 85 +++++++++++++++++++++++++++++++++
 package/filebeat/filebeat.service       | 13 +++++
 package/filebeat/filebeat.yml           |  5 ++
 package/pkg-golang.mk                   |  6 ++-
 9 files changed, 133 insertions(+), 3 deletions(-)
 create mode 100644 package/filebeat/Config.in
 create mode 100644 package/filebeat/filebeat.default
 create mode 100644 package/filebeat/filebeat.hash
 create mode 100644 package/filebeat/filebeat.mk
 create mode 100644 package/filebeat/filebeat.service
 create mode 100644 package/filebeat/filebeat.yml

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
|                 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
| yann.morin (at) orange.com           |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
