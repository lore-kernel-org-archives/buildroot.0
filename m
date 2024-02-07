Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B60F5C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 15:09:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8141E80C02;
	Wed,  7 Feb 2024 15:09:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bxa0hXofR96C; Wed,  7 Feb 2024 15:09:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 338C980BFE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 338C980BFE;
	Wed,  7 Feb 2024 15:09:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 004651BF471
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 15:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EECCE83B9A
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 15:09:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NpZpP5hKoRWc for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 15:09:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13CCF83B8D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13CCF83B8D
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 15:09:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F1D8F875A8; Wed,  7 Feb 2024 15:09:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Feb 2024 16:08:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 218fa820f541df593f35ee8468c4f531499caf4f
X-Git-Newrev: 7f1e1b1b171618952725bffdbe73827e062735c4
X-Patchwork-Hint: ignore
Message-Id: <20240207150901.F1D8F875A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-bitstring: add missing
 runtime dependency
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7f1e1b1b171618952725bffdbe73827e062735c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python-bitstring require python-bitarray and python-zlib at runtime
since 4.1.0 release [1][2].

python-zlib is now needed for the "Experimental support for two 8-bit
float types" [2].

Fixes:
https://gitlab.com/kubu93/buildroot/-/jobs/6114047821

[1] https://github.com/scott-griffiths/bitstring/releases/tag/bitstring-4.1.0
[2] https://github.com/scott-griffiths/bitstring/commit/70c8af4d8bef557bc7d96f809d37e2c241587dd0

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-bitstring/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-bitstring/Config.in b/package/python-bitstring/Config.in
index 93d7682577..82d0bb29c6 100644
--- a/package/python-bitstring/Config.in
+++ b/package/python-bitstring/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_PYTHON_BITSTRING
 	bool "python-bitstring"
+	select BR2_PACKAGE_PYTHON_BITARRAY # runtime
+	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	help
 	  Simple construction, analysis and modification of binary data.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
