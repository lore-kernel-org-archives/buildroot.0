Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BFF606A80D
	for <buildroot@archiver.kernel.org>; Tue,  3 Nov 2026 10:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mhbGrPwN;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qqI3ulU+
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5033080D8B;
	Tue,  3 Nov 2026 10:52:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7uIKl0vtpNzq; Tue,  3 Nov 2026 10:52:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2CAF380DEE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793703155;
	b=m/J53WyhEsNeH5DfUBvoNbZDUwOozV/PqvgaRPNtlawjkWEW7Wb6Kity3ba5HdRRDJmO
	 jEvDNj5qqeMmFCjaHlEXHrFcqO9s4xEg3GXQZP5LQ7slMaIxNnAeWcEJ/i9RhQF1uQuLK
	 cghiC52U2DeJiSEZIoqJskuFG/0T0JwweOUKUqYla65BXUWs7XL3BpQEEWRYl9nBRPzeY
	 vUk1o6QWzuu2Yef3+6NbuSfn0Nt7tYx1ZmrcRofrPS3pTls/ms74utGeZPmnUsfY7xwzw
	 6yAkV2alHIsC2ncqd9zXognAFEgahafRfQLI8/Cd0i4AXxvtu7+QlD3VucGWHgzrCOw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793703155;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=ertwieKqv8JT+W82YlkeGa3DwwcUnpt9er4DEJvqtJY=;
	b=oMOHD88FYf6KLdFHmfdUIevdhsJuag4yVCUGjAmYchd2/c3cgTmITLsNUz8LYnlSQC5y
	 MhzQyrjFeRQbHKUurPraS7ffEdC3E7XltQvrqcYIR4JL8bQ4kog1T8zeVcp1pF+69sr3I
	 EIfXV/UyeAysNBTijU3YkdBOfyhZVJcPQQnWRhXgS9DMurAaT2KTKqCiTq7AoIjgANy2A
	 besCOugjgq9ky6D7a4udgVu7zIiLjm76lsMXd3xdT8hK7gar+kggAfDs48RWQJQrd7bOm
	 pWOJHfQ8DK+5xrvIzSgYlQ57xOg/Qs7bjmmFqvq/5sMfwK7p2Z7FLAudP1PuxBWsnQg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793703155;
	bh=ertwieKqv8JT+W82YlkeGa3DwwcUnpt9er4DEJvqtJY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mhbGrPwNwn5VLO1GWPk8jpI8DjRVZnV2TK0LIf0mF4XFH2jjs2RSk884D3Mjs0zBD
	 fybO4dovo/e1pKyf60opysw8Z/69hBaLlsW9lYVM6SyJJEYLWLyPCaQxpQxneS6si0
	 yjuhbNAd7BzmdwK/dDrRYssVr+dRx5lM4qgjgtI7rlZXnUnnQnuxZF/+UOSrev4qEL
	 XUJH6enhZ7pFhOjkhBYzObFUmM8CydffP7DOkgPGBYWpCvTsDk+DQ75dxTwqco6wdh
	 9Qkfr7R8EYckZZ2/ptX9V55pMc7t8snqIRgsq/bNpFk1/t1RrWeqwGi/cfnbBtQEIz
	 5RMWW81APcY8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CAF380DEE;
	Tue,  3 Nov 2026 10:52:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6008C356
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 10:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51EA8405B7
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 10:52:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iD9gAZ5SSBKy for <buildroot@buildroot.org>;
 Tue,  3 Nov 2026 10:52:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0BFE340575
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::436"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793703151;
 b=konOxK34Rogrk0eWEI7IPn94qWI/ptmSVT0c1MAKV52kbhW7hh7X2pR3/PhnQ/cFIt0z
 hFn/+hLrH1dXjITv5ApjMBBtXsDhuZGGMn1McsuufVYHOcRgLXY8rAc9eoGpGRiHLkZUJ
 5oOHXP+SVaoSWTyp8RPT93Txf9sH5Cm5TmKnC4oH7Tj4iYbrnZkhLmyqI2Z+ouUockTU/
 ai3lsyJ05ak8AqGtFGBVsheBs/pafwSqyGxHqg2l16fdisrSo7/k4Kf3r+aZIt8+/T6RB
 alx8egtMP7m9pf8q5Kz8xWRbpWi6rPV9wR5A3NMSx0mxlEZNG2N5PIA2w105kbYWi3w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793703151;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=2I77Xt/UTpQnCjaj2F//iPiPxvJ/jTjTzF6Co08WD9k=;
 b=YsHa3+Rzkp5aJO5ofAk7dWnxGW5YNP6/8IA0r+RcNcL5GxD9n86FYiLwUloICkZhUs3K
 oquWtXHS6efOZPKEppveLxz08HrEmVy1cCjwbr0qpDj49Yl52kKXSDYksEfo1b0b8IXKw
 GNdqRytRT2n9to/kADbQZoh2Lo9OzrtgN2/PXOlnL/6bx0zvcfIcrbCt1KO8GqHU2DwWp
 eX/jwGhaeTjCWZnLk4EwrYmQImhCrA60+OrbEZ3f0CXH/3R39xoU5h4A2g6yGU0akM6Zc
 tabX6OIFD/UhJOlA5RmdoaSZ/4EKoxtwKrL7mVOjOX6GiQt0kFyHNbVd/RkpbawcZ+Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=qqI3ulU+; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::436"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=qqI3ulU+
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0BFE340575
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 10:52:30 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-48b060ec084so2361214f8f.0
 for <buildroot@buildroot.org>; Tue, 03 Nov 2026 02:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793703148; x=1794307948; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2I77Xt/UTpQnCjaj2F//iPiPxvJ/jTjTzF6Co08WD9k=;
 b=qqI3ulU+EoAyo0HOh9NNoLRnESzTm4zOk+dkjbzVghZs0SWk5NCpS6Al842kZpA6pk
 wXRmPyZ4aUBhVEtX/dhKgvMT/rK9HrZse0UNQRwRb7Da/0YUVNkEjK5vvXYXWS3gYvuW
 eWMsw6nG4CogIwyj6T/wWMerqiyqt6nzQNaQAWuFBOi/VDLIu3YYXkf9LBO8qs9+Ctzp
 avJlBlxE8Eht34UA8vfjVYmJNrGOnf59CSGofpiw7EvpiWDE3lbhSj49am1lbJu0w8ZQ
 jtdIHpC/ibPlR6AVKFOFuYWnlm7qYNwxva3/SVm4icdLBin5ALiXlnTcloQjzyHO8+Am
 QhMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793703148; x=1794307948;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=2I77Xt/UTpQnCjaj2F//iPiPxvJ/jTjTzF6Co08WD9k=;
 b=PoeB1Ht3OPtCNqY7VDxaQmxJ2TvKjW4ZnV8G1HjCBsHr3wK6TGOgkx46ZuJV5yp0+z
 3g1FT008pIF9KGyA6cs5E6bccwR5ciQrN6bu0FEzJsOH0ZBQ+MWxy6yi04f8K/e9IceW
 eptIaGxNTpwrZAT0aodgMm2yJcZdlp5p4yQQwpbjtztywsNYNfWpidxBDf3VYBZHr0T0
 DWLdLJzYY4Frx5xR7Xy5OOW/ifsEFWUSCDM9rO6nQSmHTczcqjlIn8bowOu+mBH+OtGI
 OsgzEdOZk9cWjk7iDEMHsPz065tHC/PylwKP0OrOWHMw0ft7z1EmG0IIwMPIJs2GwmnE
 UTSw==
