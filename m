Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B6AE7717F
	for <buildroot@archiver.kernel.org>; Tue, 17 Dec 2024 18:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0F1F408E6;
	Tue, 17 Dec 2024 18:44:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YBYLj-4yGzoB; Tue, 17 Dec 2024 18:44:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E8424090C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E8424090C;
	Tue, 17 Dec 2024 18:44:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C67DCE
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 18:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2670C612D3
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 18:44:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pl1bw8PtH6cp for <buildroot@buildroot.org>;
 Tue, 17 Dec 2024 18:44:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7020F6119B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7020F6119B
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 18:44:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5D6778719C; Tue, 17 Dec 2024 18:44:07 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 17 Dec 2024 19:16:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f515f2e7a009f9a12b7be65662bf2d61b914d735
X-Git-Newrev: fdea0d10dc5f95f4dcf7884177a42f3662d55a8c
X-Patchwork-Hint: ignore
Message-Id: <20241217184407.5D6778719C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/pine64/rockpro64: add TF-A hash
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
Content-Type: multipart/mixed; boundary="===============7109264267078857907=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7109264267078857907==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=fdea0d10dc5f95f4dcf7884177a42f3662d55a8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We have no more hash file for TF-A v2.11 in the package directory since
commit 24615d1502e2 ("boot/arm-trusted-firmware: bump to v2.12"); add
one in our global patches directory.

This fixes the following warning:

  WARNING: no hash file for arm-trusted-firmware-v2.11-git4.tar.gz

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Suniel Mahesh <sunil@amarulasolutions.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../rockpro64/patches/arm-trusted-firmware/arm-trusted-firmware.hash    | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/pine64/rockpro64/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/pine64/rockpro64/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..8b77e1f165
--- /dev/null
+++ b/board/pine64/rockpro64/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  c0f23ccc71c49989e9ad238acf334473c17b7c88f79a20c829c3d443e3794a22  arm-trusted-firmware-v2.11-git4.tar.gz

--===============7109264267078857907==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7109264267078857907==--
