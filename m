Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56BEDE8782D
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 13:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7CF0814C0;
	Tue,  3 Feb 2026 13:45:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4iFIwttJav-q; Tue,  3 Feb 2026 13:45:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 788D381E64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770126324;
	bh=XF8gGdVMK62VgJIEoTM0JwI4uWmZKZf3PRwYHyojuco=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RZ4DjQklIkZlbUPzhEH7GfYi0AibvuyaAmiW7SzzCLxt28FzlM93Sa3gCsW5DUI2J
	 AIXKp+UbeSQw57G7T5Q2Fn5OgKh6yu0prxPb/w67ofqi4jrF/iqCcXiiTkFSgCzOJx
	 0g7Oi6DMvYYebcV4O8RGbtOeRmInBP1TJ5BNATNX84ZQoILA3da2r1zneJLNTtlbrL
	 V63fTCKgIoQH/qVGy7ivJ9Ij5DFiGDfkJp4OMcNZhdsipj939Uz1BPIrbDE1knbeGC
	 7RDwGYloD4AJbHUnxNhpB/D2BlrloJfWwntrmxeJHKLjVkFB1kAk2DOPCT7SIr+kin
	 +NcIZnMU1eJ7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 788D381E64;
	Tue,  3 Feb 2026 13:45:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E7BA41A6
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D11C540BB3
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:45:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jveWQp1ukVZi for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 13:45:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1372A40B1F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1372A40B1F
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:45:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F016886692; Tue,  3 Feb 2026 13:45:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 14:44:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7ed80ecec1cf2653803e5bbbec48daaeb6e6c056
X-Git-Newrev: ef5293307478bd9487c890facbb8de85240d4156
X-Patchwork-Hint: ignore
Message-Id: <20260203134518.F016886692@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libucl: add CPE
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ef5293307478bd9487c890facbb8de85240d4156
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The CPE `vstakhov:libucl` is a valid CPE for the package libucl.

See the latest CVE: CVE-2025-6499 [1] that reference the upstream
repository.

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-6499

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libucl/libucl.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libucl/libucl.mk b/package/libucl/libucl.mk
index bf5e368f2b..7b0e5b8e8c 100644
--- a/package/libucl/libucl.mk
+++ b/package/libucl/libucl.mk
@@ -12,6 +12,8 @@ LIBUCL_LICENSE = BSD-2-Clause
 LIBUCL_LICENSE_FILES = COPYING
 LIBUCL_DEPENDENCIES = host-pkgconf
 
+LIBUCL_CPE_ID_VENDOR = vstakhov
+
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 LIBUCL_DEPENDENCIES += libcurl
 LIBUCL_CONF_OPTS += --enable-urls
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
