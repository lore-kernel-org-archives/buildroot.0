Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04F2AC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 20:19:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD1B860E0B
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 20:19:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BD1B860E0B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 81D14403D5;
	Mon, 25 Oct 2021 20:19:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kp2o7MYBpnuE; Mon, 25 Oct 2021 20:19:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48D2C403EE;
	Mon, 25 Oct 2021 20:19:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 66A4D1BF870
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 20:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5293540422
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 20:18:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HU2NEhCk8myi for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 20:18:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 964CC40237
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 20:18:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id EC7AA88984; Mon, 25 Oct 2021 20:15:08 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 22:17:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f6ffc2b045d3d92deb91a174e1871d69224e37db
X-Git-Newrev: 09f1367c3020c8c43a178bda2cd72de6343d65d3
X-Patchwork-Hint: ignore
Message-Id: <20211025201508.EC7AA88984@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pip: needs python3
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

commit: https://git.buildroot.net/buildroot/commit/?id=09f1367c3020c8c43a178bda2cd72de6343d65d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python 2 support has been dropped since version 21.0 resulting in the
following build failure since bump to version 21.2.4 in commit
3491f34d9ed97ac5980ff4a450367914b6985ff1:

  File "setup.py", line 7
    def read(rel_path: str) -> str:
                     ^

Fixes:
 - http://autobuild.buildroot.org/results/ed74f4ca96332454af329fac23505000c379d4a3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-pip/Config.in | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/python-pip/Config.in b/package/python-pip/Config.in
index 61d8d7d317..92c3e3bd46 100644
--- a/package/python-pip/Config.in
+++ b/package/python-pip/Config.in
@@ -1,9 +1,8 @@
 config BR2_PACKAGE_PYTHON_PIP
 	bool "python-pip"
-	select BR2_PACKAGE_PYTHON_HASHLIB if BR2_PACKAGE_PYTHON # runtime
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
-	select BR2_PACKAGE_PYTHON_SSL if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON3_SSL if BR2_PACKAGE_PYTHON3 # runtime
+	select BR2_PACKAGE_PYTHON3_SSL
 	help
 	  The PyPA recommended tool for installing Python packages.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
