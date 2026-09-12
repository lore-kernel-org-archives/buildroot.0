Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F4CC88E59
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 13:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64B8D40722;
	Sat, 12 Sep 2026 13:35:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OgmMFCYsATLv; Sat, 12 Sep 2026 13:35:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7DB4440726
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789220109;
	b=rhACWQiLz+myVxtgH7+g97/1NEEFWkbpOwiLfA0p9jnCtcwo+KyZvhKOhhR8T6cY6bfp
	 XNjMXDirs7uCNwZ42Ki8jbQSxJllWlBINI5EYUjIGLGEpztTzAI3pp9gGKDq1qC8FwTLY
	 k5/WszTmtRsjzEuCBk/g4ZWVgpF0h/qNg5x0N31TnZupwTvIdY5yJBEViux2z8ZwL1QSw
	 ekokNDjVhRFSpK1CcxjO+1cYpc37Vj4Uua4rFuKpXsrxzMh/yQN8FQwWWpVejkMF65W/0
	 tDXivomCagDVqUP2CLFBsQBNEIK3jUbxPwrmKYRo4gxF5I0QbBdaljjWqGz3ITxL3dw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789220109;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=2CnUgaNjQbABGKHU0pFsXM6Cu0aVRxyvqdEZi9jS+zI=;
	b=aWWYEfF9il63UqMPfA4JwLdqXfDNRofXsUw2HJ6xOxX0TJGUMWkrynwe2jw+wTx4csnS
	 TAk/DrRfHnYPg56du62Xz4LTs+mSCZq1/3ezXY579UVXl6CkWyBLeHhCFyPDGVIuNzKIU
	 H8n1acafikWnIr7/c9VxCWcV5P4YxjPSUOmjeSGuGZ5x1Eb//m1YDzDXshXCfYg52dQdA
	 MOvwqEl3YAhPkPsOWyPApvqmzX3pMtg45aJazInbyMp/O3FWjBSHWNa1FMyftE82mwJyP
	 EoBRWujaRYplpk+2BxIhg2cAPRRY58rqmzgL117FnifAfKu52sTX/nu/1Rs16tkBgVA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789220109;
	bh=2CnUgaNjQbABGKHU0pFsXM6Cu0aVRxyvqdEZi9jS+zI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=B0+ChJmlciTGNGqPzjJdVyjZxHWWNpxq9L9Et5Wd3Pd4MATeMqf/q9HEwqM8UNDXc
	 F0a9fkvgtiJE2KKbEiE0O3Dpg1xgYcjRr29eqDXxB34gDnkfbVi+iLBr0qrnk5wR1h
	 UZ443i6OBiFsiC97PvIwn/Yzz+PMW6YyldPEUQNM83Ju1oKEwNtsnIc5NldI30p5Ym
	 svi202ZrpCv5XbKCTmk/GOdrec4gdQ6xQHJDu3UfM0H7kbHjS4WmJC9iLxV/iM2iQo
	 uuV0Wq8q1Yht+Dk5mQWIVdadyQQlJ6w9LF/MASqr0o+f7bYjJ8rfjARasDLFGwKr8z
	 G1VErKtYX3S+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DB4440726;
	Sat, 12 Sep 2026 13:35:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1743532F
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 13:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 095A140729
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 13:35:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nF5Clndhujp7 for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 13:35:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5761C40722
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789220107;
 b=VReeFj4VB18iryu7lxwoGKJtJOVsXPml4HMUJ7KnFLMUwBg5StlirivLly1b0M8B2GjT
 40jkzIRZhlj4gk1Fn2IxQny34x3yIOv5HeJd7bWd+D6Bpp2wj+fNgAlA8UbAVPDbKRKrK
 5r8LoO6CK6BTkwo/tJc+sQIx4CN2Fi5WZKOUNiEy/9XoZveWmVHWsw+aiqprO0xKHwV5c
 sHGy43nDMz4/pbwSkkJaXaWwoy39DacDtzaduerCZ0WnD9okroZevOXCjzOzu7E48Asfa
 O6d7Af2KMd1j9nlQp+ypXW5O5SAeG9u1sExdZnl0XBlRTxyL2iNosEXZMF4IpThKb2g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789220107;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=jywCE8MjhNU2HoB6YW0kgYLHMqHltdA/FD7JoLbQUnU=;
 b=HIf4z6oKQutJzPZ1jGx2v6MWsX+Teop7lKqPoN8vQMTYF62pbcXXuAG7FLQl6S7WrXpe
 XbGfqdJ4O25f7+jkag6wAfRvM/xUEzf4VwR8IQmQPYwMg62DOOxTRE+LJI6YsHxfhuhBE
 DUv2uQ7WiuJA9plAadhvTja0UttCEPLhHUdOgYy+jQO4BF8+1i0IdTm/p+dVWNk1CDWol
 /iFlr0E2fFGHJD6/Yl+SqmC56NyXy3Te9aaq3xKZZ8YJOadtFcsBj2iUvtfq17nPQqECg
 tBRjTAmLse2i06JwfRnAyeTrDpnOGJiGhjFD9wRQAjEAtBfBLjD/40IRsckkcmLJFEw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5761C40722
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 13:35:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ED35F956D5; Sat, 12 Sep 2026 13:34:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 12 Sep 2026 15:29:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ceaf9e557df142bdf771ffdc102ee5a00443bd2b
X-Git-Newrev: c25fed67e6165269424c2cb7f1f93f720c2a8145
X-Patchwork-Hint: ignore
Message-Id: <20260912133402.ED35F956D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/omniorb: bump version to 4.3.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c25fed67e6165269424c2cb7f1f93f720c2a8145
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://sourceforge.net/p/omniorb/svn/HEAD/tree/tags/4_3_4/omniORB/ReleaseNotes.txt

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/omniorb/omniorb.hash | 8 ++++----
 package/omniorb/omniorb.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/omniorb/omniorb.hash b/package/omniorb/omniorb.hash
