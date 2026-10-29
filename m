Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC02606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bjq1UbR3
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2067B40CC2;
	Fri, 30 Oct 2026 14:20:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mfr3VMmS5OCq; Fri, 30 Oct 2026 14:20:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3CB2940E41
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793370047;
	b=oxvtysimfPu0pZAXS3s324XmhQ+lJq3bu3Fx4c0DX1XVJO0eIrz8mSR+qbScnZwVag/E
	 fMRiW8zuWikVZDTxS3qDH/WL4C+Uu9GdmaW2l6c3hXvttGsGpDQnpi+owAUZoXriQUw3y
	 YMPxRzYoUoxzy5LuD/Q8kk/aaTibWs2KxZDucJQN+EtOiRlmEjIBbZj41L3NYtZAYiCFw
	 4Lc0JGdZuT33O9c1ICjbh5D+GP1Hox1Jg+tKN/3Cj7TEdG9yivvvM6g7nKoltsf0CUmNn
	 EvUjYy0HDSSjpTtRpAWaZgLk6RGTjKYKg9Bcx3lagbq4O//qSl2Vh7CfmXdRfPZUBaA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793370047;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=qxDAz9OC0T5UWS8SIW7u80dfc3pxBqcrxvlQkz4WExk=;
	b=Trx1A30op8sCYGDZEy8yxSO0TQyS08ng7M4036BtLThdLtZ4waon52gGWCV9CuRQV4Aa
	 sTGNPalpE0L152heSSJ3lopN9vl4qzc0yYCjFnbACLdb/HRh1gZUoAyi38+8RARt2lmL1
	 gJgFCm499AuMG1xTDEWeI2240wEANtUXFCbCnPfb8fXL5zm1mC+g4kzsZBpPaWksBjOex
	 adJaFokAXqxVZtQ70Xqm8X3aX2mts4ToAnwwQn4IX6hlJPZqqZ65IyxXRhQF5hpPbnR/j
	 BnfrLlXsIxgwhpi5NGNEevgozxEGwMFXjc+vvRQBMBnTvb1eiC3JBuyfd+uSWSJL5DA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793370047;
	bh=qxDAz9OC0T5UWS8SIW7u80dfc3pxBqcrxvlQkz4WExk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bjq1UbR3hfEy4bKufFfN7Z9ZWFN+65c7wLIKsIk+fiJvvOMoAiifBOLTM31Y5ZUoD
	 puGC3hZ69AHvSVZ8Fy60BbnNnIOfM9p28bCHQThocdLXBGm/Uj01K7UtLbjQUcm8U8
	 yDn1iTfoBfWa9DLh8sv8CnPy8cWKQ7JcMta88tX9zgjJzgKQ1Y7a4eFEDLu4DN9WNV
	 4nLS+qqablRkzNayAE9CIX80OSH0zQm02LMs3KUw6Aoq8g7SaKdnY08378WHblm4Sx
	 Ve4DKPV07za/B4SwRxBIsNijd+o3FVC88M0CDSs5wTklA6wXHKB8CQ190LPTgMWmVj
	 RB4ffuI9AUoog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CB2940E41;
	Fri, 30 Oct 2026 14:20:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A755CD43
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A44860B17
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O9p3Ni5XYLJZ for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BC65560B69
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369896;
 b=rpsxF8YcqsZMuDXuttIt2Fy+KAcN3vpe7FBnjHQ+Pd79cW6Oyw+pEOEsBlBbFnbAoE8W
 6juUrmUF5yqiFhetu0dH1KegB0/kKCSHyjQpP95w3nRDe2wUGIcU523CynntHeQxUxg/Y
 yjFWuvniozH9JoG/nIxqDJPLrnsYnoujABKATKh9DEemnYgSMJD+WR7Zd4Agfaddt06mY
 3Gk6KMg0pP6iuUNhruBEM6YAem7qCbHGzA3vO9I5jjqNJFssjyI68Hzp6yBHIP+uVkmui
 m7GRo8m3NNPsp85s2h6c6Jai1wQNyCF456XYiE4v1Jy5ztlDuAYSnnjhvJs/4cLKkBg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369896;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=t9mwKzXg2Igx0BYex21NOvC11SmVFbaPYVp1sOJLJEI=;
 b=pP2GOa5JxYDvnadkkelxNdLYWMvD6m5bs8yGPftunPv0XJ71JQLwwnNikgsEmgvb39os
 ogEpIuf5tOhlyC7DoqXjo+DX9tGxYL0Ox01Sim3BQIEnayVPItRvq5IZuzWVtdRmhBoJO
 7orYRBR2y5e6fqkjVmAg+WSUlNyb7QP/JNeMPxt9D08nySXMrtkfRl/bql08bhsE7TNJi
 MweylCvH9w8YgEZDD/FzSH/21DJXtpiMoGsSK+KMAZJLiWWHmQ3q5I10cl/wOTOg04tqf
 8HVyHPSjF2sx2naF1swpF7dtpG6Du72nujXcbtiG7LcQDzncyC2M9A6o2tSdQPay7Rg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC65560B69
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CF1AE9D388; Fri, 30 Oct 2026 14:16:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:12 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: df0f72151b9be5c6c140272ad17c91387017b2c5
X-Git-Newrev: 1df505db94eb6215fa99706a3658c382f1fd9afc
X-Patchwork-Hint: ignore
Message-Id: <20261030141648.CF1AE9D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x]
 board/acmesystems/acqua-a5: remove linux-headers.hash
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
Content-Type: multipart/mixed; boundary="===============0118995425717747548=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0118995425717747548==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1df505db94eb6215fa99706a3658c382f1fd9afc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Since commit a8b9c6f9f512 ("configs/acmesystems_acqua_a5_*: switch to
Bootlin glibc stable toolchain"), the acmesystems_acqua_a5_* defconfigs
do not build a Buildroot toolchain anymore. Hence they do not depend on
linux-headers.

Remove the symlink linux-headers.hash -> ../linux/linux.hash.

Fixes: a8b9c6f9f512cc3ef18956b53a99b93ba74a9e8f ("configs/acmesystems_acqua_a5_*: switch to Bootlin glibc stable toolchain")
Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3a578a247dc13a96563dcc3574b0d4604826fc87)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 board/acmesystems/acqua-a5/patches/linux-headers/linux-headers.hash | 1 -
 1 file changed, 1 deletion(-)

diff --git a/board/acmesystems/acqua-a5/patches/linux-headers/linux-headers.hash b/board/acmesystems/acqua-a5/patches/linux-headers/linux-headers.hash
deleted file mode 120000
index 5808d92afe..0000000000
--- a/board/acmesystems/acqua-a5/patches/linux-headers/linux-headers.hash
+++ /dev/null
@@ -1 +0,0 @@
-../linux/linux.hash
\ No newline at end of file

--===============0118995425717747548==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0118995425717747548==--
