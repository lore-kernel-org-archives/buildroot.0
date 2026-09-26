Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C74C98318
	for <buildroot@archiver.kernel.org>; Sat, 26 Sep 2026 10:45:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3ADFD40AE4;
	Sat, 26 Sep 2026 10:45:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WaCiq3lMRqMF; Sat, 26 Sep 2026 10:45:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5944B40ADA
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790419521;
	b=MwWO/fp0O+453Gkc08JIdtckH4LIHpLu+RaPz4o4CcGVKyj5AW1cqrnaaSjTghRReEK2
	 yET2Tp3cG8Wl0wE9FJgEh72qDwNIORAcwlQDW/DIsTm2qqaWsDadabZFrnNaeMIU3FnVz
	 +7HU28GtgNJdtCko87AE2KVcxQUn6Jgt/E562UlViH3CguSKtppyGdsbG6pKGIPSY8PjI
	 da/ULWJDM2ABTqpeN8BclbYussPXXwaVq0WHhgeLmi8fr6mDJXBzwJSy43ORqjlAjWEco
	 Hfl6eUSmG6CFsLBjWwIpV2WuTPAIl7Pf3h8uhtB8gQWD8L05hsfti4EdoPm2dPNmwZw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790419521;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=yIz2vbVQFxxBLHlbrZO3Y1a6iO0lbk1tBN4NFIjH+ks=;
	b=fMmP1tohRVFl+m53tTKI/lnSBKQILBcHAEkc/PeV3Saeb6bwFMlvp/2EEekCXtDwVJZI
	 +8MFPLWysI+AWESBQ7CnzncPD0uvZaEOMLdNe+N/mR3BeG9ZoRwsFF0AgMtE4Nra/dkWI
	 5wZT9BDa2zzjbYpUXvx/Pi/hj8yJD9eTaiqUVmqD6ir2ySHJxuhIIJRPen4dZejxXlZaq
	 gY2k0Jm7g+gw/sxFSF5FJjUykQ24ckRQJtD7Awo5v7/bvXYcb6CU9QRZiaVMMJN7Oawxk
	 uIUsN6UU68UqbzA1HUFofO0i7rQvagP6P+/1mgjGhVJYpq05MwFdawt7SdtnSm9tcHA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790419521;
	bh=yIz2vbVQFxxBLHlbrZO3Y1a6iO0lbk1tBN4NFIjH+ks=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Rl5ZryS4oN+ASNhEoHKM95eBJIrnxhqiNdWXQvZAIFztIoWPXAtkQt+d36n7SVpTs
	 c4qlBYI26bOHBz4uCMyefyfzQJx3uSTpXzHqTb5WoJMifgbX1XC4I3c1X9K8COlhHV
	 XwCoEfDXMvetZBAQP4Nbh1jB+MRCM8Kao3e8r4Mvxbv+lSSC6QY3tipzaW9DA7HqFL
	 uU+EBDF1I8zUGofnweAF1ITZtZriqRKkcRICUeBOxogU0VMcx/F70Z+ic/eEdPmaav
	 rVIOrhrZC6IO0S8PDxK6ApY11xrutaOT5CQ2XSX0UHW7EvFY/D2G1MOV9t/TqR+fYK
	 M1JXEUeAAJmEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5944B40ADA;
	Sat, 26 Sep 2026 10:45:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CF5A3335
 for <buildroot@buildroot.org>; Sat, 26 Sep 2026 10:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C075981296
 for <buildroot@buildroot.org>; Sat, 26 Sep 2026 10:45:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XRqvtSeS_eyt for <buildroot@buildroot.org>;
 Sat, 26 Sep 2026 10:45:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org BBEBB812E3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790419518;
 b=afeiJfhtn5Sr+eysXlTrt/7pJBnrCFGDp5wBGP1VpFUIjk4gMHXePWUFJk0+e/GvrsRf
 6hP3hGvc9YJ8vlvNyCYO8vlye3u6oNfetRR8RSp/H6lR9/PmegN2IvY1v2+u4DN3y/HA2
 ab5H3k8vDywJm0kSQ7F4ggVT8/vhLVskPpVicwlKXExc3l3vZ5Un3vzY12lXL/ueUm7rv
 eJBLXKw6UAW09fnsG2YMZMBqJ/r5mr6LgVCWZbGOIntoe4fZxChIhAEAbY4t85ty9LZVg
 mnwoE2Dz8GsfFDSxDuO4MK3KXMMlkSYSmSsmi/tYc891SDVrw/9tUGscLIpEFrf/J2g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790419518;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=yfv9fLpxpnA51rCXg089ROq4Ml2O+GBBa9EtMEXeBoE=;
 b=lNhCgEaLPAtjTzgjkq0FokDAUtzydg/lPpKiz64JD/JMwUsUXOygReQfIThu345xr+SH
 huX55ZXqH9dMkurNgh3HtUttSUjWGSXfogp5cihXbzel4wqK/JcgioBzPLs1iiAHumR+C
 7yxG6RDoKuiHo1WzejMOBoX3T1+tfwJHUei//HnVN/1UwO3g03Y0uEi3NvaoLG5pX4eQN
 Kfuwb+huEGxMTizBQ91CVj1ki8bYASdNlNAuRXfVPI5Hw4NomRNmIIYATfCC7/bSMT64T
 P5N+/MHQ1PRCKujg6yW5R6QBe+iP0T2AVdYTB0VbRq/Ymh5/sVcoyUqgWyfbWpETluA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BBEBB812E3
 for <buildroot@buildroot.org>; Sat, 26 Sep 2026 10:45:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8953A8E452; Sat, 26 Sep 2026 10:44:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Sep 2026 12:08:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f07eeff6dfd4b2ca9065e18b6c84e6ed9bc236c8
X-Git-Newrev: 063863ee5c6f7aafa15820f20f04e66243b727a5
X-Patchwork-Hint: ignore
Message-Id: <20260926104407.8953A8E452@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/samba4: bump version to 4.25.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/063863ee5c6f7aafa15820f20f04e66243b727a5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://www.samba.org/samba/history/samba-4.25.0.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index d62e325f82..10d881b093 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.24.7.tar.asc
-sha256  45b7747a47452eff2b2159a44cc63eb43690d339fd1069088e023a015fed06c7  samba-4.24.7.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.25.0.tar.asc
+sha256  2e2cb7296833b35b8f7a7fb76045e0c57adc0c2cd03264b37df5d58e40f28437  samba-4.25.0.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index a9e1577e26..88d2c598c4 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.24.7
+SAMBA4_VERSION = 4.25.0
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
