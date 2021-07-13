Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12A05C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:07:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C01260FA0
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:07:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7C01260FA0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B64240494;
	Wed,  4 Aug 2021 00:07:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sasVgaECXvTf; Wed,  4 Aug 2021 00:07:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E8EB403FF;
	Wed,  4 Aug 2021 00:07:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B6AC71BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:15:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2E10406B3
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jKbLgXIXMu-K for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74A6D40E45
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id CBDBE86A84; Tue,  3 Aug 2021 21:10:00 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 13 Jul 2021 21:29:49 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: aa2875fba62a493d0ffbbf7cecffe63936e21cc8
X-Git-Newrev: f693354c30bd8251c05824c64299fb84182f45ac
X-Patchwork-Hint: ignore
Message-Id: <20210803211000.CBDBE86A84@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libbpf: add
 BR2_PACKAGE_LIBBPF_ARCH_SUPPORTS
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=f693354c30bd8251c05824c64299fb84182f45ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

libbpf does not support all architectures, for example ARM is not
supported resulting in the following build failure:

bpf.c:53:4: error: #error __NR_bpf not defined. libbpf does not support your arch.
 #  error __NR_bpf not defined. libbpf does not support your arch.
    ^

Fixes:
 - http://autobuild.buildroot.org/results/288d54100a2e736195a3a04a9e2e035d02ea5c16

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libbpf/Config.in | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/libbpf/Config.in b/package/libbpf/Config.in
index c5b24c5eb5..9eadf0254a 100644
--- a/package/libbpf/Config.in
+++ b/package/libbpf/Config.in
@@ -1,5 +1,15 @@
+config BR2_PACKAGE_LIBBPF_ARCH_SUPPORTS
+	bool
+	# see src/bpf.c
+	default y if BR2_arc
+	default y if BR2_aarch64 || BR2_aarch64_be
+	default y if BR2_i386 || BR2_x86_64
+	default y if BR2_sparc || BR2_sparc64
+	default y if BR2_s390x
+
 config BR2_PACKAGE_LIBBPF
 	bool "libbpf"
+	depends on BR2_PACKAGE_LIBBPF_ARCH_SUPPORTS
 	depends on BR2_USE_WCHAR # elfutils
 	depends on !BR2_STATIC_LIBS # elfutils
 	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils
@@ -15,6 +25,7 @@ config BR2_PACKAGE_LIBBPF
 	  https://github.com/libbpf/libbpf
 
 comment "libbpf needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads"
+	depends on BR2_PACKAGE_LIBBPF_ARCH_SUPPORTS
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
 		|| !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
