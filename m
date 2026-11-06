Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BF8606A329
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 17:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qiMzcZhs
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDB8581270;
	Fri,  6 Nov 2026 17:24:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i_M15oKHf8bW; Fri,  6 Nov 2026 17:24:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E5BD38123E
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793985867;
	b=pf223ra/9/YwcaPCg17ATLTm50UiifvkKB9jD/R9qTIzj3g3J8krRiulf5dZHiV7wrMj
	 GNuWcAzFzswAwik7O/trJHZlbxgepvpBY3WrPN4YUNS4Z4ZZmvFjIHLt4/M89NDtoBjEf
	 y4p9G4dqgfHx2iGUb1dM/1XpBc2Ve4HZktnydJIt25Q5/R1NggBA3gdsAbQVPQTmLLkn+
	 WOrNQdAhtT8lchi+k60TjBThWyI3QM4AWnyJGkR6/Qqj2ST/jMOx7PesqG+4fxusJcZo/
	 6ceeSHyoAMRIu3Rr+EdXYQWvWpDlK4UyNrYkolQXff2c7bbi0NSeqJyi79YBaxrnmhg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793985867;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=nP3CGI53+GDaGV8ZAnyVfeUAi/Cv2yoAjpOumn8ftH8=;
	b=oKYnYJDXlCW7AbFWlVqbwemyJTvKUyAM7Cc6H8krktsoId5udnYbzP/I6BZvXaszlskD
	 kTJV94ig9grSx5vtNr4c2TmVM6Nso/uDIP/z/4fe6PW3JlgjKEnQKU6uluSJlKDqbl6A+
	 KZQxffCx9I4heJM/5fvcLIsAT90cd59u9EqVw4jAaMcoHYJBqUSC/f6a9AC//qNKjzGKI
	 cUzK2BD6J+9bLH0mKQ99X/pjhN3xicPHr0G0Y8Q/d5oV/8nS7wX+RIDLe0BoxMpRpenEg
	 D01avh+63j/5KBHoWYXEmq63QHI0BgN/gekx8nle34l0aRNg+x5z8OOCDTOClsRd7Cw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793985867;
	bh=nP3CGI53+GDaGV8ZAnyVfeUAi/Cv2yoAjpOumn8ftH8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qiMzcZhszX9W7fXqw7DWAa3Wz3mQFBkALCWoUsPoPQZIcIZDHtYv95WxAgT+GSczh
	 f7NuLyP91fPIAzn6E9CbSO1utginmqgtVDxrRxo1hgVm0OPqtOIxTgdFKQ92sZ+aBx
	 8bWvdTzUFRzrGsW08t+a7QBnVlLesD49SFCdTbU7CWui5+fv7KTn6yT/pf8pHEOrel
	 Ylb1ukfv2qmm2pkKDxXUk+u6VyQavZLHym9KxW1fw3B2Qr5NoIWgM/aNZUCacH91xI
	 yfWASqbD75E60nBROmNdUkWyCGvDymZuMrqNVpEDPpbDjnAtXIrOOkzj64t+4Ns73o
	 QiNyxsjhiLN3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5BD38123E;
	Fri,  6 Nov 2026 17:24:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A17034D
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 17:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7028481233
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 17:24:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MNNSRMQ05cH2 for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 17:24:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BBF3181230
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BBF3181230
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 17:24:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E4C879E0BB; Fri,  6 Nov 2026 17:22:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 18:23:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b86f2c2fc9bdbdaa4683ee20f33e84e21073a4d7
X-Git-Newrev: 2131698e11948a2158ad45abf1026d8d5cf81ccf
X-Patchwork-Hint: ignore
Message-Id: <20261106172252.E4C879E0BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qbee-agent: bump version to 2026.41
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
Content-Type: multipart/mixed; boundary="===============3965781965357743472=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3965781965357743472==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2131698e11948a2158ad45abf1026d8d5cf81ccf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Jon Henrik Bjørnstad <jonhenrik@qbee.io>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/qbee-agent/qbee-agent.hash | 2 +-
 package/qbee-agent/qbee-agent.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/qbee-agent/qbee-agent.hash b/package/qbee-agent/qbee-agent.hash
index 02109f274a..380380e33e 100644
--- a/package/qbee-agent/qbee-agent.hash
+++ b/package/qbee-agent/qbee-agent.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ade55d580115cb1c81b0e35766cbba2b3718f45e9b4262dd795f5c964bb2ca2b  qbee-agent-2026.27-go2.tar.gz
+sha256  40f334a33e82bb9d20e4643bf42a75db9e7e73eb504d7163073ceda481ba4464  qbee-agent-2026.41-go2.tar.gz
 sha256  02d07d96be99eb042b01ba650079a440ce26a78c5e0e1e8060c33a8c9e200404  LICENSE
diff --git a/package/qbee-agent/qbee-agent.mk b/package/qbee-agent/qbee-agent.mk
index 93c6f501a4..8b4c3dd308 100644
--- a/package/qbee-agent/qbee-agent.mk
+++ b/package/qbee-agent/qbee-agent.mk
@@ -5,12 +5,12 @@
 ################################################################################
 
 # keep QBEE_AGENT_COMMIT_ID in sync when updating
-QBEE_AGENT_VERSION = 2026.27
+QBEE_AGENT_VERSION = 2026.41
 QBEE_AGENT_SITE = $(call github,qbee-io,qbee-agent,$(QBEE_AGENT_VERSION))
 QBEE_AGENT_LICENSE = Apache-2.0
 QBEE_AGENT_LICENSE_FILES = LICENSE
 
-QBEE_AGENT_COMMIT_ID = 6710abd49906d00ba6c4e446f6436faab14fb5d9
+QBEE_AGENT_COMMIT_ID = bb852d8fd57ba0871168dbf6f111621bf7f04c1d
 
 QBEE_AGENT_GOMOD = go.qbee.io/agent
 

--===============3965781965357743472==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3965781965357743472==--
