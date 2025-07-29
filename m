Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1ACFC87FCA
	for <buildroot@archiver.kernel.org>; Tue, 29 Jul 2025 23:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C89496127B;
	Tue, 29 Jul 2025 23:40:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OKgtALmCp_mE; Tue, 29 Jul 2025 23:40:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C47EF6127E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C47EF6127E;
	Tue, 29 Jul 2025 23:40:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BEC613D
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 23:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 825258143F
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 23:40:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GYwftZaI5S_F for <buildroot@buildroot.org>;
 Tue, 29 Jul 2025 23:40:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC3D08111A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC3D08111A
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 23:40:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9D24C86C9E; Tue, 29 Jul 2025 23:40:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Jul 2025 01:39:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f103e3696f611153915e99a32caf8dcbbb106397
X-Git-Newrev: 0c2769b9c3075aa31ef7c436bd44c020e3c87d34
X-Patchwork-Hint: ignore
Message-Id: <20250729234015.9D24C86C9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rust: add CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=0c2769b9c3075aa31ef7c436bd44c020e3c87d34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This gives a proper cpe-id string to the Rust buildroot package,
as it can be found in the NVD database:
https://nvd.nist.gov/products/cpe/search/results?keyword=cpe:2.3:a:rust-lang:rust

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/rust/rust.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 22f3ca1455..9999475c35 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -11,6 +11,7 @@ RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
 RUST_SITE = https://static.rust-lang.org/dist
 RUST_LICENSE = Apache-2.0 or MIT
 RUST_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
+RUST_CPE_ID_VENDOR = rust-lang
 
 HOST_RUST_PROVIDES = host-rustc
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
