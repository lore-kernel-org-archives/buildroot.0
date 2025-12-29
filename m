Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCD4E92724
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 14:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 633FE407F0;
	Mon, 29 Dec 2025 14:07:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0XSvp92GvBbV; Mon, 29 Dec 2025 14:07:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC41F404A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767017270;
	bh=VukjECvMg5LJTq2bNNkLlcRuW+Okj70fmkMZi/C5Axg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jq9FWPZPWWSPLD+vXLT3wsV+AGPlTZDIu576BBdil3u+DC7kS+8a0l+l/rBpDw6Ua
	 +Tx4N6mpXIfb6I5oL9mdJib1/BpxEjLh+quAFWeHm6h86+ha3yc/qZ+o6ra5Qogoib
	 PR/lodGB2kAP3eJIR88j6cu9e9O8OQH3N510UmvrrZNGQGqMMzwUq0If2e65PvHMqV
	 i54dB80cme8RkdnZEeFwg+qRmJj5GlLyPK1uawGaObLg5SlIr3j6sv6FqOlfF0djrb
	 Pwmn+KkhZHZjk1vv/95WdKn/SoubECeeEcUAEcWCgWN1q+B610jQ2WVdD3oEK/w13D
	 E9HSzACJ2MrkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC41F404A8;
	Mon, 29 Dec 2025 14:07:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 266ECB9
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:07:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE13260854
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:07:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4nHo4wYn9lWl for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 14:07:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E67F860AED
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E67F860AED
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:07:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E46B782DC9; Mon, 29 Dec 2025 14:07:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 15:06:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f276648692b898aed8b32d4887a8372209b3cd2c
X-Git-Newrev: a8e7e6c85289f0eee1b2bf13da2c83dbfb07ef65
X-Patchwork-Hint: ignore
Message-Id: <20251229140743.E46B782DC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mupdf: add CVE-2024-2425{8,
 9} to IGNORE_CVES
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a8e7e6c85289f0eee1b2bf13da2c83dbfb07ef65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit [1] removed the IGNORE_CVES entries for
CVE-2024-24258 & CVE-2024-24259 because they referenced a patches no
longer existing.

Those IGNORE_CVES entries are still required because the CVEs reference
the exact mupdf version Buildroot is using.

Re-introduce those IGNORE_CVES entries with an updated comment instead.

[1] f2e442a14d package/mupdf: remove stale IGNORE_CVES

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mupdf/mupdf.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/mupdf/mupdf.mk b/package/mupdf/mupdf.mk
index 9eecb84232..57501ab954 100644
--- a/package/mupdf/mupdf.mk
+++ b/package/mupdf/mupdf.mk
@@ -21,6 +21,12 @@ MUPDF_DEPENDENCIES = \
 	lcms2 openjpeg \
 	zlib
 
+# Fix is in libfreeglut, but CVE applied to mupdf 1.23.9.
+# Buildroot libfreeglut is >3.4.0 then is not affected.
+MUPDF_IGNORE_CVES = \
+	CVE-2024-24258 \
+	CVE-2024-24259
+
 # mupdf doesn't use CFLAGS and LIBS but XCFLAGS and XLIBS instead.
 # with USE_SYSTEM_LIBS it will try to use system libraries instead of the bundled ones.
 MUPDF_MAKE_ENV = $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
