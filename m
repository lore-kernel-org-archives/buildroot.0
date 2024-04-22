Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CACC4345F
	for <buildroot@archiver.kernel.org>; Mon, 22 Apr 2024 05:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA55340516;
	Mon, 22 Apr 2024 05:09:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xzJh-DvPbL4g; Mon, 22 Apr 2024 05:09:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C13D84051C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C13D84051C;
	Mon, 22 Apr 2024 05:09:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C05301BF2EC
 for <buildroot@lists.busybox.net>; Mon, 22 Apr 2024 05:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with UTF8SMTP id A9384404FF
 for <buildroot@lists.busybox.net>; Mon, 22 Apr 2024 05:09:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id fCGkveH83P3C for <buildroot@lists.busybox.net>;
 Mon, 22 Apr 2024 05:09:16 +0000 (UTC)
X-Greylist: delayed 5623 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 22 Apr 2024 05:09:14 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D0B5F404F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0B5F404F8
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=203.205.221.192;
 helo=out203-205-221-192.mail.qq.com; envelope-from=jacob-chen@iotwrt.com;
 receiver=<UNKNOWN> 
Received: from out203-205-221-192.mail.qq.com (out203-205-221-192.mail.qq.com
 [203.205.221.192])
 by smtp2.osuosl.org (Postfix) with UTF8SMTPS id D0B5F404F8
 for <buildroot@buildroot.org>; Mon, 22 Apr 2024 05:09:14 +0000 (UTC)
Received: from PC-429720.company.local ([60.190.250.155])
 by newxmesmtplogicsvrsza29-0.qq.com (NewEsmtp) with SMTP
 id 246B167C; Mon, 22 Apr 2024 13:09:06 +0800
X-QQ-mid: xmsmtpt1713762546tragiii10
Message-ID: <tencent_7A5A407C574E45921E432385B01446CC4506@qq.com>
X-QQ-XMAILINFO: OZZSS56D9fAjlpsn/xx7u2GnfOReJyyvl1jmMO+ei5/5kgHILnIXNlDfTVLgTK
 r45NKoMoWc5vco8fNf8qwAWzUdzFT0XP/pjbUzuMnkdKKbiecjJh2L2AWbHEgL71PS8JM7+7xU4h
 1d6yi0mh7IXdDzFOMe1mZ3dkpucqf4zkAgaUyjw1+H3+as0cbzHlFBz2jbNIxoFJroKrqtg3WV4x
 vh1ZYIBaiweVqF1HN00SdM1BnRMOhfTazNrzT+xb8g8D2qlbwlWrPS3prjy/VomEZEGrjdn9vW5/
 0dKGhysr1Id3ePBhvkV/AN8fMjVuoExID3DfIVQ9AkBwuZblglYATSSzSeJ1bVP68g36041rOjQm
 YRdDgED/u/Q+LXUkL9aOjRxi2+9dzo8Ite+/qE3DjUXctOCVViBYUhUCgUTdwmmbFZ5VB3fU520D
 y/2tRgsbQg1wZG++PRMQ6HgEilNnzT0g7CvKQU518H/Pi2rfG/83vpfxoEogCKILWynRuJNdMEF0
 URhfguamxasSbZUD8y/Bi+dB3RjlrNJq4Z3MTsSpJQsMhfu8ChobYCCLViH+JMzQ9sNexmIGZocF
 XJRLiLvY2MwSAhQe2pcXnGFt4RgKq20XXUcS4YdrXMW13k3jeLeuNdPPwZ8crmdNI91Y4+X5bHTs
 3BD3tnKxBW6ezndcqyIkqrpFcLJeCdgFXCJR3xrOIRGpvKyYU+whH1QSsjwNFv8aWHjJCe7U3cHt
 drDdlTo/zftWiSxIscvlMEtsyQUZQQp7LGYxdtgDQ9U81iD4LE4v4d/NOR62SmaPBAF4AELjChig
 1qY+UB8/doDJ2yVX8C7ZrgFdovhBp5nfzlTCvzHfis4ApSVR/sToPOL0ZtqM9gPk4Z0ThFiN8CJL
 zSjxqILI+i1ej6FSvVli44rA8GTMXk3uPZso5S1R96WsEoz04frtRN7sQEfEcxTKWPSkiJyjlnLd
 q/bhJk4brI4gXiiq+hiOwnXzizaF4JejX3LjuoEw4taFiY0ImSWdpBvUecg9OiZe48tLLbDxtZwe
 oRcIjVNcUsLZxxrnx3N1LgHI7UxA8=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
From: jacob-chen@iotwrt.com
To: buildroot@buildroot.org
Date: Mon, 22 Apr 2024 13:09:00 +0800
X-OQ-MSGID: <20240422050900.279541-1-jacob-chen@iotwrt.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qq.com; s=s201512; 
 t=1713762549; bh=KTHcxN8meIwrWhcCD+BjeMjcIxcAdWY57Lmu1y9gnAc=;
 h=From:To:Cc:Subject:Date;
 b=kWMuoBT+nSWpG9x+S4YO/ULC98jqYkaYWAHB8+CapLvV/2l9wO/jahm2s3IU1zcTn
 gYUTio4mVgSdFz3t5hyvJV9fDv+a9FgeFah5MQUNWrAo7aqhhghUOBpJeF2SecYZoX
 270XV+fCcWki+D1fX2m0gGJmBuo6PGaU0VuMMGKg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=iotwrt.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256
 header.s=s201512 header.b=kWMuoBT+
Subject: [Buildroot] [PATCH 1/1] package/pkg-utils.mk: fix incorrect
 handling of per-package rebuilds
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
Cc: chenhao <chenhao37@lixiang.com>, jacob-chen@iotwrt.com,
 zhouxiufeng@lixiang.com, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: chenhao <chenhao37@lixiang.com>

The current per-package enabled build process incorrectly handles rebuild targets,
which break local development workflows("make package-rebuild && make all.").
There is an earlier report regarding the bug( https://lore.kernel.org/buildroot/20191212130253.2cb543ba@windsurf/ )

To address this issue, we change rsync command used during the finalize step to use the 'update' parameter.
This ensures that the most recent files are installed into the rootfs.

Signed-off-by: Jacob Chen <chenhao37@lixiang.com>
---
 package/pkg-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 6181ae7a99..be1db37df1 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -227,7 +227,7 @@ define per-package-rsync
 			$(if $(filter hardlink,$(4)), \
 				--link-dest=$(PER_PACKAGE_DIR)/$(pkg)/$(2)/, \
 				$(if $(filter copy,$(4)), \
-					$(empty), \
+					--update, \
 					$(error per-package-rsync can only "copy" or "hardlink", not "$(4)") \
 				) \
 			) \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
