Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5961F606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jPYziN47
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 357DA60C23;
	Fri, 30 Oct 2026 14:19:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jVROthv5TAB1; Fri, 30 Oct 2026 14:19:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 64F6860C18
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369963;
	b=hM1RyAHxr4+e+XlHfxs2syOPSRfUyIoikqi9QoPvojqKVh18UOeEOYc6zkVHrxKeKMDZ
	 qIxD/1p7/+Px069kAC/dkjjIzhe00b8C88i5WIMqc3nVAPCEg9eFUcT4s01Mtn1igH7fC
	 5xH3Cj+Zyx+R5a49gz823VzRL/Of3MRjKhyRw1uL/MOA0JqPcMTYhZC/Rg16A4J1OLT7p
	 qgxthz8fUbAWmWhmVRbjicyCNPXH4eT4QRJazIZGjxjnNR7XjtIuRzH2XxWK0cNylmPm/
	 tf1NmIEo81Tdffae6bJ9utyguEqpiQjb08v0ArbHj0zJbBONhwITnv4xqXLrhd1QBzQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369963;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=1Eg0EKoAS5l5lITyjop8EE7hcYenStmhCtLJfRAoVMc=;
	b=Ta/8tOnfnvEvtxgpnQtZmT/cGkcSpViJxHh85ZuSRPXqInceDTm+UP3wyTRuxb4U3Ohs
	 54FDVF48Nu62NuOVy869qaSY5ZVjtAyKPzIvjhTWnIclF11lI0y4zBVfCbFup8Q02pEHJ
	 dskKPXYYyvI8FTjqnW5dW5MRe4zdikWLjTO/K2AnBmuO8AMyGAhMuMew3+i8Ty67fAhfD
	 OBJ9NNufglI9sbrb8XjOQ+qSs9xCQT5uMn/iDx1pUfZ8qowE00Wmjgu2NZkrb3aYvkOkx
	 Wh7WQFXxXJmm1tP41ByfibH+IMq5v6TYSse6UwTDbcoRc8vs2HqUQYS/Hxtq/9fxpXQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369963;
	bh=1Eg0EKoAS5l5lITyjop8EE7hcYenStmhCtLJfRAoVMc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jPYziN47pKfnOe3ggzZlUOLFAwWOBhc5KadRTRbjWo9FpsRSA7V91kvLtVCa3JIAP
	 Ql4hM88qy/PH6xex6ghaPjyDG9LaB5IzlStujiQEPPDJdp3Ug3DL0t6BHfv9Cv0NSW
	 7Nus+iS0qqNXMtzNkkVAOO58VIiI54GZmq3eWehPkqQUXx3dm2//CgcJhC2+gWcoDb
	 QUJ12U7A08qVuHdVwmE2aIKYhyP+P22dVDC/KvrtC+4boiet1d+pIECCgQn2hJeKSq
	 u4CubvmsowLJK4vxERqu3kjytwPkS2CBqLn6fgwaifnwq+lMh59b5Rr30S+AgjVuku
	 /qxXHW0p6PWAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64F6860C18;
	Fri, 30 Oct 2026 14:19:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D3444D43
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0F4C812D4
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9B4-UiwOomVA for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 53209812BC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369890;
 b=JnD6GdcXZLDbZsdOGF0JJL6tMpfFXtWgm1hWylspBeznL18QZOhbcrQifd5gClFEOQ/3
 035XA41t3V7Ws3rSqQURBYp28jWJPXyjSeGzdKQX3LqyZVzkUQEZF7CXastSewKOGBvOn
 9CGJg0YaAdivJtTtohGVpuBMklaiYNS4br1BbwrPyZF2+GpLkU4cqi6Le36NcLnjfP+zv
 /NgnuTb9X5hHtQAwmxTrykneaerPJjX8Zorht+5iwzKQ2DD9YbcUb3FZaqyDYNJZp+Fwg
 KNWEPW530XhitXMLz3gxn+LfP2wOdqWyH/7UtUfFpuWdwInw9cjdFrLwldWA+xr3xHg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369890;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=wdZLvWoQS/auwLqPaESjqWyiR9bP0k0RjzD6+jXFpF0=;
 b=Q4YVLIHH7rf6NhATNq5EAPqc4qt9zeSRW4lz/v8c4BpMD6X1irCf8ni9Nej6aKJYQBO9
 lnHjbt22phBXo5qmFDwfv9k2RMcg6+HQ2onO4iOjcD6zg9D7o3pB4/jCE60PzefSzCpH+
 s+Hv2cet7srFvz54ApFShgkqyQxP2lD6TU69nMctpx/CMv/UGZA0VO8SeNvc2TYYkzGyT
 vEpyguAE2oYpFU7yZFmscwPrY1sl/f1ibTSDF2xyGadi7p0zUnXW+JIy7bx2pqgnhejMb
 4MVgZDrWG7BHMg8zl96H3grG4z+iwnGDcgw5FgTQt2lUGRJVWzjrlDsUh71Q/kRa3lA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53209812BC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 708EF9D388; Fri, 30 Oct 2026 14:16:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:07 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 39221d29e9b99a987c3157b9b68ecdf6e02b8ef6
X-Git-Newrev: 1b21ef98296af5540a59075d21bed163b7b3d8db
X-Patchwork-Hint: ignore
Message-Id: <20261030141642.708EF9D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/libplacebo: add
 optional dependencies to lcms & xxhash
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
Content-Type: multipart/mixed; boundary="===============4987861867616015631=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4987861867616015631==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1b21ef98296af5540a59075d21bed163b7b3d8db
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Buildroot commit 006aab8d64d2179d77df9a696b3fd8636f541640 added the
package at version v7.351.0.

This version includes optional upstream support for

lcms, added in v0.5.0:
https://code.videolan.org/videolan/libplacebo/-/commit/eb14d3bdf22605263a9b6025ed6280eb1515a89a

xxhash, added in v6.338.0:
https://code.videolan.org/videolan/libplacebo/-/commit/cb1009d1455e64787e52c5c3b6f7042aa37e5c14

This patch adds handling of these optional dependencies.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit af68a0883213ac465d3ba6718097f4e0e3166af8)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libplacebo/libplacebo.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/libplacebo/libplacebo.mk b/package/libplacebo/libplacebo.mk
index e03f224971..c3a2822fb5 100644
--- a/package/libplacebo/libplacebo.mk
+++ b/package/libplacebo/libplacebo.mk
@@ -12,4 +12,18 @@ LIBPLACEBO_LICENSE = LGPL-2.1+
 LIBPLACEBO_LICENSE_FILES = LICENSE
 LIBPLACEBO_INSTALL_STAGING = YES
 
+ifeq ($(BR2_PACKAGE_LCMS2),y)
+LIBPLACEBO_DEPENDENCIES += lcms2
+LIBPLACEBO_CONF_OPTS += -Dlcms=disabled
+else
+LIBPLACEBO_CONF_OPTS += -Dlcms=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_XXHASH),y)
+LIBPLACEBO_DEPENDENCIES += xxhash
+LIBPLACEBO_CONF_OPTS += -Dxxhash=disabled
+else
+LIBPLACEBO_CONF_OPTS += -Dxxhash=disabled
+endif
+
 $(eval $(meson-package))

--===============4987861867616015631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4987861867616015631==--
