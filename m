Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FA5606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 12:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gHf7EfZu
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4799380DBA;
	Fri, 23 Oct 2026 12:32:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0uiIg0YxGVFg; Fri, 23 Oct 2026 12:32:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5DA698146B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792758730;
	b=NDdXSYY+QNSzrQQ/gm0iwwxybYaIWQnC6nEs0T1GpoOzR7/NWlXAeq9JhTIs5vvF2BWo
	 Bwlk3peEDcwDrkDXtY4I7x+v766VWmsy5L3zp4Q1sAv36PgIn8XLvavmLnmSnxHyoo9PR
	 uwchUUjDGaT7uRKKdduQ5VNKyooWNP5b5rUaSOfAEK7bRmkTyhgsMmO6uCbS6RNcGsRtf
	 3Kz7N9XaL6aw0od32/YqXd/+XYsfybqsaiXkcB5X7RjGSb87v6fQvdyj93RzDf1bbf4IZ
	 RZExejrZ0Muk84cS1yU/3IX4HZ9oPEKGPPJ4vtm2JSveIT1x/OHx1stVTuqyuRq8XTQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792758730;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=azthjwWc63DxIyy3NxQnHDCK0f9/5hgwRNIAFhMZc84=;
	b=oXBb7ynYnfp2fZpH+V/icpUzpn7/N18pERzgi09LvnffrO4VUtmbyRh0aieQi9C1/2r6
	 4obHDgB/WI55WHf04KunXW7TP2oSnshJsWYmzezDD4rKqCpwNkCpAGJWD0Nir4FUF7Tin
	 BrXVOmIMM57TLsNkpbqTKvrYeeXd8HzeZkXd83+1R2NQyoCNQVLnrGOswe80JkCWadgeF
	 FOygUQ87+g8UOzjf2EGWmbU5mB0vGlKslCcnMjQ7nTZuZ6RI97/+huPiurLVexUf6LJ/3
	 3U6ZdUshJThpvvu3+emrnNN0aBmKAJ90buvCguTPbxEsi9xjJwrw1T3Pft3YjyFTumQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792758730;
	bh=azthjwWc63DxIyy3NxQnHDCK0f9/5hgwRNIAFhMZc84=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gHf7EfZu1b404oucLvfHxl13qr8V2jeuaWjNPG67TOE7rFqCy0n2gjFRgpEgwydoY
	 D0FQdRAooXdCewBRUKqK/QOPLlq3dZRUXpTvOhcrX884S0RdEEWQj9YB9g98w9IKT5
	 COfqxsbTHpwNScTHe3NcqwNjJJ0xI1xGBE6T4mrMZa0M7OqP9M+atjAPeW2mZo/E+A
	 JWiMY8qMxcZp3Nz4XOAL2FdgMss2iM2gja5AhWPNiLHfxpDsp9BeIdGEu+jZMED1fK
	 EInKR0xJTthqs9AbuIkvyvhYnZmCVF4E4Yx2LRhVE5/ENthw+9K5FeUWscJtRK50Qk
	 90sMTFWJg/FxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DA698146B;
	Fri, 23 Oct 2026 12:32:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9530112C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B2A440933
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rGULaiRmRbSq for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 12:32:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BA12D40928
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792758724;
 b=S00GqofaoWrpNNuwOMP9R9T3PDgqHcV15bXHXyI2NUbqu+w6tUr98IjRpvPbL/gTdvJI
 rmZ1AW7tvTdod1QWwlJkPHM0a058d7z4cEsuqih1DWhjGXr+LQlGcekkpe+eWIgVta3Pe
 EojpznqyKQoJQEzLTRVs8/ipPiRyah9b9yiQR1N9gCt3s6ewb9X3g1CIn2VSxc0KDL+B4
 m35hrDWOk0iyVPP1ZhOSmc1n0bbqmtz/vn6INuiozfkbpRRMAzMWiLmY/V9ZBrbfSmVHM
 L6UpzXOoLzix5ZWp/D3AsKHwYhecmZouYQZLO9kKVFzz+E73LzDmHLaJmvplYd9400A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792758724;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=QH82TadYDKCZWAAeNioKcEjMDjrE40CkfEUQeqzqv5o=;
 b=TsERfM2mg+e0pRIGwv2c296NkgpFtJqCm2sz5XEH4xJiwWIbaWINTYDZsbOX7UnHWpeU
 MCfA0pCBaOqG6xLxf2qRRvv51P/slcKw16KXDZ0gaNDFjcJGxNHwfdXpjkoteHQ/9vBC+
 zHi5gSrj/y270QsqOjKa4hQKRKLxFS06FXTFOc+SvJu/G8DZoTjCs+0km8cKdtGAUi2+O
 LBcwW4ZP/wHQ9NWboGu9dy3ZVewNTuc7C52Ge1EWC352XoTf547+SyeLN8Fc4sIPjDa1+
 l6WSBLPOgK4lKAXiK0a98rQR67ph7orvnOFHQIecgJa1g3+uas53BnDB360DDeQlwKQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA12D40928
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0D1969C669; Fri, 23 Oct 2026 12:30:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 20:50:23 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 7e1b227cb6f82a216d6e05f2944c6c6b7d1d062b
X-Git-Newrev: 501436823047caace88ae663101723a0c677165f
X-Patchwork-Hint: ignore
Message-Id: <20261023123040.0D1969C669@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/uclibc: patch to
 remove pthread_atfork dummy for noMMU
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5224269121099167218=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5224269121099167218==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/501436823047caace88ae663101723a0c677165f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

