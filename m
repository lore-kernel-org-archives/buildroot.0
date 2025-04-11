Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF4A0C36010
	for <buildroot@archiver.kernel.org>; Fri, 11 Apr 2025 10:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77D3B41C09;
	Fri, 11 Apr 2025 10:42:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NpEojV3HJUEY; Fri, 11 Apr 2025 10:42:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D3C341A3A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D3C341A3A;
	Fri, 11 Apr 2025 10:42:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E68AF138
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 10:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A440181259
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 10:41:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yk81yNdCfgqY for <buildroot@buildroot.org>;
 Fri, 11 Apr 2025 10:41:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 704AE81351
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 704AE81351
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 10:41:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6E1A4826A4; Fri, 11 Apr 2025 10:41:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 11 Apr 2025 12:40:36 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: b0b94fd1364dc12d2774eab3db569945097e5ee3
X-Git-Newrev: 9f141c1dd15a168c7e6263071db56702fae38c7b
X-Patchwork-Hint: ignore
Message-Id: <20250411104148.6E1A4826A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/python-fastapi:
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

commit: https://git.buildroot.net/buildroot/commit/?id=9f141c1dd15a168c7e6263071db56702fae38c7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

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
index a2191c73b7..8301e72997 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -10,7 +10,7 @@ PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/01/d5/33a8992fe0e8
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
-PYTHON_FASTAPI_CPE_ID_VENDOR = fastapi_project
+PYTHON_FASTAPI_CPE_ID_VENDOR = tiangolo
 PYTHON_FASTAPI_CPE_ID_PRODUCT = fastapi
 PYTHON_FASTAPI_DEPENDENCIES = host-python-hatchling
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
