Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35755CD8CA8
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B820385B88;
	Tue,  9 Jun 2026 13:04:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RfdKPZf0pKsM; Tue,  9 Jun 2026 13:04:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3C8A85B69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010249;
	bh=zF63NG3qRdevTl0VSdwsZ0ns6bUfo4By2XOswrMvsiA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=n9+jNahoTGp75LPBK1Q9DdOn5yu8eeST7JtpYrsrsYf/BeWKEDinuSSb8jIT/Tqkk
	 uIfoT0P8w56Yf8E+Utb+5DyNlLkhIIwBRpE6kWdkwlUdP3N1ntltwtDXRpAdxQinN7
	 fA4wF9Y/B4e7G5UPjC7BJKfx2hCAat2FHg4NjEHCdPORL+svhXnZYazN2+ECJXyVF+
	 6xwdu3Dy2hpvpGY+grm9XhOY+++Xvn81GWPQSTTX7JzdGZxrXjpMts31JhMKyE3FSK
	 +r5fi7JpngrwMHOTaWPnSyG94A0O9J+3VYFMOHiLFkl7k7ACtVCYErJ6L9UnyBPsza
	 mykOQF89cQO4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3C8A85B69;
	Tue,  9 Jun 2026 13:04:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5EB93196
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:02:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3C81460C3
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aNMZjfunk9VK for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6176D43B5B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6176D43B5B
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9DC3F87E68; Tue,  9 Jun 2026 13:01:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 15:48:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 045c5270cfdff50d975a2007b1555519afc9b46f
X-Git-Newrev: ceec8746a9e60108b758b1fc0f7f7f6557a5371b
X-Patchwork-Hint: ignore
Message-Id: <20260609130122.9DC3F87E68@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cups-filters: needs autoreconf to
 fix build with gcc 16.x
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ceec8746a9e60108b758b1fc0f7f7f6557a5371b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add comment to clarify that autoreconf is still needed even after the
patches are removed to update ax_cxx_compile_stdcxx.m4 for compatibility
with gcc >= 16.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/cups-filters/cups-filters.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index eaad301c6d..2c682b92f3 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -12,6 +12,7 @@ CUPS_FILTERS_CPE_ID_VENDOR = linuxfoundation
 
 # 0003-libcupsfilters-Fixed-building-with-QPDF-11.x.patch
 # 0004-Updated-code-to-be-built-with-QPDF-12.x.patch
+# ax_cxx_compile_stdcxx.m4 needs to be updated for gcc 16.x (C++20)
 CUPS_FILTERS_AUTORECONF = YES
 
 # 0001-beh-backend-Use-execv-instead-of-system-CVE-2023-24805.patch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
