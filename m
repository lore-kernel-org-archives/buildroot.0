Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51440C87FDA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 17:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 272A260699;
	Thu,  7 Aug 2025 17:20:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XOrrKLzdL2fk; Thu,  7 Aug 2025 17:20:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6386360651
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6386360651;
	Thu,  7 Aug 2025 17:20:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1ABF44C6
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4FDA40081
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tDYrSGhAhcRd for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 17:19:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05492400C4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05492400C4
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0395581435; Thu,  7 Aug 2025 17:19:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Aug 2025 19:11:33 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 3480fe66fb5c3c5b380d831071fa4df0321f71af
X-Git-Newrev: 97e03b27fd260a624055e8ed5ad348aba83fbcac
X-Patchwork-Hint: ignore
Message-Id: <20250807171917.0395581435@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/rust: add
 CPE_ID_VENDOR
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=97e03b27fd260a624055e8ed5ad348aba83fbcac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

This gives a proper cpe-id string to the Rust buildroot package,
as it can be found in the NVD database:
https://nvd.nist.gov/products/cpe/search/results?keyword=cpe:2.3:a:rust-lang:rust

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 0c2769b9c3075aa31ef7c436bd44c020e3c87d34)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/rust/rust.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 7f6f2ebc17..5bcdfa455e 100644
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
