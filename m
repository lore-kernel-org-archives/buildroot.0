Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16322606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=HPyUqM3L
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 626D581289;
	Fri,  6 Nov 2026 16:08:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JLwDog-4asis; Fri,  6 Nov 2026 16:08:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B656B8128A
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981294;
	b=A2K3hY/CKid2k2CgpyT0I5nvMyArlz1sko66zqHM/VrnLe+urXeErYV08d3dPp5AB2s9
	 IMf3a3XnPimo163YuItTP/2ElkEnDZlKEjNoQrD8PNUSJx+uefmhxJph+Xga+Dlok8Ylz
	 wHrTTm/xpWC5uaGhduA1cta5e5XF3kaqtjlu3BIaxkYHtqzA2Pesvc6qlclEddDCeW2vQ
	 SMZVE5ydd0HBt03t5Wsh8yFwF2ftV1jv331kWo8UZY+rlmpYcMUYO08lH6hLmwFVXIeO8
	 jsLSlqIbqqdyTOu6/B83+oCGeWXALrCpKnNITfMl7KyM1XR57bYmvdGZiSAVqi6SHvw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981294;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=t4LtrEm1U5BQ+xjuv9V4VOf7yd62jiTlNtUpzFGhMOQ=;
	b=U336DFPqfssXO9K2FHQS7sF2JPHvrAWq+JtvS01ow/6Fsm2WaEl3rIxpcyay+I/SoHGi
	 j0sqEkeA5jqF/x/Sb34gxS8aXCAdEveWMx2HnMPcKoDmMx6g25OfpLg+BhS+7WikBHSiE
	 WvFpil8JENTgE1ACAGUq89L1PV5HZGnt0puzUx9HCR3A2daiwVqUI8BJz/MN3aUlHU2UI
	 riZthe1+jIIdo8nVExVBAt2Zd4clqURdBWpen5qXcyepdIWgcJcltJlRm1wVtv4gRY1Qh
	 bIPxX6s+PdMpkY7MPWQrarBclJT/CM8BYoUshhpj3kX2BVLMQfoBNElC3+TvUYMP5Eg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981294;
	bh=t4LtrEm1U5BQ+xjuv9V4VOf7yd62jiTlNtUpzFGhMOQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HPyUqM3Lb/8Ddv/H2TpvefLDtAWhD0sViQSTEm7vtu+579vBoy/EZx6xFodMmXJ9I
	 rOJfuP1O8wyl6ZBHQEJe6LJi8VOqR6f/JDSh3s5J8B1c85OAhmKTZpwAAsAy3i5Uqu
	 mfNXBfHwPphaL25G41LD7+V6qQzvy7ZuXoX638s8V7i6a6yjRlXpMiDlmbQ/m/vs4Y
	 0R5HWuBsxeAHcF6LlkTMLTjuR2kCsgVKX1N48QVXYePX9nJXgcm+2TnSAD8cWarPw/
	 ZUr+1DcFvgc/KMtdDCcyqricWIOBWmAsJrqxEq77BfgfyyL4QFJz+Tu4y+b1qarQq3
	 vLQlZFQqVcVRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B656B8128A;
	Fri,  6 Nov 2026 16:08:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 545DD7AA
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 382DD81231
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w5b0SohDnvQy for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:08:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 93E1681215
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93E1681215
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C9C489E09B; Fri,  6 Nov 2026 16:06:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 15:30:54 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 38f964a949500b6da6e39086edb009aedfc59403
X-Git-Newrev: b3fa59e9ac16478d630649f8eab421fc6761ab77
X-Patchwork-Hint: ignore
Message-Id: <20261106160639.C9C489E09B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] .mailmap: create a
 mapping for Markus Mayer original BRCM email address
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
Content-Type: multipart/mixed; boundary="===============0394998935150084673=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0394998935150084673==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b3fa59e9ac16478d630649f8eab421fc6761ab77
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Map my classic Broadcom email address from older commits to the new
standard format. (The old address now bounces.)

With the mapping, Git will show the new email address in the "Author"
field of old commits, unless --no-mailmap is given. Signed-off and other
footers do not change.

Using .mailmap is a first for Buildroot, however it was introduced into
the Linux kernel in back 2007 (see [1]) and is a standard Git feature.
See gitmailmap manual [2].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=e0ab1ec9fcd3799e874ff9086729a480f6c06cd3
[2] https://git-scm.com/docs/gitmailmap

Signed-off-by: Markus Mayer <markus.mayer@broadcom.com>
[Julien: reword commit title, add links in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 57e1b04f39fe1ae50efda34e74df9ec93f2c59f9)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
new file mode 100644
index 0000000000..bda50ce6c6
--- /dev/null
+++ b/.mailmap
@@ -0,0 +1 @@
+Markus Mayer <markus.mayer@broadcom.com> <mmayer@broadcom.com>

--===============0394998935150084673==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0394998935150084673==--
