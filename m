Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28117E9A056
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7636610CC;
	Thu, 19 Feb 2026 17:24:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o4Kep34lsyeW; Thu, 19 Feb 2026 17:24:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B11F6610CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771521879;
	bh=XnH4Cr2qBUjE9MAPdfl1KH8EiVYes1f5cuM9wPehT+M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=E9ZUH9oB6PMih7u9Yxwk1KCaHvUooRsU/fvJdaARKqqQPbjw+gu2hBRyz4HdNBTmO
	 X5LycGQUU9bOT9i4x6kw2kBHh5iKCJbsi+aKj/iTwnHswZnt1PFk46PO/hjj3TSVxH
	 h8+WuyI8BQD+KRd4OzZ3y7B750whIjbKCCbyMD/nFiMuyqnrvqgVSeaBk8h6/0I5a4
	 fp+tEHMVLoglGr9byjrTgZQVJhHEpvddevzyNNdq4WZz81cWB2OiVsD+7hdeBMo/CT
	 Vk7KuO+VOngGHM2wUeBn+pU1M3he28+m2148S5l/M5ywtc/bbKY3SMN2zCGF6t001b
	 19tjz66PgOK0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B11F6610CE;
	Thu, 19 Feb 2026 17:24:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 360E8206
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29E8640C6F
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:24:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eA-Y-aQwlRxW for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:24:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3072C40CFA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3072C40CFA
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:24:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2C8EF82205; Thu, 19 Feb 2026 17:24:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 18 Feb 2026 19:27:24 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 98e4df25fdbdf4676833a186dc51c91d6608d1e3
X-Git-Newrev: d6f0cf14b05343857379e63460fd4bd12ffaf2ab
X-Patchwork-Hint: ignore
Message-Id: <20260219172414.2C8EF82205@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/python-jinja2:
 update CPE
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d6f0cf14b05343857379e63460fd4bd12ffaf2ab
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

The `pocoo:jinja2` CPE introduced in commit [1] is not deprecated but is
no longer used. All the security issue on the Github Advisory reference
CVE with the `palletsprojects:jinja` CPE instead (see [2]).

This commit updates the CPE accordingly.

[1] 165f60a092 package/python-jinja2: add CPE variables
[2] https://github.com/pallets/jinja/security/advisories/GHSA-cpwx-vrp4-4pq7

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit c01c53f5e8ea212c826e9c276d69a900dfbbbace)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-jinja2/python-jinja2.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-jinja2/python-jinja2.mk b/package/python-jinja2/python-jinja2.mk
index 74360ec258..a52fa77275 100644
--- a/package/python-jinja2/python-jinja2.mk
+++ b/package/python-jinja2/python-jinja2.mk
@@ -10,8 +10,8 @@ PYTHON_JINJA2_SITE = https://files.pythonhosted.org/packages/df/bf/f7da0350254c0
 PYTHON_JINJA2_SETUP_TYPE = flit
 PYTHON_JINJA2_LICENSE = BSD-3-Clause
 PYTHON_JINJA2_LICENSE_FILES = LICENSE.txt
-PYTHON_JINJA2_CPE_ID_VENDOR = pocoo
-PYTHON_JINJA2_CPE_ID_PRODUCT = jinja2
+PYTHON_JINJA2_CPE_ID_VENDOR = palletsprojects
+PYTHON_JINJA2_CPE_ID_PRODUCT = jinja
 
 # In host/target build, setup.py tries to download markupsafe if it is not installed
 PYTHON_JINJA2_DEPENDENCIES = host-python-markupsafe
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
