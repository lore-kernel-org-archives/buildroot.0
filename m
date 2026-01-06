Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E43D0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E131E80F46;
	Wed,  7 Jan 2026 18:02:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qNWxH3_AAEnk; Wed,  7 Jan 2026 18:02:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CA1681416
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808951;
	bh=aUn1u4FnXjW09VcvG/KbB8yQtWvDBXE28Gm5fpjLLR0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=W713/XhaC7xvlLQJUq3QSKZP7Fs7XT97H9qR31JPImrAqo0vFL3sTH2V4JF9KBgKM
	 9BVgsRTGiCIFzbyKQhdYNh+QjVfBiQVeDEk+HoBrt0aGW+vkqF1/PuITR4s1gllLog
	 OMSN4p65fdPfjnGiiZ9S5z8Ef7nT3LHYAWNDEWny7Y8uSNjMP0kxWHib4TZJgtA13R
	 zCif/cgUxl0Gg7g+GiPTZniTIBhVcNDF9GbxsqXz3ataVkyaPj3tivMBEZoQugFmcH
	 HMCB184nKrnXWChVmR/Y9rQg6aTgMS0IKdLXhM+QDWTIn0FOARQmtXGLeY+a9tL4+a
	 Cz4zFe5stqoSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CA1681416;
	Wed,  7 Jan 2026 18:02:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C1B225B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 09356608D0
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SmMDREDedp9i for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8F846087B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8F846087B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B86A6811C5; Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:09:34 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 070d7302f213317d95eea5b9821aac0dd37852c3
X-Git-Newrev: e985152990110c3fc21c6de205abcee1039c077f
X-Patchwork-Hint: ignore
Message-Id: <20260107180115.B86A6811C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/mupdf: add
 CVE-2024-2425{8, 9} to IGNORE_CVES
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e985152990110c3fc21c6de205abcee1039c077f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Buildroot commit [1] removed the IGNORE_CVES entries for
CVE-2024-24258 & CVE-2024-24259 because they referenced a patches no
longer existing.

Those IGNORE_CVES entries are still required because the CVEs reference
the exact mupdf version Buildroot is using.

Re-introduce those IGNORE_CVES entries with an updated comment instead.

[1] f2e442a14d package/mupdf: remove stale IGNORE_CVES

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a8e7e6c85289f0eee1b2bf13da2c83dbfb07ef65)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
