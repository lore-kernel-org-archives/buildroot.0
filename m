Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F516C07E8F
	for <buildroot@archiver.kernel.org>; Mon, 22 Apr 2024 07:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD47B8176B;
	Mon, 22 Apr 2024 07:33:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MNujuP9Hf8ct; Mon, 22 Apr 2024 07:33:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA20781E16
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA20781E16;
	Mon, 22 Apr 2024 07:33:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 326A61BF2EC
 for <buildroot@lists.busybox.net>; Mon, 22 Apr 2024 07:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F20681E16
 for <buildroot@lists.busybox.net>; Mon, 22 Apr 2024 07:33:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NWi5c8ytXAgX for <buildroot@lists.busybox.net>;
 Mon, 22 Apr 2024 07:33:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E9F108176B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9F108176B
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E9F108176B
 for <buildroot@busybox.net>; Mon, 22 Apr 2024 07:33:30 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([212.114.183.37]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MvK4Z-1sq5Q62KlV-00rIB4 for <buildroot@busybox.net>; Mon, 22 Apr 2024
 09:33:27 +0200
To: buildroot@busybox.net
Date: Mon, 22 Apr 2024 09:33:27 +0200
Message-ID: <20240422073327.11948-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:3Jc7smZFZrrzYYSGED0je3xhUBpijS2fvwi4cceRp7cFMCuqhw0
 +ER5NsJmEyGLL8Xoi1nBEY6Shv996DA0IWV0PuaJpNTy7qDv9DnnkDGGp6Eds16NpqRzCU0
 etZUFH94NGn4x0d5JNRRLkQFMvt3OSm07iq18RFvqXgPKFHvuwJwvsS22sZGhQt+XAXheWx
 gGchhA42zD9o5EQumA9tg==
UI-OutboundReport: notjunk:1;M01:P0:uoJgPXL3fCY=;/kbXtJGFHEYq2P+m6aMD0YeDbtc
 SWVrzZt2IRMBB8uSB1jC7DcxlzOjQAgC/s+SEoXy1qDFURftVMxPd6Jy9Q2+IMvnjiDDFLdEm
 lm12kr8921Vn2qBB6KV/s2ezX3P72G9e1h1OnntR5yYswV4zDHRcRI6Cmx0wdHndq94sNuUfr
 vp/Hw2W70AI99cTbygEaZ1XxdmKMCDEj61EmVBvV4kedGF2ehT8s6mAglRawRNpVMq11OvSfS
 gIcVvvoIXlFQqQH0LXFste56VRNjCbuBxSjYAejtAI3JOaUf98Z98vunT+JeX72OeS7Egx4M4
 jQoRQ6g/7KbxUNEHWkb56FUG9du4971CrXgSYADEz3hwKTzkVpL96er8Ovb3W8fyWNCFS94ZV
 DIzCO349NdXFpWRvXlHThaMf9IVFyoR9Ae77oxfo4A0Njhui6lKQIbzFMMPRq7PFlWCwTGPHg
 mG+qpakp2DFNAv7jBcUMsMF8DaaQJvaqU7btafOpgb6N8Q+2KPSDHyfWzEtHLyIA5iqPCSxEo
 xCQi2fMP0Ispul3wtV25FehBZIWkdchv8Vy3KEn3tWe3XMP5UV8CJWoCz3yrcPKtwotI9mYvB
 CWJjzf563gPF969j6SZ7dVmTfl38lRXkuJ8oNArdsQzUYCBH7kOol/NIUuIUzEcobrlwTnCDb
 PedXU0CNPznQZ7UZFyhyCMU4XMghrYPAmqvzo/5W52A4xxjPQKAPRotSDbJ4mEeVUZUCvCA30
 qhEKYUbd+48NOWNI+eGGSbAetj2yhSiAMoMPhLWrm2bS0s3v1/nNYqNzSJxc4U8EQi6Q/mWae
 TbabhZkfX6ys7TuKaWmKP70k0R+ENR1tUIW6dWmkT8HsA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1713771207; x=1714376007; i=ps.report@gmx.net;
 bh=v9rOzeHKHZKe6pNiMn5BT4DQGjlEyFwgh/3X2HCuUHc=;
 h=X-UI-Sender-Class:From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=lDnrmnnnu23LEaD967zTRANrU7c0uUq6zE5u1y8kyKTMT/EQYTIQhjbtxunjgrfp
 FI4StJ7YMXv7TTGfeSPmhO5B61yIBtTcUrcPJ6fzkYDo6/8yVXNjK/Zc/0XbLKjwU
 5pSXzn6Jx+7WTYzZvsbSjqjcmL1yuu9WVUuUWOE5KhqG3IZkQIwMfGBuNDH5XfY3r
 ZMf6rrIUM2erUThxpj5NKCbnXewXefQi1dhVgipLZVF3fsmrrKbvCTeD8mrOn2CJG
 JckQc8Z2vfQyzy1m3YF9q+sH2fm/42EjZCuEAMI1omA9wm8hclKTR8ZAcPdN0j/h/
 MoAKCCZm5Bo9YL3XqA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=lDnrmnnn
Subject: [Buildroot] [PATCH v1] package/dotconf: bump version to 1.4.1
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/dotconf/dotconf.hash | 2 +-
 package/dotconf/dotconf.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dotconf/dotconf.hash b/package/dotconf/dotconf.hash
index 3233ea62c8..aa2ddc25bd 100644
--- a/package/dotconf/dotconf.hash
+++ b/package/dotconf/dotconf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7f1ecf40de1ad002a065a321582ed34f8c14242309c3547ad59710ae3c805653  dotconf-1.3.tar.gz
+sha256  5922c46cacf99b2ecc4853d28a2bda4a489292e73276e604bd9cba29dfca892d  dotconf-1.4.1.tar.gz
 sha256  a50cc98d5044a7bbddabe61fc0ec42aa671c73bf414d0c6b50da83ea8ae041c6  COPYING
diff --git a/package/dotconf/dotconf.mk b/package/dotconf/dotconf.mk
index 26e78b3c7a..7ad5c6aa74 100644
--- a/package/dotconf/dotconf.mk
+++ b/package/dotconf/dotconf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOTCONF_VERSION = 1.3
+DOTCONF_VERSION = 1.4.1
 DOTCONF_SITE = $(call github,williamh,dotconf,v$(DOTCONF_VERSION))
 DOTCONF_LICENSE = LGPL-2.1
 DOTCONF_LICENSE_FILES = COPYING
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
