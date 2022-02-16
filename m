Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBFD9C433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 14:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FB9F831A7;
	Wed, 16 Feb 2022 14:22:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Uk_ZEOqGtwN; Wed, 16 Feb 2022 14:22:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82772833AE;
	Wed, 16 Feb 2022 14:22:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DF8E01BF5B4
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 14:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD205831F1
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 14:22:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vioiei-oTAaG for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 14:22:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E0B4A82716
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 14:22:04 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id k1so3736703wrd.8
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 06:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tz2LHiFa3BRCt6WAJABSWzo+w7e7ds7bq7YI4lqREAk=;
 b=HJgTwMGqyFSPyfxPUCqRj0BTxlFiAzZ2a45iBNnxedmXL/j7B2f+9aengzpWlRzbWr
 guSltHGAlOzIXiYGnujhoXgbgJ/YwVeKslszOA8Cdr5DGqkCOXTT0vSul8ANFgnHuc7Y
 7Uu33qLn2XEiYt/tRlyN8nxtwhb7li+mHqxN8K/t37SVXUi3xWYrpgyH8RPC3ZM3QlDg
 7g3V51yxElnaKqxUi8twNp8hVE4wOfGQl5CunohFdiIVe2bO1XQVVwKZwlsqBUXYyZBi
 V/jkSZ/SANnQK2HIG+LRmbfMbCcikgZMnhMDxl24PGWfDCLcnMddknDadgZjMF2oV8uN
 Lr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tz2LHiFa3BRCt6WAJABSWzo+w7e7ds7bq7YI4lqREAk=;
 b=EO7JRWB7g28zRBtG05ZJtzcogWoN70yTysbnBhbTuQzeZlv2GVPMvPC9A+gY7FZCGs
 R9Cmu3OhQhUFHtXKjUM4Wy3BwoRyS216aXLOrn+cMghl1zORkNnZrrLiRxzkaOCw3T8f
 hhHrUT4JHdzvvyXo7VhIiy3D4V0XNQPKmnA9FaV9TdmZ7qdKyOMsTuCch512F3Q16HWK
 yuzBc3mWtASR8IC+Yz1TcTv1RNBe2OLliG5TExsWf2m+piZful6j0vl4ATEwOQRRK2BF
 14+10fFRWaROzqhyj9rKEjxfAlkrY/1Ef1TM+BSGir8cj9zRVX/0jrLgNgceb7Z9cKzJ
 SBTA==
X-Gm-Message-State: AOAM5300r95eUpU/WzBFhLYv2xNKGtBJQtR1B17O0ynAJzpTjF3BR/c8
 0k2czsc93ZFdosJtNo9Sx9NCXFtUVOk=
X-Google-Smtp-Source: ABdhPJzvRl0LyoNyVacSUWClEZhz4JCvTx5zvDDS5QhZL81MNB/EUKLSwM6nPSnf2uMN+TUFRqSz1A==
X-Received: by 2002:a5d:4536:0:b0:1e5:64fb:a531 with SMTP id
 j22-20020a5d4536000000b001e564fba531mr2510304wra.264.1645021322777; 
 Wed, 16 Feb 2022 06:22:02 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id 14sm4685013wrb.34.2022.02.16.06.22.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 06:22:02 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 16 Feb 2022 15:22:13 +0100
Message-Id: <20220216142213.1472039-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/frr: set FRR_XREF_NO_NOTE
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
Cc: Vadim Kochan <vadim4j@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Set FRR_XREF_NO_NOTE to avoid the following build failures with
microblazeel, nds32 and xtensa raised since bump to version 8.1 in
commit ca2753fd47d47e5ad0eec16ea62f7b7f096331b6:

_clippy.ELFAccessError: virtual address (538157256) not found in program headers

[...]

/tmp/ccFGv94v.s:13: Error: can't resolve `__start_xref_array' {*UND* section} - `L0' {.note.FRR section}
/tmp/ccFGv94v.s:14: Error: can't resolve `__stop_xref_array' {*UND* section} - `L0' {.note.FRR section}

Here is an extract of
https://github.com/FRRouting/frr/blob/7347a4859d4b984cea0aef769a16622d3f02e44f/lib/xref.h:
"FRR itself does not need this note to operate correctly, so if you have
some build issue with it just add -DFRR_XREF_NO_NOTE to your build flags
to disable it."

Fixes:
 - http://autobuild.buildroot.org/results/3cdb50f5e5a1b3f37a6edcd4276fcbf015e28828
 - http://autobuild.buildroot.org/results/a3cc0b5090a1faa2bca9c8dfe0fec9b6a918ba4d
 - http://autobuild.buildroot.org/results/694cc65478a82ec93d2074252892036855cdc49d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/frr/frr.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index cc83016f9f..0e6ab7a815 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -17,7 +17,9 @@ FRR_DEPENDENCIES = host-frr readline json-c libyang libnl \
 
 HOST_FRR_DEPENDENCIES = host-flex host-bison host-elfutils host-python3
 
-FRR_CONF_ENV = ac_cv_lib_cunit_CU_initialize_registry=no
+FRR_CONF_ENV = \
+	ac_cv_lib_cunit_CU_initialize_registry=no \
+	CFLAGS="$(TARGET_CFLAGS) -DFRR_XREF_NO_NOTE"
 
 FRR_CONF_OPTS = --with-clippy=$(HOST_DIR)/bin/clippy \
 	--sysconfdir=/etc/frr \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
