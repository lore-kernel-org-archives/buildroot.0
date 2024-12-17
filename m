Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24607E77187
	for <buildroot@archiver.kernel.org>; Tue, 17 Dec 2024 18:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0CF58433E;
	Tue, 17 Dec 2024 18:44:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N4xEcvtrKFgL; Tue, 17 Dec 2024 18:44:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 057E384445
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 057E384445;
	Tue, 17 Dec 2024 18:44:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6079DCE
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 18:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 414EA4094A
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 18:44:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sca7pEAsOERh for <buildroot@buildroot.org>;
 Tue, 17 Dec 2024 18:44:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C99B408E6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C99B408E6
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 18:44:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 52FE687191; Tue, 17 Dec 2024 18:44:07 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 17 Dec 2024 19:16:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d427d27aeeaec4ff52e948fdc7d4be3ce0c9e2bb
X-Git-Newrev: f515f2e7a009f9a12b7be65662bf2d61b914d735
X-Patchwork-Hint: ignore
Message-Id: <20241217184407.52FE687191@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/arm/fvp-ebbr: add TF-A hash
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2735552264634496277=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2735552264634496277==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=f515f2e7a009f9a12b7be65662bf2d61b914d735
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We have no more hash file for TF-A v2.11 in the package directory since
commit 24615d1502e2 ("boot/arm-trusted-firmware: bump to v2.12"); add
one in our global patches directory.

This fixes the following warning:

  WARNING: no hash file for arm-trusted-firmware-v2.11-git4.tar.gz

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../arm/fvp-ebbr/patches/arm-trusted-firmware/arm-trusted-firmware.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/arm/fvp-ebbr/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/arm/fvp-ebbr/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..8b77e1f165
--- /dev/null
+++ b/board/arm/fvp-ebbr/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  c0f23ccc71c49989e9ad238acf334473c17b7c88f79a20c829c3d443e3794a22  arm-trusted-firmware-v2.11-git4.tar.gz

--===============2735552264634496277==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2735552264634496277==--
