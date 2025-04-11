Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B6DC36010
	for <buildroot@archiver.kernel.org>; Fri, 11 Apr 2025 10:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC4C160C2E;
	Fri, 11 Apr 2025 10:45:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BAeJd2TR8J7i; Fri, 11 Apr 2025 10:45:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D86906F716
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D86906F716;
	Fri, 11 Apr 2025 10:45:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1658D138
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 10:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 42A6B6F641
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 10:44:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ORdkiBLMi-f for <buildroot@buildroot.org>;
 Fri, 11 Apr 2025 10:44:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21D1660640
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 21D1660640
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 10:44:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 187CB821F0; Fri, 11 Apr 2025 10:44:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 11 Apr 2025 12:42:44 +0200
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: d1f9d9ca5f41920721892cac326b60a36da9dd32
X-Git-Newrev: ee7c227b1607db81ceca0727f63202515ffb0024
X-Patchwork-Hint: ignore
Message-Id: <20250411104451.187CB821F0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/python-fastapi:
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

commit: https://git.buildroot.net/buildroot/commit/?id=ee7c227b1607db81ceca0727f63202515ffb0024
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

fastapi_project is deprecated, tiangolo is the current cpe id vendor
for python-fastapi.

See:
https://nvd.nist.gov/products/cpe/detail/4339522D-F85C-4C37-966F-A5CFF72D1D04

Signed-off-by: Gilles Bardoux <gilles.bardoux@sagemcom.com>
[Julien: reformat patch and add nvd link]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 6a1eca91b950aa7ad38d39fe1738ea68b0614729)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-fastapi/python-fastapi.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index 95eb565b23..100f285385 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -10,7 +10,7 @@ PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/a9/db/5781f19bd307
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
-PYTHON_FASTAPI_CPE_ID_VENDOR = fastapi_project
+PYTHON_FASTAPI_CPE_ID_VENDOR = tiangolo
 PYTHON_FASTAPI_CPE_ID_PRODUCT = fastapi
 PYTHON_FASTAPI_DEPENDENCIES = host-python-pdm-backend
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
