Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CC1CF11F4
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 13:34:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83CA940FEE;
	Thu, 10 Oct 2024 13:34:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fYV0Vcxox7Z3; Thu, 10 Oct 2024 13:34:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4507140FE8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4507140FE8;
	Thu, 10 Oct 2024 13:34:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 01DA51BF427
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 13:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5054608EC
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 13:34:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LW3mSNFkV6ae for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 13:34:40 +0000 (UTC)
X-Greylist: delayed 305 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 10 Oct 2024 13:34:39 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8E7B260B21
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E7B260B21
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8E7B260B21
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 13:34:39 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.112.249]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N17UQ-1tzyCH1FFK-016ZDN; Thu, 10
 Oct 2024 15:29:31 +0200
To: buildroot@buildroot.org
Date: Thu, 10 Oct 2024 15:29:12 +0200
Message-ID: <20241010132912.3061663-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241010132912.3061663-1-fiona.klute@gmx.de>
References: <20241010132912.3061663-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:MHUTZouvJk/2jhee++ZAqS4s2FovBA/Y0x1k/JfMfsM/S8AcKdE
 A+TrzyHpoM4xahSMYYGP838LtWUe6hhORVDd13vD9bNxe5HAguaGE2NLx1QXuzrcVDmYWGS
 E78ELxzeqjnA3Cww/hd7FmqwGanGzWnlJsWGaxoyMYxGlULHHhEIoSsUEPcLFN9ONddgGQa
 UJwq88lTA1vb3MIF00pPA==
UI-OutboundReport: notjunk:1;M01:P0:YbTBrOgSxYo=;EHvCZmzQk3WD1NAAtb7fUmDIzsn
 /qDlXfV2wAjZLVjJgUoEfho1RoSwOmuniw42Wo9eOeJbL/ms786959DvsQYvWXZkKyEbXcD5b
 kYudlD5ke60eC8vN0ZCabslEWSGW4H+PgK4o86JdD/oFQFBPCgyKEj++2PIH5pfic16iTQ7hQ
 vR3SAgqWZDDrKNxU936APQXAV4ubwzd0uMxEUzHmkkW190wiBAdDaJC9X94Ep4LLLKC81S1cI
 wNLWM/ZEifztYJxGLBUyipyJ8fHtolP+sPicIHEbF98XL66GCPJ1Q0SMC4LOkNhgMvR1Vub3p
 fZLG7sFQq4gTDPl/N0zRR1Ldy0uwHW5TRuJIBopPdWJoqauTSDmag2CLqxyfesXb1te3I1M1l
 I7ZDJbA0FboUaUymVvlm2ZmMYfRdTew7INb4FhxVq8QxaAIQ5IntH1sVGcX9e08mOGRIzkQXq
 htUsA3LsRossDhyYZfY4esayvwcroEcojwOxvXovyM8lssl32tG6lt/I5BVYp4zl1CM/mLDS5
 dilFEkAEeEKtN/Ymg/gqoMor/XmEpgBmOU4czB81wfLHvhqrzfOuXesjtTxzVdU8fdl6hOkMt
 U1HuVt1Ae0lHgMecQlA6vzOHnMZljA8n9IKm3GAfrm8+o3b5lL7Kk56gVuhf/0pZsvdmxMUfx
 BUTAAWj2VrnzWffxPf1Gf4/1VgTctWKpB8/Eo0qK14vu8vhRFDwAZ2T82noy/lvIE5LzncaZ6
 xBYkqJ82nRNiUz3NcCqTpiRZ/5eAT4dm9iLcsiDSMUAiqaa1jmmDYvM40AWwkzd2Da4uFyL2N
 0R20nHFf2VjDVEmAEoVW+LOg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1728567277; x=1729172077; i=fiona.klute@gmx.de;
 bh=mRnBNSWa1KEPLuTRp9BZvMMwsV9bukA7kh1yRsezF8g=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ZAKt/PsQf8Rm231YsFn6xkNX0rCcX0lSqfkxFDfzOdFsRxXJeZqxzdOZHik6q133
 W7wvheqYfahGR6+5LYQX2xfxIA1hJ6wbOUD4MLh5BS+iYunJBpNdn+4tH3YZPl2E8
 fjhqV8lhsNNp5x3s8FqqgkKNvz92eIvMOesAbxFznOFLWglALJhU/3RDbNKROf77A
 CSpJ9+9bIKPYi5TR8w7MLsPO/3H0mZDVrwQ0/jzVQJJGI1nyq99NKxTK/QaooZufb
 XPx5lc9BYWxat1W7gMlhW4SK03xAsWegqGED+Zij4iThTXP9TXH5ncxJeB63giN3r
 PoRar7LfCarSREJZoQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=ZAKt/PsQ
Subject: [Buildroot] [PATCH 2/2] package/docker-engine: add optional
 dependency on tini
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>,
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

To provide an init process for containers if requested e.g. with
"docker run --init", Docker relies on tini to provide the init
binary. package/tini already provides the required
/usr/libexec/docker/docker-init symlink, the new option just selects
tini if enabled to prevent confusion over why docker-init is missing.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
Adding an option seems like the least invasive version to me. An
unconditional dependency would work too, I'd be surprised if anyone
using Docker on the target has an issue with the extra ~66KB. Or drop
the patch, being able to install tini (patch 1) is the critical
part. ;-)

 package/docker-engine/Config.in | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index 49a002a647..e03ecceeff 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -48,6 +48,17 @@ config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_VFS
 	help
 	  Build the vfs filesystem driver for Docker.

+config BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT
+	bool "support docker-init"
+	select BR2_PACKAGE_TINI # runtime
+	help
+	  Support providing a minimal init process for containers,
+	  using tini. Required to use "docker run --init".
+
+	  This does not change the Docker engine build, the
+	  docker-init symlink is provided by the tini package
+	  itself. This option only adds the dependency.
+
 endif

 comment "docker-engine needs a glibc or musl toolchain w/ threads, headers >= 3.17"
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
