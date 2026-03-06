Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61959FCC069
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DC6661460;
	Fri,  6 Mar 2026 19:53:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L7p8ah-Jt91m; Fri,  6 Mar 2026 19:52:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C492461477
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826778;
	bh=bKWylp+v45KYJgnppuWroZSo6VeUboE6Lov8UcACO9Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NCujOOBY4eJO0sQw/w6X+xqCRbrOAiZxiDx3Iliu697bZQhsCjxhKq07TONvujQyH
	 hId6e6cvlZD3SvvxWdclGtlmOtESkzBdHGZPQV4U+fR/PcdW+ay+VqFdb1W0pqLJ4m
	 ynd7gb9A0VQlU2zHwIyaR80bB2WUggHjLqGTP95Ab1vEODEZyl2CoxUKy/HNlhRoFG
	 /5ZtWCeuVHSdujLQWg+yME4NQd3U/QSKql/VBAmfeWb6z5LM50jojlwNHIpq7HId5T
	 CxM7XyXudLzcShzHi6PrRXtUInbiKOR+43D8Jhm4UEw5947bMfKPeax55MoiDKIR6h
	 +icxgxXViZbrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C492461477;
	Fri,  6 Mar 2026 19:52:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FD24223
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB5968376B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nzx2jEEhdRY8 for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:52:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E9B382C8F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E9B382C8F
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A42DA7FB67; Fri,  6 Mar 2026 19:52:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 14:15:28 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 456ecca0acc79412d3ceb3110284c99d44e5cfa3
X-Git-Newrev: 398ce24c57513f664086a20a8f3c940a14577a82
X-Patchwork-Hint: ignore
Message-Id: <20260306195223.A42DA7FB67@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/freerdp: patch
 various vulnerabilities
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5698651555288423210=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5698651555288423210==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/398ce24c57513f664086a20a8f3c940a14577a82
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Patches mostly backported with the basis of the work of Ubuntu Security
team. See [1].

Fix the following vulnerabilities:

- CVE-2024-32661:
    FreeRDP is a free implementation of the Remote Desktop Protocol.
    FreeRDP based clients prior to version 3.5.1 are vulnerable to a
    possible `NULL` access and crash. Version 3.5.1 contains a patch for
    the issue. No known workarounds are available.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2024-32661

- CVE-2026-23530:
    FreeRDP is a free implementation of the Remote Desktop Protocol. Prior
    to version 3.21.0,`freerdp_bitmap_decompress_planar` does not validate
    `nSrcWidth`/`nSrcHeight` against `planar->maxWidth`/`maxHeight` before
    RLE decode. A malicious server can trigger a client‑side heap buffer
    overflow, causing a crash (DoS) and potential heap corruption with
    code‑execution risk depending on allocator behavior and surrounding
    heap layout. Version 3.21.0 contains a patch for the issue.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-23530

- CVE-2026-23531:
    FreeRDP is a free implementation of the Remote Desktop Protocol. Prior
    to version 3.21.0, in ClearCodec, when `glyphData` is present,
    `clear_decompress` calls `freerdp_image_copy_no_overlap` without
    validating the destination rectangle, allowing an out-of-bounds
    read/write via crafted RDPGFX surface updates. A malicious server can
    trigger a client‑side heap buffer overflow, causing a crash (DoS) and
    potential heap corruption with code‑execution risk depending on
    allocator behavior and surrounding heap layout. Version 3.21.0
    contains a patch for the issue.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-23531

- CVE-2026-23532:
    FreeRDP is a free implementation of the Remote Desktop Protocol. Prior
    to version 3.21.0, a client-side heap buffer overflow occurs in the
    FreeRDP client’s `gdi_SurfaceToSurface` path due to a mismatch between
    destination rectangle clamping and the actual copy size. A malicious
    server can trigger a client‑side heap buffer overflow, causing a crash
    (DoS) and potential heap corruption with code‑execution risk depending
    on allocator behavior and surrounding heap layout. Version 3.21.0
    contains a patch for the issue.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-23532

- CVE-2026-23533:
    FreeRDP is a free implementation of the Remote Desktop Protocol. Prior
    to version 3.21.0, a client-side heap buffer overflow occurs in the
    RDPGFX ClearCodec decode path when maliciously crafted residual data
    causes out-of-bounds writes during color output. A malicious server
    can trigger a client‑side heap buffer overflow, causing a crash (DoS)
    and potential heap corruption with code‑execution risk depending on
    allocator behavior and surrounding heap layout. Version 3.21.0
    contains a patch for the issue.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-23533

- CVE-2026-23534:
    FreeRDP is a free implementation of the Remote Desktop Protocol. Prior
    to version 3.21.0, a client-side heap buffer overflow occurs in the
    ClearCodec bands decode path when crafted band coordinates allow
    writes past the end of the destination surface buffer. A malicious
    server can trigger a client‑side heap buffer overflow, causing a crash
    (DoS) and potential heap corruption with code‑execution risk depending
    on allocator behavior and surrounding heap layout. Version 3.21.0
    contains a patch for the issue.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-23534

- CVE-2026-23948:
    FreeRDP is a free implementation of the Remote Desktop Protocol. Prior
    to 3.22.0, a NULL pointer dereference vulnerability in
    rdp_write_logon_info_v2() allows a malicious RDP server to crash
    FreeRDP proxy by sending a specially crafted LogonInfoV2 PDU with
    cbDomain=0 or cbUserName=0. This vulnerability is fixed in 3.22.0.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-23948

- CVE-2026-24675:
    FreeRDP is a free implementation of the Remote Desktop Protocol. Prior
    to 3.22.0, urb_select_interface can free the device's MS config on
    error but later code still dereferences it, leading to a use after
    free in libusb_udev_select_interface. This vulnerability is fixed in
    3.22.0.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-24675

- CVE-2026-24676:
    FreeRDP is a free implementation of the Remote Desktop Protocol. Prior
    to 3.22.0, AUDIN format renegotiation frees the active format list
    while the capture thread continues using audin->format, leading to a
    use after free in audio_format_compatible. This vulnerability is fixed
    in 3.22.0.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-24676

- CVE-2026-24679:
    FreeRDP is a free implementation of the Remote Desktop Protocol. Prior
    to 3.22.0, The URBDRC client uses server-supplied interface numbers as
    array indices without bounds checks, causing an out-of-bounds read in
    libusb_udev_select_interface. This vulnerability is fixed in 3.22.0.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-24679

- CVE-2026-24681:
    FreeRDP is a free implementation of the Remote Desktop Protocol. Prior
    to 3.22.0, aAsynchronous bulk transfer completions can use a freed
    channel callback after URBDRC channel close, leading to a use after
    free in urb_write_completion. This vulnerability is fixed in 3.22.0.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-24681

- CVE-2026-24682:
    FreeRDP is a free implementation of the Remote Desktop Protocol. Prior
    to 3.22.0, audin_server_recv_formats frees an incorrect number of
    audio formats on parse failure (i + i), leading to out-of-bounds
    access in audio_formats_free. This vulnerability is fixed in 3.22.0.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-24682