For noMMU pthread_atfork() is only a dummy.
This causes build failures in util-linux: the configure.ac script
detects pthread_atfork() presence because the symbol exists, but the
build fails because the prototype isn't there.

Fixes:
 - https://autobuild.buildroot.net/results/936/93637dfaabad0a1f11a94488421f6cc73882817f/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 107e7f54ae047cfed1aa844680f17cbc5e645f7e)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 ...linuxthreads-add-dummy-for-pthread_atfork.patch | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/package/uclibc/0005-Revert-linuxthreads-add-dummy-for-pthread_atfork.patch b/package/uclibc/0005-Revert-linuxthreads-add-dummy-for-pthread_atfork.patch
new file mode 100644
index 0000000000..66605aa657
--- /dev/null
+++ b/package/uclibc/0005-Revert-linuxthreads-add-dummy-for-pthread_atfork.patch
@@ -0,0 +1,43 @@
+From 2e902dccb925f1f185836bbad2284e2879550cb3 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Sun, 11 Oct 2026 16:25:53 +0200
+Subject: [PATCH] Revert "linuxthreads: add dummy for pthread_atfork"
+
+This reverts commit 9e38e0aa45cca21d5023d0af94377f0e1e41d2f4.
+
+As reported on the uClibc-ng mailinglist by Thomas Petazzoni
+this dummy without proper prototype is breaking util-linux
+compilation. My usecase in 2017 was curl+libressl. Since then
+I moved from libressl to libopenssl and that works fine without
+pthread_atfork(). Tested with curl in Qemu for RISCV64 noMMU flat.
+
+Upstream: https://gogs.waldemar-brodkorb.de/oss/uclibc-ng/commit/2e902dccb925f1f185836bbad2284e2879550cb3
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ libpthread/linuxthreads/ptfork.c | 12 ------------
+ 1 file changed, 12 deletions(-)
+
+diff --git a/libpthread/linuxthreads/ptfork.c b/libpthread/linuxthreads/ptfork.c
+index a1bad3d54..74d630830 100644
+--- a/libpthread/linuxthreads/ptfork.c
++++ b/libpthread/linuxthreads/ptfork.c
+@@ -150,16 +150,4 @@ static pid_t __fork(void)
+ strong_alias(__fork,fork)
+ strong_alias(__fork,vfork)
+ 
+-#else
+-
+-/* We can't support pthread_atfork without MMU, since we don't have
+-   fork(), and we can't offer the correct semantics for vfork().
+-   But instead of failing, just provide a dummy */
+-int pthread_atfork(void (*prepare)(void),
+-                  void (*parent)(void),
+-                  void (*child)(void))
+-{
+-  return 0;
+-}
+-
+ #endif
+-- 
+2.47.3
+

--===============5224269121099167218==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5224269121099167218==--
