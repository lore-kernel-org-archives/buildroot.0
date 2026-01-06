Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65317D0D156
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:02:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23EB241363;
	Wed,  7 Jan 2026 18:02:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lJj4Jp3T5UnM; Wed,  7 Jan 2026 18:02:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B57641395
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808927;
	bh=xaPi5/4Hdh9w8FPSu5bQ9K0/MzCwhFt5bGBf6qNGHT8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KqujuLpZgp3VhMoR6SsZ1pv9C7gTzfcis9PFZBlczntFLRk3FbpEj2F+pjshoysGx
	 wL35YNPC0CX/XQ2g5q9fnVclfv1H/peubA7a8EK6Q0l6C50xuYkGv8oMRVUnygSd0z
	 Saoy9qxGeI9DCkB8OFNW1MDb8FG/F6vvm+fM6rDrKrYAM512sFW52E98ZnvdZnPiUJ
	 Z5DWVXSEPmd94aRs5hjhlrz/s4AcbEle/QDLMX86nIlUaG763jKSTgKU/mZpKGRpL5
	 qNUdIVDdzo5r1OAfTh0V01iXBiKH6LnAyCQaRjgHEtT/OztXwnMIVsmzILSBSQZ3ZN
	 CRuRtBDk2q4sg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B57641395;
	Wed,  7 Jan 2026 18:02:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D98925B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C28A040B42
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xbluVIXgw3RO for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5F1B40A36
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5F1B40A36
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A467A87C86; Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:35:54 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 8718e8be5ead0a4a3b53c5f3da21c079f501c281
X-Git-Newrev: c33f9a2871f5dc2b5b6abcf28f81411b3400a924
X-Patchwork-Hint: ignore
Message-Id: <20260107180111.A467A87C86@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/vim: fix
 reinstallation
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

commit: https://git.buildroot.net/buildroot/commit/?id=c33f9a2871f5dc2b5b6abcf28f81411b3400a924
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

While not very common, it is nice when package re-installation
works. Unfortunately the "installlinks" target of vim installs links
with "ln -s", causing a package reinstallation to fail with:

cd /home/thomas/buildroot/br/output-all/target/usr/bin; ln -s vim ex
cd /home/thomas/buildroot/br/output-all/target/usr/bin; ln -s vim view
cd /home/thomas/buildroot/br/output-all/target/usr/bin; ln -s vim rvim
cd /home/thomas/buildroot/br/output-all/target/usr/bin; ln -s vim rview
cd /home/thomas/buildroot/br/output-all/target/usr/bin; ln -s vim vimdiff
ln: failed to create symbolic link 'ex': File exists
ln: failed to create symbolic link 'view': File exists
make[2]: *** [Makefile:2749: /home/thomas/buildroot/br/output-all/target/usr/bin/ex] Error 1
make[2]: *** Waiting for unfinished jobs....
make[2]: *** [Makefile:2752: /home/thomas/buildroot/br/output-all/target/usr/bin/view] Error 1
ln: failed to create symbolic link 'rvim': File exists
ln: failed to create symbolic link 'rview': File exists

To fix this, we remove the target links before proceeding with the
installation.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 67e84345c156170fa01103289f1d255a74ad830d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/vim/vim.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 4297bdd198..36015c6085 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -47,6 +47,7 @@ VIM_CONF_OPTS += --disable-selinux
 endif
 
 define VIM_INSTALL_TARGET_CMDS
+	$(RM) -f $(TARGET_DIR)/usr/bin/{ex,view,rvim,rview,vimdiff}
 	cd $(@D)/src; \
 		$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) installvimbin; \
 		$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) installpack; \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
