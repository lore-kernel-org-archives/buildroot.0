Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A93CD3439
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E6A341B5D;
	Mon,  4 May 2026 14:47:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6r7AqGp_iE36; Mon,  4 May 2026 14:47:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A07DC41B64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906025;
	bh=venEyo55rsDV86EtOoPapRA27knHz/x/vGbgz4JaPrI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kJeMD43uUEzgA2WEo2Qpjwr1UGsgpaSOzOcrR2d9uNxbWSLYKUgr5LxcJxXxwSUVd
	 KMN3zswFi2ys6zR/wh+x6Ke5AB5TfA+fkGPOOPt7nJRm377PteopPV9rxMkfd/Hr5w
	 nvZKWssUH/u0oEKc9ARxkGikDjCmBEtbWzeFfsm+f/Mo+LDB0d0A3Zmd7pXIDS/Yk1
	 DAk5eMi2MS8KMaK5/NTZhsHQD6WZRs4o0lAp1eVGtVl9YcQkdUUfpeAfhDwzpp6Cgu
	 e/Gyt+jL7Bp0GoSk37DAd2Lo6QDuMbKpMPYyGz4XxTD+OS7ehbEFTUG3258fNT5jSp
	 Cg9sPgds/dOSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A07DC41B64;
	Mon,  4 May 2026 14:47:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FC1930A
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2249410EF
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:46:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 06G1jGAK5PVm for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:46:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DCD7410B6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DCD7410B6
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:46:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4088A8427E; Mon,  4 May 2026 14:46:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 13:57:09 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 89be84d22e6edc8874aca8d3a85f993bcfc9ee52
X-Git-Newrev: ffdaa44c1f4060df2288572f292f698fa8640c35
X-Patchwork-Hint: ignore
Message-Id: <20260504144643.4088A8427E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 package/python-magic-wormhole: add CPE ID
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ffdaa44c1f4060df2288572f292f698fa8640c35
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The CPE ID `magic_wormhole_project:magic_wormhole` is valid for
magic-wormhole. See:
https://nvd.nist.gov/products/cpe/detail/591D7832-786D-4BBD-A16A-04CBDE20333B

This commit adds the information.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
(cherry picked from commit 298390ade47965a39e6fddaada1f7128aaa6ac6b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-magic-wormhole/python-magic-wormhole.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-magic-wormhole/python-magic-wormhole.mk b/package/python-magic-wormhole/python-magic-wormhole.mk
index 37fddf6c21..0424f5ce19 100644
--- a/package/python-magic-wormhole/python-magic-wormhole.mk
+++ b/package/python-magic-wormhole/python-magic-wormhole.mk
@@ -10,5 +10,7 @@ PYTHON_MAGIC_WORMHOLE_SITE = https://files.pythonhosted.org/packages/1b/a8/32a54
 PYTHON_MAGIC_WORMHOLE_SETUP_TYPE = setuptools
 PYTHON_MAGIC_WORMHOLE_LICENSE = MIT
 PYTHON_MAGIC_WORMHOLE_LICENSE_FILES = LICENSE
+PYTHON_MAGIC_WORMHOLE_CPE_ID_VENDOR = magic_wormhole_project
+PYTHON_MAGIC_WORMHOLE_CPE_ID_PRODUCT = magic_wormhole
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
