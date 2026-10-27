Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A8D606A338
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 16:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=XCF+f/ct;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=UrGvQ0uO
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4ED040534;
	Tue, 27 Oct 2026 16:40:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2T2iYPMtkgeT; Tue, 27 Oct 2026 16:40:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C6CDA40758
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793119238;
	b=ZuYS76oEKVMDrA2ffoeMpcbxWAe76G/RDJc8s7rCrQ1jkIU6yed4Nm1OqaHtjTprEcUV
	 6t5M+3GibdsnlVWSErO0f2fqydzdLz4blQeNPwk3RO5YEnoDv0s+Mbc3zqTI0h88kxCfy
	 PRLM/LcuenccHqSlzKFtg+j9PWu/Q7AqBotLdhsHrtcBDqFZPrQSJ9rPSih76EhKQxUvp
	 O7qFUy2mkUHA2TfiIbElNB9qN0mOeTEa9lXH77rAltngMgohuTu/681yOFj6w3j6AKd3r
	 tN0bOzmbpE6d5g5jI/PyrFdbi9A06qy4Y/yJTBjpoWJrkiGrFWf1m79do4nwDhLGHlA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793119238;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=fKOZdm3Ozr8sn+HyWREP9c2YvuQhoxd8mwwL99nT6wE=;
	b=b81eEKXv5LvpglrPxA7emL8q0my5vbNSeXuUd+R2d8AG4YJTiaKh3wbqKVerd43yXDCe
	 HnOxL6U6YjbjD+g4GjWnsvaeXGyozN/EYevwYkVfOUCZ9k+el5rJ79CDC5b36O3eGPWAO
	 WmIYhgfg3IINB0FEwOLqTAYlh7V9tAlq6vOQ4E8FNX6m5sLi8C9hNHdNBgMJKnIGWrOSc
	 GeHN/yKe31cLvvzfMrPhIyZKvBzAuvLrR+Hx0vuhrB89unGBk2mwpQwJT9uUZMTPAjjBX
	 Q7uyiSkn7e63Fyb1AOKCueo0PlbBU0ZkqoXZi6p5WBXlax1EPvAbFKX2QlXduhMqNEQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=pass header.from=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=UrGvQ0uO;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793119238;
	bh=fKOZdm3Ozr8sn+HyWREP9c2YvuQhoxd8mwwL99nT6wE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=XCF+f/ctsf9AGk3yxw7k89b7xhtI1EQXpD/7GUe4sNKTRD32dgdbS76WHIlDMLWya
	 vnwiCLKSqJRW8S/W2AXJlqMriCqzzYQrqIWfsGJGtH3d5E30qy+xS7r7xYBRGI28U7
	 eSCmXyKH7qZ++bd6LKVLEpZXIj4J9nH8+ysgUjqcLyxkLCyQ7Una6p7qqKAHkXC6E+
	 Mc846y/bCq5frYrrJDCtMUIl8Zw4MaTon/E+ZCLDQei2d3DHQBpG/lpf2Dhk/BdvoR
	 AhYTmYBRzPXqbEWPl4BIjwbKVEKMckisf+ktZOxNXfmJDWmX5AAtdgp4eZhQraqcjD
	 RNxucnJk/qmkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6CDA40758;
	Tue, 27 Oct 2026 16:40:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 330A64BC
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 305B440728
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:40:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DDOuLAsGhRsT for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 16:40:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1E4A040534
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::530"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793119225;
 b=sfGzifIwbB4NIsIlllfCDinB9p42OIOqDu/fUBuuEHyIwsbUxRvSoIwLvJ3sG+seeOyY
 qaVMnS6gfjqat9r9WkoN2maahEoUAl4XQ1QMkMP48SQUQmocp1X5obKrW4P8KfEQJjiLJ
 JcmuYRFoPS6K3eM0sqjnHObzX6glYUVwfDRXtNbhDVC3rfTzhWIQw47yVviELLBIKOQ4S
 gKVh6qUs10e0906xQmDJF28YnTFpujBh8TSOj0EZo3JZ1r9OPQAEBAdH9iGURqMPm9CnX
 DKFNv1ai4EiOTCAZUrx+4JtHlwvxl0X1aztytKVGqaamBPQdB/v1Y29uLcodN2XF7Dg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793119225;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=D2k0tjr1hqRWebb5SqzDMqzNx/M1cdE5KchR7Bfz5Yk=;
 b=s/48AgUIEbDz6akFXesnv1n1BazHkeB5biDSXJ/n6vmZuDtrj8y1WhAQQw/CbAvYcgHu
 nU0KjWfoJoep4Iht/5M/CCjG+c0Qch8PpVbRASsJI1XAvSBgrcRy1Oj0vnVgCZTfz2E/Q
 SzJyPzeWZi8R+rMDR2HRQ5tQXZBewVEMAap6zDTEjvXRmDVLw3w4Xw3sbzSIUpfbzksv3
 Pajoe8xPlUHnfqA1AH0X8XzqyMKYsOi65PhKbo1VHPvkP8aBTdBL5ppiCIgxyytk77lqk
 K0iHOINlI0zd+X3n5Lg4peaIBhWOHXplp7z1BVMyLnKbsxy9AX8LIy9xJYDJzGYBoGQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=amarulasolutions.com;
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=UrGvQ0uO; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::530"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=UrGvQ0uO
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1E4A040534
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:40:24 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-6aff2e5b322so16474a12.0
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 09:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1793119223; x=1793724023;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=D2k0tjr1hqRWebb5SqzDMqzNx/M1cdE5KchR7Bfz5Yk=;
 b=UrGvQ0uOJLPXgCyScbkP+BcqYM3gATUbvlogWHvzqSF16ZKdHix/hK1pbmZbzjwBu5
 nv6aSJENjN+Z2JQ9sAALIvQd40n9Tx0zhKKRLj/syt0FlRTnZMdU6YBojbNk8WJKgzJy
 kBBvblp3UqIujLFvqtbk7Q+nDJADeSZOrFJVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793119223; x=1793724023;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=D2k0tjr1hqRWebb5SqzDMqzNx/M1cdE5KchR7Bfz5Yk=;
 b=XhefyKH89BC5Dpff47XjiWNaKUOYUEeeEEf4fgyNeHjWjcPYEQmxP1PhioEidgY7eG
 ogW0d1AUbDFMGTTMOtRWztjI8VQ7taal5/tGc24zez1lYQn3DZ/I3/F93rPFSPwL8P+S
 H7obRHDeqQHj1hTMLHHs0HXGgC8umyqEj7AV2go8HeNwvwcP1ANzoxgmPA8aeb6B6s2k
 pmuG+GTZ3f3K3KSm0+NvtOnUX0Lo6ckD18nJGbS6JA7hM+sgRAJNCw76zUWLv5j0R+7q
 SN8Jt48G4DIdUL1ujni1ESoYrTOFJZ00JIVevAOlyXes49ZJyJg+CVw2C0qHm1+xTl8U
 nLwQ==
