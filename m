Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46CA2EA3F0D
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 06:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07A4D40D93;
	Tue, 10 Feb 2026 06:45:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Ok7VnWay0NR; Tue, 10 Feb 2026 06:45:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57BC540D78
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770705933;
	bh=/uPK6joQr5exL87KcYrVctH/3qS9RDslqqO1McZHOOE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ONcuHk4+ZJSTCepTHHqK9RmFl5qtFH4zr/Q5f2WkbFB6++0JgljgOK92CQiyNNe6P
	 Ny4fWZdR3jCC3ViL/b1SFSBZebR5MrhlWLiWRRxrGy6XU5T0k+vJLs3KS9W3lT+1Ib
	 e47px4oQVgh0A1spvoc7UCJhI87lssGlpZ/QhaI8jdXKXR3kVEkqzhmB3fbC4NAlY4
	 sfHSVHF0ecUigf1l+Qn0NvaVXwYwKcGEmSzJ5aN6Yqv5COPRvQkOqxeujTWT2Br6IC
	 obwMdn1aUyvHIilS54MpXSZkR8D5HTsWSPv3qtmh0oUn702RHl28f7Fm21PILYjf0j
	 Hb1A46MnyiaNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57BC540D78;
	Tue, 10 Feb 2026 06:45:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C03E91A9
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 06:45:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0F4260FE8
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 06:45:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mHaB4lbz7pmq for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 06:45:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DD8760FE3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0DD8760FE3
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 06:45:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F0DFF86A19; Tue, 10 Feb 2026 06:45:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 10 Feb 2026 07:45:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5b23e04383f6a1862874b8567011150805658961
X-Git-Newrev: 4af8e543159f0d512e6eef7674b6d4b2d92f7e9a
X-Patchwork-Hint: ignore
Message-Id: <20260210064531.F0DFF86A19@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: adopt mosquitto for Yann E.
 MORIN
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4af8e543159f0d512e6eef7674b6d4b2d92f7e9a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Scott Fan <fancp2007@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 225d1ac917..296b79f9e4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3481,6 +3481,7 @@ F:	package/tpm2-pkcs11/
 N:	Yann E. MORIN <yann.morin@orange.com>
 F:	.editorconfig
 F:	package/gpsd/
+F:	package/mosquitto/
 F:	package/skopeo/
 
 N:	Yegor Yefremov <yegorslists@googlemail.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