index 36db67191d..b71fa7e2ac 100644
--- a/package/omniorb/omniorb.hash
+++ b/package/omniorb/omniorb.hash
@@ -1,8 +1,8 @@
-# From https://sourceforge.net/projects/omniorb/files/omniORB/omniORB-4.3.1/
-sha1  b6581c9b6a956c1d442c442767b5a58899a09513  omniORB-4.3.1.tar.bz2
-md5  dc3e4467ef3f457025fedcc6403f8f13  omniORB-4.3.1.tar.bz2
+# From https://sourceforge.net/projects/omniorb/files/omniORB/omniORB-4.3.4/
+sha1  03cab2ac0ff04688e174a9247e85ff230d6f2451  omniORB-4.3.4.tar.bz2
+md5  92a8f1b8612dcf692a8c35da4b0da9d2  omniORB-4.3.4.tar.bz2
 
 # Locally generated
-sha256  0f42bc3eb737cae680dafa85b3ae3958e9f56a37912c5fb6b875933f8fb7390d  omniORB-4.3.1.tar.bz2
+sha256  79720d415d23cd8da99287a4ef4da0aa1bd34d3e4c7b1530715600adc5ed3dc3  omniORB-4.3.4.tar.bz2
 sha256  126647a6ee062fe46f8f3766965dc62e031c0a31238a347e4bc07aab2ac1e2a7  COPYING
 sha256  eaf5b13ffd5355da7c0b83074e4b798152ff7086c95c4f3045122a06e2673eb9  COPYING.LIB
diff --git a/package/omniorb/omniorb.mk b/package/omniorb/omniorb.mk
index 8235fac797..b61c7c3537 100644
--- a/package/omniorb/omniorb.mk
+++ b/package/omniorb/omniorb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OMNIORB_VERSION = 4.3.1
+OMNIORB_VERSION = 4.3.4
 OMNIORB_SITE = http://downloads.sourceforge.net/project/omniorb/omniORB/omniORB-$(OMNIORB_VERSION)
 OMNIORB_SOURCE = omniORB-$(OMNIORB_VERSION).tar.bz2
 OMNIORB_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
