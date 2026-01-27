Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97653D2FEE2
	for <buildroot@archiver.kernel.org>; Tue, 27 Jan 2026 20:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A05E82286;
	Tue, 27 Jan 2026 20:53:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z5fkKlSWgZ3y; Tue, 27 Jan 2026 20:53:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 556508227A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769547185;
	bh=4x0cEO2tPtpBjytQCfrf8uYbo11zOKwmyHkEt83Cb/s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eW7STR4fs7erLqRzrLVmXBdNlE3jocgPZ/4/IVqX3IiA0YH0+JhxExsQFl4XUn9AF
	 fJFIuS3GQ+5J4rjsGo0E+fl2rsz7TWAWcSS8pefael1rTQlY/gQKooV9hpIS8TYPuq
	 PNQ0uT/s2xDswUfoT+CeuJnRMfUgKlJdj8ax3kUx99+U2zbOUQjOubCJ4J0ZzhYn9m
	 bVtM/o2jcqsCvVtUlT48zpXULPsqGgqNf9B8s/EfVoXQnXLUvqKHTecg+5Wx+w4S9w
	 PHNE6Jy5Hcj6G7uDF5jSNMKKbUA5agLh7qaj5Y/qTcQCUIED4xXCyzqGpznAG8OZyC
	 w4PgWWhhcMDNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 556508227A;
	Tue, 27 Jan 2026 20:53:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B0251118
 for <buildroot@buildroot.org>; Tue, 27 Jan 2026 20:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94E3E401E0
 for <buildroot@buildroot.org>; Tue, 27 Jan 2026 20:53:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2eIdmkDhEchT for <buildroot@buildroot.org>;
 Tue, 27 Jan 2026 20:53:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CA8E40181
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8CA8E40181
 for <buildroot@buildroot.org>; Tue, 27 Jan 2026 20:53:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 799D887773; Tue, 27 Jan 2026 20:53:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 Jan 2026 21:32:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 54153e7ac859a6af36266a24bb49d7f1692b6761
X-Git-Newrev: fdeced6692b12641097864399ab930b88cebff64
X-Patchwork-Hint: ignore
Message-Id: <20260127205302.799D887773@busybox.osuosl.org>
Subject: [Buildroot] [git commit] system/Config.in: do not reference md5 for
 sha256 option
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fdeced6692b12641097864399ab930b88cebff64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit bf3626002f ("system cfg: remove mkpasswd MD5 format option") dropped
the MD5 option, so stop referring to it from the sha256 one to limit
confusion.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 system/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/system/Config.in b/system/Config.in
index 0652b94a3b..98bbd93092 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -67,7 +67,7 @@ choice
 config BR2_TARGET_GENERIC_PASSWD_SHA256
 	bool "sha-256"
 	help
-	  Use SHA256 to encode passwords which is stronger than MD5.
+	  Use SHA256 to encode passwords.
 
 config BR2_TARGET_GENERIC_PASSWD_SHA512
 	bool "sha-512"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
