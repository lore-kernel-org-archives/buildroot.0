Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D59606A329
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 15:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=frU82rBA
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77082606BB;
	Fri,  6 Nov 2026 15:58:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SL5fb7Fq3ahD; Fri,  6 Nov 2026 15:58:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A7D906085F
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793980735;
	b=r3SmFcDbxWZGBNrGQIDYHQijdfzLsHANG1j2RsGzogI0KR0eh/fbzjNT274YzvatJDhR
	 iUugmADNk50qkAy6+mSn+LybOIcAFNAeVgC5wplpztDNuBiJdSBAkRS/AZfyeegWKdkof
	 yFHAKH763DoflOIEE4SColriBxwf6OFQ5yCzoAx0LNxo9JyUt0Nu7B3GfPk2+mldgVCcc
	 rjsP7SuOygS2EuQP+vSLZhF1dK4V9jMZOZvmgFAU6hVlYSXPynomjdqQ8bLQoi9mjNTUL
	 DM2AE2MRffx40vJbfJ2QiaLx6XZMcQwq6P7O2LmEeBwZPspVE4qWaVSlfcFcBLk0tVw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793980735;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=90qY9czHGDCF6CCSmmxd/vw9JhIBwWhGgfINVLG2Las=;
	b=md7MT/2gbSSVLta2x3wtT4CzqFJu5qni4RoQKnN18WzWeukQ5PDEjNNczGP1EcQK/JEW
	 oS3Za3RdHenwGZfuGJkCcnx2nCraPI3seHD/BDPMFMIyz0pEHw/BtfUFGhKeCkeKpfoCT
	 RUTCe+/vB2Pj96kAEKv/u3arhKD49dQHpTDUboBD9e56Fbo4j6/gitRkkpkbT3bNzKXNg
	 vD86yIiBqFJysSwoB8tT+GCnI3TFCf/0GftT68klejX+SOq1WER+dCmgdU7zltz5PSXXn
	 +SleTYevVL1gBCLwVvA45NV361WZsnW51N74qQyY21KvHHPNrfZjujHLLWinBeGxDVg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793980735;
	bh=90qY9czHGDCF6CCSmmxd/vw9JhIBwWhGgfINVLG2Las=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=frU82rBAg4GVo3hW5xDm3LuoB1aTOv+4+OucB/oag/EbvzrswHH3TJAc8XsJcfvC9
	 zZGe6mqIAtf1YWXd7oZATaODPDSXqF6SzKOCu+V+1CjmKoyasNOZczv5bNmib9euP/
	 DjlXw2zmmCzystRLUdzk3zql95B8x3lsaSGtfpNA09+TYZJEvCEFkWBSuococbdnSP
	 Coq1ap4CkfboQRuT/WD2NJlURTJyy+46ZckrD3KCIcVvZi9bYyGwudFviq8d+tezEc
	 DiVCzbrzUI2io/1ggS+LAlKI84t7FQ4Z4p2LYyDp21Of9MN3HwEsObucT7/bKvWW5d
	 C30hijju5j/4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7D906085F;
	Fri,  6 Nov 2026 15:58:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 353C032A
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27415403D9
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OuOQHX8a2L3A for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 95622403DA
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95622403DA
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CD8099E09B; Fri,  6 Nov 2026 15:56:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 12:04:26 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: fcf83bf91f75a68827410b45983d361fc166ffcf
X-Git-Newrev: d4f97a9acc33629ff0bb7d2895be145d886c94d8
X-Patchwork-Hint: ignore
Message-Id: <20261106155655.CD8099E09B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/swtpm: fix
 license information
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
Content-Type: multipart/mixed; boundary="===============2446478877581402507=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2446478877581402507==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d4f97a9acc33629ff0bb7d2895be145d886c94d8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The SPDX identifier matching the LICENSE file is BSD-3-Clause [1], not
BSD-4-Clause. The LICENSE file was last modified with upstream commit
5f1ef9565df074b918a39cb4885af4190c98edb7 in 2015, before release
0.1.0, so the fix applies to all Buildroot stable branches.

[1] https://spdx.org/licenses/BSD-3-Clause.html
[2] https://github.com/stefanberger/swtpm/commit/5f1ef9565df074b918a39cb4885af4190c98edb7

Fixes: 87b9b126d23be1e95b3d2b82438f65e28f554a87 "package/swtpm: add host package"

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 56f15ebd01b1057fb7d28574c4176e837b586fae)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/swtpm/swtpm.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/swtpm/swtpm.mk b/package/swtpm/swtpm.mk
index 636a385db8..b51c2071b3 100644
--- a/package/swtpm/swtpm.mk
+++ b/package/swtpm/swtpm.mk
@@ -6,7 +6,7 @@
 
 SWTPM_VERSION = 0.8.3
 SWTPM_SITE = $(call github,stefanberger,swtpm,v$(SWTPM_VERSION))
-SWTPM_LICENSE = BSD-4-Clause
+SWTPM_LICENSE = BSD-3-Clause
 SWTPM_LICENSE_FILES = LICENSE
 
 HOST_SWTPM_DEPENDENCIES = \

--===============2446478877581402507==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2446478877581402507==--
