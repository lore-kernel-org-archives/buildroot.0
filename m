Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A0FAC3601B
	for <buildroot@archiver.kernel.org>; Wed,  2 Apr 2025 20:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3EAB4122A;
	Wed,  2 Apr 2025 20:15:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q-H7YmXjKSim; Wed,  2 Apr 2025 20:15:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08669414F5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08669414F5;
	Wed,  2 Apr 2025 20:15:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id ACEBD11F
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 20:14:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B80B4150F
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 20:14:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RnG7exO85yIr for <buildroot@buildroot.org>;
 Wed,  2 Apr 2025 20:14:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D474D414F5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D474D414F5
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 20:14:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE51383B10; Wed,  2 Apr 2025 20:14:58 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 2 Apr 2025 22:13:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 68d0da4ba76fe016d0683fbe92b3def67c769745
X-Git-Newrev: 6a1eca91b950aa7ad38d39fe1738ea68b0614729
X-Patchwork-Hint: ignore
Message-Id: <20250402201458.BE51383B10@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-fastapi: fix cpe id vendor
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6a1eca91b950aa7ad38d39fe1738ea68b0614729
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

fastapi_project is deprecated, tiangolo is the current cpe id vendor
for python-fastapi.

See:
https://nvd.nist.gov/products/cpe/detail/4339522D-F85C-4C37-966F-A5CFF72D1D04

Signed-off-by: Gilles Bardoux <gilles.bardoux@sagemcom.com>
[Julien: reformat patch and add nvd link]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-fastapi/python-fastapi.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index 08fe5623cb..2662f3ddaf 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -10,7 +10,7 @@ PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/a2/b2/5a5dc4affdb6
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
