Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B85AC19F2D
	for <buildroot@archiver.kernel.org>; Sat,  6 Aug 2022 22:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D87CA60F8E;
	Sat,  6 Aug 2022 22:22:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D87CA60F8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r2_zklYyh24R; Sat,  6 Aug 2022 22:22:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08D7460F6E;
	Sat,  6 Aug 2022 22:22:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08D7460F6E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8F11F1BF95E
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 22:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A2D560F85
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 22:22:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A2D560F85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4dw4jIFnwzQ5 for <buildroot@lists.busybox.net>;
 Sat,  6 Aug 2022 22:22:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6182606BF
Received: from smtpcmd03120.aruba.it (smtpcmd03120.aruba.it [62.149.158.120])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6182606BF
 for <buildroot@buildroot.org>; Sat,  6 Aug 2022 22:22:06 +0000 (UTC)
Received: from localhost.localdomain ([86.32.63.136])
 by Aruba Outgoing Smtp  with ESMTPSA
 id KSBHoy4Go5XbvKSBIoQj0D; Sun, 07 Aug 2022 00:22:05 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Aug 2022 00:22:01 +0200
Message-Id: <20220806222203.1115664-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJuvYLUffpk/3yLTBziBH0kfV3Y4C305EqjN+BbF8rBZlodzWW+ZBAdrlvOYEodgqXpVMd0bVNYlurGCmK5Fr1f8WOUs3ubXuWg5w0xgH42Dm2/OrWJc
 LBuK2T5pzLZVsNddriAFOg6qRWhiZI5YwFPz9x37+hXH/9emUPWDnceECdl3Rma2U0Dq81jpel1gKBhUyILbBaZb/MUGd/givInr02eqOrVA6esgtBcYF9fO
 OP1Ec5vhiRVNrpZ8u+oLRvv++JTsnRDxOdifXFAVYOnqed1GBA6gpMH1IB7vbpjNcJhTfZRlN6sywCF65BMj4Ctxia4fwyaXfGI3K7NwTSOVCZQUsjNXspA7
 Dv3acWLO5EL/2qjZyZX3a9NcZZuGx6wgbqH2i2P7a+AW877uLt45C2QBuqvXNH7tooC2fq4sMCoeLoR+JI/excasy3sjIQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1659824525; bh=DvIAKaxPXSfKFW2re6nTqi0rpPrttHbOGRMM3aZBpKA=;
 h=From:To:Subject:Date:MIME-Version;
 b=PIAwp5NfWw6gATM1vvGXjd8Cppfa0fL1ASrYBNQ2Cz6QktJMenqfp+Ta1ZAljs/be
 U2SsF1sViosr+2LZEhV0xWNgEgVRURN9kfCfpXleB4BMxrtJDn9kzxLmssqH1YpUwt
 yCBh9H63Gb66Io8aqc2dhOXpaH4wdXaBvj+GPqeft7xJDYaLKJ7NbCJ+rod+Lf9w/4
 1DUtSROONqsMr5DLeLNhXSyGi+FYsa38NTssL1S9DolGOaFdhqgYfV5qj04cBlEP1j
 Gr1Uw/pI2ojaN1WLuH3TiW+k8VG5uPRIembC1ogQYgkBiA/bbVNNw4sGG2BkJnqyot
 F8hIlA20yTceg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=PIAwp5Nf
Subject: [Buildroot] [PATCH 1/2] toolchain/Config.in: update gcc bug 101915
 comment
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Chris Packham <judge.packham@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 toolchain/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 9612bdf8b2..fbc2f28553 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -200,7 +200,7 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_101737
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101915
 # ICE: in extract_insn, at recog.c:2294 on microblaze.
-# This bug still exists in gcc = 11.1.0
+# This bug still exists in gcc = 12.1.0
 config BR2_TOOLCHAIN_HAS_GCC_BUG_101915
 	bool
 	default y if BR2_microblaze
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
