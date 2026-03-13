Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11840107BCFE
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 07:49:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F80F40FF2;
	Sat, 14 Mar 2026 07:49:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jXgibNpnS3rZ; Sat, 14 Mar 2026 07:49:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1E4540FE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773474578;
	bh=H6nRn0zUhGGCbO64IwT+PNETuz2ShZLU3VnxlYyfHzA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=K6UQdKvxYLG3d/UjZT4qyMr5r3Xn8w1nlzanGLea2Iv9HSkzEXZaIfUU3U4JOJ04c
	 Qot0Li7z4QjGyCKL6iQS6JH+zfdDjEUv5b0faBn/qjH+XDaFr0Ccz0hrUgWVAVgFFJ
	 0p2oGFINOjRRD20e/72hXMsptWBeBo3Ep1VzNk38GJal/fOyWkfoTZpiQVBksRfDRg
	 ecRVP1w6UzLkRS7syeuVu8Z2ChRaVZxfg4qCSDomjucLzi8Hu/k8ey8tedetlwKwk1
	 nNNufGj2Z2WYQI1afVv3u1bU0LIS20YEHh7UeVYTIt4h7KtVPPdEoW4b+BuZsQxpKx
	 yS5kFSVqPyzjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1E4540FE9;
	Sat, 14 Mar 2026 07:49:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C8ED4201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B291C822C5
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:49:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OsMCobDIJlXA for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 07:49:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D16E822C0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D16E822C0
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:49:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B2A91818DC; Sat, 14 Mar 2026 07:49:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 16:01:05 +0100
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 2ea20189606aad892e2b75fbcdb2915bd265bcee
X-Git-Newrev: 69c4221f25fc7f854e440eebe381540193438890
X-Patchwork-Hint: ignore
Message-Id: <20260314074935.B2A91818DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/freetype:
 security bump version to 2.14.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/69c4221f25fc7f854e440eebe381540193438890
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Release notes:
https://sourceforge.net/projects/freetype/files/freetype2/2.14.2/

Fixes CVE-2026-23865: https://seclists.org/oss-sec/2026/q1/253

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 6c3933d14bc6b8622733f1ada788c168ba9f8775)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/freetype/freetype.hash | 6 +++---
 package/freetype/freetype.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freetype/freetype.hash b/package/freetype/freetype.hash
index 2c6ab20e19..520e6c2bcf 100644
--- a/package/freetype/freetype.hash
+++ b/package/freetype/freetype.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/freetype/files/freetype2/2.14.1/
-sha1  20f7a9a3e2996aab82b0648e82d49a78e8813bab  freetype-2.14.1.tar.xz
-sha256  32427e8c471ac095853212a37aef816c60b42052d4d9e48230bab3bdf2936ccc  freetype-2.14.1.tar.xz
+# From https://sourceforge.net/projects/freetype/files/freetype2/2.14.2/
+sha1  28200b8f8df5a524f476bdacb20f05da1c33280c  freetype-2.14.2.tar.xz
+sha256  4b62dcab4c920a1a860369933221814362e699e26f55792516d671e6ff55b5e1  freetype-2.14.2.tar.xz
 
 # Locally calculated
 sha256  bd36c8b474855fa294c2ec5c184544478ef3720aad37d65a6296a4f264fd2d3b  LICENSE.TXT
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 00743fe358..fbf9d13235 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREETYPE_VERSION = 2.14.1
+FREETYPE_VERSION = 2.14.2
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.xz
 FREETYPE_SITE = https://download.savannah.gnu.org/releases/freetype
 FREETYPE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
