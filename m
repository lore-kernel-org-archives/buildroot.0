Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79816C4828F
	for <buildroot@archiver.kernel.org>; Sat,  3 Feb 2024 17:48:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3473641EB5;
	Sat,  3 Feb 2024 17:48:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3473641EB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Bp3CD8rDF-w; Sat,  3 Feb 2024 17:48:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 633DE41F00;
	Sat,  3 Feb 2024 17:48:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 633DE41F00
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E1B851BF834
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 12:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC8B060A97
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 12:30:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1fGbf_vAYqmX for <buildroot@lists.busybox.net>;
 Sat,  3 Feb 2024 12:29:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4999A60A9C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4999A60A9C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4999A60A9C
 for <buildroot@buildroot.org>; Sat,  3 Feb 2024 12:29:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E368E8679C; Sat,  3 Feb 2024 12:29:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 3 Feb 2024 13:12:01 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 64ea5524cc20af551beadd5043bd95fd2d71f81d
X-Git-Newrev: 3561064b8eb679fc75ea4e9cd20bc961308c28a5
X-Patchwork-Hint: ignore
Message-Id: <20240203122958.E368E8679C@busybox.osuosl.org>
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 spf=fail smtp.mailfrom=osuosl.org
Subject: [Buildroot] [git commit branch/2023.02.x] package/python-sqlparse:
 add CPE variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=3561064b8eb679fc75ea4e9cd20bc961308c28a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

cpe:2.3:a:sqlparse_project:sqlparse is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/BB69AE3A-3268-4EDF-95AF-A05BB61B686F

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 8ed1bb3628511cb2b408186cb260dc15ef1eb43e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-sqlparse/python-sqlparse.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-sqlparse/python-sqlparse.mk b/package/python-sqlparse/python-sqlparse.mk
index 23b1338e49..48b1a24822 100644
--- a/package/python-sqlparse/python-sqlparse.mk
+++ b/package/python-sqlparse/python-sqlparse.mk
@@ -10,5 +10,7 @@ PYTHON_SQLPARSE_SITE = https://files.pythonhosted.org/packages/ba/fa/5b7662b04b6
 PYTHON_SQLPARSE_SETUP_TYPE = setuptools
 PYTHON_SQLPARSE_LICENSE = BSD-3-Clause
 PYTHON_SQLPARSE_LICENSE_FILES = LICENSE
+PYTHON_SQLPARSE_CPE_ID_VENDOR = sqlparse_project
+PYTHON_SQLPARSE_CPE_ID_PRODUCT = sqlparse
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
