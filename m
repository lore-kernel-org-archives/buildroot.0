Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38931D43342
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:30:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1E69811CB;
	Thu, 11 Dec 2025 19:30:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UFxwZ5YND3vs; Thu, 11 Dec 2025 19:30:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 136CF80DC8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481413;
	bh=GjcQfSaDK70XptuMXdEfR3+HR9DBuW+u7tfT4tQ1WOA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TYFbY5itI7DpSeDF1l0VFyC7m/+zSu80uPlT3PTN1YHPWvPVwgKC2tIq90K4sJnEm
	 KEhLhhmLZY6JcgGhDTagwqgDqvqb1FkrwUn7xC7cDQPBasfBLIrDSE5CsHHAPkHOp7
	 jUe5byOsNgjK3sxVdcXzvYw0znLhvJYry/ECgvhZaGp+ST79lyUyMSnsFTKpAl0nIZ
	 2hrGJM5/7EUxj4zWJZ+Hg95u17eL8+c+tOnnLDWWh14KDbSmAje1s11bl/lw/rQb0D
	 4JtH9pshefCP6HVywfWDq911/AnCbCg+lXYamXIqy6Rp9/zhbpsBFsjtg8pHc0RzK0
	 ldrq7Fhaw8pJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 136CF80DC8;
	Thu, 11 Dec 2025 19:30:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 38A81E7
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 498A540012
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:29:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0nr1nUeVci3v for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:29:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 392F140029
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 392F140029
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:29:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2C94686BEE; Thu, 11 Dec 2025 19:29:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 10:56:28 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 2e7569be2e82db039cb3e7e8d72d5ca43e1f4b36
X-Git-Newrev: 5f40e75e07c06d5be6a28ac82e92fbed682cb9b8
X-Patchwork-Hint: ignore
Message-Id: <20251211192954.2C94686BEE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/lugaru: switch to
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

commit: https://git.buildroot.net/buildroot/commit/?id=5f40e75e07c06d5be6a28ac82e92fbed682cb9b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

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
