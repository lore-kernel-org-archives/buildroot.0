Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72AF1F99C9A
	for <buildroot@archiver.kernel.org>; Sat, 18 Apr 2026 22:02:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38B3F82060;
	Sat, 18 Apr 2026 22:02:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dKG8i870x4XL; Sat, 18 Apr 2026 22:02:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5749682049
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776549741;
	bh=06PdgINECRKqE9JNTYT4PV513I0CCbK3UrqBbS45HlM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OWGa+UUsTIKG7MPDadyWad/ie6uAvtLEQqpoakri0qqqnX4M+kTBumeI6hn9dL5Er
	 Zf+RzF3p/Xj6kKLUiVOCWfWL2gBbLVls0pHkISp+YOcJ0t52hsG/6HrKJs5nBK+MBT
	 NcwhZggIHi6MpoYj46xBZMqN7FaBGpzWfP9Wp86uKvvPVr7BHtl3q0AUvgWRTf9fj/
	 VagzN9SQJEedS1W+8s/wzvIe3YTTlUIFwROkunngvAYyIOyZssysesLSB259wh0mI2
	 pjZwUAVWOTpdhkX2tcW9dmCgmg7CauIsz/923Qol+bJ26151UyFw1xvP50j7WorHiJ
	 qUAlbGydH9LZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5749682049;
	Sat, 18 Apr 2026 22:02:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D196347
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 22:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1EC39403E9
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 22:02:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hI8xDu0No_7H for <buildroot@buildroot.org>;
 Sat, 18 Apr 2026 22:02:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E25540345
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E25540345
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 22:02:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A38FF81DF3; Sat, 18 Apr 2026 22:02:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Apr 2026 00:01:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7e24f892f6120d008e6a73617398ddc3111ee3a2
X-Git-Newrev: ccf69ab8c4cedfe5a1fdb7e5d90b962045064444
X-Patchwork-Hint: ignore
Message-Id: <20260418220218.A38FF81DF3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libjxl: security bump to version
 0.11.2
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ccf69ab8c4cedfe5a1fdb7e5d90b962045064444
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For release notes since v0.11.1, see:
https://github.com/libjxl/libjxl/releases/tag/v0.11.2

Fixes:
https://www.cve.org/cverecord?id=CVE-2025-12474
https://www.cve.org/cverecord?id=CVE-2026-1837

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/libjxl/libjxl.hash | 2 +-
 package/libjxl/libjxl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libjxl/libjxl.hash b/package/libjxl/libjxl.hash
index 56d1909110..5e76f0ee7f 100644
--- a/package/libjxl/libjxl.hash
+++ b/package/libjxl/libjxl.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  1492dfef8dd6c3036446ac3b340005d92ab92f7d48ee3271b5dac1d36945d3d9  libjxl-0.11.1.tar.gz
+sha256  ab38928f7f6248e2a98cc184956021acb927b16a0dee71b4d260dc040a4320ea  libjxl-0.11.2.tar.gz
 sha256  8405932022a556380c2d8c272eff154a923feb197233f348ce5f7334fb0a5ede  LICENSE
 sha256  91915f8ae056a68a3c5bdf05d9f6f78bb6903e27a8ca3a8434c9e4ac87300575  PATENTS
diff --git a/package/libjxl/libjxl.mk b/package/libjxl/libjxl.mk
index 18bebad662..b877e42d35 100644
--- a/package/libjxl/libjxl.mk
+++ b/package/libjxl/libjxl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBJXL_VERSION = 0.11.1
+LIBJXL_VERSION = 0.11.2
 LIBJXL_SITE = $(call github,libjxl,libjxl,v$(LIBJXL_VERSION))
 LIBJXL_LICENSE = BSD-3-Clause
 LIBJXL_LICENSE_FILES = LICENSE PATENTS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