X-Gm-Message-State: APuU4Z/NsFp+6vZQrPh2wwAneaCG76j2ZQjRIBaZU843pV3CI+S2NECb
 ChDRzcObQHUqOpWwFRVDDzkhs3GSyTAWEdIneUa6qCyHIGSgDPj4gyFl2kva1g==
X-Gm-Gg: AYBFou3+cy8eI1A46pzT8u5BAJTK/Ygt3Q7VJhDC2RXCack9LrY5xE4nv3l7XeEtXb4
 0LEwNPK4ocdoa9CLwVydiJMMge0/xYG4jwlBE6utBZu1VdzM4TInUIqz2f2RZPxsUHZcDDeW31l
 EC5ytZjBivEnMoF5hyhHz5cuhv46rpuVS3OiWHMD068jSgU/Yn0kZ2+V5nTKRcOsRyDOMBfLpAA
 16B0ySjT46TMXCqm0eR5JU2QCJBPfaLm+lKnoeffLKflrBBS3V9F6yuk9Pr0nZimw8SQG4Q+B/f
 8eRe+mLCe6bJ8LJ2wAmfx9kW73fy+RTZtEmxuq45L4v0/xvS22gRbLBQoK6z8iNrUpyLQgOtukO
 9Fu2hGZTT/V30fHFyMjleHgxZfvZNywyWE4qSlbTwLOAiSS4zQEe4g48Yb0x1ZY5xn7OJt4Xruj
 7V7pKNhhFHMRRKOmCdMyuHsrBLubJ4kc/JTH/ileRLff7HLs/3s3ihGtjXGvaWTt3cvcGx4mvjr
 yJjgm/OjjxSCfYatmYDadaeNBqKAsrDmFeV/IYRbDEP+FNf+ps2IqIE2bdN5ioEJxVlJpdg6p3s
 j3ThWMKXWtgQAoR+8E6M21OBbXeQiXC5QgkCB3+1746IbK4kp+7wXA==
