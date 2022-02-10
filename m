Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB87C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 20:46:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 805494091E;
	Thu, 10 Feb 2022 20:46:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tyUZJBXHHrEF; Thu, 10 Feb 2022 20:46:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C523940915;
	Thu, 10 Feb 2022 20:46:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BC0DC1BF398
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 20:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A9DB4012B
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 20:45:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f2dbGvU2A6tD for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 20:45:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96BF440122
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 20:45:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 6C1ED81392; Thu, 10 Feb 2022 20:37:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 10 Feb 2022 21:44:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aa01b17862ab3af9d95a05018bf8ccf5e875057b
X-Git-Newrev: 39b025258539b8686eb5615a6df10e2c06b5c228
X-Patchwork-Hint: ignore
Message-Id: <20220210203748.6C1ED81392@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-web2py: drop python2 host
 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=39b025258539b8686eb5615a6df10e2c06b5c228
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With host-python gone, BR2_PACKAGE_PYTHON3 will always be enabled for a
python package, so drop the legacy logic.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-web2py/python-web2py.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
index 5ea46fbfd9..3e453282a9 100644
--- a/package/python-web2py/python-web2py.mk
+++ b/package/python-web2py/python-web2py.mk
@@ -10,7 +10,7 @@ PYTHON_WEB2PY_LICENSE = LGPL-3.0
 PYTHON_WEB2PY_LICENSE_FILES = LICENSE
 PYTHON_WEB2PY_CPE_ID_VENDOR = web2py
 PYTHON_WEB2PY_CPE_ID_PRODUCT = web2py
-PYTHON_WEB2PY_DEPENDENCIES = $(if $(BR2_PACKAGE_PYTHON3),host-python3 python3,host-python python) \
+PYTHON_WEB2PY_DEPENDENCIES = host-python3 python3 \
 	host-python-pydal host-python-yatl
 
 PYTHON_WEB2PY_EXCLUSIONS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
