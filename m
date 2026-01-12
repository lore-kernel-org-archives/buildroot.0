Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C5A5CF45BB
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 18:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 224F860C1A;
	Mon, 12 Jan 2026 18:02:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pYQMPkD7iXMI; Mon, 12 Jan 2026 18:02:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B035460C05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768240951;
	bh=oSwApvZtFn6U1AJ8TuXx6ECD2yy7YZ7u/tQp/0RrWjk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mu1h5GkjzVJK+eEzov+0O+Ox92vmL2ADpe004D2nNl/fp9vNGX62XR2BVWF7GmRLh
	 pOVNu+d4inuTPxwxdmne1e++mtYm0wKfO7o8at3QNXzkjOjXwtAst9OZMkSvngLVIL
	 V4uZM9U95Px9WsQpPcibMQpj6PaQewl8NvtAQTJa9STjBHXMFoW5lApFCTiZnB2tAY
	 2LtNVFb9tyh+hcWtpc0yGz9fSW8bq6n9QaEz1bA4UB3Id/0HC8ERPMm9+DqQe1o+tW
	 kRD7P//6ViB51g3OwRLoWG6CF/HJvWn9RlJJImphlffItRYPbYfd5hDjKCQyBDNLwB
	 jZI1NMisdtAIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B035460C05;
	Mon, 12 Jan 2026 18:02:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7026A231
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 18:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 612CC400C1
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 18:02:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id npyszpohNYK6 for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 18:02:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FA8F40465
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FA8F40465
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 18:02:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7FA9788547; Mon, 12 Jan 2026 18:02:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 19:01:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aa87aafa4b89b70330883d0e79f087bf3dbd319f
X-Git-Newrev: bdeecb18ab3d5a53363d581ab9c991b5f5562571
X-Patchwork-Hint: ignore
Message-Id: <20260112180227.7FA9788547@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-net-ssh2: bump to version 0.74
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

commit: https://git.buildroot.net/buildroot/commit/?id=bdeecb18ab3d5a53363d581ab9c991b5f5562571
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/perl-net-ssh2/perl-net-ssh2.hash | 8 ++++----
 package/perl-net-ssh2/perl-net-ssh2.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/perl-net-ssh2/perl-net-ssh2.hash b/package/perl-net-ssh2/perl-net-ssh2.hash
index b2e8b2d48e..0fa86f1158 100644
--- a/package/perl-net-ssh2/perl-net-ssh2.hash
+++ b/package/perl-net-ssh2/perl-net-ssh2.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  57aa0f6e2be4020f75888a7195ad5cba  Net-SSH2-0.72.tar.gz
-sha256  867d83070fac6436b9f0971918243002072fbf8d2724a87c254b34250dce0222  Net-SSH2-0.72.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  6ac3a6616dc673ae00ba101e33d637dd  Net-SSH2-0.74.tar.gz
+sha256  1c124699745eeb40ed636097fdcc3e722c94cfd7704ebc0acfb0f05541d2809c  Net-SSH2-0.74.tar.gz
 
 # computed by scancpan
-sha256  268afaee7aa88a41959c93cd91853e8124bdbe64a74480d36ff1130e01a1c0ca  README.pod
+sha256  5fdfc16a4c38c1a82d97f91bf3166806c03015ec42bc2b96aee330ffeebd9461  README.pod
diff --git a/package/perl-net-ssh2/perl-net-ssh2.mk b/package/perl-net-ssh2/perl-net-ssh2.mk
index 20e45b6287..f5ba67865f 100644
--- a/package/perl-net-ssh2/perl-net-ssh2.mk
+++ b/package/perl-net-ssh2/perl-net-ssh2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PERL_NET_SSH2_VERSION = 0.72
+PERL_NET_SSH2_VERSION = 0.74
 PERL_NET_SSH2_SOURCE = Net-SSH2-$(PERL_NET_SSH2_VERSION).tar.gz
-PERL_NET_SSH2_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SA/SALVA
+PERL_NET_SSH2_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RK/RKITOVER
 PERL_NET_SSH2_LICENSE = Artistic or GPL-1.0+
 PERL_NET_SSH2_LICENSE_FILES = README.pod
 PERL_NET_SSH2_DEPENDENCIES = libssh2 zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
