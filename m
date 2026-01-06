Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D054D0D14B
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81DCF412CE;
	Wed,  7 Jan 2026 18:01:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MZ3kIMPWO4Rf; Wed,  7 Jan 2026 18:01:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 825EF408A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808906;
	bh=bI0bPDWmg8QokaMjhI8bGk7SsnUrGOA+0dW1U9SgD78=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=B5447BaIwdkj9KXqwV7It6Gz4a7XOwz6zqGpd6JyQ5KN8QDoaKkK1DGxQz+IiUbF1
	 3utN0KZFBu9Pk5BAJPwmNYJPhwqe4Lg6HCvxGsyJp+nqTulr4P2rk6BaOFjg1greUD
	 461S+VNkl5fNyJrQJFMhFt61zJHjNlPaRdUGMAcferF92fBQ0pjnVwAT/WRxGhnZNZ
	 SOM6cJbjeCWi9DOiQwCZVXS/+Tj30hZjDxefV+pAT8OwncjN6/jOyAu7shE+1qQTGL
	 NpR6hzMw71L4kESzDxUExg5ftxGOfets0B3rv/r8hpLM8P/Pzz5ICpBShh/yX+rirl
	 CATAn/3eeA8Kw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 825EF408A0;
	Wed,  7 Jan 2026 18:01:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0455125B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7568B80F37
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l7wrttu0n80r for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2F2180EB2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2F2180EB2
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B0BBE873D4; Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:36:04 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: c33f9a2871f5dc2b5b6abcf28f81411b3400a924
X-Git-Newrev: 3bfab7709d8bbe43b906174971783fd7caec71b4
X-Patchwork-Hint: ignore
Message-Id: <20260107180111.B0BBE873D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/vim: use more
 conventional $(MAKE) construct
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

commit: https://git.buildroot.net/buildroot/commit/?id=3bfab7709d8bbe43b906174971783fd7caec71b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

In Buildroot, we more commonly do:

   $(MAKE) -C $(@D)/src

than:

   cd $(@D)/src; $(MAKE)

so let's adopt this more conventional style.

This coding style in vim.mk dates from when the package was introduced
by Peter Korsgaard back in 2010.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 21e613753ec2fc931c4f7a95ab5c0019bd30636c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/vim/vim.mk | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 36015c6085..2bf01fa8bd 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -48,17 +48,15 @@ endif
 
 define VIM_INSTALL_TARGET_CMDS
 	$(RM) -f $(TARGET_DIR)/usr/bin/{ex,view,rvim,rview,vimdiff}
-	cd $(@D)/src; \
-		$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) installvimbin; \
-		$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) installpack; \
-		$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) installtools; \
-		$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) installlinks
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src DESTDIR=$(TARGET_DIR) installvimbin
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src DESTDIR=$(TARGET_DIR) installpack
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src DESTDIR=$(TARGET_DIR) installtools
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src DESTDIR=$(TARGET_DIR) installlinks
 endef
 
 define VIM_INSTALL_RUNTIME_CMDS
-	cd $(@D)/src; \
-		$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) installrtbase; \
-		$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) installmacros
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src DESTDIR=$(TARGET_DIR) installrtbase
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src DESTDIR=$(TARGET_DIR) installmacros
 endef
 
 define VIM_REMOVE_DOCS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
