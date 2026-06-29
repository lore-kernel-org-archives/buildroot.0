Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A79D1C43458
	for <buildroot@archiver.kernel.org>; Mon, 29 Jun 2026 10:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80188405BD;
	Mon, 29 Jun 2026 10:55:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GZ289mIggpWj; Mon, 29 Jun 2026 10:55:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86A5940302
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782730525;
	bh=GkwMJgiAsSVOfXZIgqMulRsDBGLaZa2/kQRiiS1N1JU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Q0vggbzd0xFGkB6Ap4qeT+kllZgJdxnIsRqxVLC5pQmPOXFhuCOjZCUygSc7hjX8x
	 xTpxcvR4LsbBDxOZV0EvLzSrTitDXOdURT7fMah9P7WF3i13gGHuRUq7rZLq/pxA9b
	 XXQ5uU2zUoI2R6eLIS0gy3kHT8W9GVRnOn6WOkBug8W8/yBYGT3CQnHv8lbYMwyTq6
	 FD0lxaoqzl15PweWcC+Bq9lFYdGQ8WMx1jHK8kwcE3zMlxOpeEH4wVnn4LzVeK6dW9
	 VBzWuQnjp9VX5Zcs9eiyaLF44hDBBQkMEHn5YWeL/aigCYq2N+kq7fNyHZsbTPJnnf
	 coNKhNtzg5miw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86A5940302;
	Mon, 29 Jun 2026 10:55:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EAE9A2D3
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 10:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC52881150
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 10:55:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yeQJ98eZzjAT for <buildroot@buildroot.org>;
 Mon, 29 Jun 2026 10:55:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51B5881140
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51B5881140
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 10:55:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D773086CF7; Mon, 29 Jun 2026 10:54:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 29 Jun 2026 12:53:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 606f9ecbdec0b814e1fd6f07635985fbbf61e62c
X-Git-Newrev: 866462e8dd79311c34b7318a988e920372080928
X-Patchwork-Hint: ignore
Message-Id: <20260629105455.D773086CF7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libglib2/libglib2-bootstrap: do
 not install to target
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/866462e8dd79311c34b7318a988e920372080928
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Libglib2-bootstrap is only used as dependency to build
gobject-introspection and then libglib2 with GOI support. It should
not be installed to target, even if in practice libglib2 should
overwrite anything it has installed.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libglib2/libglib2-bootstrap/libglib2-bootstrap.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libglib2/libglib2-bootstrap/libglib2-bootstrap.mk b/package/libglib2/libglib2-bootstrap/libglib2-bootstrap.mk
index 72a32bd825..665f320684 100644
--- a/package/libglib2/libglib2-bootstrap/libglib2-bootstrap.mk
+++ b/package/libglib2/libglib2-bootstrap/libglib2-bootstrap.mk
@@ -24,6 +24,7 @@ LIBGLIB2_BOOTSTRAP_LICENSE = $(LIBGLIB2_LICENSE)
 LIBGLIB2_BOOTSTRAP_LICENSE_FILES = $(LIBGLIB2_LICENSE_FILES)
 LIBGLIB2_BOOTSTRAP_CPE_ID_VENDOR = $(LIBGLIB2_CPE_ID_VENDOR)
 LIBGLIB2_BOOTSTRAP_CPE_ID_PRODUCT = $(LIBGLIB2_CPE_ID_PRODUCT)
+LIBGLIB2_BOOTSTRAP_INSTALL_TARGET = NO
 LIBGLIB2_BOOTSTRAP_INSTALL_STAGING = YES
 LIBGLIB2_BOOTSTRAP_DL_SUBDIR = libglib2
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
