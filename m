Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C23CD6E4C
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 09:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AE8E42E60;
	Sat, 30 May 2026 09:04:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SvGhPCoswT3p; Sat, 30 May 2026 09:04:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 457A942E64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780131880;
	bh=gM8BNW5z4cpZ75RZqCWqxKdMIajXHmhYmr9NrPOt8ns=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BB/jB08nhObeLRd9kdCle0+raTm47Zpp7fL5L0RZEMfl8QNYmjjJBG8KD0/Dw496X
	 HAc1zCdRWmH9lc49EnI8srny4AayfQ31PdMZwnt5UUX+kFzZn4hJItgDVt9FjNuaL1
	 MAwJrQdiztSIx6m961EEVuTEX2FVvMGV5RxvP08qzOv4k3b66Jw/u1kdLqWgqInSS9
	 qUZmalne1Q6jM4Rby0KkcZqKYlsA8XHHk8efQ6fqMaE4rOMXL7QAXhIDDC4gnB5T++
	 3dA3xBNdNhJUpj6hwTrluPE9HFhUcwZE3IGpd6L/X7K+DuVXMtpkfG+QKeiKs8JVsl
	 LxCz0EfJii5WQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 457A942E64;
	Sat, 30 May 2026 09:04:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5BD96D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D00542DE8
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:04:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IBY_9kx5QdKo for <buildroot@buildroot.org>;
 Sat, 30 May 2026 09:04:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A9074290C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A9074290C
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:04:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8301986C8A; Sat, 30 May 2026 09:04:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 10:59:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 25601df83be78a3d3539eb1cb6f23d818b656472
X-Git-Newrev: 2c3bc6609b1d08f0953f85f7101da68568d96e1c
X-Patchwork-Hint: ignore
Message-Id: <20260530090421.8301986C8A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cups-filter: update CPE vendor
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2c3bc6609b1d08f0953f85f7101da68568d96e1c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The CPE "cpe:2.3:a:openprinting:cups-filters:*:*:*:*:*:*:*:*" is valid
for this package.

See the GHSA [1] and the associated CVE [2].

[1] https://github.com/OpenPrinting/cups-filters/security/advisories/GHSA-893j-2wr2-wrh9
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-64503

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cups-filters/cups-filters.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index dcfb2e9500..f2b85aa9d5 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -8,7 +8,7 @@ CUPS_FILTERS_VERSION = 1.28.17
 CUPS_FILTERS_SITE = https://github.com/OpenPrinting/cups-filters/releases/download/$(CUPS_FILTERS_VERSION)
 CUPS_FILTERS_LICENSE = GPL-2.0, GPL-2.0+, GPL-3.0, GPL-3.0+, LGPL-2, LGPL-2.1+, MIT, BSD-4-Clause
 CUPS_FILTERS_LICENSE_FILES = COPYING
-CUPS_FILTERS_CPE_ID_VENDOR = linuxfoundation
+CUPS_FILTERS_CPE_ID_VENDOR = openprinting
 
 # 0001-beh-backend-Use-execv-instead-of-system-CVE-2023-24805.patch
 CUPS_FILTERS_IGNORE_CVES += CVE-2023-24805
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
