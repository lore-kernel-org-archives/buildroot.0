Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE0CC55822
	for <buildroot@archiver.kernel.org>; Tue,  4 Aug 2026 19:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81B3B4072E;
	Tue,  4 Aug 2026 19:15:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RjOKbIfFr5qs; Tue,  4 Aug 2026 19:15:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E00140722
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785870943;
	bh=+/F4XVEbVk4aH/O14JSfkaUFF3LpwIPFaDNxK3L8OCs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UdvS0CQjp6mzhe6esxHuFHIcY2iSjtxFiNp2Cucw6Xvw3+XsdknW8d9YkmeTCBEJ9
	 dWmVqCx14eBsI5nfrXsSoIFsThN96HfTWRbN2ofSa+bZk04ZWhnSeICPxKJqgw5LEh
	 GBsccM7frww1iZFcBvnOVsJzEr0AtkatJOZM+aowCua+Rh5sOcxhH7yS3cxHtD4tHR
	 YNDa+8ZLeSv6fm7IJtFhHmHyb7EiG13GHNyVrPworerQHW0IvAqU9hqmNuWOKkkRlo
	 SorRLGSnxUDniAsDUYUP8dQ0cA7Pa4JprpCjghclUdw/R3o3C5dIg6LMCM58ksPGf4
	 /sNl0GkWDeS2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E00140722;
	Tue,  4 Aug 2026 19:15:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CA49B218
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 19:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BCBE980C59
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 19:15:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WVn-jle0nohL for <buildroot@buildroot.org>;
 Tue,  4 Aug 2026 19:15:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A197980A78
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A197980A78
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 19:15:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3DD208C55A; Tue,  4 Aug 2026 19:14:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 4 Aug 2026 21:14:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d80d38a551ca6c8a027d541d47abe440639c4976
X-Git-Newrev: ed980191ebc1fbc8bba3aee4e003104b1c22e0ba
X-Patchwork-Hint: ignore
Message-Id: <20260804191449.3DD208C55A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual: fix indentation in pkg-hare
 example
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ed980191ebc1fbc8bba3aee4e003104b1c22e0ba
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes: 44d38432343e (package/pkg-hare.mk: new infrastructure)

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 docs/manual/adding-packages-hare.adoc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-hare.adoc b/docs/manual/adding-packages-hare.adoc
index b52d953b2e..e61d524acb 100644
--- a/docs/manual/adding-packages-hare.adoc
+++ b/docs/manual/adding-packages-hare.adoc
@@ -13,7 +13,7 @@ The +Config.in+ file of Hare-based package 'hare-foo' should contain:
 01: config BR2_PACKAGE_HARE_FOO
 02: 	bool "hare-foo"
 03: 	depends on BR2_PACKAGE_HOST_HARE_TARGET_ARCH_SUPPORTS
-04:	select BR2_PACKAGE_HOST_HARE
+04: 	select BR2_PACKAGE_HOST_HARE
 05: 	help
 06: 	  This is a comment that explains what foo is.
 07:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