X-Gm-Message-State: AFq9FYKDirIHJ99fZ4Bkxsz96GfACLv9YiLy7g8A5GG5kjhVwyUOgAKw
 pup7GYSXGlE2/9lNhinL3Q6w069vkRbrJY1ug1Cd/sqVjiLMh/Iq0SC7A+ia8iFiXmioJ25dgU8
 fa1x30CY=
X-Gm-Gg: AYBFou0P5WwxB10+mhdR9e7bLpC14i6y5XUXD1Eq1LN2tc4wOmC23aDXCso5KXKAnFD
 63q0wsb0qudIexoJUPR9IJ1Y/W8DrYlkxWXJM6ASBTGs5L7Fw09QakirzCU2Lef3Zt1/JbC0YN7
 3KNwzY2DnqHGzaxwttzr3lbSetgVD51aPFAh+Gal9f4SMJlRnjncOlfbO/3x6up4wtgqeE8nDzV
 0ON470J1YnZ3C+8KSRk6iXTpc3/GyQ1CpaIxSzh4xVI9aApg2S+HA+SaZOa5S/Z3gNsTCnbjRGt
 2MwBmEshkbBSXXaE3jyMqdbUmsi4Lr+QYmHJowKri614b8KURllnNVaGWhErGTDUuWLal6aU0V9
 wnWCks8jEXizL37+/tKuk1WLnLqkIqt0qaiFxYm4tIdb95904yI0H2we5G/LdAslG9Mzp0GX0Y7
 GRJRhiAr5hNGZgwXsdYpEzpaZDdf+Xtp9wzLfV2VQiOQqdoFLO+LCB1Z1k0zxbRLoNwy1Daqsfz
 M5mbwS9rXe4MROrnGN+83BEygXMRWwHDhPG4Vk986YvwQidG8X6uWt1xN7QDRAKRukBfmB2JFVI
 yNUGwrHNBQirAbnXNJGHOioAQhlGWp/ZY9Db5wQ06Bu1wR3yIP7NQSsx3gZBNmhzwmytyDeUKXh
 kGiqXVokgelYuNBrqqua46UD8pWrrIAHr4FAPFGBTW5M+FST3pS6tVlk7NSeyXWw=
