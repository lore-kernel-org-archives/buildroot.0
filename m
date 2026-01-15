Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6113DCCF2D4
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 09:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1843681BBD;
	Mon, 19 Jan 2026 09:58:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dxdSax6AHAgg; Mon, 19 Jan 2026 09:58:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4253881BC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768816732;
	bh=TtklOHVoljxCD3BGRFo/+XdtsoUMy3l/j92r9igTw1g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OQXjmfzsuo9jmR9IIxQwsZzOyjALvWgIxNaEXMuWSYuJDDeIhA2pvbocuU8+p+VyG
	 GwOz+QGutbabccmxC/xwPni1xAjcfpYxsp7CsjxOnKk8Q9pXh83tibS6fLwJzKcK0i
	 krMGBJicY+qJ2hdyN14JNJlG5rsJ7gPQSfCREGMEnU8W3xnc6QCUxhdYP/GpSwUL6P
	 kJjItlwRr3MinDndi/qEy04X1iC4ixb2HK9ArF5ent14JIterStHxCZVU+z7Ka77A4
	 9v3PIWgkcKTFWAEtMVwIhfy6e4TyCGrdTb2/tWjpXrE0faafxvGIDmlDEbmqROzynQ
	 N3iiGzTHrQ5CQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4253881BC6;
	Mon, 19 Jan 2026 09:58:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D7CBE2CE
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE46A81BD4
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:58:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3eOP-uonnTuK for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 09:58:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 710C881BBD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 710C881BBD
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:58:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 66B5B88673; Mon, 19 Jan 2026 09:58:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Jan 2026 08:22:59 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 55db4c933316ff2ab5a0fce6f2ae35c76cdd71eb
X-Git-Newrev: f3cd116dbdfad2fc63610a4590600326cff422bd
X-Patchwork-Hint: ignore
Message-Id: <20260119095849.66B5B88673@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] uboot: allow building
 versions >= 2025.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=f3cd116dbdfad2fc63610a4590600326cff422bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

With upstream commit a239b0b0b6db ("Add symlink from gpl-2.0.txt to
a COPYING file"), COPYING is now a symlink to Licenses/gpl-2.0.txt,
causing the install command in UBOOT_COPY_OLD_LICENSE_FILE to fail
because the source and destination refer to the same file. To avoid
this, copy the license file only if Licenses/gpl-2.0.txt does not
already exist.

Link: https://gitlab.com/buildroot.org/buildroot/-/commit/128c26f2875dd60ed5fafe25f63b3da11bb79f60
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 boot/uboot/uboot.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 2796b0a310..0d77340f85 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -307,7 +307,7 @@ endif
 # prior to u-boot 2013.10 the license info was in COPYING. Copy it so
 # legal-info finds it
 define UBOOT_COPY_OLD_LICENSE_FILE
-	if [ -f $(@D)/COPYING ]; then \
+	if [ -f $(@D)/COPYING ] && [ ! -f $(@D)/Licenses/gpl-2.0.txt ]; then \
 		$(INSTALL) -m 0644 -D $(@D)/COPYING $(@D)/Licenses/gpl-2.0.txt; \
 	fi
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
