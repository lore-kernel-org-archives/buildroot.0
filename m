Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4548C5CFDB
	for <buildroot@archiver.kernel.org>; Thu, 13 Aug 2026 20:18:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91D8840D3C;
	Thu, 13 Aug 2026 20:18:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AeH9y55RSqpb; Thu, 13 Aug 2026 20:18:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3823540D38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786652304;
	bh=uu7t/gB6IqfzRnrsjutzVlgQJV+ypw1RNuETs12sNgE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=if8AdE5JFKaNMeAijFLyzRXqZpxMrwy360+/Kprh/cPoclUS+FZTW2biSLwF7180F
	 OpZm4tM2wkx8CH7Gpi30gQLQHdXI8GwojEHTEBjSAbX/6SRcdHv7bnwi+x1WO6CKfk
	 fnk3sw0xZGWZaxoNF7/DtGvBx6hR7CRKWWvS1ahJSVLtSxTmIlfq1KyI+QXGVJsxWm
	 st9iIv8mcPN+GDjtnIXbi45TlnTa3CnF5AXgphj+cnEgZWvnihwdfNeH3EFQVrLpBy
	 GYtQyvM9xANTM7zDm4ZuCrChqmnfWfu5mSJWYwOiC/3F5UB7QkGeGB5BwVHzeuYrwA
	 QygroG/d2X+nw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3823540D38;
	Thu, 13 Aug 2026 20:18:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F0B821393
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 20:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D7476400AB
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 20:18:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZMo8MX3gQguG for <buildroot@buildroot.org>;
 Thu, 13 Aug 2026 20:18:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04BED400A1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04BED400A1
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 20:18:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 10F1D8D591; Thu, 13 Aug 2026 20:17:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 13 Aug 2026 22:17:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ec8c6e44874e4eefaf8b6f7c92464cec6db8c6ef
X-Git-Newrev: a0d58864d0ab2f6f292a56a4359ea457851a6a1f
X-Patchwork-Hint: ignore
Message-Id: <20260813201732.10F1D8D591@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/s390-tools: bump version to 2.44.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a0d58864d0ab2f6f292a56a4359ea457851a6a1f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For change log since v2.33.1, see:
https://github.com/ibm-s390-linux/s390-tools/blob/v2.44.0/CHANGELOG.md

Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/s390-tools/s390-tools.hash | 2 +-
 package/s390-tools/s390-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/s390-tools/s390-tools.hash b/package/s390-tools/s390-tools.hash
index d5f6cc5ea8..093f850c3d 100644
--- a/package/s390-tools/s390-tools.hash
+++ b/package/s390-tools/s390-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  2933c6c5233cb70b7c47d9410458d8e4c26347de683e2c027956b9c67c7ebe9a  s390-tools-2.33.1.tar.gz
+sha256  05455baba4bcd3f2e6243aacf2d26f742c22944a29e412d50b89cc73e3028114  s390-tools-2.44.0.tar.gz
 sha256  cca17a9a944ebec769adee4aebd805c912c357785ff2705a99ffe68563021f75  LICENSE
diff --git a/package/s390-tools/s390-tools.mk b/package/s390-tools/s390-tools.mk
index 6b7a52447b..a01129338e 100644
--- a/package/s390-tools/s390-tools.mk
+++ b/package/s390-tools/s390-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S390_TOOLS_VERSION = 2.33.1
+S390_TOOLS_VERSION = 2.44.0
 S390_TOOLS_SITE = $(call github,ibm-s390-linux,s390-tools,v$(S390_TOOLS_VERSION))
 S390_TOOLS_LICENSE = MIT
 S390_TOOLS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
