Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C600D3B7E5
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 22:07:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D430E81498;
	Sun, 28 Dec 2025 22:07:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sjs2LdvWPGsr; Sun, 28 Dec 2025 22:07:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15FB58125B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766959621;
	bh=yUMpxqgLnC4pvKnvCsitxnFSR/RECzizvZsOEWQKi6M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dW7ZNVNmtBq0Px9H81gQS6lZuYsyxKpOkynCwbEGKazsi3foASXKsf+V6GJsT59KB
	 bHSrx1FIwff6fVOrR3IlyWDQ06jgRmUJLDwPyzCbkdtOliF6MWLm6ASqka4gJHk//1
	 bVeUrmnjCEB8rxy/+Z0vXr9rqCQSwXCWN/XuffOsaXE2EX0KEyaTDXvt70rf7INUXX
	 b7Po1DRe4VeR/NigbXfv5XSGBICiY6t0IpCX6zMjkWiNs5RxTIgiezqOjelSfDmFvR
	 oISEGst29too1uPlSCofAMBvVXDsAKwB04/CimdYoURxwTfpMZVrdjz246yfsQ6hHZ
	 0SsxBoyKNPXmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15FB58125B;
	Sun, 28 Dec 2025 22:07:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CFFB5D8
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 447A74016B
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:06:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R94VsDDuETvI for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 22:06:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85330401F3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85330401F3
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:06:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8296D85C36; Sun, 28 Dec 2025 22:06:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 23:02:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 84536c14986ab9f2de93d76a220a06d962134552
X-Git-Newrev: 63863ed1f7ea4e038fdbd6dbca8a79492a488556
X-Patchwork-Hint: ignore
Message-Id: <20251228220645.8296D85C36@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-json-schema-validator:
 update tarball URL
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

commit: https://git.buildroot.net/buildroot/commit/?id=63863ed1f7ea4e038fdbd6dbca8a79492a488556
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-json-schema-validator/python-json-schema-validator.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-json-schema-validator/python-json-schema-validator.mk b/package/python-json-schema-validator/python-json-schema-validator.mk
index c0a335cbd7..017d5a3ec5 100644
--- a/package/python-json-schema-validator/python-json-schema-validator.mk
+++ b/package/python-json-schema-validator/python-json-schema-validator.mk
@@ -6,7 +6,7 @@
 
 PYTHON_JSON_SCHEMA_VALIDATOR_VERSION = 2.4.1
 PYTHON_JSON_SCHEMA_VALIDATOR_SOURCE = json-schema-validator-$(PYTHON_JSON_SCHEMA_VALIDATOR_VERSION).tar.gz
-PYTHON_JSON_SCHEMA_VALIDATOR_SITE = https://pypi.python.org/packages/70/46/ba39cb7efad1898cfc89bf3588b8612f24d128f1c25b761994f524a59cef
+PYTHON_JSON_SCHEMA_VALIDATOR_SITE = https://files.pythonhosted.org/packages/70/46/ba39cb7efad1898cfc89bf3588b8612f24d128f1c25b761994f524a59cef
 PYTHON_JSON_SCHEMA_VALIDATOR_LICENSE = LGPL-3.0
 PYTHON_JSON_SCHEMA_VALIDATOR_SETUP_TYPE = setuptools
 PYTHON_JSON_SCHEMA_VALIDATOR_DEPENDENCIES = host-python-versiontools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
