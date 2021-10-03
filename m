Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4A24C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 20:31:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17E40611C1
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 20:31:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 17E40611C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCF5D846C5;
	Sun,  3 Oct 2021 20:31:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Pn1wKG2nVjw; Sun,  3 Oct 2021 20:31:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2145D8469B;
	Sun,  3 Oct 2021 20:31:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AB40D1BF44A
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 20:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A719640169
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 20:31:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H9MJY-oDDAQu for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 20:31:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CFFDF4000B
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 20:31:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 1F5DF8B3D6; Sun,  3 Oct 2021 20:29:10 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Oct 2021 22:31:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 058e743d814cec2cf8ec3091203617096f65e636
X-Git-Newrev: 6fc84ca1c082ec6dbfdc8fcc046ca8a99c9a5365
X-Patchwork-Hint: ignore
Message-Id: <20211003202910.1F5DF8B3D6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-psycopg2: needs python3
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

commit: https://git.buildroot.net/buildroot/commit/?id=6fc84ca1c082ec6dbfdc8fcc046ca8a99c9a5365
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python 2 support has been dropped since version 2.9 and
https://github.com/psycopg/psycopg2/commit/d956eaa3b1842a14895685be0d6d5e380fd029fc
resulting in the following build failure since bump to version 2.9.1 in
commit 09417e47d706e5d7d58c0f886b4679064c5175fa:

  File "setup.py", line 117
    f"Unable to find 'pg_config' file in '{self.pg_config_exe}'")
                                                               ^

Fixes:
 - http://autobuild.buildroot.org/results/f8a2cf9eea500e2c617381840b849225f12b56f1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-psycopg2/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/python-psycopg2/Config.in b/package/python-psycopg2/Config.in
index 5ffe179517..fba781c014 100644
--- a/package/python-psycopg2/Config.in
+++ b/package/python-psycopg2/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PSYCOPG2
 	bool "python-psycopg2"
+	depends on BR2_PACKAGE_PYTHON3
 	depends on BR2_USE_WCHAR # postgresql
 	select BR2_PACKAGE_POSTGRESQL
 	help
@@ -21,5 +22,7 @@ config BR2_PACKAGE_PYTHON_PSYCOPG2
 	  Psycopg 2 is both Unicode and Python 3 friendly.
 
 	  http://initd.org/psycopg/
+
 comment "python-psycopg2 needs a toolchain w/ wchar"
+	depends on BR2_PACKAGE_PYTHON3
 	depends on !BR2_USE_WCHAR
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
