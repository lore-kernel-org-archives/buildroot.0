Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 479B7CD6E4A
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 10:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1052852E8;
	Sat, 30 May 2026 10:53:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id thT1bYYWHiID; Sat, 30 May 2026 10:53:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9461185178
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780138383;
	bh=aePxeJHlWc3tlQbfnBX5TmIBCrmUMp4OeRn34Jcgrzw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Kh8Uun9zjPCGPNhlC/RA1KTAvnc+SEodu1o68nZUOsK/6HljQzi2iQgEXTbUFvH+z
	 yvW6317LDcVRECQJQ6wClm3K8ZnL2hxBMvsPZ5PWc1SyJ0j0/p+rt/XXoZ4vfmxg2S
	 4TS67fCeb4ffTa6wTHqISQfc1/S0FgleGJe1huUWJZQvI09jK112sbsypNauMV5bKj
	 2a/d3o6eTpOHRJDaDl+M2FxRmhkE8l/zw66V0Bn8WgvmDshTbrf0PZRnqFSpIkJCwN
	 X8IzZ/hqhV8Yp3dxHRfy+TV7141ixu/ImBQHujUP+lZ8qPzkMQrP5TfXv0HX8DmEAf
	 hm3tJfIdSXuXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9461185178;
	Sat, 30 May 2026 10:53:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BBF2C12F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A173242C3A
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:53:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dwK2KnnYSLvT for <buildroot@buildroot.org>;
 Sat, 30 May 2026 10:53:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C75B742C38
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C75B742C38
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:53:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C81648747E; Sat, 30 May 2026 10:52:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 12:49:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dd4161c39d97c7a651625dca18fa2aaab9298fa6
X-Git-Newrev: a0b3c2f84e1e048cfe11243645b4df7dc73bc41d
X-Patchwork-Hint: ignore
Message-Id: <20260530105248.C81648747E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/suricata: fix build
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a0b3c2f84e1e048cfe11243645b4df7dc73bc41d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit a3374e49baa45679997c37a25accaf1574132c4a in 2026.05-rc1
bumped the package from 6.0.20 to 8.0.4.

Upstream included in version 8.0.1 a commit adding rustdoc as build
dependency "required for the tests":
https://github.com/OISF/suricata/commit/6d74656befe20cd939de8a97bfe272efa112c90b

This causes an error during configure in buildroot:

  checking for rustdoc... no
  configure: error: rustdoc required

To fix we problem we add RUSTDOC=true to _CONV_ENV.

Fixes:
https://autobuild.buildroot.net/results/489/48984ab369d01fae9b53b7b1f51e874bada0619f/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/suricata/suricata.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/suricata/suricata.mk b/package/suricata/suricata.mk
index 0ee3752a21..56bbc0c89b 100644
--- a/package/suricata/suricata.mk
+++ b/package/suricata/suricata.mk
@@ -30,6 +30,7 @@ SURICATA_DEPENDENCIES = \
 SURICATA_CONF_ENV = \
 	ac_cv_path_HAVE_SPHINXBUILD=no \
 	CARGO_HOME=$(BR_CARGO_HOME) \
+	RUSTDOC=true \
 	RUST_TARGET=$(RUSTC_TARGET_NAME)
 
 SURICATA_MAKE_ENV = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
