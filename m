Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10391EEB57F
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C89A3814D6;
	Thu,  1 Jan 2026 09:42:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id euwA9T76w4iM; Thu,  1 Jan 2026 09:42:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EAF7818C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767260564;
	bh=VlDdp8dUEqFM2v/9fPi06WNWDWZ1meOF4RF8+OIAgGM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=k/9f35LYp41t5iZtC67cOduJUn58/8KRxvAx3CzRB4Bh62RLYqG0sImcm0BFZgsVZ
	 l5XF3JaOoFmEhs9GWZsY7+SJSOAa33ytOCHkzR0OD/pWZcZwjZGJOYFcegmwm3o5qz
	 3CqixpZySilL+CXYpIFIfoQIxitUam6L+sMhCUZOdrqMmdvnU8EvuEyFNTVFgSWZsL
	 8ondjFdGovFFwx84UIOViSQq9jL2GGPxOA4pE0NQ7inkazRJz1tIaSSUHj8oqsNhhy
	 eYQvh/8PKx20xKrRdn6U+tEcguB3V7XFYNB95NbTf+77a5LRW1XbhYgt+HePi7Gu8A
	 DKbwiZaFsQsMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EAF7818C0;
	Thu,  1 Jan 2026 09:42:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A5AB206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8353815CA
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 39Ky_pOb-Xhh for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:42:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98E53814C7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98E53814C7
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 97465878FB; Thu,  1 Jan 2026 09:42:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 10:32:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c2176a9af0af2179847106b50f6a532cff4bdb6b
X-Git-Newrev: af21a7ff2de585dc58a63363037563f0f1343fb4
X-Patchwork-Hint: ignore
Message-Id: <20260101094232.97465878FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-smbus2: bump to version
 0.6.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=af21a7ff2de585dc58a63363037563f0f1343fb4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-smbus2/python-smbus2.hash | 4 ++--
 package/python-smbus2/python-smbus2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-smbus2/python-smbus2.hash b/package/python-smbus2/python-smbus2.hash
index 65f9eefaf6..b0c9802204 100644
--- a/package/python-smbus2/python-smbus2.hash
+++ b/package/python-smbus2/python-smbus2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/smbus2/json
-md5  5708a6cbf052f45a3ad6dd83c00902a6  smbus2-0.5.0.tar.gz
-sha256  4a5946fd82277870c2878befdb1a29bb28d15cda14ea4d8d2d54cf3d4bdcb035  smbus2-0.5.0.tar.gz
+md5  d832ad65cbf7f58685c0e5647ecc6494  smbus2-0.6.0.tar.gz
+sha256  9b5ff1e998e114730f9dfe0c4babbef06c92468cfb61eaa684e30f225661b95b  smbus2-0.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6ee9cf18c3a75dd76fb549a4b607ae34eedc31a796c48157895e2ad28d66ce79  LICENSE
diff --git a/package/python-smbus2/python-smbus2.mk b/package/python-smbus2/python-smbus2.mk
index c416a55005..fb1d4fc02c 100644
--- a/package/python-smbus2/python-smbus2.mk
+++ b/package/python-smbus2/python-smbus2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SMBUS2_VERSION = 0.5.0
+PYTHON_SMBUS2_VERSION = 0.6.0
 PYTHON_SMBUS2_SOURCE = smbus2-$(PYTHON_SMBUS2_VERSION).tar.gz
-PYTHON_SMBUS2_SITE = https://files.pythonhosted.org/packages/10/c9/6d85aa809e107adf85303010a59b340be109c8f815cbedc5c08c73bcffef
+PYTHON_SMBUS2_SITE = https://files.pythonhosted.org/packages/4e/36/afafd43770caae69f04e21402552a8f94a072def46a002fab9357f4852ce
 PYTHON_SMBUS2_SETUP_TYPE = setuptools
 PYTHON_SMBUS2_LICENSE = MIT
 PYTHON_SMBUS2_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
