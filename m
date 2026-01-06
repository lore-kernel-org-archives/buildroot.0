Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3BDD0D155
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:03:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 935D841685;
	Wed,  7 Jan 2026 18:03:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mLIzb9Ve0aCP; Wed,  7 Jan 2026 18:03:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A914C4167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767809004;
	bh=M16UscUEwUKCLRZuH0TYXCKgJEqLwG387+PmeIXI6xc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CaePZnzANhXq/pMICq4axrPcKy4mXpFUPc+irSY4rohXz/+mYRxmicupvjEUC1WXk
	 RZNkD/m/Xyqs+8Re3Ej2NpmCsGZWPzliSWc0RNWAEilRbg9FzS2PpmvELCe9DvoECh
	 p4wl70O4KHnpOV+OjLa1yEb6u8K2bnAaL/HnrFkZKwSK/8vAmuAk9O8bpbheNVaTV/
	 bwfy4eFgDsFkpDENaDuN1YWNgckq9zFyHE6rAlVl65Y0Xz/k4cNIR6preDztsM43Af
	 d5VEmGNeIB7Dm4TOFXjwd0Y5Aw1ZGaKliR+qe8waWJxTobh7TbYdLxY5MVOHxVr/YF
	 8Ou7hn8LZQkZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A914C4167D;
	Wed,  7 Jan 2026 18:03:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 107E8A58
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80FDB810E0
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BNP3g7lmV4n0 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A142480C8D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A142480C8D
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A02F480333; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:59:49 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: e0fd58288c6d506c119c8e689cbdb85fa3e8e8ef
X-Git-Newrev: 562e7fb5d27be538405db90e6be02698a62e2927
X-Patchwork-Hint: ignore
Message-Id: <20260107180114.A02F480333@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x]
 package/python-json-schema-validator: update tarball URL
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

commit: https://git.buildroot.net/buildroot/commit/?id=562e7fb5d27be538405db90e6be02698a62e2927
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 63863ed1f7ea4e038fdbd6dbca8a79492a488556)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
