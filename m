Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA994606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 17:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=pN7rlKFF
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96E89407CD;
	Fri,  6 Nov 2026 17:28:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p5VJ79TJvllP; Fri,  6 Nov 2026 17:28:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 98E0C40806
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793986137;
	b=mCj1J9ewsv2kWheU/EUypPeGfkjiU6/70yuSRMHQWc6KH9RISvKFjDDE+EFyXM1mEKRe
	 1yxr8BxlI3MoYFX0AVO7yz/e3jYkHyM5L4GTzYBUtWLTpiZ3KCVdtFx+v9thd4z0WXIK8
	 VBY9qGFbLGjFWRTIUmKILbc//DfzUwPz+KqOh+uthzYcEucBDLB7xCipEEZvx085bjWvZ
	 nBU68/iF5wzPl33vk4SY4dOAk5Ie8VxUMk0Cu4KuWu2rw0xH2lVWFdct6nlJP1b9ggnJN
	 ga2vN1ptkTWgXcD/fY/LPoNi8XYBR6sX695sH7Fci73rttyqD6BS5i69ofSytRq2+Rw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793986137;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=hTdRaKnkq5mcmuDgiRB8/ODvhHVy8uRiFWQSdQXEGZU=;
	b=c2dqG+puX4hmpsjwYjR8DEZnnssYO+e3tAKS9+j+V7TnmB602nqswczT8Fo6Fq/dnfDI
	 EZ/rSDXD+z8zJH+ANR57/5/E3u4yn4UQQv5Cb+ifyYMSaZGLW2trfTvS8BnspFF/I7Hoe
	 flDV3Rv1JnSwzAMpoxRXwNXBtCL8YzVSmxsUviFwSXaYlVHQ1ZK2r713scqldinCLmWos
	 RYHMnJkclojtUG0Jo2wM26RpvXqte9/iM4onuMu9EZfPn86wj+WZqaxjM5FAACV9/ks1a
	 g5qik3qeyC/iZcwN0FFv+S/QSeDnAW7AkuYUaMXKlbr7kskVo2tuXgoAYL0jdWDB/Kg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793986137;
	bh=hTdRaKnkq5mcmuDgiRB8/ODvhHVy8uRiFWQSdQXEGZU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pN7rlKFFfmc2Fz17B6N7ZFRgv2O4Nry/M5iUk2PUXFmljlvlQffFSGbc9y1YXQHnG
	 77k9+uLqpkGq2WV9pmT8rjgmygUD5/klqnrVCvlQ5iigC01I0cBFqg3iunIbaCA9pR
	 g3cctY1KTtLspA6s5IsAoN0UpscL5o4x8Fa8JykZB8Jt7RjqIe3R4og8W9bZTOA92/
	 cIlB851utctJlkTNZleDvjrHmHyNvHfgXDHmTpUlciWeC39mnlEFvTMZInTde7MNbu
	 Td2DA2avGJ0G+xlCL2R8EMnRQ3okCo+re+bxoEDKro+BWAGcdd78231OWa3/p967U7
	 K4P4oJMKWTP3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98E0C40806;
	Fri,  6 Nov 2026 17:28:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CD4F32A
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 17:28:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02C9A40806
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 17:28:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h86xLG98tPJW for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 17:28:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 35187407CD
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35187407CD
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 17:28:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5527E9E0B2; Fri,  6 Nov 2026 17:27:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 18:27:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9362e608cfcb8e045c4b02c40b859614f93330a7
X-Git-Newrev: 89623a47f07167c2b34c595af7924c0004434e2c
X-Patchwork-Hint: ignore
Message-Id: <20261106172723.5527E9E0B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openocd: fix build with jimtcl 0.84
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
Content-Type: multipart/mixed; boundary="===============2972343043985216534=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2972343043985216534==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/89623a47f07167c2b34c595af7924c0004434e2c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

jimtcl 0.84 replaced the isproc member of Jim_Cmd with a flags field,
so openocd 0.12.0 fails to build against it:

src/helper/command.c:51:19: error: 'Jim_Cmd' has no member named 'isproc'

Backport the upstream fix, which checks JIM_CMD_ISPROC at compile time
and thus also keeps working with jimtcl 0.83. Its context had to be
refreshed for 0.12.0.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...imtcl-fix-build-with-jimtcl-master-branch.patch | 64 ++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/package/openocd/0005-jimtcl-fix-build-with-jimtcl-master-branch.patch b/package/openocd/0005-jimtcl-fix-build-with-jimtcl-master-branch.patch
new file mode 100644
index 0000000000..4b0c9d8da5
--- /dev/null
+++ b/package/openocd/0005-jimtcl-fix-build-with-jimtcl-master-branch.patch
@@ -0,0 +1,64 @@
+From fe0080478b9e76a4b6b64186b7b705726ac55848 Mon Sep 17 00:00:00 2001
+From: Antonio Borneo <borneo.antonio@gmail.com>
+Date: Sat, 28 Sep 2024 17:58:51 +0200
+Subject: [PATCH] jimtcl: fix build with jimtcl master branch
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Current jimtcl release 0.83 has been tagged on 2024-08-28 and the
+new 0.84 is on the way.
+
+The change [1] merged in jimtcl branch 'master' for 0.84 breaks
+the build of OpenOCD.
+OpenOCD releases are not frequent and jimtcl is now by default an
+external build dependency. The release of jimtcl 0.84 could force
+OpenOCD to deliver a fix release to support it.
+
+Anticipate the change [1] by detecting it at compile time, without
+relying on jimtcl version, and providing an alternative code.
+
+Link: https://github.com/msteveb/jimtcl/commit/5669e84aad22 [1]
+Change-Id: I61bf100d447083258aea222aaf15608b7cbe2e57
+Signed-off-by: Antonio Borneo <borneo.antonio@gmail.com>
+Reviewed-on: https://review.openocd.org/c/openocd/+/8956
+Tested-by: jenkins
+Reviewed-by: Andrzej Sierżęga <asier70@gmail.com>
+
+Upstream: https://github.com/openocd-org/openocd/commit/fe0080478b9e76a4b6b64186b7b705726ac55848
+
+[Yegor: refresh context for 0.12.0]
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ src/helper/command.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/src/helper/command.c b/src/helper/command.c
+index ca66cf7..31964d5 100644
+--- a/src/helper/command.c
++++ b/src/helper/command.c
+@@ -48,17 +48,22 @@ static int help_del_command(struct command_context *cmd_ctx, const char *cmd_nam
+ /* set of functions to wrap jimtcl internal data */
+ static inline bool jimcmd_is_proc(Jim_Cmd *cmd)
+ {
++#if defined(JIM_CMD_ISPROC)
++	// JIM_VERSION >= 84
++	return cmd->flags & JIM_CMD_ISPROC;
++#else
+ 	return cmd->isproc;
++#endif
+ }
+ 
+ bool jimcmd_is_oocd_command(Jim_Cmd *cmd)
+ {
+-	return !cmd->isproc && cmd->u.native.cmdProc == jim_command_dispatch;
++	return !jimcmd_is_proc(cmd) && cmd->u.native.cmdProc == jim_command_dispatch;
+ }
+ 
+ void *jimcmd_privdata(Jim_Cmd *cmd)
+ {
+-	return cmd->isproc ? NULL : cmd->u.native.privData;
++	return jimcmd_is_proc(cmd) ? NULL : cmd->u.native.privData;
+ }
+ 
+ static void tcl_output(void *privData, const char *file, unsigned line,

--===============2972343043985216534==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2972343043985216534==--
