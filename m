Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F54D606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JD2iaMzk
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FDE560BBD;
	Fri, 30 Oct 2026 14:08:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mKeQrm9bTlRO; Fri, 30 Oct 2026 14:08:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 336F860B83
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369291;
	b=HHVPkoF3CTQF+M4xnxsvK/cCr+E2KCL9hw3ySnhnZMXQNWI7X/tCKkht0Gp5M5d3QwSz
	 jeXvQ/DrcBH5u2oul5ftgyhMn9JadxVNwR5XkqUjbskwiSZhMkY/8CJmqrDESh89ilHzd
	 5aiQ5BbRcmMUGNOWelNvitntqs26MWvsmhQDaqBifBa7tiVGCPrF/ZTFV5q8gjbF7LWn6
	 Ynnnbuk8cLtaI5Dk9lyAjvFkg8wpGw4k6qSCzUSY9axfWar6Kz2He1uS30LXdgSHjTFy/
	 95iZ7mlTbNBXVAmTANl4TBB3GjTbWsp1+4dr11+uOHkhkyu6LQHIdsAWK1fcoc3cfMQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369291;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=mNmi7Vj9lvCCTl+qLkzBWWeGHx0xX3QrgDIzCvl1VWs=;
	b=C2nffJZenqFTGLvA4kngghp4a7xn+gEyB+aeKQPcJHEep4OWN0IXbFEhBqic8064lgUi
	 oA6i2u46yXXPTj854AW527v6HEna0bujHb1tAPZriX4lRbJv+4+nIk1AQBFtPaQ1QWNyt
	 Tr7HxKIuwh7rxYfsadjVTrKAEFUSWEWMOiv/RsPDb12+JtkxMF0QvrewnMl4msTFnhB6R
	 JLMleWiRgXlHhT+Hhk9KgCUNMkvMRhdQV9nOj+ZyrKt+0s4zomKXjF7Dqh0qm04XxZqOX
	 h9neV6LK1KmOBFpPZWCj5iMRzYRspieH55A8fZZZRzfIRXfIO7OEKUa8ahqDvEVDplw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369291;
	bh=mNmi7Vj9lvCCTl+qLkzBWWeGHx0xX3QrgDIzCvl1VWs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JD2iaMzkeHjJq5Ew0dtLPE0J1mDGG0gCLP0H70TFm61FQKkM9wEFOjb1lYgPph+F/
	 tyB/Souz7lYF9M92DEF00jQiRHdpFPdeV6egILC0ylXzt21NHGJI1VOHrt0RIp5B3l
	 Z6TF1xeVsvqufBbu4xhjaa3hBQzvwHzDO70vp/t38v4JEjc2rFE8XhXGUhK3xn90VZ
	 +zVRdUJ0Cv/tDZ7xjIHzKVE8MrTuiVNPpLH6QWPUYGY5fttYqx4Vn+eCw73ld04a9h
	 xmgGpLkWiUS+Os+W9kQ752pxkm6mWJTkxAAH57DENR8yojMLXMAatwl4mbqzXnjm4y
	 R11+LVcOHwCdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 336F860B83;
	Fri, 30 Oct 2026 14:08:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D5BAED43
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D355981180
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PgSfi-p5JJq9 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 292CA81185
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369168;
 b=hx72jo4Lbr/4iQgvmn8A5cI/m+CUbZRmQmBQKMEK8ABkuUsutygGutVKDRpAeF+yhUvp
 6YCx6IMb9uc5eC+s5+Uuq35KNFNg/20uZEfTftWQKzb7ADp/J+gt18fjhtdsxxVeyMiMT
 oT3+a+baJRWAtRlVIOyKjwUECPzKcWB13dP1y0DnVKCqJM1qB8OVVxTB7ddspr6ef1KxI
 eXgCDlDKNTSuI+/4Rp9ZxMHkvps9Vk0edU/oHGjVI+sg3Xlr2J/FFH26VqlZRwxwIYGya
 m4LFru50NnqOKQhpMKp9Jv6cTdPYS3z3eTEaDAfWCwk+2mUsB9yjMzM7GwB5cihXw4w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369168;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ADAPVc6lWkHhnW6a3bX7SMlEFKe1jMiw8cWNjf6MQmY=;
 b=aDhFhlVkpFxYU8JrKJQfALMrNwdht/xVqc7Q3AZ6QlDSIbTRUa4qNW0TfeTedG/pyMh3
 qHW+fiDrF3wNnkSs3Axx4Ffmdc4L9Y+jEHWUTagyM1al19C2e/DDbvdpOx2p7GvnvAbwL
 3SG1OXJGCBO30w3QNzeDLBBCa7sJFEISTAGuQ8vUtkaq1XD04zKxDicNRgEm5i9NxqEOA
 GnMFQBsJV/pp//5bJui4NVXMGXXv15Mg2guvg0IXTRy8M8BV8UJmw6dbS2nE4n/IMJ/MI
 jgPSxAOYlMVernGnbChMqd6cgV3lrVom+OlXFaQjGTNZDYkeolKPXhnkRRAuIainNSw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 292CA81185
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4891D9D38A; Fri, 30 Oct 2026 14:04:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:20:00 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 7561b83f86c8fb0da668a033ae34ff6da07c2460
X-Git-Newrev: 9062a525a07462bec226138e90bee0c7341f64c3
X-Patchwork-Hint: ignore
Message-Id: <20261030140440.4891D9D38A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/rtai: fix
 download URL
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
Content-Type: multipart/mixed; boundary="===============1541506105354848892=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1541506105354848892==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9062a525a07462bec226138e90bee0c7341f64c3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The RTAI download area has been removed from www.rtai.org, so the
download fails with:

  ERROR 404: Not Found.

The website now points to a GitHub repository holding the former
rtai.org files, including the latest release rtai-5.3.tar.bz2 [1].
Download it from there, pinned to the commit that added it, so that
the URL doesn't depend on the repository branch. The tarball is
identical, so the hash is unchanged.

This is not caused by a Buildroot change: the download URL has been
the same for years, and upstream removed the files. All maintained
branches use the same URL and are therefore affected as well.

Fixes:
https://autobuild.buildroot.org/results/24364819229d65dda43a4294f26a31667e7bd77b

[1] https://github.com/mmorandi/RTAI/tree/main/userfiles/downloads/RTAI

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e9d5ba526565f9011beccf37209ae0287a0835fc)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/rtai/rtai.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rtai/rtai.mk b/package/rtai/rtai.mk
index 6b309ebf85..6e189bf27b 100644
--- a/package/rtai/rtai.mk
+++ b/package/rtai/rtai.mk
@@ -6,7 +6,7 @@
 
 RTAI_VERSION = 5.3
 RTAI_SOURCE = rtai-$(RTAI_VERSION).tar.bz2
-RTAI_SITE = https://www.rtai.org/userfiles/downloads/RTAI
+RTAI_SITE = https://raw.githubusercontent.com/mmorandi/RTAI/cb3c52f056559c9aaa54d0e1c8c0b47467ae5f3e/userfiles/downloads/RTAI
 RTAI_INSTALL_STAGING = YES
 
 # The <pkg>_CONFIG_SCRIPTS cannot apply here to the specificities of rtai-config

--===============1541506105354848892==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1541506105354848892==--
