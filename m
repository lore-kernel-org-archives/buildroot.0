Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02F9606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 19:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=DnV0iNoc
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0DA381358;
	Fri, 23 Oct 2026 19:33:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cA2u5ffA3iv3; Fri, 23 Oct 2026 19:33:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C6DBD811A2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792784033;
	b=e192iezncrJ7tDRmcXYiqP2BfGhjpfY6Xr3z8vn8jePXv5j338DBs28TYO4Fk9jEg6K/
	 V3HFCwh/tHvwgSBtBOG5fMw8DKYTo/5yPhkNc78GF0eSEcfPYKn44+5SHgJdG7Q/GG0Av
	 5NHkPsesr9oHoFWt+5DFA0/XytQUUse9Y5TthQ5gyJbJTJ/DzDRPeFi2ywMyGeGwIIEHD
	 K4NNxSusgWDlBtyABIn3DNWSKgNRYf2c7c4F3d7rQ7bu/zrGoXExE2yklOMSJ8ebJe5Af
	 cUGA9J13Q5k0WRiuq+nU7+w4ybP9pEcsFD8hFr6U90WMpQG5kos/JnAUwUBx7v91sSA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792784033;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=RMZuYXxFR0Ld1ZNbxnCOfGMp2AGZxMScEYCTwZ80mPM=;
	b=UQMgQZOZZfEP4YVbwYctMr+8EP1J3yTgZI6wFL2soLebJ5URrZyxAOSCI4tQga1vbFJ9
	 oXF4G2dOVNa8ROjs5/Y3J3c+iuQxbnOUeC8JVBgGtq1z9VfWayH5UfmZdlWHgCI0fzNu8
	 lxvAlJFkElQ3G4LcwHCeY9brKiL3ddsquQdHvCGPE0OLzePyUNfeEhJ4RxjlQdh6YIWMl
	 2pP2zvuRlx514xTd61LlPnZzPjdTH2v8nubTF7tCEcmr01fzVyKHDCFixyjkW80Uji6wE
	 5fOeLUf7DpiLM1C40xgysWLsN+ug+3E0Db96uaZEMkp65PjrY8Khguvktccvhf+EqDw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792784033;
	bh=RMZuYXxFR0Ld1ZNbxnCOfGMp2AGZxMScEYCTwZ80mPM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DnV0iNocVJD+QW/TZx4aLXLGtpnlgQHMNyMUesL5zDVWyWmnVCz/t2wF6Faq6RiYx
	 SxYMOEhC2DTPOuqSmyt2tH7XCsAe6lOhDnFrgl0zOTZZ0cjSTwuf7lFG0tKsqfevdC
	 Yq5mqmDir2xvGWaf8Y0xlXOp62+sXXbyr0wmJJfUbzZIe3rvCFiT9xBUh2bWkc50ZA
	 T0BV+Aq5GBIqiuab7z4MPpBDhbUsMKtpD8VVj/kYqdQEV0vYezkuTENavEoZ9fIqkf
	 Rljg4qlPXFw0h0O1WhOTMF6vvjWw1kHAYIV4fL55ipROXH9MLQAx2QbIJveKFtBslU
	 9CvMu4Yqr2myA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6DBD811A2;
	Fri, 23 Oct 2026 19:33:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 60378388
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 19:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 521724023E
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 19:33:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OG97CnMG1eJQ for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 19:33:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 680C040061
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792784031;
 b=RWkvu57qDkZjC41pVQz+0N7s2Mp2XAh8xtwDpn/Rum7kC14ztE4sMXOPMvAIgrx3WXgi
 ZKBmG+3u3YQAWBVdtMdZ5lYOjWffgWfDlbe+1ULXuJ1kk1tk6ydaoBy6NSNrHc1XUshHa
 RP+meit91pyAnotXITplRkGMHk6SPZJhK1xaOM0W+l7naPYXZyW2n7aMqUQZpSZ2slERc
 Xi9sRN9tLvkCw9KvLHoTwCzGTutW7AmkM8ZKGw2Wbq5ZqaLHkW55uAQN253GpwyRQcQeu
 JrGRxWgzLkDjPtkW6R07jGB/Wx8Ap/zSBsKOis6+J91GNYMoLiP0nJgzZFSi7/gKaEw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792784031;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=vJ6OWfTB067lF5SCRqJgIYTbf1KBzKV6gUjRDWQo0iU=;
 b=H5ei5114l/9Zifui1fKuChZiw/OMf0zdSQ2xxj2GbeiEHrvL+M+IvgxrDyU7680ItrpC
 GaKxVysn3MtsHhqbbhdsy97BOiWFuICPSVJbuUpypnoD+V4zlbv7I/qXyRe7LTaZN93R9
 ThFO/EMViEjTI6USXO+cQaJCN/Grpza3f1WuQs6B4lZp4UCQ9yV5MUvsBSHoUKTzWhRGb
 k5XiQpy0aVhZ+whOmz52upBuir1dy3RBfnc0MRR55MfR+HEnJ0wp9CKgjCSKa3eczuLLQ
 ALiW7fqubmulANhJhwkWroKYQi+7xa3I5QWQUcstsSvh7m67jMzvUgFY9kqvdl/cehQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 680C040061
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 19:33:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE1049C687; Fri, 23 Oct 2026 19:32:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 21:24:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 410b9c87c26d5d5eaf44b2b2362452febf887b06
X-Git-Newrev: b82efddfa96363264a67f8fbfb97e9095d4bddc5
X-Patchwork-Hint: ignore
Message-Id: <20261023193226.BE1049C687@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/harfbuzz: bump version to 15.0.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b82efddfa96363264a67f8fbfb97e9095d4bddc5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/harfbuzz/harfbuzz/blob/15.0.0/NEWS

Deprecated API:
-hb_font_set_face()
doesn't break any Buildroot package.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/harfbuzz/harfbuzz.hash | 4 ++--
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index da30d531a6..4bd6cf9bec 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,4 +1,4 @@
-# From https://github.com/harfbuzz/harfbuzz/releases/tag/14.6.0
-sha256  d07a007327277708a2a73ae437887cdbaf282937f6d03ca5467723e9099af586  harfbuzz-14.6.0.tar.xz
+# From https://github.com/harfbuzz/harfbuzz/releases/tag/15.0.0
+sha256  968536e9abd782f07f7954044c0c4020199fcdd39b41d221ec42d2a3be4a44df  harfbuzz-15.0.0.tar.xz
 # Locally computed
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 556ae3db61..a68d8658b8 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 14.6.0
+HARFBUZZ_VERSION = 15.0.0
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
