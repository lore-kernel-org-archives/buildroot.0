Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE5A3C46CD2
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 11:23:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5883C60B6C;
	Sat,  6 Jan 2024 11:23:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5883C60B6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Emk3L6UkmjJr; Sat,  6 Jan 2024 11:23:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A405E60B51;
	Sat,  6 Jan 2024 11:23:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A405E60B51
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BE49B1BF2C0
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 11:23:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9087240578
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 11:23:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9087240578
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BJq-6GQ_3eEZ for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 11:23:54 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3D3D340569
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 11:23:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D3D340569
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40d5f402571so5058835e9.0
 for <buildroot@buildroot.org>; Sat, 06 Jan 2024 03:23:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704540231; x=1705145031;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UzUn0NEVPqZDArMwSVvX2lSCxhaq6yfHbBmy3yYz1oo=;
 b=SMX+V9D486r+5Aud2BPHzjKMZLpRx8QCO+lkPtSjsXMlKDD80f5IOTwzj6vLDQOUZy
 GyAHW+ERlGYuvV8puR2v6u54JmlekaKiZD/nwgWMa9spXKnboLMDWYslMtB7mnVsrMia
 Z7GrmcMfjl3fxD0kNZPoB7XUhmtNo7KAWS6K854gL6LfTF9yMzQg4OZ7FuPYSNyZHlzK
 ucl8Lmf/eCZEDkhxe7ZuPvzzWd8O0jzDSfJkY41CpyIPPzLALGc1k7QQ1o+xNsAgXRP0
 kUhLdFYxwj5xnbbwiVzlaGL0ifcMSZudGciZeW0AASqqbPS+69Ou/MPvcOqpW9+7UjfA
 xNhg==
X-Gm-Message-State: AOJu0Yw220UGO6UywfswWBQRxbDUdrwvoc6COTTvBo3Ukrm5AogGTXDF
 xrYzXdDwEvyVC9EA+BBYtuHzlmB70UE=
X-Google-Smtp-Source: AGHT+IFWIHdKmLNyaUe1KiMz2uuoirYzp83RV3GXFEl5AAsyXlAULCOYGlr72uO+18/YoX+uE8YXFQ==
X-Received: by 2002:a05:600c:a05:b0:40d:51ce:16b4 with SMTP id
 z5-20020a05600c0a0500b0040d51ce16b4mr402977wmp.178.1704540231279; 
 Sat, 06 Jan 2024 03:23:51 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 bg40-20020a05600c3ca800b0040d83ab2ecdsm4368580wmb.21.2024.01.06.03.23.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jan 2024 03:23:50 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  6 Jan 2024 12:23:43 +0100
Message-ID: <20240106112343.610484-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704540231; x=1705145031; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UzUn0NEVPqZDArMwSVvX2lSCxhaq6yfHbBmy3yYz1oo=;
 b=RIWLBH8ecdwfnrTA4SfhULUdZc40vwXTgLQnBwsj1it1XIjWMu2hHtTx2PcvCKj2eJ
 5ViaGiACf1ww65bJg3+nMIY7wyVUxrThEMnjGY4ePB9+epHlRJJA3zJDO4tLjXb32la7
 JoZPtrZcM04M4XfXsbnMRtBt8agnxoW830iVP9+Y4QXqXLSg3WibcLc4XIYg1v6Wfp0N
 7rfk9ZzaKZFx3qrS4rrznwdBq+WmXf6WHiBk3lmbWZacXPx9nQBBcKFrX6gTIXTl3D4K
 suiL4dskOL8toLA149VFqWxXQiXHCdXs6SD3SK/5OEG1ve1DZ6tbrtv1bNulNMMT1Btb
 5h1w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RIWLBH8e
Subject: [Buildroot] [PATCH 1/1] support/dependencies/dependencies.sh:
 libopenssl needs perl Math::BigInt
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libopenssl needs perl Math::BigInt for s390x asm to avoid the following
build failure since commit a5cacb63082b9e58194c4b9f8b2af2c3e38ff15c:

Can't locate bigint.pm in @INC (you may need to install the bigint module) (@INC contains: /home/buildroot/autobuild/instance-0/output-1/build/libopenssl-3.2.0/crypto/poly1305/asm/../.. /home/buildroot/autobuild/instance-0/output-1/host/lib/perl /usr/local/lib64/perl5/5.36 /usr/local/share/perl5/5.36 /usr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl /usr/lib64/perl5 /usr/share/perl5) at /home/buildroot/autobuild/instance-0/output-1/build/libopenssl-3.2.0/crypto/poly1305/asm/../../perlasm/s390x.pm line 16.
BEGIN failed--compilation aborted at /home/buildroot/autobuild/instance-0/output-1/build/libopenssl-3.2.0/crypto/poly1305/asm/../../perlasm/s390x.pm line 16.

Fixes:
 - http://autobuild.buildroot.org/results/986cb07d368c7214ffbc9d60c378e7ac00797f00

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 support/dependencies/dependencies.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 6e7d067ccd..3d83cb3285 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -282,6 +282,10 @@ required_perl_modules="$required_perl_modules Thread::Queue" # Used by host-auto
 required_perl_modules="$required_perl_modules FindBin" # Used by (host-)libopenssl
 required_perl_modules="$required_perl_modules IPC::Cmd" # Used by (host-)libopenssl
 
+if grep -q ^BR2_PACKAGE_LIBOPENSSL=y $BR2_CONFIG && grep -q ^BR2_s390x=y $BR2_CONFIG ; then
+    required_perl_modules="$required_perl_modules Math::BigInt"
+fi
+
 if grep -q ^BR2_PACKAGE_MOSH=y $BR2_CONFIG ; then
     required_perl_modules="$required_perl_modules diagnostics"
 fi
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
