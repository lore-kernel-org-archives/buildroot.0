Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 059E7CED274
	for <buildroot@archiver.kernel.org>; Tue,  8 Oct 2024 07:33:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75CF1402EE;
	Tue,  8 Oct 2024 07:33:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S9qJzx_PjB8c; Tue,  8 Oct 2024 07:33:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29BD7401A2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29BD7401A2;
	Tue,  8 Oct 2024 07:33:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CF12F1BF2FA
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 07:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE81680DA3
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 07:33:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jwsxOTGOEo8D for <buildroot@lists.busybox.net>;
 Tue,  8 Oct 2024 07:33:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C971880CF2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C971880CF2
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C971880CF2
 for <buildroot@buildroot.org>; Tue,  8 Oct 2024 07:33:11 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a9953d3b2cdso20833066b.3
 for <buildroot@buildroot.org>; Tue, 08 Oct 2024 00:33:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728372789; x=1728977589;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GaGHoHf8TzEmsGKYxmsKbej4HvzLy3QguhbNIZ8AOJM=;
 b=nFQyzwAKvtmQb3187XvR2Gi+LqFGUiHH5h4BqPoJNbp3HTyQ1dJ9YwmXNb3qrWZ9vF
 WfMsU1rZMykIrMgVcjMYlPeA39YLTOXu0fbLgJHdjkc6KvgfA0hLDXFqMidSzvNc/IGy
 cpoNWjoH0aiQax49yyriUAv5NUu/wxtxrIWCA0o8iv4WsAT6M6XZo3btA4HR0TRRz0Fd
 GBff46IP0it1sHFj4qLzP2oaLXJiicdZbU2AMhFI0+9SVda0Cl1w4v8kRl+/tmUZSqJc
 yI4kZfZv/0CQTSU/KbhPfDQ/hFqVu7zYegVQ+/suPAOvf8bFH1ZsMjTto7LY6tLKeI7O
 eIWA==
X-Gm-Message-State: AOJu0YxxiJrzFsGDvEe7Qk1pcbn267i4p66b7HQ1WPFDEeY1zflTnggS
 RkWL+USIgf29bfPme9b4bQvUOIzrQt1zWB4qZDNaT2R0l0rWZ24v3K11WNBU0T1tPjBfmpemnvK
 k2YbjFQ==
X-Google-Smtp-Source: AGHT+IE6airUbDxIx6TowW/Lk/WAaR8UA/Eh/NP8zGhxu9erXHGc/njwxhxEdPlsjr2tYKJfPduykw==
X-Received: by 2002:a17:907:7d9e:b0:a8a:9054:83b5 with SMTP id
 a640c23a62f3a-a991bce2f06mr610876566b.3.1728372788933; 
 Tue, 08 Oct 2024 00:33:08 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:e642:fe3c:c003:b424])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9950ef9f45sm260559866b.37.2024.10.08.00.33.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2024 00:33:08 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  8 Oct 2024 09:33:00 +0200
Message-ID: <20241008073301.125344-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1728372789; x=1728977589;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GaGHoHf8TzEmsGKYxmsKbej4HvzLy3QguhbNIZ8AOJM=;
 b=QWQzzDeNZsmZVn7WSOtktkHiTGhzZ4kKtS00Ge2OMi0r79Giuz8ety1UN+l6wF/uaL
 NoOjbk6boNw904jWRhcgXkXdMBrJnuTenERP+MeOhJRUrVNefSGF/LDPLbfiZ5DpNhQS
 7mjqopscwWqFNb12bemRQF7/6A++x4V4C/3/0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=QWQzzDeN
Subject: [Buildroot] [PATCH v2 1/2] board/mender/x86_64: clean up post build
 and image scripts
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Use function_name() {} instead of function function_name {}
- Use consistent double newlines between methods.
- Un-indent the comment aboe the mender_fixup method.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 board/mender/x86_64/post-build.sh     | 11 +++++++----
 board/mender/x86_64/post-image-efi.sh | 12 +++++++-----
 2 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/board/mender/x86_64/post-build.sh b/board/mender/x86_64/post-build.sh
index 23d1120d45..254b0a21fd 100755
--- a/board/mender/x86_64/post-build.sh
+++ b/board/mender/x86_64/post-build.sh
@@ -3,7 +3,8 @@ set -e
 DEVICE_TYPE="buildroot-x86_64"
 ARTIFACT_NAME="1.0"
 
-function parse_args {
+
+parse_args() {
     local o O opts
     o='a:o:d:'
     O='artifact-name:,data-part-size:,device-type:'
@@ -28,8 +29,9 @@ function parse_args {
     done
 }
 
-  # Create a persistent directory to mount the data partition at.
-function mender_fixup {
+
+# Create a persistent directory to mount the data partition at.
+mender_fixup() {
     pushd "${TARGET_DIR}"
     if [[ -L var/lib/mender ]]; then
         rm var/lib/mender
@@ -44,7 +46,8 @@ function mender_fixup {
     popd
 }
 
-function main {
+
+main() {
     parse_args "${@}"
     mender_fixup
     echo "device_type=${DEVICE_TYPE}" > "${TARGET_DIR}/etc/mender/device_type"
diff --git a/board/mender/x86_64/post-image-efi.sh b/board/mender/x86_64/post-image-efi.sh
index 97b9e06d21..c7c848e453 100755
--- a/board/mender/x86_64/post-image-efi.sh
+++ b/board/mender/x86_64/post-image-efi.sh
@@ -7,7 +7,7 @@ ARTIFACT_NAME="1.0"
 
 
 # Parse arguments.
-function parse_args {
+parse_args() {
     local o O opts
     o='a:o:d:'
     O='artifact-name:,data-part-size:,device-type:'
@@ -31,8 +31,9 @@ function parse_args {
     done
 }
 
+
 # Create the data partition
-function make_data_partition {
+make_data_partition() {
     "${HOST_DIR}/sbin/mkfs.ext4" \
         -F \
         -r 1 \
@@ -44,7 +45,7 @@ function make_data_partition {
 
 
 # Create a mender image.
-function generate_mender_image {
+generate_mender_image() {
     echo "Creating ${BINARIES_DIR}/${DEVICE_TYPE}-${ARTIFACT_NAME}.mender"
     "${HOST_DIR}/bin/mender-artifact" \
         --compression lzma \
@@ -56,12 +57,13 @@ function generate_mender_image {
 }
 
 
-function generate_image {
+generate_image() {
     sh support/scripts/genimage.sh -c "${BOARD_DIR}/genimage-efi.cfg"
 }
 
+
 # Main function.
-function main {
+main() {
     parse_args "${@}"
     make_data_partition
     generate_image
-- 
2.46.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
