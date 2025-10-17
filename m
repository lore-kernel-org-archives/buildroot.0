Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76906CCD195
	for <buildroot@archiver.kernel.org>; Fri, 17 Oct 2025 10:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE41A40861;
	Fri, 17 Oct 2025 10:36:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Syz0Ua1lfSlh; Fri, 17 Oct 2025 10:35:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E33F40585
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E33F40585;
	Fri, 17 Oct 2025 10:35:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D72CDEC
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 10:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD6AA40078
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 10:35:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qst4w_X8Cvmx for <buildroot@buildroot.org>;
 Fri, 17 Oct 2025 10:35:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8B2EA40090
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B2EA40090
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8B2EA40090
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 10:35:53 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id E05C331E0CF3; Fri, 17 Oct 2025 12:35:48 +0200 (CEST)
Date: Fri, 17 Oct 2025 12:35:48 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aPIcBESMsMyWuILS@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.43+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1760697349; bh=Q5pWcocy+1uRlE1gCLoh2UvGeO1Ak2lg0+GoPXbRzlA=;
 h=Date:From:To:Subject:From;
 b=oG0FmbJ/8FdMg9dY3ug+fg6oOoKTOl5xaNOL8tSX/sO71Ndw79+9GI/i/EredEo6A
 /YVsEj0r2sA5VGbW75o8yZC9FfoBQYsR/Nk1e7Iy0C+ppCR991HYXvP5Lptlo53fsi
 qi9NTqplQMscT975t3OEqwsqaMvqTdFC/DY/JOcW5g/UNwo9KEei8pKBHAiJ+XyNpF
 2tZl9YEEh1S4mJMWeFTxiGQIXWnj1Vxoit5Fz8f8Ugcn0po/0/btPx/idw5qNfuQ8f
 45NbIIrhpI5NZ9WPTNGIYRNJuvjigKAqgn+p7NUCIGSvYniDlzojY2aJ6GvYzER0Ht
 Jt7OQuYZnJucg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=oG0FmbJ/
Subject: [Buildroot] [PATCH v2 1/6] package/fontconfig: disable doc and
 tests for host
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Debian 13 doc generation fails. Disable it like for
the target.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/fontconfig/fontconfig.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
index d9f5dbefad..639f6ed51d 100644
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -16,6 +16,10 @@ FONTCONFIG_LICENSE = fontconfig license
 FONTCONFIG_LICENSE_FILES = COPYING
 FONTCONFIG_CPE_ID_VALID = YES
 
+HOST_FONTCONFIG_CONF_OPTS = \
+	-Dtests=disabled \
+	-Ddoc=disabled
+
 FONTCONFIG_CONF_OPTS = \
 	-Dcache-dir=/var/cache/fontconfig \
 	-Dtests=disabled \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