- CVE-2026-24683:
    FreeRDP is a free implementation of the Remote Desktop Protocol.
    ainput_send_input_event caches channel_callback in a local variable
    and later uses it without synchronization; a concurrent channel close
    can free or reinitialize the callback, leading to a use after free.
    Prior to 3.22.0, This vulnerability is fixed in 3.22.0.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-24683

[1] https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/freerdp2/2.6.1+dfsg1-3ubuntu2.10/freerdp2_2.6.1+dfsg1-3ubuntu2.10.debian.tar.xz

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 8d184e5504cf2c8cea992c6f2a08f1c185f86cac)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...-missing-check-in-rdp-write-logon-info-v1.patch |  29 ++++++
 .../freerdp/0010-fix-decoder-length-checks.patch   |  29 ++++++
 .../freerdp/0011-fix-missing-length-checks.patch   |  31 ++++++
 .../0012-check-clear-decomress-glyphData.patch     |  79 ++++++++++++++
 .../0013-properly-clamp-SurfaceToSurface.patch     |  48 +++++++++
 .../0014-fix-clear-resize-buffer-checks.patch      |  58 +++++++++++
 .../freerdp/0015-fix-off-by-one-length-check.patch |  33 ++++++
 package/freerdp/0016-fix-missing-NULL-check.patch  |  55 ++++++++++
 .../0017-do-not-free-MsConfig-on-failure.patch     |  31 ++++++
 package/freerdp/0018-reset-audin-format.patch      |  35 +++++++
 ...19-ensure-InterfaceNumber-is-within-range.patch |  43 ++++++++
 ...cancel-all-usb-transfers-on-channel-close.patch |  24 +++++
 ...021-fix-audin-server-recv-formats-cleanup.patch |  26 +++++
 .../0022-lock-context-when-updating-listener.patch | 109 +++++++++++++++++++
 .../0023-terminate-thread-before-free.patch        |  64 ++++++++++++
 .../0024-only-clean-up-thread-before-free.patch    | 116 +++++++++++++++++++++
 package/freerdp/freerdp.mk                         |  44 ++++++++
 17 files changed, 854 insertions(+)

