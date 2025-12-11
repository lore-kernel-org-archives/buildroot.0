Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34036D43342
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0153D4097B;
	Thu, 11 Dec 2025 19:27:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OC-kjFIdfcFA; Thu, 11 Dec 2025 19:27:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 393FF40894
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481269;
	bh=KDTlIrxjw2wiTAjF7Fcfb2ZMvcaD4JUtMt2vOQ6mf1g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CzsGMgUUCZsiwc1z0PyAvIxSS97xwvZZ2/+nITALqvUkoLNVc+kTDU87uped5+fnD
	 BStVcABe4rObOjo7pZR8pID/i4bfWZudWNk4VBoiaqiNpve69xZ9NjtoCWv1e8sQ2N
	 SSqvIypq2fDRFCdbpryJt2KJmW0PtN5Oh6YynnSA+aEe6yuKeI99yu2UbILVNSq2Y8
	 C6P+mDnBnYve5uP9k01k+g1Rike4VZ7vBgq85F+aGJ/ZLqIBr9rXdzFOhPKaq9mE03
	 wTVYGobRi/9wzYBNQlBGVR1/4P7J5Knmatjq2ZjdzZcjh0W+R5FTIY6cPlFSNf0KhX
	 O2SmyV/2ZqRCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 393FF40894;
	Thu, 11 Dec 2025 19:27:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BE0F32C1
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:27:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A45F040137
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:27:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I7jSg6LA_723 for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:27:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D014040073
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D014040073
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:27:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB0EF86B3F; Thu, 11 Dec 2025 19:27:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 10:21:49 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 64f6f2d06ef7e56c72438117de0e644b15cde1b8
X-Git-Newrev: eadb711a37c1a8c0cf5aa461f803f7706eb49d18
X-Patchwork-Hint: ignore
Message-Id: <20251211192746.BB0EF86B3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/lugaru: switch to
 github
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

commit: https://git.buildroot.net/buildroot/commit/?id=eadb711a37c1a8c0cf5aa461f803f7706eb49d18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Old site returns 404 for the tarball and does not contain any repos:
https://bitbucket.org/osslugaru/workspace/repositories/

Switch _SITE to URL shown at https://osslugaru.gitlab.io/

The hash value of the tarball is unchanged.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a65bbef5baaa04d9074264e56b76e002a8a39f4a)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/lugaru/lugaru.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lugaru/lugaru.mk b/package/lugaru/lugaru.mk
index 53797f405e..57ec9fef3a 100644
--- a/package/lugaru/lugaru.mk
+++ b/package/lugaru/lugaru.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LUGARU_VERSION = 1.2
-LUGARU_SITE = https://bitbucket.org/osslugaru/lugaru/downloads
+LUGARU_SITE = https://github.com/osslugaru/lugaru/releases/download/$(LUGARU_VERSION)
 LUGARU_SOURCE = lugaru-$(LUGARU_VERSION).tar.xz
 
 LUGARU_LICENSE = GPL-2.0+, CC-BY-SA-3.0 (Wolfire and Slib assets), \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
