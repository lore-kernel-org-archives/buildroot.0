Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41DC8D2F32D
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:42:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F8DC8406B;
	Tue, 13 Jan 2026 19:42:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qYRD-lzxfG15; Tue, 13 Jan 2026 19:42:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDE3984091
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333325;
	bh=wpuJvTiiFnd2Rfg4eLtU2GU1UVM+cvwP5MHBpNmvvqk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JHSvK1HSNBYuE/vHX+wYRkQ4YKPq4/iFy3jQHf8/s99YwJS2hcogaIk2fmIWsoSnj
	 SQz25NA9J6Sp/nQUeYy0UXpzh6uLNDPe/dHnyjkXo7DD4pygdNWsIYGC+uO+Hgze1r
	 qK82HQCon7PEqqJZyISznU15ONlnBlTOaHLOZeG0t3Xcj1UyPZ5LOnNUrN54JFz/N4
	 A2g923ph4iN47SdufuzrMiG+VQ079rmHNE8vJQKR7G7Iq+Igv+vkeD6GRAlmA9j5oE
	 t+uB+Ja4lG4ILTsYPSgtchoViNKhvJbQX7zznkGt9sy39HMD+jMKhJ+aw9r1PVbpTy
	 zclHzcjKFZh4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDE3984091;
	Tue, 13 Jan 2026 19:42:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A5212CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A503406E5
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4BQp3NpuMsH1 for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3510A406EC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3510A406EC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 33F9580840; Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:58:11 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: e97f1cfe3573b221ddb26e8744da00c702e86206
X-Git-Newrev: 01e73806f161e9f1e1d0f658b8ed17b34f75b426
X-Patchwork-Hint: ignore
Message-Id: <20260113194034.33F9580840@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/fontconfig:
 disable doc and tests for host
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

commit: https://git.buildroot.net/buildroot/commit/?id=01e73806f161e9f1e1d0f658b8ed17b34f75b426
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

On Debian 13 doc generation fails. Disable it like for
the target.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 20f31f90ad55b3e0654b6bc1b1ed76e7a1e6032e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
