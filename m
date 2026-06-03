Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4870BCD6E6B
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 18:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FF5842862;
	Wed,  3 Jun 2026 18:50:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7-1DcJmaDMy1; Wed,  3 Jun 2026 18:49:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AAEE042842
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780512598;
	bh=PAOIuv3lTO+O2gdIdsiWBN5uNnSPGRzeFDUMFNXK3bM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QwvI5CpdCZaFzIjY30CM5h71yp/qBa+plMX5+wwJBbq5Ksn2EdvGdq6z0Ya/zU4A4
	 10xE/ebayxdMfjl/f6Q+9Hwp9TuwSXQhi3hoeVVVQC1cMOeGpo6uKsok3qy22FZL67
	 i9k+JRN4rwdlqEClIamcR+T+WTU10Tm9fhul82TUyQQT1LcivvTJw31A3CVVkVFsYT
	 8US3cMkDL+3G81qcj1kouzyb6ZWZtogMJI41A3SkwfC2xcUt6BYPieCQ9CtwKa2POH
	 hhpPUoVQNmXmyMUjCh8t8X0r1KBn2u8ugC6yZaabBwJ6vJrKoZ8QSSHOUQPoTR8nmq
	 DXpggPTOoZ5iQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAEE042842;
	Wed,  3 Jun 2026 18:49:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D8E12F5
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:49:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 837E861AF0
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:49:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z5iznl15l3EP for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 18:49:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C40EB61AFC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C40EB61AFC
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:49:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B5FD387991; Wed,  3 Jun 2026 18:49:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 3 Jun 2026 20:46:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0c9ccb93275338b5a90cc2278e66790370e2f241
X-Git-Newrev: f3687ebafa0a3d97b094d5b972a9323e00345da4
X-Patchwork-Hint: ignore
Message-Id: <20260603184935.B5FD387991@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-ecdsa: update CPE
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f3687ebafa0a3d97b094d5b972a9323e00345da4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The CPE 'python-ecdsa_project:python-ecdsa' hasn't received new CVE
since 2019 while 'tlsfuzzer:ecdsa' received two [1][2].

See the package CVE history at [3].

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-33936
[2] https://nvd.nist.gov/vuln/detail/CVE-2024-23342
[3] https://security-tracker.debian.org/tracker/source-package/python-ecdsa

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-ecdsa/python-ecdsa.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/python-ecdsa/python-ecdsa.mk b/package/python-ecdsa/python-ecdsa.mk
index c94cc0512d..b1ac6fe1b8 100644
--- a/package/python-ecdsa/python-ecdsa.mk
+++ b/package/python-ecdsa/python-ecdsa.mk
@@ -10,6 +10,7 @@ PYTHON_ECDSA_SITE = https://files.pythonhosted.org/packages/c0/1f/924e3caae75f47
 PYTHON_ECDSA_SETUP_TYPE = setuptools
 PYTHON_ECDSA_LICENSE = MIT
 PYTHON_ECDSA_LICENSE_FILES = LICENSE
-PYTHON_ECDSA_CPE_ID_VALID = YES
+PYTHON_ECDSA_CPE_ID_VENDOR = tlsfuzzer
+PYTHON_ECDSA_CPE_ID_PRODUCT = ecdsa
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