X-Received: by 2002:adf:e007:0:20b0:48d:fdd0:6ce8 with SMTP id
 ffacd0b85a97d-48e6e2bc847mr21650702f8f.3.1793703148396; 
 Tue, 03 Nov 2026 02:52:28 -0800 (PST)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e7a1d9d71sm18911099f8f.48.2026.11.03.02.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2026 02:52:27 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue,  3 Nov 2026 11:52:22 +0100
Message-Id: <20261103105224.1995953-2-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103105224.1995953-1-angelo.compagnucci@gmail.com>
References: <20261103105224.1995953-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/skeleton-init-common: add option to
 mount an overlayfs on /etc
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On a read-only root filesystem, only /var can be made writable, and
only with systemd. /etc cannot be mounted from /etc/fstab or from a
systemd unit, as the init system already needs it when it starts.

Add an option to mount an overlayfs on /etc, with its upper layer on a
persistent device, for the busybox, sysvinit and systemd init systems,
as done by the overlayfs-etc image feature of openembedded-core: the
init program is moved to /usr/libexec/overlayfs-etc/init, keeping its
name as busybox selects its applet from it, and a pre-init script,
adapted from openembedded-core, is installed as /sbin/init. It mounts
the persistent device, mounts the overlayfs on /etc, optionally exposes
the original /etc read-only, and then starts the original init.

This is done in skeleton-init-common, as the pre-init does not depend
on the init system, and overlayfs support is enabled in the kernel with
a package kernel config fixup, as done for the /var overlayfs.

The persistent device must exist and be formatted, which is left to
the integration. If it cannot be mounted, the system boots with the
read-only /etc.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 .../overlayfs-etc-preinit.sh                  | 39 ++++++++++++
 .../skeleton-init-common.mk                   | 63 +++++++++++++++++++
 system/Config.in                              | 62 ++++++++++++++++++
 3 files changed, 164 insertions(+)
 create mode 100644 package/skeleton-init-common/overlayfs-etc-preinit.sh

diff --git a/package/skeleton-init-common/overlayfs-etc-preinit.sh b/package/skeleton-init-common/overlayfs-etc-preinit.sh
new file mode 100644
index 0000000000..c97a2b5c14
--- /dev/null
+++ b/package/skeleton-init-common/overlayfs-etc-preinit.sh
@@ -0,0 +1,39 @@
+#!/bin/sh
+# BR2_ROOTFS_OVERLAYFS_ETC pre-init
+#
+# Mount an overlayfs on /etc, with its upper layer on a persistent
+# device, before starting the init system, which already needs /etc.
+#
+# Adapted from overlayfs-etc-preinit.sh.in from openembedded-core.
+
+PATH=/sbin:/bin:/usr/sbin:/usr/bin
+
+MOUNT_POINT="@MOUNT_POINT@"
+OVERLAY_DIR="${MOUNT_POINT}/overlay-etc"
+
+echo "overlayfs-etc: mounting @DEVICE@ on ${MOUNT_POINT}"
+
+mount -t proc proc /proc
+mount -t sysfs sysfs /sys
+
+if mount -n -t "@FSTYPE@" -o "@MOUNT_OPTIONS@" "@DEVICE@" "${MOUNT_POINT}"; then
+	mkdir -p "${OVERLAY_DIR}/upper" "${OVERLAY_DIR}/work"
+
+	if @EXPOSE_LOWER@; then
+		# Read-only access to the original /etc content
+		mkdir -p "${OVERLAY_DIR}/lower"
+		mount -n -o bind,ro /etc "${OVERLAY_DIR}/lower"
+	fi
+
+	mount -n -t overlay \
+		-o "lowerdir=/etc,upperdir=${OVERLAY_DIR}/upper,workdir=${OVERLAY_DIR}/work,index=off,xino=off,redirect_dir=off,metacopy=off" \
+		overlay-etc /etc ||
+		echo "overlayfs-etc: mounting the /etc overlay failed"
+else
+	echo "overlayfs-etc: mounting @DEVICE@ failed, /etc is not writable"
+fi
+
+umount /sys
+umount /proc
+
+exec @INIT@ "$@"
diff --git a/package/skeleton-init-common/skeleton-init-common.mk b/package/skeleton-init-common/skeleton-init-common.mk
index 299f2643b4..ce9d7a8c1f 100644
--- a/package/skeleton-init-common/skeleton-init-common.mk
+++ b/package/skeleton-init-common/skeleton-init-common.mk
@@ -104,4 +104,67 @@ endif
 endif
 SKELETON_INIT_COMMON_TARGET_FINALIZE_HOOKS += SKELETON_INIT_COMMON_SET_BIN_SH
 
