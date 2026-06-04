Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C90ACD6E79
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4468882242;
	Fri,  5 Jun 2026 12:40:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RCod6EqgfSLK; Fri,  5 Jun 2026 12:40:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 553A08222E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663240;
	bh=TUQHHg4sGeR6Za0Lxto1reRtR+LuhzZ3h8zKYMF1qxE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Q7bMhhwRsV1cRA9z3JOEh5isSj2qf7XRjsbWBX/1PU7bz4i/nrtPC5hP4zikJuPMu
	 Y6uCtNC7jbmOui5VAyxIEJ+K7zQR6rhH8x7tKrxGpmOt9O/rPaw1TB6qvvRBRiFOQZ
	 HoUVFtWz2FqIdKl/cJK0yDxzlKuNZnOcpxrjH1+OlzjVc/n5zJQ0hLct9pNsxLywh5
	 XhcaIMxrsuQmbHqPiADi4e2m4qXLP8cJWJU7s7KaayILsFdOdKM7L6NKKsG6l02P3q
	 FJtVCM27QBfDYDzjUwgjS7qDWy/2K3eBnUHamF+s9XuwsfSSBSwKlqTke20biaTsZr
	 S5FsPKOn8fyvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 553A08222E;
	Fri,  5 Jun 2026 12:40:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D4F2F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD31A4107C
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FA40U3Ykw84P for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19EDE4100F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19EDE4100F
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4411787B39; Fri,  5 Jun 2026 12:38:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:18:19 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: e3ccc1eaed1ae789727ddd1dd776c875422de34b
X-Git-Newrev: 8b6eeca15889b5af98eaf5d52ea491e5fd306812
X-Patchwork-Hint: ignore
Message-Id: <20260605123839.4411787B39@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/liburing:
 properly handle VERSION vs. SITE
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8b6eeca15889b5af98eaf5d52ea491e5fd306812
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

VERSION should ideally contain only the version, i.e 2.12 and not some
additional prefix like liburing- as it prevents our logic matching
against release-monitoring.org data to work properly.

Fixes: d2ed4565321c74772014681ca5ddcb433162e468 ("package/liburing: bump to version 2.12")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
(cherry picked from commit 8e2d15cb760c10474862697a4917e32878e5d279)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/liburing/liburing.hash | 2 +-
 package/liburing/liburing.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/liburing/liburing.hash b/package/liburing/liburing.hash
index d37b69497f..d50a81d2cb 100644
--- a/package/liburing/liburing.hash
+++ b/package/liburing/liburing.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  f1d10cb058c97c953b4c0c446b11e9177e8c8b32a5a88b309f23fdd389e26370  liburing-2.12.tar.gz
+sha256  f1d10cb058c97c953b4c0c446b11e9177e8c8b32a5a88b309f23fdd389e26370  2.12.tar.gz
 
 # Hash for license files
 sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  COPYING
diff --git a/package/liburing/liburing.mk b/package/liburing/liburing.mk
index 24ceb281b5..78b43d5bfa 100644
--- a/package/liburing/liburing.mk
+++ b/package/liburing/liburing.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBURING_VERSION = liburing-2.12
+LIBURING_VERSION = 2.12
 LIBURING_SOURCE = $(LIBURING_VERSION).tar.gz
-LIBURING_SITE = $(call github,axboe,liburing,$(LIBURING_VERSION))
+LIBURING_SITE = $(call github,axboe,liburing,liburing-$(LIBURING_VERSION))
 LIBURING_LICENSE = (GPL-2.0 with exceptions and LGPL-2.1+) or MIT
 LIBURING_LICENSE_FILES = COPYING COPYING.GPL LICENSE README
 LIBURING_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
