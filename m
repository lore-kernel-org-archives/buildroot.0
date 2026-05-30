Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41231CD6E4A
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 09:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F03E642E02;
	Sat, 30 May 2026 09:04:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N_DXYhHl4hCy; Sat, 30 May 2026 09:04:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2B2A42E6D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780131885;
	bh=1wfr73aW9kpmB3oHqj1skqFIBFQq7mLKhQ64eFiJu9o=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=F/xSZ9UpqqSa8kDCZR7UfKfcTUf5Yg8FotGpavvSQ4+rzPl9dDGr1YhpdSAY2bpaq
	 ZED5Ek0QJLv99XTiE1z3yx2qfPBwLhY8wP9CN0jKy91j9mAN3hWgAnUtkNL/dfrNrW
	 Rg0VrPGxXFe+vNwvnE4b0vbnh1W8z65fZvQnnXLhzeGb7SlXpH6Fvm7eAl8gjGHrHg
	 ufr+uTpqysNGLlWbf8Zhwl4NJSPD0L6dX3CQUFezqfyAT+eRuCOBKhx5BG8aHBk2Ms
	 TxvgwhfWHdvQwBNfqW5VqfUlbg8QdrI78nj7VFsn7NReVmRqfh+Nlcdp//s3CrTqs/
	 thMP764f8h8Rg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2B2A42E6D;
	Sat, 30 May 2026 09:04:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 35E6637F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1156780F4C
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:04:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IpMFU-YWJv8Y for <buildroot@buildroot.org>;
 Sat, 30 May 2026 09:04:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 518EC80F3E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 518EC80F3E
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:04:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 69477837EA; Sat, 30 May 2026 09:04:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 11:03:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4893eeefde33a3e7417a5e1889f08934671f3269
X-Git-Newrev: 4a5b7d733c7391f39097d76eb95a6b761bc09d97
X-Patchwork-Hint: ignore
Message-Id: <20260530090423.69477837EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gstreamer1: update CPE vendor
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4a5b7d733c7391f39097d76eb95a6b761bc09d97
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The CPE "cpe:2.3:a:gstreamer:gstreamer:*:*:*:*:*:*:*:*" is valid for
this package.

The previous vendor `gstreamer_project` has no CVE assigned to it except
"gstreamer_project:gst-rtsp-server" which target another package.

See the CVEs [1][2] ...

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-3085
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-3086

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gstreamer1/gstreamer1.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index e9299e9e93..535272ed25 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -10,7 +10,7 @@ GSTREAMER1_SITE = https://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER1_INSTALL_STAGING = YES
 GSTREAMER1_LICENSE_FILES = COPYING
 GSTREAMER1_LICENSE = LGPL-2.1+
-GSTREAMER1_CPE_ID_VENDOR = gstreamer_project
+GSTREAMER1_CPE_ID_VENDOR = gstreamer
 GSTREAMER1_CPE_ID_PRODUCT = gstreamer
 
 GSTREAMER1_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
