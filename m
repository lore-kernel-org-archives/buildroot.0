Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6632EF48C5
	for <buildroot@archiver.kernel.org>; Sat, 14 Feb 2026 11:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C6FD60902;
	Sat, 14 Feb 2026 11:47:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ah11ykT9etk; Sat, 14 Feb 2026 11:47:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF968608EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771069662;
	bh=6oKWxANtAitNztTuzenZCaArKcbkkM0EpKpebZoKCFI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aiYNNPyyKnq4KZEjQQnSBViEd23xNeiba2XsaNZhP0dpRaLtDKPLIRZ3SIm+Iv9+i
	 MWJCxFN+HV/Pj29ySPWaicqGrAt2nOiZXSvPDYFxNfNLJnFFyOId3B9loHuv/FAShP
	 ZM4OvUPj/SBGswSnfM/Uu6I0lGAZt8pxsH0yojRZKqL7DN3/QgpfRXpKgPgQJXifGW
	 pqebjNWaR32BiLvllgoqBkgbXAwhwGMdx8CZIc8j5lP3JKAfWkefq5frktgMvj7jLE
	 7MrQOo95tw+lJoNlUmJdLWYszadNTjgYkE6z/ll/+ROLbuvABEYCJRp9qqvLtLVjNA
	 uOFSpzhZGqg4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF968608EF;
	Sat, 14 Feb 2026 11:47:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3601C69
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 11:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26D7983CC2
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 11:47:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2nn7EfhaoSbk for <buildroot@buildroot.org>;
 Sat, 14 Feb 2026 11:47:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C8BA83CBF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C8BA83CBF
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 11:47:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5CDD986D2D; Sat, 14 Feb 2026 11:47:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Feb 2026 12:43:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 87e2a72e13b870530cdeb7ec9f21036aa994d43c
X-Git-Newrev: c01c53f5e8ea212c826e9c276d69a900dfbbbace
X-Patchwork-Hint: ignore
Message-Id: <20260214114741.5CDD986D2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-jinja2: update CPE
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c01c53f5e8ea212c826e9c276d69a900dfbbbace
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The `pocoo:jinja2` CPE introduced in commit [1] is not deprecated but is
no longer used. All the security issue on the Github Advisory reference
CVE with the `palletsprojects:jinja` CPE instead (see [2]).

This commit updates the CPE accordingly.

[1] 165f60a092 package/python-jinja2: add CPE variables
[2] https://github.com/pallets/jinja/security/advisories/GHSA-cpwx-vrp4-4pq7

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
