Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 237E7E6FE2B
	for <buildroot@archiver.kernel.org>; Tue, 23 Dec 2025 20:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C623C606E5;
	Tue, 23 Dec 2025 20:41:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OK_aNR3Oc9YF; Tue, 23 Dec 2025 20:41:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D313360710
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766522483;
	bh=O79dKmHM6xmsWLRJejsEkdRqGNspgPgP+y32Rbs25GA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=L+nvN8TSq+VeiKdfTiLF26WSIE5eFEzbkhJTlBMqkm3p3VJTTXdfOn21QE81lTR5w
	 eMehEUNwCXXt4ix4ZaYq8wr6kiM3sjJRamFkZtWplSvnyrG2/N0Il584UJseIe1iqq
	 NO58ZOxYh7PLAxVOvXHgoEVcOcqbb/y4JtxNQTVUJtUquwB7IYje/NkkdbuNYr27fE
	 6vSyuDXKTBY2I4WKQkjwGMeqaH/AiZihBLoJyQZlSAQMZN2Xd6iUjiR9tdWqK7f8xx
	 jKgFk5nRrbMLc/rq7KWiSf5E8ha83GF1Bv1Ta4l+pN7cy5RUN9vkjwDLd8+Pbv6mfu
	 SrrpDbb1TTGMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D313360710;
	Tue, 23 Dec 2025 20:41:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F1DE5BE
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 20:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3D4840789
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 20:41:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gMaU2yNsqIq3 for <buildroot@buildroot.org>;
 Tue, 23 Dec 2025 20:41:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4223940024
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4223940024
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 20:41:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 39B5F8760F; Tue, 23 Dec 2025 20:41:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 23 Dec 2025 21:37:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 57395ccf91bc383770e7ba8e15cc3765c0a5fabd
X-Git-Newrev: 67e84345c156170fa01103289f1d255a74ad830d
X-Patchwork-Hint: ignore
Message-Id: <20251223204121.39B5F8760F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vim: fix reinstallation
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

commit: https://git.buildroot.net/buildroot/commit/?id=67e84345c156170fa01103289f1d255a74ad830d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 package/vim/vim.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 2ecab0652f..43c9bfc0f1 100644
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
