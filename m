Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0820ACD8CA8
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE09F61145;
	Fri, 12 Jun 2026 11:24:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id psHRXJ-ZM4nR; Fri, 12 Jun 2026 11:24:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 840B36112F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263477;
	bh=7gZ+zRNtz5TfpoY/r+NPFXATqB+h8HzJd1ULC39LDU4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=k6mP2lWhDGzMp4+9+sZyW8dvQAZvxQaCNghSUFYR4sDV1IR9jOndoj2KLB2nUGG2I
	 icFVCFP9CyvfpM80uo7xEEC37V+5dTCTULGrZ6D25Gjy4GFYT/GnrB99M5YcxmOXm+
	 UlR2T5kTNPiXkVThnE0gqClz/GXl/xAlvduj2NxMztHhidds3qotd+25mYHjaWaIXN
	 EZqA3Yb62djeB7zdPyavSvOjSGjlWIGvzHnnWz3rO6CuzmVnstwAaHdM1GKpVmW7ke
	 Ovd9ea3ZeX+J3Ocp4o/kBl1sGzmws5OEFwUJ/0BCWNBm8CWdmsP936MJnkAUrDlI6s
	 z/nmMba1AOycw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 840B36112F;
	Fri, 12 Jun 2026 11:24:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 59560F4
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F1DF040673
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7twCafKaKfS6 for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:24:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1457640676
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1457640676
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E21B4880EA; Fri, 12 Jun 2026 11:23:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 11:41:03 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 80e6c6271a377c1faa80709d2071cfdf7cbf3bf5
X-Git-Newrev: 15c475247374873e5b8b307ece6e70b33b1b7071
X-Patchwork-Hint: ignore
Message-Id: <20260612112349.E21B4880EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/python-ecdsa:
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/15c475247374873e5b8b307ece6e70b33b1b7071
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

The CPE 'python-ecdsa_project:python-ecdsa' hasn't received new CVE
since 2019 while 'tlsfuzzer:ecdsa' received two [1][2].

See the package CVE history at [3].

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-33936
[2] https://nvd.nist.gov/vuln/detail/CVE-2024-23342
[3] https://security-tracker.debian.org/tracker/source-package/python-ecdsa

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f3687ebafa0a3d97b094d5b972a9323e00345da4)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
