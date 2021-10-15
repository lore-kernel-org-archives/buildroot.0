Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A111AC433F5
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 15:18:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2B0B61181
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 15:18:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D2B0B61181
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8643683B75;
	Fri, 15 Oct 2021 15:18:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LcJ5IgtKDgIR; Fri, 15 Oct 2021 15:18:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 557AA83B73;
	Fri, 15 Oct 2021 15:18:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 530161BF378
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 15:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4308883B73
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 15:18:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dnn7W5G3SbzB for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 15:18:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4806883B72
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 15:18:06 +0000 (UTC)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
 by mailout04.t-online.de (Postfix) with SMTP id 57DD54691
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 17:16:38 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.199.253]) by fwd71.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mbOwm-0bC08X0; Fri, 15 Oct 2021 17:16:36 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:35124)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mbOwm-0001Tz-BX
 for buildroot@buildroot.org; Fri, 15 Oct 2021 17:16:36 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Fri, 15 Oct 2021 17:16:36 +0200
Message-Id: <20211015151636.630910-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1634310997-00001441-629E2062/0/0 CLEAN NORMAL
X-TOI-MSGID: 4376305b-0d0a-4a23-af3d-91a82af1ad00
Subject: [Buildroot] [PATCH 1/1] utils/genrandconfig: test configurations
 with BR2_PACKAGE_PYTHON3_PY_ONLY
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Python3 variant of
https://git.buildroot.net/buildroot-test/commit/?id=c0de21d9530af53eae5588d99d90c7e0cb87c543

to support Kodi 19 which depends on python3:
https://git.buildroot.net/buildroot/commit/?id=148e695e37561fe45d4726cb68f6454464d17797

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 utils/genrandconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index a1431bf1a8..4fffcbad11 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -367,6 +367,8 @@ def gen_config(args):
         configlines.append("BR2_STATIC_LIBS=y\n")
     if randint(0, 20) == 0:
         configlines.append("BR2_PACKAGE_PYTHON_PY_ONLY=y\n")
+    if randint(0, 20) == 0:
+        configlines.append("BR2_PACKAGE_PYTHON3_PY_ONLY=y\n")
     if randint(0, 5) == 0:
         configlines.append("BR2_OPTIMIZE_2=y\n")
     if randint(0, 4) == 0:
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
