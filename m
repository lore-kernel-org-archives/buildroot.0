Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DD0D26D85
	for <buildroot@archiver.kernel.org>; Fri,  9 Jan 2026 18:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2141740C6F;
	Fri,  9 Jan 2026 18:37:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v07AjAu54KlM; Fri,  9 Jan 2026 18:37:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BE1B40C3C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767983859;
	bh=NNLjwXROJFluXtDjz3Tt0pMcOhoxRs3dGYlPYnhaymo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AHnsc3bDGahLebL21hw573mYxLQD7447nwrC81A8b3kKmVf++9xCMUOtJh5Zdcmpv
	 k5ZTE8njTq6tbap5MbnvM78RLfb6zVhyvKuGZ49BSQ8ZTEflfdFedCEqTxui/ERYST
	 7i9XUwoA/aP9yfGQeTs0mubJ8HjMqD4zWPr0usaJnM2eGyW6sUUUOfi/v61SwxGmyS
	 eO6ZbT2NochUukcODJ8bnAOVvmUrVHIcwZTIawWdqBha+PbfcEv45ZA5ryEGKeUFHn
	 gx/QeG8aydYsXBGkb02+UWBA2uCKsM54pSXz7WQSTGWSbQFZz+81kPrEBQBAjn4txr
	 5SmJ47+EuDmnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BE1B40C3C;
	Fri,  9 Jan 2026 18:37:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F6E612E
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 18:37:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91E6540018
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 18:37:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JwwFHo8_zfNQ for <buildroot@buildroot.org>;
 Fri,  9 Jan 2026 18:37:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4DD140199
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4DD140199
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 18:37:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D25AB883AE; Fri,  9 Jan 2026 18:37:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 19:32:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fd2555ecfdc682201cc2081d0f9249f70a1f4022
X-Git-Newrev: ca23f860d1d5ed83cfa5eece8911d26a593b2f3e
X-Patchwork-Hint: ignore
Message-Id: <20260109183736.D25AB883AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xen: xen tools need coreutils stat
 at runtime
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
Content-Type: multipart/mixed; boundary="===============6308131613266196069=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6308131613266196069==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ca23f860d1d5ed83cfa5eece8911d26a593b2f3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Xen tools scripts need the stat program from coreutils to work
correctly, and not the one from busybox.
One such example is the /etc/xen/scripts/locking.sh script, which will
cause timeouts for operations such as "xl block-attach", or when
starting a DomU with a disk.

Add the dependency on coreutils to fix this.

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Alistair Francis <alistair@alistair23.me>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/xen/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/xen/Config.in b/package/xen/Config.in
index 70a06f3cbf..e8168ca8c8 100644
--- a/package/xen/Config.in
+++ b/package/xen/Config.in
@@ -35,6 +35,7 @@ config BR2_PACKAGE_XEN_TOOLS
 	select BR2_PACKAGE_ARGP_STANDALONE if !BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_BASH # runtime (scripts)
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS if BR2_PACKAGE_BUSYBOX # bash
+	select BR2_PACKAGE_COREUTILS # runtime (stat)
 	help
 	  The Xen tools can be accessed by the xl command.
 

--===============6308131613266196069==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6308131613266196069==--
