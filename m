Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E464D1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 21:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 602CB407E1;
	Sun,  7 Dec 2025 21:27:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id boD8GWyx5vgD; Sun,  7 Dec 2025 21:27:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5D08407BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765142875;
	bh=Xd1HKouFCZzUQ40LL+jsf7OJV87Z3Vm+hHCnSuShjzw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sbXcqnioHOYqrTM9m0bm3N76okwCtnb/gLtwC8zbqZMpk4xa9wvWfkAvX2+XyZtbr
	 YR+PiPOpuaSqWrKgxw1GNAqCdJ7kQyioHI8FzX5HNKXZ69pIp+OlIoXagQ/BJ1MxGp
	 E0qpWXWHbVRfD9injy0yWzcHQtahnHngzoAs/GFoKnfrVFVQJrFjMoMSb8VSmm+GeT
	 Tceil5hZTIprVzoyGeBTT3Nu7aE+BYGKc8bfePWjk9rZ454aQ0YkBzQX2/Sq6aqskU
	 PhWXYwq0WBgBoN0nrUn7YxKvT4v1378W8DalnfkX/LNzN5EL/UvNLqKJz299zBjxVv
	 OWFVAhJvqW84A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5D08407BC;
	Sun,  7 Dec 2025 21:27:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A737F2F0
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 21:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DD3B821A3
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 21:27:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pBB7D4DvXUuC for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 21:27:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2D5B8219F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2D5B8219F
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 21:27:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C144C8689F; Sun,  7 Dec 2025 21:27:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 21:52:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 655accbfeaeaf61816ff504cb01f795c4c37ceb0
X-Git-Newrev: 7bd818a06726b3bde02282bb9ae382a8e3af93be
X-Patchwork-Hint: ignore
Message-Id: <20251207212751.C144C8689F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rdesktop: fix build error
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

commit: https://git.buildroot.net/buildroot/commit/?id=7bd818a06726b3bde02282bb9ae382a8e3af93be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
https://autobuild.buildroot.net/results/8ad/8ad5d33f726fe57910a70df7c8f40a9568c2dfa7/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-use-correct-modulus-and-exponent.patch    | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/rdesktop/0002-use-correct-modulus-and-exponent.patch b/package/rdesktop/0002-use-correct-modulus-and-exponent.patch
new file mode 100644
index 0000000000..f6989d5777
--- /dev/null
+++ b/package/rdesktop/0002-use-correct-modulus-and-exponent.patch
@@ -0,0 +1,29 @@
+From 53ba87dc174175e98332e22355ad8662c02880d6 Mon Sep 17 00:00:00 2001
+From: Markus Beth <markus.beth@zkrd.de>
+Date: Mon, 2 Dec 2019 11:22:13 +0100
+Subject: [PATCH] use correct modulus and exponent in rdssl_rkey_get_exp_mod
+
+Upstream: https://github.com/rdesktop/rdesktop/commit/53ba87dc174175e98332e22355ad8662c02880d6
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ ssl.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/ssl.c b/ssl.c
+index 930c7f94..0681a890 100644
+--- a/ssl.c
++++ b/ssl.c
+@@ -307,10 +307,10 @@ rdssl_rkey_get_exp_mod(RDSSL_RKEY * rkey, uint8 * exponent, uint32 max_exp_len,
+ {
+ 	size_t outlen;
+ 
+-	outlen = (mpz_sizeinbase(modulus, 2) + 7) / 8;
++	outlen = (mpz_sizeinbase(rkey->n, 2) + 7) / 8;
+ 	if (outlen > max_mod_len)
+ 		return 1;
+-	outlen = (mpz_sizeinbase(exponent, 2) + 7) / 8;
++	outlen = (mpz_sizeinbase(rkey->e, 2) + 7) / 8;
+ 	if (outlen > max_exp_len)
+ 		return 1;
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
