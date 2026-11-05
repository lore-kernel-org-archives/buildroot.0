Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C74606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 15:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qw52p9WH
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB8DD81285;
	Fri,  6 Nov 2026 15:59:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 99h5cx1LCCoC; Fri,  6 Nov 2026 15:59:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8636B812B3
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793980747;
	b=XVZigWrX1wlpLp0AAOSoa8pf+CiNGVK/2qeCWudERZpYvXwC05i4womsQb+jnLgAKkPo
	 /Ico7rt1hxAHsAzCHmGjR+6ms+wjxrzFW8rIYaNQaeRSmFLHJB4rQHs4kyOPbyZOHrCRG
	 950nyO5U1avAo7mtlbE+B8qMxRFxFLjhBJR6x3S/7xgDY+GkzDKR1CpSuDgx/X1HFJlE1
	 kCjo5yul6ZJAZlD2PFSJEfJ4IogpgJ58xXrRVI65fdwHQ1NikU1v9AliXqF4nonNWTbw8
	 9bAtI0z68KmRdQ+OkbgQiKnabV5VLQR2AiMG9sUZvuKYziYclYQ5wKo55lAcp89pLtQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793980747;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=oqdgdCrQibV+1FWrENvS+tbmUAY6iUFQ4QFjNI/FML8=;
	b=MBH9xJSIHWqoE1HR/H6ToaUqofTf1+je2ABYc0pPgQH1/gwFBfHH6sfaga4YaZH5PtKP
	 rSQSMAdZpoxQJu57b0wdF76XsLBng9kwI3/5cqGkj5gM+KjDvrf/VxoCVA8+wTcmsRvlG
	 EqDh9uWZ4s80bx09meUSbOwBMt3j/LGyNFDS1n5UmHPgEwEu3iBmdur6CelOSS1d6OUrk
	 DJ7v+btc1fWBWVWt/uxxgVYY5VQdGGkviJZ8ydetYghTSyggac6pTIBNP56WUrbrTKd+M
	 mLH52XFbBo4ds8OK59aB4lrBD/mhTQs3VMJ79TzGpX9Cu7TzMo54qzSyfSCCeRD68tA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793980747;
	bh=oqdgdCrQibV+1FWrENvS+tbmUAY6iUFQ4QFjNI/FML8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qw52p9WHMILzcgRbUqM/KH+2f/us2jOAXchDWuKCL1OpNsPjFTBQrZmlpktOQ0nkA
	 2YU+MXW6CoQ5gxXkFM0hWXlJf2dVYEdEAkDuv0Ez8fpHGUhQxuHCWOqbg+eBnmV/AR
	 aYZaKOXIAcws+rxuwQlHO2Tx4VqFNYTqWE2DRvJU0MTOSEnqAKGSp6xy7LvPk4vctc
	 4LbqSlJ99utZyaHiHQ5Vhg32tInXlMgnsmCp2Hu5sawLILQrFNwYOItRw8MjfW5Etf
	 P5uqEno/DYHWe380aMe14hwTGyncKT609w0jslpGJhaeNl/A1ioY4ytAJx5sayCrK+
	 mq8vu3UnWO9yA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8636B812B3;
	Fri,  6 Nov 2026 15:59:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 601AAD36
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40DD16085F
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OCHRo86Cz-yl for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 09E03605A7
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 09E03605A7
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 413509E0A8; Fri,  6 Nov 2026 15:56:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 12:04:26 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d8e973f106fcd40f91356339f1da2267d5c51f25
X-Git-Newrev: 9a4a1ef1e8ec5d973171fe39501138d55813788e
X-Patchwork-Hint: ignore
Message-Id: <20261106155656.413509E0A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/ntpsec: security
 bump version to 1.2.6
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
Content-Type: multipart/mixed; boundary="===============3797319859093617692=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3797319859093617692==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9a4a1ef1e8ec5d973171fe39501138d55813788e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

- bump version to 1.2.6 (for details see [1])
- fixes CVE-2026-102486, CVE-2026-102483, CVE-2026-102484, CVE-2026-102485

[1] https://lists.ntpsec.org/pipermail/devel/2026-October/011062.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 7af7e73ca4b485ba77105d745feaae4fe93cb45d)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/ntpsec/ntpsec.hash | 2 +-
 package/ntpsec/ntpsec.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ntpsec/ntpsec.hash b/package/ntpsec/ntpsec.hash
index 768ee75a86..4bfe81aaae 100644
--- a/package/ntpsec/ntpsec.hash
+++ b/package/ntpsec/ntpsec.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  48717ea84a8c89bfa082ab5d0dc58b44e6328158632e77d2a74c85b7a509e498  ntpsec-NTPsec_1_2_5.tar.bz2
+sha256  c82f213532d2a5b5e9c368127287ba69a20e3116bc134e64a5c767f7c96565d8  ntpsec-NTPsec_1_2_6.tar.bz2
 sha256  074e6e32c86a4c0ef8b3ed25b721ca23aca83df277cd88106ef7177c354615ff  LICENSES/Apache-2.0.txt
 sha256  991d8a58e0b4be84a174a9bd333a8ca33807a0c1ce6d23a2e25a21f7ece482d0  LICENSES/Beerware.txt
 sha256  899261d6eb6c922cf8f051225411f27b738ba0014be18c2eaf6afbf30d421bb1  LICENSES/BSD-2-Clause.txt
diff --git a/package/ntpsec/ntpsec.mk b/package/ntpsec/ntpsec.mk
index 0fa8a3f527..a67308af4a 100644
--- a/package/ntpsec/ntpsec.mk
+++ b/package/ntpsec/ntpsec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NTPSEC_VERSION = 1.2.5
+NTPSEC_VERSION = 1.2.6
 NTPSEC_SOURCE = ntpsec-NTPsec_$(subst .,_,$(NTPSEC_VERSION)).tar.bz2
 NTPSEC_SITE = https://gitlab.com/NTPsec/ntpsec/-/archive/NTPsec_$(subst .,_,$(NTPSEC_VERSION))
 NTPSEC_LICENSE = Apache-2.0, \

--===============3797319859093617692==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3797319859093617692==--
