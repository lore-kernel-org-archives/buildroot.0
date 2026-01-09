Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D1CD2F32D
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B297A83870;
	Tue, 13 Jan 2026 19:40:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vQUug-DheiYW; Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64B3E83077
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333234;
	bh=5QRhcnCrYI42rn4u2oYhX5qt2N6o+Ll4JIIj6o/4020=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=L55Y6BJC5sZDdLynCpEi0xfLYvbPGH9HyBTPw87UzUAyuy45kv/bsFOK0iFwdUUU/
	 Po9DToqLAlDVgcORXK0vl/PwePw6cfDvgaodzZBEW3aLw+jF4WwnyptAU0rCssuCVy
	 GR6Dbw0Jl1v9ZfW34USS5N5gEqOmgj+HiAQVcPIyR5O05fHYvY3Sp+B6H/oinQWFvY
	 KcrY+igcoJuicA2Ff2w98H4JRhQk/D8xIGIKUBuiOgsttG8kcXse0guuWlgegWUCAQ
	 VrvhTUWrM5CUrhL5foRkTVnpWsH6lfPoVC0A/rySzOhBNTTTQKqTiMAMx+7rkGyAI3
	 B+WfhEqsktm1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64B3E83077;
	Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E5752CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 753F6406DF
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9cTnU55dht1K for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:40:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B865940373
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B865940373
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A7DF48111F; Tue, 13 Jan 2026 19:40:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:00:35 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 5eca2fdcad6d42ae1ea9f57d63b681bbd1289a0d
X-Git-Newrev: 7b360bde0d9a0b12d52b49b8830e7b4b98c640f3
X-Patchwork-Hint: ignore
Message-Id: <20260113194031.A7DF48111F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] packages/linux-tools:
 perf: enforce PKG_CONFIG_LIBDIR
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
Content-Type: multipart/mixed; boundary="===============4358897368931997044=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4358897368931997044==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=7b360bde0d9a0b12d52b49b8830e7b4b98c640f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

For kernel patched with 440cf77625e3 ("perf: build: Setup
PKG_CONFIG_LIBDIR for cross compilation"), if neither PKG_CONFIG_LIBDIR,
PKG_CONFIG_PATH nor PKG_CONFIG_SYSROOT_DIR are provided, the perf
Makefile while try to set some default value for PKG_CONFIG_LIBDIR,
which will not point correctly to buildroot staging directory. This
issue will lead for example to a failure to find libtraceevent even
if it is correctly enabled and installed in the staging dir, and so it
will make perf fail to build.

Make sure to call the perf make command with PKG_CONFIG_LIBDIR variable
set and pointing to buildroot staging area to make sure to properly
detect perf dependencies.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f784c823ef8357aa36828342f83d5fd59995937e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/linux-tools/linux-tool-perf.mk.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index 1e19ee7f1c..3238948d76 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -23,6 +23,7 @@ PERF_MAKE_FLAGS = \
 	JOBS=$(PARALLEL_JOBS) \
 	ARCH=$(PERF_ARCH) \
 	DESTDIR=$(TARGET_DIR) \
+	PKG_CONFIG_LIBDIR="$(STAGING_DIR)/usr/lib/pkgconfig" \
 	prefix=/usr \
 	NO_GTK2=1 \
 	NO_LIBPERL=1 \

--===============4358897368931997044==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4358897368931997044==--
