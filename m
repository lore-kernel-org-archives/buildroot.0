Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7691CCD1292
	for <buildroot@archiver.kernel.org>; Thu, 11 Apr 2024 04:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32A944061A;
	Thu, 11 Apr 2024 04:35:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QBQu1Bnvc-oB; Thu, 11 Apr 2024 04:35:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3BA3407A8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3BA3407A8;
	Thu, 11 Apr 2024 04:35:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B016B1BF396
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 04:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A75B81B6D
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 04:35:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4WG5VPtdQHbp for <buildroot@lists.busybox.net>;
 Thu, 11 Apr 2024 04:35:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAE6E81B23
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DAE6E81B23
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 04:35:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D5B0C86024; Thu, 11 Apr 2024 04:35:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 11 Apr 2024 06:35:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 107bcd536dae1bc26e4f34ed510484d3abcc6b5f
X-Git-Newrev: 15381b57559182693f6d5530544937f8fcf3b471
X-Patchwork-Hint: ignore
Message-Id: <20240411043543.D5B0C86024@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pypng: add missing
 python3-zlib dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=15381b57559182693f6d5530544937f8fcf3b471
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

png.py import zlib [1] so python3-zlib needs to be installed at
runtime.

[1] https://gitlab.com/drj11/pypng/-/blob/pypng-0.20220715.0/code/png.py?ref_type=tags#L185

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6477656971 (TestPythonPy3Qrcode)

Cc: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pypng/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pypng/Config.in b/package/python-pypng/Config.in
index c1ed405615..952b46c2c5 100644
--- a/package/python-pypng/Config.in
+++ b/package/python-pypng/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYPNG
 	bool "python-pypng"
+	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	help
 	  Pure Python library for saving and loading PNG images.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