+ifeq ($(BR2_ROOTFS_OVERLAYFS_ETC),y)
+SKELETON_INIT_COMMON_OVERLAYFS_ETC_DEVICE = $(call qstrip,$(BR2_ROOTFS_OVERLAYFS_ETC_DEVICE))
+SKELETON_INIT_COMMON_OVERLAYFS_ETC_FSTYPE = $(call qstrip,$(BR2_ROOTFS_OVERLAYFS_ETC_FSTYPE))
+SKELETON_INIT_COMMON_OVERLAYFS_ETC_MOUNT_OPTIONS = $(call qstrip,$(BR2_ROOTFS_OVERLAYFS_ETC_MOUNT_OPTIONS))
+SKELETON_INIT_COMMON_OVERLAYFS_ETC_MOUNT_POINT = $(call qstrip,$(BR2_ROOTFS_OVERLAYFS_ETC_MOUNT_POINT))
+
+ifeq ($(BR_BUILDING)$(BR2_ROOTFS_OVERLAYFS_ETC_DEVICE),y"")
+$(error BR2_ROOTFS_OVERLAYFS_ETC_DEVICE can't be empty)
+endif
+
+ifeq ($(BR_BUILDING)$(BR2_ROOTFS_OVERLAYFS_ETC_FSTYPE),y"")
+$(error BR2_ROOTFS_OVERLAYFS_ETC_FSTYPE can't be empty)
+endif
+
+ifeq ($(BR_BUILDING)$(BR2_ROOTFS_OVERLAYFS_ETC_MOUNT_POINT),y"")
+$(error BR2_ROOTFS_OVERLAYFS_ETC_MOUNT_POINT can't be empty)
+endif
+
+define SKELETON_INIT_COMMON_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_OVERLAY_FS)
+endef
+
+# /sbin/init is replaced by a pre-init mounting the /etc overlay, which
+# then starts the original init, moved to $(SKELETON_INIT_COMMON_OVERLAYFS_ETC_INIT).
+# The original init keeps the "init" name, as busybox selects its applet
+# from it. A relative symlink is turned into an absolute one, so that it
+# still points to the same file from its new location. The original
+# init is only moved when /sbin/init is not the pre-init yet, so that
+# this hook can run again on rebuilds.
+SKELETON_INIT_COMMON_OVERLAYFS_ETC_INIT = /usr/libexec/overlayfs-etc/init
+
+define SKELETON_INIT_COMMON_OVERLAYFS_ETC
+	mkdir -p $(TARGET_DIR)$(SKELETON_INIT_COMMON_OVERLAYFS_ETC_MOUNT_POINT)
+	if ! grep -qs '^# BR2_ROOTFS_OVERLAYFS_ETC pre-init$$' $(TARGET_DIR)/sbin/init; then \
+		mkdir -p $(dir $(TARGET_DIR)$(SKELETON_INIT_COMMON_OVERLAYFS_ETC_INIT)); \
+		rm -f $(TARGET_DIR)$(SKELETON_INIT_COMMON_OVERLAYFS_ETC_INIT); \
+		if [ -L $(TARGET_DIR)/sbin/init ]; then \
+			target="$$(readlink $(TARGET_DIR)/sbin/init)"; \
+			case "$${target}" in \
+			/*) ;; \
+			../*) target="/$${target#../}" ;; \
+			*) target="/sbin/$${target}" ;; \
+			esac; \
+			ln -s "$${target}" $(TARGET_DIR)$(SKELETON_INIT_COMMON_OVERLAYFS_ETC_INIT); \
+			rm -f $(TARGET_DIR)/sbin/init; \
+		else \
+			mv $(TARGET_DIR)/sbin/init $(TARGET_DIR)$(SKELETON_INIT_COMMON_OVERLAYFS_ETC_INIT); \
+		fi; \
+	fi
+	rm -f $(TARGET_DIR)/sbin/init
+	sed -e 's|@DEVICE@|$(SKELETON_INIT_COMMON_OVERLAYFS_ETC_DEVICE)|g' \
+		-e 's|@FSTYPE@|$(SKELETON_INIT_COMMON_OVERLAYFS_ETC_FSTYPE)|g' \
+		-e 's|@MOUNT_OPTIONS@|$(SKELETON_INIT_COMMON_OVERLAYFS_ETC_MOUNT_OPTIONS)|g' \
+		-e 's|@MOUNT_POINT@|$(SKELETON_INIT_COMMON_OVERLAYFS_ETC_MOUNT_POINT)|g' \
+		-e 's|@INIT@|$(SKELETON_INIT_COMMON_OVERLAYFS_ETC_INIT)|g' \
+		-e 's|@EXPOSE_LOWER@|$(if $(BR2_ROOTFS_OVERLAYFS_ETC_EXPOSE_LOWER),true,false)|g' \
+		$(SKELETON_INIT_COMMON_PKGDIR)/overlayfs-etc-preinit.sh \
+		> $(TARGET_DIR)/sbin/init
+	chmod 0755 $(TARGET_DIR)/sbin/init
+endef
+SKELETON_INIT_COMMON_TARGET_FINALIZE_HOOKS += SKELETON_INIT_COMMON_OVERLAYFS_ETC
+endif
+
 $(eval $(generic-package))
diff --git a/system/Config.in b/system/Config.in
index f4788cd72e..dac986ac3c 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -517,6 +517,68 @@ config BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
 	  remain read-only.
 	  If unsure, say Y.
 
+config BR2_ROOTFS_OVERLAYFS_ETC
+	bool "mount an overlayfs on /etc"
+	depends on !BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
+	depends on BR2_ROOTFS_SKELETON_DEFAULT
+	depends on BR2_INIT_BUSYBOX || BR2_INIT_SYSV || BR2_INIT_SYSTEMD
+	help
+	  Make /etc writable on a read-only root filesystem, with an
+	  overlayfs whose upper layer is on a persistent device.
+
+	  The init system already needs /etc when it starts, so
+	  /sbin/init is replaced by a script which mounts the
+	  persistent device, mounts the overlayfs on /etc, and then
+	  starts the original init, moved to
+	  /usr/libexec/overlayfs-etc/init. The changes to /etc are
+	  stored in <mount point>/overlay-etc/upper on the persistent
+	  device.
+
+	  The persistent device must exist and be formatted: this is
+	  left to the integration. It must not be listed in /etc/fstab.
+	  If it cannot be mounted, the system boots with a read-only
+	  /etc.
+
+	  Only /etc is handled: for /var, see the "/var management"
+	  option with systemd; with busybox or sysvinit, /var only
+	  provides volatile directories, and /var/lib is read-only.
+
+if BR2_ROOTFS_OVERLAYFS_ETC
+
+config BR2_ROOTFS_OVERLAYFS_ETC_DEVICE
+	string "persistent device"
+	help
+	  The device holding the upper layer of the /etc overlay, for
+	  example /dev/mmcblk0p3 or ubi0:data.
+
+config BR2_ROOTFS_OVERLAYFS_ETC_FSTYPE
+	string "persistent device filesystem type"
+	default "ext4"
+	help
+	  The filesystem type of the persistent device, for example
+	  ext4 or ubifs.
+
+config BR2_ROOTFS_OVERLAYFS_ETC_MOUNT_OPTIONS
+	string "persistent device mount options"
+	default "defaults"
+	help
+	  The options used to mount the persistent device.
+
+config BR2_ROOTFS_OVERLAYFS_ETC_MOUNT_POINT
+	string "persistent device mount point"
+	default "/data"
+	help
+	  Where the persistent device is mounted. The directory is
+	  created in the root filesystem.
+
+config BR2_ROOTFS_OVERLAYFS_ETC_EXPOSE_LOWER
+	bool "expose the original /etc"
+	help
+	  Bind mount the original /etc content read-only on
+	  <mount point>/overlay-etc/lower.
+
+endif
+
 config BR2_SYSTEM_DHCP
 	string "Network interface to configure through DHCP"
 	default ""
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
