Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FEB3C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 21:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 584824094D;
	Tue,  6 Feb 2024 21:55:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mSZcRBIoANKQ; Tue,  6 Feb 2024 21:55:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5EBC40959
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5EBC40959;
	Tue,  6 Feb 2024 21:55:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B6A281BF400
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 21:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A323B4031D
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 21:55:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TcYgj_FmvBzD for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 21:55:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9129D401B1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9129D401B1
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 21:55:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7AE8587420; Tue,  6 Feb 2024 21:55:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 22:53:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c7bbea9a6c4780210afc6ff6da3513b83a8a0270
X-Git-Newrev: b3803513e87cb75795edfd3205337996ad971bb3
X-Patchwork-Hint: ignore
Message-Id: <20240206215536.7AE8587420@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pydantic: add CPE variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=b3803513e87cb75795edfd3205337996ad971bb3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:pydantic_project:pydantic is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/9B7C28E5-ACB1-4252-AE8F-4225C1AF739E

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pydantic/python-pydantic.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-pydantic/python-pydantic.mk b/package/python-pydantic/python-pydantic.mk
index 7ad7abeb8d..0cce5a153f 100644
--- a/package/python-pydantic/python-pydantic.mk
+++ b/package/python-pydantic/python-pydantic.mk
@@ -10,6 +10,8 @@ PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/aa/3f/56142232152
 PYTHON_PYDANTIC_SETUP_TYPE = pep517
 PYTHON_PYDANTIC_LICENSE = MIT
 PYTHON_PYDANTIC_LICENSE_FILES = LICENSE
+PYTHON_PYDANTIC_CPE_ID_VENDOR = pydantic_project
+PYTHON_PYDANTIC_CPE_ID_PRODUCT = pydantic
 PYTHON_PYDANTIC_DEPENDENCIES = \
 	host-python-hatchling \
 	host-python-hatch-fancy-pypi-readme
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
