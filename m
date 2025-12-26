Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F14F3E8FDA6
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 12:24:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5458040980;
	Fri, 26 Dec 2025 12:24:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nD1NUbnVNaWF; Fri, 26 Dec 2025 12:24:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09F1C40950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766751858;
	bh=/VLIMQRJ73G8V4htffx8iMrMGYR45oZFzg0XD8fp/hg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Y/DcUmAE8tcY/X3Pts+e0L1mz/CplIWHQBp9CDsFQWdX4I54WD2IcuDQJrwwiIAub
	 sKnAVFdJuL9gv/Z0srCnj6+8lZs8DBFvzgjmzlE5OXXm4rF+khIAV0u2MY60rXcxCS
	 harD6slCC6b0WEpkzG7aTfjKYe1aLBU/fNG1x0wJ54HFhmNs4y0cnY0AUmnZX1aRnu
	 1xRKnWSbxMknv4mm25OyoeTcepcPEBCht9TGWQ917ZUu3HXliWcZoA9u2uQVqVzSi9
	 Jb/D10/GrcUo+gOlTSZ0bOutnpsaF9VhmdasPuYNjPStML8PBncERREmtBx2QB8ZBG
	 WP1ITZUCCBXNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09F1C40950;
	Fri, 26 Dec 2025 12:24:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 407CC255
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 12:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 323FB40512
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 12:24:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xQglTv3QIq3G for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 12:24:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 439B94025E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 439B94025E
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 12:24:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 347A7876CD; Fri, 26 Dec 2025 12:24:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Dec 2025 13:19:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3afac89183899ac0f74737043e581fe65a8aac15
X-Git-Newrev: 92f2cb504545d3377da460cba407c09c842824cf
X-Patchwork-Hint: ignore
Message-Id: <20251226122414.347A7876CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Giulio Benetti to package
 dash
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

commit: https://git.buildroot.net/buildroot/commit/?id=92f2cb504545d3377da460cba407c09c842824cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ea74f9d505..d83540b6bf 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1292,6 +1292,7 @@ F:	configs/rockpro64_defconfig
 F:	package/at/
 F:	package/binutils/
 F:	package/cryptsetup/
+F:	package/dash/
 F:	package/erlang-jiffy/
 F:	package/esp-hosted/
 F:	package/gcc/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
