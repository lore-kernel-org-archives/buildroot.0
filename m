Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68572C369A9
	for <buildroot@archiver.kernel.org>; Fri, 11 Apr 2025 10:42:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BB596F79C;
	Fri, 11 Apr 2025 10:42:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IPHtwahJlNOr; Fri, 11 Apr 2025 10:42:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 431296F7C8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 431296F7C8;
	Fri, 11 Apr 2025 10:42:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0876B138
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 10:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56AF54046D
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 10:41:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TeSNpPpojVey for <buildroot@buildroot.org>;
 Fri, 11 Apr 2025 10:41:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79AFA4042E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79AFA4042E
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 10:41:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 77B5F8429E; Fri, 11 Apr 2025 10:41:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 11 Apr 2025 12:40:37 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 9f141c1dd15a168c7e6263071db56702fae38c7b
X-Git-Newrev: 8fc12cb424a6eed209c7845efb373fcc73c41a0c
X-Patchwork-Hint: ignore
Message-Id: <20250411104148.77B5F8429E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/python-twisted:
 fix cpe id vendor
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8fc12cb424a6eed209c7845efb373fcc73c41a0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

twistedmatrix is deprecated, twisted is the current cpe id vendor
for python-twisted.

See:
https://nvd.nist.gov/products/cpe/detail/A38171CB-8F75-4CE2-8C00-229D4A8F1C0E

Signed-off-by: Gilles Bardoux <gilles.bardoux@sagemcom.com>
[Julien: reformat patch and add nvd link]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 1747ebf29b577f4b1ef03b0633bedd525ce9947d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-twisted/python-twisted.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-twisted/python-twisted.mk b/package/python-twisted/python-twisted.mk
index 398baed2a8..c8aeb722f2 100644
--- a/package/python-twisted/python-twisted.mk
+++ b/package/python-twisted/python-twisted.mk
@@ -10,7 +10,7 @@ PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/b2/ce/cbb56597127b
 PYTHON_TWISTED_SETUP_TYPE = setuptools
 PYTHON_TWISTED_LICENSE = MIT
 PYTHON_TWISTED_LICENSE_FILES = LICENSE
-PYTHON_TWISTED_CPE_ID_VENDOR = twistedmatrix
+PYTHON_TWISTED_CPE_ID_VENDOR = twisted
 PYTHON_TWISTED_CPE_ID_PRODUCT = twisted
 PYTHON_TWISTED_DEPENDENCIES = python-incremental host-python-incremental
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
