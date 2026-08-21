Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3846C5DF97
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 22:04:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EBC580ED9;
	Fri, 21 Aug 2026 22:04:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EjeLI_Av9gxd; Fri, 21 Aug 2026 22:04:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787349871;
	bh=ZtLj08soIlpj0M0xdwlsh5W7INaoW1/RcShvrgfgj9s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ts2QbaFUH1a+YAUEmlqhBbwva+eGMNxaVDASHHtPQJ9uOFBqxrrtK4Rco/LKIrbwK
	 F51B3pRN86BETcoA9SJ1ovHS/9vhZMEsoHf8/sekFAdLhWS1NDOmoT0UVNDkyzcmVc
	 Cl3QiN31IZ0bX+xRFk+JOeuqs9f9qq5VcC0t5rOVuaEIR9yH2efDOSBJ9qXtEYon9X
	 klM3xGlUJPSBw4T8BBvdp//qeTgdfsXYfwuPhCO85FcEj9ne5EvRCQF5sHjHEvRCTs
	 xogSFxkSaeXSgj9cRXKBxAYfp6KZ1DTLV8k36v7hleGWWlJCCIFPWhkFPknigxL9Fx
	 Ouac0LcJi4TXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EF5E812EC;
	Fri, 21 Aug 2026 22:04:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F61D118
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 22:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10F2A404F7
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 22:04:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rU4hbO9ptWUE for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 22:04:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6BE5A404EF
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 22:04:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B5C978E499; Fri, 21 Aug 2026 22:03:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Aug 2026 23:43:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b088e5dbe43d1c31add4b99cd05b8ba71228761a
X-Git-Newrev: d21a81ef8c2969d46fd3c569936f056dfb7d1abd
X-Patchwork-Hint: ignore
Message-Id: <20260821220336.B5C978E499@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/distribution-registry: needs NPTL
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d21a81ef8c2969d46fd3c569936f056dfb7d1abd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

distribution-registry calls pthread_getattr_np() which is only available
with NPTL; i.e. always available with glibc (where it originates from,
since 2.2.3), always available with musl (which has had it since 0.9.10
in 2013), and only available when uClibc has NPTL (since 1.0.0 in 2015).

Fixes: https://autobuild.buildroot.org/results/9395500a8baee6c6142f96d7bc97e81725c2e754/

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/distribution-registry/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/distribution-registry/Config.in b/package/distribution-registry/Config.in
index af650171b1..3db2a8d906 100644
--- a/package/distribution-registry/Config.in
+++ b/package/distribution-registry/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_DISTRIBUTION_REGISTRY
 	bool "distribution-registry"
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL  # pthread_*_np()
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
