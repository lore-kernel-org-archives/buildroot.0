Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74035D43343
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A1338246F;
	Thu, 11 Dec 2025 19:28:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M03y1jDL93wm; Thu, 11 Dec 2025 19:28:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64B768266A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481286;
	bh=BN6PLEDBxSpw40dSkcRdHKjzAqQOHLtuTwTMGDtkcyw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hEJ/bdFD/lS9dSqHbg2fROA3edldsi1eJzLdGaRDuMxczvzRvIlBKX2lp7WZs0bYi
	 EODrsrZAxFriS3udlPb3KyGJMunk1jZmiZCieLgl33zA8e694KV2B6elaEcbzmiTV6
	 jysDj9yh7wyzLU7VmOWgqzQNGCMyp1vN8hYKjE+2ovM7j/jNt9BDEcajIRSxosDZcE
	 vZcfObcM2VUGKekU/S18lexWYY842reU7A3Rzc22WNTaOpXQ1Bgj0OGGxSVvVX9vVg
	 z8OebqyZau3Lc9ea8ycCfJrWhmt8Vf7bkp2tbvinhGorB2PPuXG4YXtC5duPD0wfg7
	 FdeR2AprZOCXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64B768266A;
	Thu, 11 Dec 2025 19:28:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6CA2C2C1
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85E6B4008B
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:27:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UAFFRk0KNYWY for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:27:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D98240100
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D98240100
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:27:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3D34586B47; Thu, 11 Dec 2025 19:27:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 10:22:21 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0161403b868aef1fd03ffb3924e66fa598c91b3e
X-Git-Newrev: 6829a555b3b1265299e6489e7215ca02abcd84ab
X-Patchwork-Hint: ignore
Message-Id: <20251211192747.3D34586B47@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/rdesktop: fix
 build error
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

commit: https://git.buildroot.net/buildroot/commit/?id=6829a555b3b1265299e6489e7215ca02abcd84ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Fixes:
https://autobuild.buildroot.net/results/8ad/8ad5d33f726fe57910a70df7c8f40a9568c2dfa7/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7bd818a06726b3bde02282bb9ae382a8e3af93be)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
