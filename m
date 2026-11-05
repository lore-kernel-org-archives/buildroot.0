Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C42606A31B
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 07:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rbrHU4kN
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2569B40807;
	Thu,  5 Nov 2026 07:29:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kgaGcbSVOw9T; Thu,  5 Nov 2026 07:29:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 52FC8407FE
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793863756;
	b=hsmevgQysUN4BQPA0WhuODYL/WAuzehi4NbAKWyjuiUYZqwyazsW0E5WzPwcFrEzerPL
	 6Vc25aVnm/OK2DmOgvjeICS33u23N8H67h2YYW9l7Cl0il7/xJ/dHzm28nEgNv4rRCXZn
	 LfBzcNgr2Vp1WcVdYXf/qGZCsp90vuP1h8pw70Dp0tin5m/aNMQJTbcYXYq+4OcKFpg8D
	 PEaubqNPB3B9DiD7Q59HNDX3WKii8m6uNdP6Odni8TpfaHF7RR0/ztOiWhYrVpiVTpyBv
	 3bDdCjn9CUtfbr3dPmJiet68durQqgU0LRH6V8Gemcf1foDPlnGUFz52esuLj2rv4uw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793863756;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=opLvUIAznyMHAKygVV1PYQbAWBNFSzq+2Z3peICYnqw=;
	b=cxM5d1EprdCqOwT+dHqPwFuziIgPC+7tade+coQ8uYj7slqOyDfRZP3A75aYUbNYJ0rY
	 CGrjZ8njLpYa6EPzK3aooMbYV1wVIL4KduGJuRFGZW4E9PrdyHOxsmUEWuGp1lAFCsjmE
	 3y/TPV+0M9olz1ZDCTGrJ0Plfrh0/+1VzWkGMXkVSlLAg67epT2/ypN8X4ru7W1PKTa7S
	 SG3oi5LL9CRMyqwlBwhuFfcDTYkiEPXdVqianbM07By7eZdueePZy54vmHg5+yq/YqLjs
	 JCZ/RrTQXqA0IeUYeOHltrDAz3s2ziVjfJVs8x5D8moZancEv80Y8mNmKDJlVC1DIgw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793863756;
	bh=opLvUIAznyMHAKygVV1PYQbAWBNFSzq+2Z3peICYnqw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rbrHU4kNbsTU8o/ViHWZb2l88fod+caHISNJpurYPHNxFjz03B8FW+f/ozW0vf/gD
	 Z1yiABVKsCRUqD2GGHIBI3hHvVRbGTbADCXarkHKre9/jL/ktzl1JYKkoNorEslkiX
	 Wrbujzft00JX0KLZrudEtIlcJb1JBw4g7AXEMaBmkoq3tvHkZvfsXBk/GwOwRlch4H
	 qkKv/vmV1o7fhGcnmKO2B0kHjX/P49BSWD2dEfdYCF81E3nPT7ls48dD5Bk4ZYcuMi
	 WJk7FL/lgtLFa4mcXpG+e1hJXQSaYdgMQUqyBAikDV5po2jWs8OG5Ctai1/yseqtHw
	 1AhvoUk5Ffs/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52FC8407FE;
	Thu,  5 Nov 2026 07:29:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9CA65177B
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 07:29:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83049810CC
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 07:29:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LS2y7jAYpjcs for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 07:29:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E304080D44
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E304080D44
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 07:29:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C483D9DF84; Thu,  5 Nov 2026 07:27:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 08:25:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6cc6d7c83f5198edb47efc0d93f1a57d74d5406f
X-Git-Newrev: 797fe39f04009c6e753b661a44b20d8357afb7b6
X-Patchwork-Hint: ignore
Message-Id: <20261105072741.C483D9DF84@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/mender/x86_64/readme.txt: fix
 documentation
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/797fe39f04009c6e753b661a44b20d8357afb7b6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Starting with commit 073c81c8cd233fa6e3a7067e3542ef0f56f28621, the
${COMPATIBLE_TYPES} variable is no longer prepended to the artifact
name. Update the documentation accordingly.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/mender/x86_64/readme.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/mender/x86_64/readme.txt b/board/mender/x86_64/readme.txt
index 01a0254511..01cf4077b7 100644
--- a/board/mender/x86_64/readme.txt
+++ b/board/mender/x86_64/readme.txt
@@ -53,12 +53,12 @@ Optional arguments:
 
 The login prompt will appear in the serial window.
 
-Tested with QEMU 4.1.1 on Fedora 31
+Tested with QEMU 10.2.2 on Fedora 44
 
 Creating a mender-artifact
 ========================
 
-The mender artifact is created in output/images/buildroot-x86_64-1.0.mender
+The mender artifact is created in output/images/1.0.mender
 
 You may wish to change --artifact-name=1.0 to a name that best suits your
 particular needs, as this option changes the mender artifact name.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
