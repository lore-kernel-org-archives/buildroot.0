Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD7DD0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 137E340A6C;
	Wed,  7 Jan 2026 17:47:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GwO7TKIk3M2Z; Wed,  7 Jan 2026 17:47:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAC5C40A56
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808046;
	bh=DZHWQO3wfgkYclC6PjPkBn34sIk1aeCn+bAjreYSfBU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OLgHCFgo7WMzbDoPlxjPvqKVd5DqmJipE7vtqjEpews46CxSbMbjfRqEkXXtMf6m1
	 iJU2zS2WiH83Kns+yc/FBYTZMRGcy9x8BWNTudto42QwdNi1/r7mBDLK8WhJWaXdjt
	 +mHNkXwPiaCNvCXnfueA0eIXslUXxa1G6PnWoBZkDz2cG9DT+YbWKZyzV6EYtvpmWs
	 XMGPPKk0C0oTQXcdFBHIxHBLM42FeEGnRhqL1cqs/PmldiEg/sMu6Ij+bibXzQYk1o
	 SUgyF5p0RojlIq3x3ky8iIlezTgXtXPy3ra7mSLHjGeBZsohypp0b4KPkrF5cvDFhn
	 s1mTBTaEV95Eg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAC5C40A56;
	Wed,  7 Jan 2026 17:47:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 114D4A58
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA548408A4
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0i5SkAW1dP4a for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0A144085E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0A144085E
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CEF8988367; Wed,  7 Jan 2026 17:46:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:19:00 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f805100bb4fc981282b9c94155e173a999110139
X-Git-Newrev: 0e97bf50e6997fc56cfeb21985745adc2c9f4c05
X-Patchwork-Hint: ignore
Message-Id: <20260107174643.CEF8988367@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-pynacl:
 fix sort order of dependencies in Config.in
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

commit: https://git.buildroot.net/buildroot/commit/?id=0e97bf50e6997fc56cfeb21985745adc2c9f4c05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 50922517f7c3f8c35f1683aab10c33e95f79fe29)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-pynacl/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pynacl/Config.in b/package/python-pynacl/Config.in
index 0553d82ce9..51623a0a70 100644
--- a/package/python-pynacl/Config.in
+++ b/package/python-pynacl/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_PYNACL
 	bool "python-pynacl"
-	select BR2_PACKAGE_LIBSODIUM
 	select BR2_PACKAGE_PYTHON_CFFI # runtime
+	select BR2_PACKAGE_LIBSODIUM
 	help
 	  Python binding to the Networking and Cryptography (NaCl)
 	  library.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