X-Received: by 2002:a17:907:170f:b0:c46:ae89:cd3c with SMTP id
 a640c23a62f3a-c46bda51372mr1119743466b.1.1793119222773; 
 Tue, 27 Oct 2026 09:40:22 -0700 (PDT)
Received: from adam-linux.amarulasolutions.com
 (2001-1c00-8181-e800-030c-182b-b2a8-e89d.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8181:e800:30c:182b:b2a8:e89d])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd79683csm479171966b.69.2026.10.27.09.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 09:40:22 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 27 Oct 2026 17:40:06 +0100
Message-ID: <20261027164013.1602502-9-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027164013.1602502-1-adam.duskett@amarulasolutions.com>
References: <20261027164013.1602502-1-adam.duskett@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 09/14] board/mender: change device type to
 compatible-types
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Newer versions of mender-artifact echo deprecation warnings when using
the --device-type argument and tell users to use --compatible-types.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 board/mender/x86_64/post-build.sh              | 12 ++++++------
 board/mender/x86_64/post-image-efi.sh          | 18 +++++++++---------
 configs/mender_x86_64_efi_defconfig            |  2 +-
 .../tests/package/test_mender/post-build.sh    |  6 +++---
 4 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/board/mender/x86_64/post-build.sh b/board/mender/x86_64/post-build.sh
index 9e909e9281..3989b58b42 100755
--- a/board/mender/x86_64/post-build.sh
+++ b/board/mender/x86_64/post-build.sh
@@ -1,11 +1,11 @@
 #!/usr/bin/env bash
 set -e
