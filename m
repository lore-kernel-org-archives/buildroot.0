Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B1EDC55174
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 14:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD7DB80E56;
	Sat,  8 Aug 2026 14:00:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0sP1cEKnwuZW; Sat,  8 Aug 2026 14:00:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEF2980E5B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786197606;
	bh=Wl9pe/HDg/WsKLoO9PaNVABu+/w1qlG+t71HgYs/ebE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=p4NVq9gJkhbkicYTXXKFGJeZK/6qNveDXs2hxPzhEVSpnn8xOvLD33+9OTxYKHMEk
	 zvjhSRzXbJERbgVKoR3jTON/FGFRmJ7jxZ8JtxIbQOPNGB0HVBh//E6wV4DQZKlU3l
	 juzwQ0oiXRulIMJYtVs1UNv9PDi5RUUUCRFNQsWW3qHkFd2tVY99CoNNsIT8PDHSQJ
	 dr7mijBW7RGTA7UyR8/NiGrZGIwjhURujHlrZE4Eehq87Dxr63bDWmel94NCDCvjDp
	 jBpnjN+VWV3Kvgfxw8SE5CXEo2I9/NxtG0Zm3fs1nz/52/ZWjTD2qcYJPMwn3msfoK
	 agh00gvVWA92A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEF2980E5B;
	Sat,  8 Aug 2026 14:00:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DF94A3A9
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 14:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C5D2B405E9
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 14:00:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id puuH3cYBTkRL for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 14:00:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDA47405A3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DDA47405A3
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 14:00:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C7FA68C5CF; Sat,  8 Aug 2026 13:59:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 8 Aug 2026 15:58:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6fe61bd9650bd2a3474b2d5c04568200ad518a28
X-Git-Newrev: d5f0ca434e3a5e2dc7eecbb01743cda88a67995d
X-Patchwork-Hint: ignore
Message-Id: <20260808135914.C7FA68C5CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tpm2-tools: propagate
 BR2_PACKAGE_TPM2_TSS_FAPI dependencies
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d5f0ca434e3a5e2dc7eecbb01743cda88a67995d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

In commit 5394df6400912efa7da4f97c7ea68a81a9f77c1d ("package/tpm2-tss:
add Mbed-TLS crypto backend support"), a depends on
!BR2_PACKAGE_MBEDTLS was added to BR2_PACKAGE_TPM2_TSS_FAPI, but this
new dependency was not properly propagated to the reverse
dependencies, causing kconfig warnings such as:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_TPM2_TSS_FAPI
  Depends on [n]: BR2_PACKAGE_TPM2_TSS [=y] && BR2_TOOLCHAIN_HAS_SYNC_4 [=y] && !BR2_PACKAGE_MBEDTLS [=y]
  Selected by [y]:
  - BR2_PACKAGE_TPM2_TOOLS_FAPI [=y] && BR2_PACKAGE_TPM2_TOOLS [=y] && BR2_TOOLCHAIN_HAS_SYNC_4 [=y]

This commit properly propagates this new dependency to
BR2_PACKAGE_TPM2_TOOLS_FAPI, fixing the kconfig warning.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/tpm2-tools/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/tpm2-tools/Config.in b/package/tpm2-tools/Config.in
index 0dcf176dfd..abe6aa5689 100644
--- a/package/tpm2-tools/Config.in
+++ b/package/tpm2-tools/Config.in
@@ -26,11 +26,16 @@ if BR2_PACKAGE_TPM2_TOOLS
 config BR2_PACKAGE_TPM2_TOOLS_FAPI
 	bool "fapi tools"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_PACKAGE_MBEDTLS # tss-fapi
 	select BR2_PACKAGE_TPM2_TSS_FAPI
 	help
 	  This option enables Feature API (FAPI) support in
 	  tpm2-tools. The FAPI tools are prefixed with tss2_.
 
+comment "fapi-tools not supported with Mbed TLS backend"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_PACKAGE_MBEDTLS
+
 endif
 
 comment "tpm2-tools needs a glibc or musl toolchain w/ dynamic library, wchar"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
