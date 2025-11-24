Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 528A3CFD313
	for <buildroot@archiver.kernel.org>; Mon, 24 Nov 2025 19:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B39F82243;
	Mon, 24 Nov 2025 19:50:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3eVZG2q89zv1; Mon, 24 Nov 2025 19:50:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B71E82248
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B71E82248;
	Mon, 24 Nov 2025 19:50:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D4D3F359
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 19:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE4CC82243
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 19:50:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id akU8yAAWSRa3 for <buildroot@buildroot.org>;
 Mon, 24 Nov 2025 19:50:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F399F8223D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F399F8223D
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 19:50:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E039B85CFD; Mon, 24 Nov 2025 19:50:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 24 Nov 2025 20:40:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c8cb1a238de5a803228f12ad32b36cae2acfc778
X-Git-Newrev: 85de5639c1354027ef107f1a83270d3c17c8af2c
X-Patchwork-Hint: ignore
Message-Id: <20251124195041.E039B85CFD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pysocks: add host variant
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

commit: https://git.buildroot.net/buildroot/commit/?id=85de5639c1354027ef107f1a83270d3c17c8af2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The host-depot-tools package now requires a host variant of the
python-pysocks package due to the python-httplib2 update on
commit [1].

Httplib2 removed the internal socks.py file on commit [2].

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/55a80f89d7321000591de349c7083a94c0349187
[2] https://github.com/httplib2/httplib2/commit/1a6ff781792099e9e14d7beb610bd99112b17b07

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
[Julien: change commit id to urls]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pysocks/python-pysocks.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pysocks/python-pysocks.mk b/package/python-pysocks/python-pysocks.mk
index ccb70fc5db..1925220d23 100644
--- a/package/python-pysocks/python-pysocks.mk
+++ b/package/python-pysocks/python-pysocks.mk
@@ -12,3 +12,4 @@ PYTHON_PYSOCKS_LICENSE_FILES = LICENSE
 PYTHON_PYSOCKS_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