-DEVICE_TYPE="buildroot-x86_64"
+COMPATIBLE_TYPES="buildroot-x86_64"
 
 parse_args() {
     local o O opts
-    o='a:o:d:'
-    O='artifact-name:,data-part-size:,device-type:'
+    o='a:o:c:'
+    O='artifact-name:,data-part-size:,compatible-types:'
     opts="$(getopt -o "${o}" -l "${O}" -- "${@}")"
     eval set -- "${opts}"
     while [ ${#} -gt 0 ]; do
@@ -14,8 +14,8 @@ parse_args() {
             # Ignored to have same options as other scripts
             shift 2
             ;;
-        (-d|--device-type)
-            DEVICE_TYPE="${2}"; shift 2
+        (-c|--compatible-types)
+            COMPATIBLE_TYPES="${2}"; shift 2
             ;;
         (-a|--artifact-name)
             # Ignored to have same options as other scripts
@@ -42,7 +42,7 @@ mender_fixup() {
 main() {
     parse_args "${@}"
     mender_fixup
-    echo "device_type=${DEVICE_TYPE}" > "${TARGET_DIR}/etc/mender/device_type"
+    echo "device_type=${COMPATIBLE_TYPES}" > "${TARGET_DIR}/etc/mender/device_type"
 }
 
 main "${@}"
diff --git a/board/mender/x86_64/post-image-efi.sh b/board/mender/x86_64/post-image-efi.sh
index a3e262f8fe..a1dccb25b3 100755
--- a/board/mender/x86_64/post-image-efi.sh
+++ b/board/mender/x86_64/post-image-efi.sh
@@ -3,14 +3,14 @@ set -e
 BOARD_DIR="$(realpath "$(dirname "$0")")"
 DATA_PART="${BINARIES_DIR}"/data-part
 DATA_PART_SIZE="32M"
-DEVICE_TYPE="buildroot-x86_64"
+COMPATIBLE_TYPES="buildroot-x86_64"
 ARTIFACT_NAME="1.0"
 
 # Parse arguments.
 parse_args() {
     local o O opts
-    o='a:o:d:'
-    O='artifact-name:,data-part-size:,device-type:'
+    o='a:o:c:'
+    O='artifact-name:,data-part-size:,compatible-types:'
     opts="$(getopt -o "${o}" -l "${O}" -- "${@}")"
     eval set -- "${opts}"
     while [ ${#} -gt 0 ]; do
@@ -18,8 +18,8 @@ parse_args() {
         (-o|--data-part-size)
             DATA_PART_SIZE="${2}"; shift 2
             ;;
-        (-d|--device-type)
-            DEVICE_TYPE="${2}"; shift 2
+        (-c|--compatible-types)
+            COMPATIBLE_TYPES="${2}"; shift 2
             ;;
         (-a|--artifact-name)
             ARTIFACT_NAME="${2}"; shift 2
@@ -55,7 +55,7 @@ generate_mender_bootstrap_artifact() {
     write bootstrap-artifact \
     --compression none \
     --artifact-name "${ARTIFACT_NAME}" \
-    --device-type "${DEVICE_TYPE}" \
+    --compatible-types "${COMPATIBLE_TYPES}" \
     --provides "rootfs-image.version:${ARTIFACT_NAME}" \
     --provides "rootfs-image.checksum:${img_checksum}" \
     --clears-provides "rootfs-image.*" \
@@ -65,14 +65,14 @@ generate_mender_bootstrap_artifact() {
 
 # Create a mender image.
 generate_mender_image() {
-    echo "Creating ${BINARIES_DIR}/${DEVICE_TYPE}-${ARTIFACT_NAME}.mender"
+    echo "Creating ${BINARIES_DIR}/${COMPATIBLE_TYPES}-${ARTIFACT_NAME}.mender"
     "${HOST_DIR}/bin/mender-artifact" \
         write rootfs-image \
         --compression none \
-        -t "${DEVICE_TYPE}" \
+        -c "${COMPATIBLE_TYPES}" \
         -n "${BR2_VERSION}" \
         -f "${BINARIES_DIR}/rootfs.ext2" \
-        -o "${BINARIES_DIR}/${DEVICE_TYPE}-${ARTIFACT_NAME}.mender"
+        -o "${BINARIES_DIR}/${COMPATIBLE_TYPES}-${ARTIFACT_NAME}.mender"
 }
 
 generate_image() {
diff --git a/configs/mender_x86_64_efi_defconfig b/configs/mender_x86_64_efi_defconfig
index 619122f5c9..f10a461770 100644
--- a/configs/mender_x86_64_efi_defconfig
+++ b/configs/mender_x86_64_efi_defconfig
@@ -6,7 +6,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_ROOTFS_OVERLAY="board/mender/x86_64/overlay"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/mender/x86_64/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/mender/x86_64/post-image-efi.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="--data-part-size=32M --device-type=buildroot-x86_64 --artifact-name=1.0"
+BR2_ROOTFS_POST_SCRIPT_ARGS="--data-part-size=32M --compatible-types=buildroot-x86_64 --artifact-name=1.0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.59"
diff --git a/support/testing/tests/package/test_mender/post-build.sh b/support/testing/tests/package/test_mender/post-build.sh
index 1afa231082..76698fb7d9 100755
--- a/support/testing/tests/package/test_mender/post-build.sh
+++ b/support/testing/tests/package/test_mender/post-build.sh
@@ -1,13 +1,13 @@
 #!/usr/bin/env bash
 set -e
-DEVICE_TYPE="buildroot-arm"
+COMPATIBLE_TYPE="buildroot-arm"
 ARTIFACT_NAME="RUNTIME_TEST_ARTIFACT_NAME"
 
 generate_mender_bootstrap_artifact() {
   "${HOST_DIR}"/bin/mender-artifact \
     write bootstrap-artifact \
     --artifact-name "${ARTIFACT_NAME}" \
-    --device-type "${DEVICE_TYPE}" \
+    --compatible-types "${COMPATIBLE_TYPE}" \
     --provides "rootfs-image.version:${ARTIFACT_NAME}" \
     --clears-provides "rootfs-image.*" \
     --output-path "${TARGET_DIR}"/var/lib/mender/bootstrap.mender \
@@ -17,7 +17,7 @@ generate_mender_bootstrap_artifact() {
 function mender_fixup() {
   rm -rf "${TARGET_DIR}"/var/lib/mender
   mkdir -p "${TARGET_DIR}"/var/lib/mender
-  echo "device_type=${DEVICE_TYPE}" > "${TARGET_DIR}"/var/lib/mender/device_type
+  echo "device_type=${COMPATIBLE_TYPE}" > "${TARGET_DIR}"/var/lib/mender/device_type
 
 }
 
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