diff --git a/package/freerdp/0009-fix-missing-check-in-rdp-write-logon-info-v1.patch b/package/freerdp/0009-fix-missing-check-in-rdp-write-logon-info-v1.patch
new file mode 100644
index 0000000000..dfb4bd84c1
--- /dev/null
+++ b/package/freerdp/0009-fix-missing-check-in-rdp-write-logon-info-v1.patch
@@ -0,0 +1,29 @@
+From 71e463e31b4d69f4022d36bfc814592f56600793 Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Sun, 21 Apr 2024 13:56:13 +0200
+Subject: [PATCH] [core,info] fix missing check in rdp_write_logon_info_v1
+
+CVE: CVE-2024-32661
+Upstream: https://github.com/FreeRDP/FreeRDP/commit/71e463e31b4d69f4022d36bfc814592f56600793
+[thomas: backport https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/freerdp2/2.6.1+dfsg1-3ubuntu2.10/freerdp2_2.6.1+dfsg1-3ubuntu2.10.debian.tar.xz]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ libfreerdp/core/info.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/libfreerdp/core/info.c b/libfreerdp/core/info.c
+index 7d6eec13782d..3395e4d2e04c 100644
+--- a/libfreerdp/core/info.c
++++ b/libfreerdp/core/info.c
+@@ -1327,6 +1327,10 @@ static BOOL rdp_write_logon_info_v1(wStream* s, logon_info* info)
+ 		return FALSE;
+ 
+ 	/* domain */
++	WINPR_ASSERT(info);
++	if (!info->domain || !info->username)
++		return FALSE;
++
+ 	ilen = ConvertToUnicode(CP_UTF8, 0, info->domain, -1, &wString, 0);
+
+ 	if (ilen < 0)
+
diff --git a/package/freerdp/0010-fix-decoder-length-checks.patch b/package/freerdp/0010-fix-decoder-length-checks.patch
new file mode 100644
index 0000000000..5f16675ad0
--- /dev/null
+++ b/package/freerdp/0010-fix-decoder-length-checks.patch
@@ -0,0 +1,29 @@
+From 1bab198a2edd0d0e6e1627d21a433151ea190500 Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Thu, 15 Jan 2026 12:02:02 +0100
+Subject: [PATCH] [codec,planar] fix decoder length checks
+
+CVE: CVE-2026-23530
+Upstream: https://github.com/FreeRDP/FreeRDP/commit/1bab198a2edd0d0e6e1627d21a433151ea190500
+[thomas: backport https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/freerdp2/2.6.1+dfsg1-3ubuntu2.10/freerdp2_2.6.1+dfsg1-3ubuntu2.10.debian.tar.xz]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ libfreerdp/codec/planar.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/libfreerdp/codec/planar.c b/libfreerdp/codec/planar.c
+index 1a06e36edb0c..94a640a551d1 100644
+--- a/libfreerdp/codec/planar.c
++++ b/libfreerdp/codec/planar.c
+@@ -616,6 +616,11 @@ BOOL freerdp_bitmap_decompress_planar(BITMAP_PLANAR_CONTEXT* WINPR_RESTRICT plan
+ 	WINPR_ASSERT(planar);
+ 	WINPR_ASSERT(prims);
+ 
++	if (planar->maxWidth < nSrcWidth)
++		return FALSE;
++	if (planar->maxHeight < nSrcHeight)
++		return FALSE;
++
+ 	if (nDstStep <= 0)
+ 		nDstStep = nDstWidth * GetBytesPerPixel(DstFormat);
+ 
diff --git a/package/freerdp/0011-fix-missing-length-checks.patch b/package/freerdp/0011-fix-missing-length-checks.patch
new file mode 100644
index 0000000000..1c96864318
--- /dev/null
+++ b/package/freerdp/0011-fix-missing-length-checks.patch
@@ -0,0 +1,31 @@
+From 25102b432fb37916a1a553d7ef8fd940c6e52c3f Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Thu, 15 Jan 2026 12:17:33 +0100
+Subject: [PATCH] [codec,clear] fix missing length checks
+
+Upstream: https://github.com/FreeRDP/FreeRDP/commit/25102b432fb37916a1a553d7ef8fd940c6e52c3f.patch
+CVE: CVE-2026-23531
+[thomas: backport https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/freerdp2/2.6.1+dfsg1-3ubuntu2.10/freerdp2_2.6.1+dfsg1-3ubuntu2.10.debian.tar.xz]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ libfreerdp/codec/clear.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/libfreerdp/codec/clear.c b/libfreerdp/codec/clear.c
+index aa36baa9b305..4a67a8ed692b 100644
+--- a/libfreerdp/codec/clear.c
++++ b/libfreerdp/codec/clear.c
+@@ -1141,8 +1141,11 @@ INT32 clear_decompress(CLEAR_CONTEXT* cl
+ 
+ 	if (glyphData)
+ 	{
+-		if (!freerdp_image_copy(glyphData, clear->format, 0, 0, 0, nWidth, nHeight, pDstData,
+-		                        DstFormat, nDstStep, nXDst, nYDst, palette, FREERDP_FLIP_NONE))
++		const uint32_t w = MIN(nWidth, nDstWidth);
++		const uint32_t h = MIN(nHeight, nDstHeight);
++		if (!freerdp_image_copy_no_overlap(glyphData, clear->format, 0, 0, 0, w, h, pDstData,
++		                                   DstFormat, nDstStep, nXDst, nYDst, palette,
++		                                   FREERDP_FLIP_NONE))
+ 			goto fail;
+ 	}
+ 
diff --git a/package/freerdp/0012-check-clear-decomress-glyphData.patch b/package/freerdp/0012-check-clear-decomress-glyphData.patch
new file mode 100644
index 0000000000..7db56cf6c1
--- /dev/null
+++ b/package/freerdp/0012-check-clear-decomress-glyphData.patch
@@ -0,0 +1,79 @@
+From 243ecf804bb122e8e643a5c142ad5a49d7aa19ee Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Fri, 16 Jan 2026 12:22:46 +0100
+Subject: [PATCH] [codec,clear] check clear_decomress glyphData
+
+Check destination coordinates and lengths against the actual sizes. Log
+every truncation accordingly
+
+CVE: CVE-2026-23531
+Upstream: https://github.com/FreeRDP/FreeRDP/commit/243ecf804bb122e8e643a5c142ad5a49d7aa19ee
+[thomas: backport https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/freerdp2/2.6.1+dfsg1-3ubuntu2.10/freerdp2_2.6.1+dfsg1-3ubuntu2.10.debian.tar.xz]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ libfreerdp/codec/clear.c | 50 ++++++++++++++++++++++++++++++++++++++--
+ 1 file changed, 48 insertions(+), 2 deletions(-)
+
+diff --git a/libfreerdp/codec/clear.c b/libfreerdp/codec/clear.c
+index 0efa89f8d06c..f9aa4f0000c1 100644
+--- a/libfreerdp/codec/clear.c
++++ b/libfreerdp/codec/clear.c
+@@ -1141,9 +1141,55 @@ INT32 clear_decompress(CLEAR_CONTEXT* cl
+ 
+ 	if (glyphData)
+ 	{
+-		const uint32_t w = MIN(nWidth, nDstWidth);
+-		const uint32_t h = MIN(nHeight, nDstHeight);
+-		if (!freerdp_image_copy_no_overlap(glyphData, clear->format, 0, 0, 0, w, h, pDstData,
++		uint32_t w = MIN(nWidth, nDstWidth);
++		if (nXDst > nDstWidth)
++		{
++			WLog_WARN(TAG, "glyphData copy area x exceeds destination: x=%" PRIu32 " > %" PRIu32,
++			          nXDst, nDstWidth);
++			w = 0;
++		}
++		else if (nXDst + w > nDstWidth)
++		{
++			WLog_WARN(TAG,
++			          "glyphData copy area x + width exceeds destination: x=%" PRIu32 " + %" PRIu32
++			          " > %" PRIu32,
++			          nXDst, w, nDstWidth);
++			w = nDstWidth - nXDst;
++		}
++
++		if (w != nWidth)
++		{
++			WLog_WARN(TAG,
++			          "glyphData copy area width truncated: requested=%" PRIu32
++			          ", truncated to %" PRIu32,
++			          nWidth, w);
++		}
++
++		uint32_t h = MIN(nHeight, nDstHeight);
++		if (nYDst > nDstHeight)
++		{
++			WLog_WARN(TAG, "glyphData copy area y exceeds destination: y=%" PRIu32 " > %" PRIu32,
++			          nYDst, nDstHeight);
++			h = 0;
++		}
++		else if (nYDst + h > nDstHeight)
++		{
++			WLog_WARN(TAG,
++			          "glyphData copy area y + height exceeds destination: x=%" PRIu32 " + %" PRIu32
++			          " > %" PRIu32,
++			          nYDst, h, nDstHeight);
++			h = nDstHeight - nYDst;
++		}
++
++		if (h != nHeight)
++		{
++			WLog_WARN(TAG,
++			          "glyphData copy area height truncated: requested=%" PRIu32
++			          ", truncated to %" PRIu32,
++			          nHeight, h);
++		}
++
++		if (!freerdp_image_copy(glyphData, clear->format, 0, 0, 0, w, h, pDstData,
+ 		                                   DstFormat, nDstStep, nXDst, nYDst, palette,
+ 		                                   FREERDP_FLIP_NONE))
+ 			goto fail;
diff --git a/package/freerdp/0013-properly-clamp-SurfaceToSurface.patch b/package/freerdp/0013-properly-clamp-SurfaceToSurface.patch
new file mode 100644
index 0000000000..541da75367
--- /dev/null
+++ b/package/freerdp/0013-properly-clamp-SurfaceToSurface.patch
@@ -0,0 +1,48 @@
+From c4a7c371342edf0d307cea728f56d3302f0ab38c Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Thu, 15 Jan 2026 12:04:36 +0100
+Subject: [PATCH] [gdi,gfx] properly clamp SurfaceToSurface
+
+CVE: CVE-2026-23532
+Upstream: https://github.com/FreeRDP/FreeRDP/commit/c4a7c371342edf0d307cea728f56d3302f0ab38c
+[thomas: backport https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/freerdp2/2.6.1+dfsg1-3ubuntu2.10/freerdp2_2.6.1+dfsg1-3ubuntu2.10.debian.tar.xz]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ libfreerdp/gdi/gfx.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/libfreerdp/gdi/gfx.c b/libfreerdp/gdi/gfx.c
+index 56e6ff9ed50b..96ce1007025c 100644
+--- a/libfreerdp/gdi/gfx.c
++++ b/libfreerdp/gdi/gfx.c
+@@ -1175,7 +1175,6 @@ static UINT gdi_SurfaceToSurface(RdpgfxC
+ 	UINT status = ERROR_INTERNAL_ERROR;
+ 	UINT16 index;
+ 	BOOL sameSurface;
+-	UINT32 nWidth, nHeight;
+ 	const RECTANGLE_16* rectSrc;
+ 	RECTANGLE_16 invalidRect;
+ 	gdiGfxSurface* surfaceSrc;
+@@ -1199,8 +1198,8 @@ static UINT gdi_SurfaceToSurface(RdpgfxC
+ 	if (!is_rect_valid(rectSrc, surfaceSrc->width, surfaceSrc->height))
+ 		goto fail;
+ 
+-	nWidth = rectSrc->right - rectSrc->left;
+-	nHeight = rectSrc->bottom - rectSrc->top;
++	const UINT32 nWidth = rectSrc->right - rectSrc->left;
++	const UINT32 nHeight = rectSrc->bottom - rectSrc->top;
+ 
+ 	for (index = 0; index < surfaceToSurface->destPtsCount; index++)
+ 	{
+@@ -1209,8 +1208,10 @@ static UINT gdi_SurfaceToSurface(RdpgfxC
+ 		if (!is_rect_valid(&rect, surfaceDst->width, surfaceDst->height))
+ 			goto fail;
+ 
++		const UINT32 rwidth = rect.right - rect.left;
++		const UINT32 rheight = rect.bottom - rect.top;
+ 		if (!freerdp_image_copy(surfaceDst->data, surfaceDst->format, surfaceDst->scanline,
+-		                        destPt->x, destPt->y, nWidth, nHeight, surfaceSrc->data,
++		                        destPt->x, destPt->y, rwidth, rheight, surfaceSrc->data,
+ 		                        surfaceSrc->format, surfaceSrc->scanline, rectSrc->left,
+ 		                        rectSrc->top, NULL, FREERDP_FLIP_NONE))
+ 			goto fail;
diff --git a/package/freerdp/0014-fix-clear-resize-buffer-checks.patch b/package/freerdp/0014-fix-clear-resize-buffer-checks.patch
new file mode 100644
index 0000000000..9913da8d72
--- /dev/null
+++ b/package/freerdp/0014-fix-clear-resize-buffer-checks.patch
@@ -0,0 +1,58 @@
+From c4391827d7facfc874ca7f61a92afb82232a5748 Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Thu, 15 Jan 2026 12:11:57 +0100
+Subject: [PATCH] [codec,clear] fix clear_resize_buffer checks
+
+CVE: CVE-2026-23533
+Upstream: https://github.com/FreeRDP/FreeRDP/commit/c4391827d7facfc874ca7f61a92afb82232a5748
+[thomas: backport https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/freerdp2/2.6.1+dfsg1-3ubuntu2.10/freerdp2_2.6.1+dfsg1-3ubuntu2.10.debian.tar.xz]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ libfreerdp/codec/clear.c | 15 ++++++++-------
+ 1 file changed, 8 insertions(+), 7 deletions(-)
+
+diff --git a/libfreerdp/codec/clear.c b/libfreerdp/codec/clear.c
+index ad57529093e3..aa36baa9b305 100644
+--- a/libfreerdp/codec/clear.c
++++ b/libfreerdp/codec/clear.c
+@@ -62,7 +62,7 @@ struct S_CLEAR_CONTEXT
+ 	NSC_CONTEXT* nsc;
+ 	UINT32 seqNumber;
+ 	BYTE* TempBuffer;
+-	UINT32 TempSize;
++	size_t TempSize;
+ 	UINT32 nTempStep;
+ 	UINT32 TempFormat;
+ 	UINT32 format;
+@@ -313,16 +313,17 @@ static BOOL clear_decompress_subcode_rlex(wStream* WINPR_RESTRICT s, UINT32 bitm
+ 
+ static BOOL clear_resize_buffer(CLEAR_CONTEXT* clear, UINT32 width, UINT32 height)
+ {
+-	UINT32 size;
+-
+ 	if (!clear)
+ 		return FALSE;
+ 
+-	size = ((width + 16) * (height + 16) * GetBytesPerPixel(clear->format));
++	const UINT64 size = 1ull * (width + 16ull) * (height + 16ull);
++	const size_t bpp = GetBytesPerPixel(clear->format);
++	if (size > UINT32_MAX / bpp)
++		return FALSE;
+ 
+-	if (size > clear->TempSize)
++	if (size > clear->TempSize / bpp)
+ 	{
+-		BYTE* tmp = (BYTE*)realloc(clear->TempBuffer, size);
++		BYTE* tmp = (BYTE*)realloc(clear->TempBuffer, size * bpp);
+ 
+ 		if (!tmp)
+ 		{
+@@ -330,7 +331,7 @@ static BOOL clear_resize_buffer(CLEAR_CONTEXT* WINPR_RESTRICT clear, UINT32 widt
+ 			return FALSE;
+ 		}
+ 
+-		clear->TempSize = size;
++		clear->TempSize = size * bpp;
+ 		clear->TempBuffer = tmp;
+ 	}
+ 
diff --git a/package/freerdp/0015-fix-off-by-one-length-check.patch b/package/freerdp/0015-fix-off-by-one-length-check.patch
new file mode 100644
index 0000000000..898603fdcd
--- /dev/null
+++ b/package/freerdp/0015-fix-off-by-one-length-check.patch
@@ -0,0 +1,33 @@
+From f8688b57f6cfad9a0b05475a6afbde355ffab720 Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Thu, 15 Jan 2026 12:19:53 +0100
+Subject: [PATCH] [codec,clear] fix off by one length check
+
+CVE: CVE-2026-23534
+Upstream: https://github.com/FreeRDP/FreeRDP/commit/f8688b57f6cfad9a0b05475a6afbde355ffab720
+[thomas: backport https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/freerdp2/2.6.1+dfsg1-3ubuntu2.10/freerdp2_2.6.1+dfsg1-3ubuntu2.10.debian.tar.xz]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ libfreerdp/codec/clear.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libfreerdp/codec/clear.c b/libfreerdp/codec/clear.c
+index 4a67a8ed692b..0efa89f8d06c 100644
+--- a/libfreerdp/codec/clear.c
++++ b/libfreerdp/codec/clear.c
+@@ -881,11 +881,14 @@ static BOOL clear_decompress_bands_data(
+ 				if (count > nHeight)
+ 					count = nHeight;
+ 
+-				if (nXDstRel + i > nDstWidth)
++				if (nXDstRel + i >= nDstWidth)
+ 					return FALSE;
+ 
+ 				for (UINT32 y = 0; y < count; y++)
+ 				{
++					if (nYDstRel + y >= nDstHeight)
++						return FALSE;
++
+ 					BYTE* pDstPixel8 = &pDstData[((nYDstRel + y) * nDstStep) +
+ 					                             ((nXDstRel + i) * GetBytesPerPixel(DstFormat))];
+ 					UINT32 color = ReadColor(cpSrcPixel, clear->format);
diff --git a/package/freerdp/0016-fix-missing-NULL-check.patch b/package/freerdp/0016-fix-missing-NULL-check.patch
new file mode 100644
index 0000000000..245c05d9d5
--- /dev/null
+++ b/package/freerdp/0016-fix-missing-NULL-check.patch
@@ -0,0 +1,55 @@
+From 4d44e3c097656a8b9ec696353647b0888ca45860 Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Mon, 19 Jan 2026 20:11:24 +0100
+Subject: [PATCH] [core,info] fix missing NULL check
+
+Upstream: https://github.com/FreeRDP/FreeRDP/commit/4d44e3c097656a8b9ec696353647b0888ca45860
+CVE: CVE-2026-23948
+[thomas: backport https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/freerdp2/2.6.1+dfsg1-3ubuntu2.10/freerdp2_2.6.1+dfsg1-3ubuntu2.10.debian.tar.xz]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ libfreerdp/core/info.c | 14 +++++++++-----
+ 1 file changed, 9 insertions(+), 5 deletions(-)
+
+diff --git a/libfreerdp/core/info.c b/libfreerdp/core/info.c
+index 0b17b75d9f64..cc54aee7baef 100644
+--- a/libfreerdp/core/info.c
++++ b/libfreerdp/core/info.c
+@@ -1372,7 +1372,7 @@ static BOOL rdp_write_logon_info_v1(wStr
+ 	return TRUE;
+ }
+ 
+-static BOOL rdp_write_logon_info_v2(wStream* s, logon_info* info)
++static BOOL rdp_write_logon_info_v2(wStream* s, const logon_info* info)
+ {
+ 	UINT32 Size = 2 + 4 + 4 + 4 + 4 + 558;
+ 	size_t domainLen, usernameLen;
+@@ -1385,11 +1385,13 @@ static BOOL rdp_write_logon_info_v2(wStr
+ 	Stream_Write_UINT16(s, SAVE_SESSION_PDU_VERSION_ONE);
+ 	Stream_Write_UINT32(s, Size);
+ 	Stream_Write_UINT32(s, info->sessionId);
+-	domainLen = strlen(info->domain);
++	if (info->domain)
++		domainLen = strlen(info->domain);
+ 	if (domainLen > UINT32_MAX)
+ 		return FALSE;
+ 	Stream_Write_UINT32(s, (UINT32)(domainLen + 1) * 2);
+-	usernameLen = strlen(info->username);
++	if (info->username)
++		usernameLen = strlen(info->username);
+ 	if (usernameLen > UINT32_MAX)
+ 		return FALSE;
+ 	Stream_Write_UINT32(s, (UINT32)(usernameLen + 1) * 2);
+@@ -1466,10 +1468,10 @@ static BOOL rdp_write_logon_info_ex(wStr
+ 
+ BOOL rdp_send_save_session_info(rdpContext* context, UINT32 type, void* data)
+ {
+-	wStream* s;
+ 	BOOL status;
++	WINPR_ASSERT(context);
+ 	rdpRdp* rdp = context->rdp;
+-	s = rdp_data_pdu_init(rdp);
++	wStream* s = rdp_data_pdu_init(rdp);
+ 
+ 	if (!s)
+ 		return FALSE;
diff --git a/package/freerdp/0017-do-not-free-MsConfig-on-failure.patch b/package/freerdp/0017-do-not-free-MsConfig-on-failure.patch
new file mode 100644
index 0000000000..ceb9b8a898
--- /dev/null
+++ b/package/freerdp/0017-do-not-free-MsConfig-on-failure.patch
@@ -0,0 +1,31 @@
+From d676518809c319eec15911c705c13536036af2ae Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Mon, 26 Jan 2026 11:54:56 +0100
+Subject: [PATCH] [channels,urbdrc] do not free MsConfig on failure
+
+let the channel handle it later.
+
+CVE: CVE-2026-24675
+Upstream: https://github.com/FreeRDP/FreeRDP/commit/d676518809c319eec15911c705c13536036af2ae
+[thomas: backport https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/freerdp2/2.6.1+dfsg1-3ubuntu2.10/freerdp2_2.6.1+dfsg1-3ubuntu2.10.debian.tar.xz]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ channels/urbdrc/client/data_transfer.c | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/channels/urbdrc/client/data_transfer.c b/channels/urbdrc/client/data_transfer.c
+index af4b9fb5f641..c4042107d4ee 100644
+--- a/channels/urbdrc/client/data_transfer.c
++++ b/channels/urbdrc/client/data_transfer.c
+@@ -570,10 +570,8 @@ static UINT urb_select_interface(IUDEVICE* pdev, GENERIC_CHANNEL_CALLBACK* callb
+ 	MsConfig = pdev->get_MsConfig(pdev);
+ 	InterfaceNumber = MsInterface->InterfaceNumber;
+ 	if (!msusb_msinterface_replace(MsConfig, InterfaceNumber, MsInterface))
+-	{
+-		msusb_msconfig_free(MsConfig);
+ 		return ERROR_BAD_CONFIGURATION;
+-	}
++
+ 	/* complete configuration setup */
+ 	if (!pdev->complete_msconfig_setup(pdev, MsConfig))
+ 	{
diff --git a/package/freerdp/0018-reset-audin-format.patch b/package/freerdp/0018-reset-audin-format.patch
new file mode 100644
index 0000000000..c15ec93b7c
--- /dev/null
+++ b/package/freerdp/0018-reset-audin-format.patch
@@ -0,0 +1,35 @@
+From 026b81ae5831ac1598d8f7371e0d0996fac7db00 Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Mon, 26 Jan 2026 10:20:23 +0100
+Subject: [PATCH] [channels,audin] reset audin->format
+
+Whenever the underlying structure changes reset the pointer to NULL
+
+CVE: CVE-2026-24676
+Upstream: https://github.com/FreeRDP/FreeRDP/commit/026b81ae5831ac1598d8f7371e0d0996fac7db00
+[thomas: backport https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/freerdp2/2.6.1+dfsg1-3ubuntu2.10/freerdp2_2.6.1+dfsg1-3ubuntu2.10.debian.tar.xz]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ channels/audin/client/audin_main.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/channels/audin/client/audin_main.c b/channels/audin/client/audin_main.c
+index c57c65a62d4e..76d87bb9c1ed 100644
+--- a/channels/audin/client/audin_main.c
++++ b/channels/audin/client/audin_main.c
+@@ -219,6 +219,7 @@ static UINT audin_process_formats(AUDIN_
+ 	}
+ 
+ 	Stream_Seek_UINT32(s); /* cbSizeFormatsPacket */
++	audin->format = NULL;
+ 	callback->formats = audio_formats_new(NumFormats);
+ 
+ 	if (!callback->formats)
+@@ -293,6 +294,7 @@ out:
+ 
+ 	if (error != CHANNEL_RC_OK)
+ 	{
++		audin->format = NULL;
+ 		audio_formats_free(callback->formats, NumFormats);
+ 		callback->formats = NULL;
+ 	}
diff --git a/package/freerdp/0019-ensure-InterfaceNumber-is-within-range.patch b/package/freerdp/0019-ensure-InterfaceNumber-is-within-range.patch
new file mode 100644
index 0000000000..0e5e213703
--- /dev/null
+++ b/package/freerdp/0019-ensure-InterfaceNumber-is-within-range.patch
@@ -0,0 +1,43 @@
+From 2d563a50be17c1b407ca448b1321378c0726dd31 Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Mon, 26 Jan 2026 10:59:39 +0100
+Subject: [PATCH] [channels,urbdrc] ensure InterfaceNumber is within range
+
+CVE: CVE-2026-24679
+Upstream: https://github.com/FreeRDP/FreeRDP/commit/2d563a50be17c1b407ca448b1321378c0726dd31
+[thomas: backport https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/freerdp2/2.6.1+dfsg1-3ubuntu2.10/freerdp2_2.6.1+dfsg1-3ubuntu2.10.debian.tar.xz]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ channels/urbdrc/client/libusb/libusb_udevice.c | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/channels/urbdrc/client/libusb/libusb_udevice.c b/channels/urbdrc/client/libusb/libusb_udevice.c
+index 6c2376f74fd6..5341248ec64f 100644
+--- a/channels/urbdrc/client/libusb/libusb_udevice.c
++++ b/channels/urbdrc/client/libusb/libusb_udevice.c
+@@ -528,19 +528,19 @@ static int libusb_udev_select_interface(
+ {
+ 	int error = 0, diff = 0;
+ 	UDEVICE* pdev = (UDEVICE*)idev;
+-	URBDRC_PLUGIN* urbdrc;
+-	MSUSB_CONFIG_DESCRIPTOR* MsConfig;
+-	MSUSB_INTERFACE_DESCRIPTOR** MsInterfaces;
+ 
+ 	if (!pdev || !pdev->urbdrc)
+ 		return -1;
+ 
+-	urbdrc = pdev->urbdrc;
+-	MsConfig = pdev->MsConfig;
++	URBDRC_PLUGIN* urbdrc = pdev->urbdrc;
++	MSUSB_CONFIG_DESCRIPTOR* MsConfig = pdev->MsConfig;
+ 
+ 	if (MsConfig)
+ 	{
+-		MsInterfaces = MsConfig->MsInterfaces;
++		if (InterfaceNumber >= MsConfig->NumInterfaces)
++			return -2;
++
++		MSUSB_INTERFACE_DESCRIPTOR** MsInterfaces = MsConfig->MsInterfaces;
+ 		if (MsInterfaces)
+ 		{
+ 			WLog_Print(urbdrc->log, WLOG_INFO,
diff --git a/package/freerdp/0020-cancel-all-usb-transfers-on-channel-close.patch b/package/freerdp/0020-cancel-all-usb-transfers-on-channel-close.patch
new file mode 100644
index 0000000000..130f86ecbc
--- /dev/null
+++ b/package/freerdp/0020-cancel-all-usb-transfers-on-channel-close.patch
@@ -0,0 +1,24 @@
+From 414f701464929c217f2509bcbd6d2c1f00f7ed73 Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Mon, 26 Jan 2026 11:07:25 +0100
+Subject: [PATCH] [channels,urbdrc] cancel all usb transfers on channel close
+
+CVE: CVE-2026-24681
+Upstream: https://github.com/FreeRDP/FreeRDP/commit/414f701464929c217f2509bcbd6d2c1f00f7ed73
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ channels/urbdrc/client/libusb/libusb_udevice.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/channels/urbdrc/client/libusb/libusb_udevice.c b/channels/urbdrc/client/libusb/libusb_udevice.c
+index 5341248ec64f..9e2d3ec5a193 100644
+--- a/channels/urbdrc/client/libusb/libusb_udevice.c
++++ b/channels/urbdrc/client/libusb/libusb_udevice.c
+@@ -1116,6 +1116,7 @@ static void libusb_udev_mark_channel_closed(IUDEVICE* idev)
+ 		const uint8_t devNr = idev->get_dev_number(idev);
+ 
+ 		pdev->status |= URBDRC_DEVICE_CHANNEL_CLOSED;
++		pdev->iface.cancel_all_transfer_request(&pdev->iface);
+ 		urbdrc->udevman->unregister_udevice(urbdrc->udevman, busNr, devNr);
+ 	}
+ }
diff --git a/package/freerdp/0021-fix-audin-server-recv-formats-cleanup.patch b/package/freerdp/0021-fix-audin-server-recv-formats-cleanup.patch
new file mode 100644
index 0000000000..5db318b4fd
--- /dev/null
+++ b/package/freerdp/0021-fix-audin-server-recv-formats-cleanup.patch
@@ -0,0 +1,26 @@
+From 1c5c74223179d425a1ce6dbbb6a3dd2a958b7aee Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Mon, 26 Jan 2026 10:14:08 +0100
+Subject: [PATCH] [channels,audin] fix audin_server_recv_formats cleanup
+
+CVE: CVE-2026-24682
+Upstream: https://github.com/FreeRDP/FreeRDP/commit/1c5c74223179d425a1ce6dbbb6a3dd2a958b7aee
+[thomas: backport https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/freerdp2/2.6.1+dfsg1-3ubuntu2.10/freerdp2_2.6.1+dfsg1-3ubuntu2.10.debian.tar.xz]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ channels/audin/server/audin.c | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/channels/audin/server/audin.c b/channels/audin/server/audin.c
+index 5046a7d6f27c..17077efa6652 100644
+--- a/channels/audin/server/audin.c
++++ b/channels/audin/server/audin.c
+@@ -215,7 +215,7 @@ static UINT audin_server_recv_formats(au
+ 
+ 		if (!audio_format_read(s, format))
+ 		{
+-			audio_formats_free(audin->context.client_formats, i);
++			audio_formats_free(audin->context.client_formats, audin->context.num_client_formats);
+ 			audin->context.client_formats = NULL;
+ 			WLog_ERR(TAG, "expected length at least 18, but got %" PRIu32 "", length);
+ 			return ERROR_INVALID_DATA;
diff --git a/package/freerdp/0022-lock-context-when-updating-listener.patch b/package/freerdp/0022-lock-context-when-updating-listener.patch
new file mode 100644
index 0000000000..903e6af7f8
--- /dev/null
+++ b/package/freerdp/0022-lock-context-when-updating-listener.patch
@@ -0,0 +1,109 @@
+From d9ca272dce7a776ab475e9b1a8e8c3d2968c8486 Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Mon, 26 Jan 2026 12:08:48 +0100
+Subject: [PATCH] [channels,ainput] lock context when updating listener
+
+CVE: CVE-2026-24683
+Upstream: https://github.com/FreeRDP/FreeRDP/commit/d9ca272dce7a776ab475e9b1a8e8c3d2968c8486
+[thomas: backport https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/freerdp2/2.6.1+dfsg1-3ubuntu2.10/freerdp2_2.6.1+dfsg1-3ubuntu2.10.debian.tar.xz]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ channels/ainput/client/ainput_main.c | 36 ++++++++++++++++++++--------
+ 1 file changed, 26 insertions(+), 10 deletions(-)
+
+diff --git a/channels/ainput/client/ainput_main.c b/channels/ainput/client/ainput_main.c
+index c291bd727285..5545753600a1 100644
+--- a/channels/ainput/client/ainput_main.c
++++ b/channels/ainput/client/ainput_main.c
+@@ -69,6 +69,7 @@ struct AINPUT_PLUGIN_
+ 	UINT32 MajorVersion;
+ 	UINT32 MinorVersion;
+ 	BOOL initialized;
++	CRITICAL_SECTION lock;
+ };
+ 
+ /**
+@@ -109,10 +110,7 @@ static UINT ainput_on_data_received(IWTS
+ 
+ static UINT ainput_send_input_event(AInputClientContext* context, UINT64 flags, INT32 x, INT32 y)
+ {
+-	AINPUT_PLUGIN* ainput;
+-	AINPUT_CHANNEL_CALLBACK* callback;
+ 	BYTE buffer[32] = { 0 };
+-	UINT64 time;
+ 	wStream sbuffer = { 0 };
+ 	wStream* s = &sbuffer;
+ 
+@@ -121,8 +119,8 @@ static UINT ainput_send_input_event(AInp
+ 	WINPR_ASSERT(s);
+ 	WINPR_ASSERT(context);
+ 
+-	time = GetTickCount64();
+-	ainput = (AINPUT_PLUGIN*)context->handle;
++	const UINT64 time = GetTickCount64();
++	AINPUT_PLUGIN* ainput = (AINPUT_PLUGIN*)context->handle;
+ 	WINPR_ASSERT(ainput);
+ 	WINPR_ASSERT(ainput->listener_callback);
+ 
+@@ -132,8 +130,6 @@ static UINT ainput_send_input_event(AInp
+ 		          ainput->MajorVersion, ainput->MinorVersion);
+ 		return CHANNEL_RC_UNSUPPORTED_VERSION;
+ 	}
+-	callback = ainput->listener_callback->channel_callback;
+-	WINPR_ASSERT(callback);
+ 
+ 	{
+ 		char buffer[128] = { 0 };
+@@ -152,10 +148,15 @@ static UINT ainput_send_input_event(AInp
+ 	Stream_SealLength(s);
+ 
+ 	/* ainput back what we have received. AINPUT does not have any message IDs. */
++	EnterCriticalSection(&ainput->lock);
++	AINPUT_CHANNEL_CALLBACK* callback = ainput->listener_callback->channel_callback;
++	WINPR_ASSERT(callback);
+ 	WINPR_ASSERT(callback->channel);
+ 	WINPR_ASSERT(callback->channel->Write);
+-	return callback->channel->Write(callback->channel, (ULONG)Stream_Length(s), Stream_Buffer(s),
++	const UINT rc = callback->channel->Write(callback->channel, (ULONG)Stream_Length(s), Stream_Buffer(s),
+ 	                                NULL);
++	LeaveCriticalSection(&ainput->lock);
++	return rc;
+ }
+ 
+ /**
+@@ -167,7 +168,14 @@ static UINT ainput_on_close(IWTSVirtualC
+ {
+ 	AINPUT_CHANNEL_CALLBACK* callback = (AINPUT_CHANNEL_CALLBACK*)pChannelCallback;
+ 
+-	free(callback);
++	if (callback)
++	{
++		AINPUT_PLUGIN* ainput = (AINPUT_PLUGIN*)callback->plugin;
++		WINPR_ASSERT(ainput);
++		EnterCriticalSection(&ainput->lock);
++		free(callback);
++		LeaveCriticalSection(&ainput->lock);
++	}
+ 
+ 	return CHANNEL_RC_OK;
+ }
+@@ -242,7 +250,10 @@ static UINT ainput_plugin_initialize(IWT
+ 	status = pChannelMgr->CreateListener(pChannelMgr, AINPUT_DVC_CHANNEL_NAME, 0,
+ 	                                     &ainput->listener_callback->iface, &ainput->listener);
+ 
++	InitializeCriticalSection(&ainput->lock);
++	EnterCriticalSection(&ainput->lock);
+ 	ainput->listener->pInterface = ainput->iface.pInterface;
++	LeaveCriticalSection(&ainput->lock);
+ 	ainput->initialized = status == CHANNEL_RC_OK;
+ 	return status;
+ }
+@@ -255,6 +266,8 @@ static UINT ainput_plugin_initialize(IWT
+ static UINT ainput_plugin_terminated(IWTSPlugin* pPlugin)
+ {
+ 	AINPUT_PLUGIN* ainput = (AINPUT_PLUGIN*)pPlugin;
++	WINPR_ASSERT(ainput);
++	DeleteCriticalSection(&ainput->lock);
+ 	if (ainput && ainput->listener_callback)
+ 	{
+ 		IWTSVirtualChannelManager* mgr = ainput->listener_callback->channel_mgr;
diff --git a/package/freerdp/0023-terminate-thread-before-free.patch b/package/freerdp/0023-terminate-thread-before-free.patch
new file mode 100644
index 0000000000..d0eb600e8d
--- /dev/null
+++ b/package/freerdp/0023-terminate-thread-before-free.patch
@@ -0,0 +1,64 @@
+From 622bb7b4402491ca003f47472d0e478132673696 Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Mon, 26 Jan 2026 10:48:14 +0100
+Subject: [PATCH] [channels,rdpsnd] terminate thread before free
+
+Ensure that the optional rdpsnd thread is terminated and the message
+queue freed up before releasing the channel context memory
+
+CVE: CVE-2026-24684
+Upstream: https://github.com/FreeRDP/FreeRDP/commit/622bb7b4402491ca003f47472d0e478132673696
+[thomas: backport https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/freerdp2/2.6.1+dfsg1-3ubuntu2.10/freerdp2_2.6.1+dfsg1-3ubuntu2.10.debian.tar.xz]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ channels/rdpsnd/client/rdpsnd_main.c | 28 +++++++++++++++++++---------
+ 1 file changed, 19 insertions(+), 9 deletions(-)
+
+diff --git a/channels/rdpsnd/client/rdpsnd_main.c b/channels/rdpsnd/client/rdpsnd_main.c
+index 49c763a87e9b..61a29ec40aa8 100644
+--- a/channels/rdpsnd/client/rdpsnd_main.c
++++ b/channels/rdpsnd/client/rdpsnd_main.c
+@@ -1244,11 +1244,27 @@ fail:
+ 	return CHANNEL_RC_NO_MEMORY;
+ }
+ 
++static void rdpsnd_terminate_thread(rdpsndPlugin* rdpsnd)
++{
++	WINPR_ASSERT(rdpsnd);
++	if (rdpsnd->queue)
++		MessageQueue_PostQuit(rdpsnd->queue, 0);
++	if (rdpsnd->thread)
++	{
++		WaitForSingleObject(rdpsnd->thread, INFINITE);
++		CloseHandle(rdpsnd->thread);
++	}
++	MessageQueue_Free(rdpsnd->queue);
++	rdpsnd->thread = NULL;
++	rdpsnd->queue = NULL;
++}
++
+ static void cleanup_internals(rdpsndPlugin* rdpsnd)
+ {
+ 	if (!rdpsnd)
+ 		return;
+ 
++	rdpsnd_terminate_thread(rdpsnd);
+ 	if (rdpsnd->pool)
+ 		StreamPool_Return(rdpsnd->pool, rdpsnd->data_in);
+ 
+@@ -1396,14 +1412,7 @@ void rdpsnd_virtual_channel_event_termin
+ {
+ 	if (rdpsnd)
+ 	{
+-		if (rdpsnd->queue)
+-			MessageQueue_PostQuit(rdpsnd->queue, 0);
+-		if (rdpsnd->thread)
+-		{
+-			WaitForSingleObject(rdpsnd->thread, INFINITE);
+-			CloseHandle(rdpsnd->thread);
+-		}
+-		MessageQueue_Free(rdpsnd->queue);
++		rdpsnd_terminate_thread(rdpsnd);
+ 
+ 		free_internals(rdpsnd);
+ 		audio_formats_free(rdpsnd->fixed_format, 1);
diff --git a/package/freerdp/0024-only-clean-up-thread-before-free.patch b/package/freerdp/0024-only-clean-up-thread-before-free.patch
new file mode 100644
index 0000000000..163ad9b8cd
--- /dev/null
+++ b/package/freerdp/0024-only-clean-up-thread-before-free.patch
@@ -0,0 +1,116 @@
+From afa6851dc80835d3101e40fcef51b6c5c0f43ea5 Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Wed, 28 Jan 2026 09:31:06 +0100
+Subject: [PATCH] [channel,rdpsnd] only clean up thread before free
+
+rdpsnd channel usually has multiple instances (static, dynamic, ...) so
+ensure only to terminate the handler thread when the channel is actually
+closed for good.
+
+CVE: CVE-2026-24684
+Upstream: https://github.com/FreeRDP/FreeRDP/commit/afa6851dc80835d3101e40fcef51b6c5c0f43ea5
+[thomas: backport https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/freerdp2/2.6.1+dfsg1-3ubuntu2.10/freerdp2_2.6.1+dfsg1-3ubuntu2.10.debian.tar.xz]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ channels/rdpsnd/client/rdpsnd_main.c | 43 ++++++++++++++++------------
+ 1 file changed, 25 insertions(+), 18 deletions(-)
+
+diff --git a/channels/rdpsnd/client/rdpsnd_main.c b/channels/rdpsnd/client/rdpsnd_main.c
+index 61a29ec40aa8..5a1edaea62c6 100644
+--- a/channels/rdpsnd/client/rdpsnd_main.c
++++ b/channels/rdpsnd/client/rdpsnd_main.c
+@@ -132,6 +132,8 @@ struct rdpsnd_plugin
+ 	BOOL applyVolume;
+ };
+ 
++static DWORD WINAPI play_thread(LPVOID arg);
++
+ static const char* rdpsnd_is_dyn_str(BOOL dynamic)
+ {
+ 	if (dynamic)
+@@ -1264,7 +1266,6 @@ static void cleanup_internals(rdpsndPlug
+ 	if (!rdpsnd)
+ 		return;
+ 
+-	rdpsnd_terminate_thread(rdpsnd);
+ 	if (rdpsnd->pool)
+ 		StreamPool_Return(rdpsnd->pool, rdpsnd->data_in);
+ 
+@@ -1328,6 +1329,7 @@ static void free_internals(rdpsndPlugin*
+ 	if (!rdpsnd)
+ 		return;
+ 
++	rdpsnd_terminate_thread(rdpsnd);
+ 	freerdp_dsp_context_free(rdpsnd->dsp_context);
+ 	StreamPool_Free(rdpsnd->pool);
+ 	rdpsnd->pool = NULL;
+@@ -1349,6 +1351,21 @@ static BOOL allocate_internals(rdpsndPlu
+ 		if (!rdpsnd->dsp_context)
+ 			return FALSE;
+ 	}
++	if (!rdpsnd->queue)
++	{
++		wObject obj = { 0 };
++
++		obj.fnObjectFree = _queue_free;
++		rdpsnd->queue = MessageQueue_New(&obj);
++		if (!rdpsnd->queue)
++			return CHANNEL_RC_NO_MEMORY;
++	}
++	if (!rdpsnd->thread)
++	{
++		rdpsnd->thread = CreateThread(NULL, 0, play_thread, rdpsnd, 0, NULL);
++		if (!rdpsnd->thread)
++			return CHANNEL_RC_INITIALIZATION_ERROR;
++	}
+ 
+ 	return TRUE;
+ }
+@@ -1388,23 +1405,12 @@ static DWORD WINAPI play_thread(LPVOID a
+ 
+ static UINT rdpsnd_virtual_channel_event_initialized(rdpsndPlugin* rdpsnd)
+ {
+-	wObject obj = { 0 };
+-
+ 	if (!rdpsnd)
+ 		return ERROR_INVALID_PARAMETER;
+ 
+-	obj.fnObjectFree = _queue_free;
+-	rdpsnd->queue = MessageQueue_New(&obj);
+-	if (!rdpsnd->queue)
+-		return CHANNEL_RC_NO_MEMORY;
+-
+ 	if (!allocate_internals(rdpsnd))
+ 		return CHANNEL_RC_NO_MEMORY;
+ 
+-	rdpsnd->thread = CreateThread(NULL, 0, play_thread, rdpsnd, 0, NULL);
+-	if (!rdpsnd->thread)
+-		return CHANNEL_RC_INITIALIZATION_ERROR;
+-
+ 	return CHANNEL_RC_OK;
+ }
+ 
+@@ -1412,8 +1418,6 @@ void rdpsnd_virtual_channel_event_termin
+ {
+ 	if (rdpsnd)
+ 	{
+-		rdpsnd_terminate_thread(rdpsnd);
+-
+ 		free_internals(rdpsnd);
+ 		audio_formats_free(rdpsnd->fixed_format, 1);
+ 		free(rdpsnd->subsystem);
+@@ -1602,13 +1606,13 @@ static UINT rdpsnd_on_close(IWTSVirtualC
+ 
+ 	cleanup_internals(rdpsnd);
+ 
++	free_internals(rdpsnd);
+ 	if (rdpsnd->device)
+ 	{
+ 		IFCALL(rdpsnd->device->Free, rdpsnd->device);
+ 		rdpsnd->device = NULL;
+ 	}
+ 
+-	free_internals(rdpsnd);
+ 	free(pChannelCallback);
+ 	return CHANNEL_RC_OK;
+ }
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index a043557828..7238de61f1 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -21,6 +21,50 @@ FREERDP_IGNORE_CVES += CVE-2024-32662
 # https://security-tracker.debian.org/tracker/CVE-2025-68118
 FREERDP_IGNORE_CVES += CVE-2025-68118
 
+# 0009-fix-missing-check-in-rdp-write-logon-info-v1.patch
+FREERDP_IGNORE_CVES += CVE-2024-32661
+
+# 0010-fix-decoder-length-checks.patch
+FREERDP_IGNORE_CVES += CVE-2026-23530
+
+# 0011-fix-missing-length-checks.patch
+# 0012-check-clear-decomress-glyphData.patch
+FREERDP_IGNORE_CVES += CVE-2026-23531
+
+# 0013-properly-clamp-SurfaceToSurface.patch
+FREERDP_IGNORE_CVES += CVE-2026-23532
+
+# 0014-fix-clear-resize-buffer-checks.patch
+FREERDP_IGNORE_CVES += CVE-2026-23533
+
+# 0015-fix-off-by-one-length-check.patch
+FREERDP_IGNORE_CVES += CVE-2026-23534
+
+# 0016-fix-missing-NULL-check.patch
+FREERDP_IGNORE_CVES += CVE-2026-23948
+
+# 0017-do-not-free-MsConfig-on-failure.patch
+FREERDP_IGNORE_CVES += CVE-2026-24675
+
+# 0018-reset-audin-format.patch
+FREERDP_IGNORE_CVES += CVE-2026-24676
+
+# 0019-ensure-InterfaceNumber-is-within-range.patch
+FREERDP_IGNORE_CVES += CVE-2026-24679
+
+# 0020-cancel-all-usb-transfers-on-channel-close.patch
+FREERDP_IGNORE_CVES += CVE-2026-24681
+
+# 0021-fix-audin-server-recv-formats-cleanup.patch
+FREERDP_IGNORE_CVES += CVE-2026-24682
+
+# 0022-lock-context-when-updating-listener.patch
+FREERDP_IGNORE_CVES += CVE-2026-24683
+
+# 0023-terminate-thread-before-free.patch
+# 0024-only-clean-up-thread-before-free.patch
+FREERDP_IGNORE_CVES += CVE-2026-24684
+
 FREERDP_INSTALL_STAGING = YES
 
 FREERDP_CONF_OPTS = -DWITH_MANPAGES=OFF -Wno-dev -DWITH_GSTREAMER_0_10=OFF

--===============5698651555288423210==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5698651555288423210==--
