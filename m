Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84078FF885A
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A00B615C5;
	Mon,  4 May 2026 14:48:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JAj2lYeAzmEv; Mon,  4 May 2026 14:48:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D32BD615C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906124;
	bh=B8K0fnA3k8k4QmiW5bA/bGb/WZnD+H2VdhCudmXK/jo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=j12uYc2rjpWhyELyzETXntEux8bR2yiPWEI/vasrWmJ9FoJPQXtCT2dP+wliB8tsA
	 MyR4op4EVSpp03A5c8DCtr7RqgsVeyMHCBZJKm4nBpxD+uK5Uy7qCVIx+lUwFDpe5y
	 GkbF39Cb5LiU42ywDXx/vv0CEAabFaEh2OlumuKFGrTnGz2rTTuTuYG2bbG3DSWzOG
	 JNa2gIMbm8yxIg1+WxPr/+6bfTRFh0bjLmILG0rc1xmhGf3mgkCUnG1b0cMikmBFpy
	 aHHR6+PFBl25Gcx054DAcbbpj0O6woeGrZbLCCvv38QtnZHkgp5kQiuX+7Z3h0vXru
	 O7pc0hypDxn9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D32BD615C6;
	Mon,  4 May 2026 14:48:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 19EFC190
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E9452845EA
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DIrLXnLpSfLE for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:48:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31B9C846A5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31B9C846A5
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1413C8423F; Mon,  4 May 2026 14:48:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 13:57:32 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 94e54141f918784a1c8d9bbb5ca6383310fedff5
X-Git-Newrev: 6873a1beabbe6f9b342823baa1d5abac626a003f
X-Patchwork-Hint: ignore
Message-Id: <20260504144839.1413C8423F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x]
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6873a1beabbe6f9b342823baa1d5abac626a003f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
index 11d4a8867e..7b74113df1 100644
--- a/package/python-magic-wormhole/python-magic-wormhole.mk
+++ b/package/python-magic-wormhole/python-magic-wormhole.mk
@@ -10,6 +10,8 @@ PYTHON_MAGIC_WORMHOLE_SITE = https://files.pythonhosted.org/packages/65/34/08813
 PYTHON_MAGIC_WORMHOLE_SETUP_TYPE = setuptools
 PYTHON_MAGIC_WORMHOLE_LICENSE = MIT
 PYTHON_MAGIC_WORMHOLE_LICENSE_FILES = LICENSE
+PYTHON_MAGIC_WORMHOLE_CPE_ID_VENDOR = magic_wormhole_project
+PYTHON_MAGIC_WORMHOLE_CPE_ID_PRODUCT = magic_wormhole
 PYTHON_MAGIC_WORMHOLE_DEPENDENCIES = host-python-versioneer
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
