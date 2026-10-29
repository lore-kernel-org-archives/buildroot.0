Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42699606A31D
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=IlgOlAkg
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2123140B50;
	Fri, 30 Oct 2026 14:06:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A3yL9VkET-K1; Fri, 30 Oct 2026 14:06:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3ECC940B2C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369182;
	b=nmEmZuWUcwDs3NHxD8Nc7suMRBMN0eIimOPSsn9mmLzSPx33G3bYyEP8c1webnjck+V8
	 mnDYNuGSJJDeuSUJTsz7D6wplLKCSemWEnmhXbTlkWu2jRH9gg7G+E2TslIldsOnGMbvd
	 y60478sGoC2OPXDAF7jBkeeg/zfPCO5hPrnfy4+SvJGfv9KK2h+33tgv4fomC22LRmwUo
	 zUvl5pPdCsglA9pmBmg8Q4ibL2Ifo0+JORWj6OWkR2B2Sl6dji/2/w2zRxCbcI3F5rKee
	 81Mx5YN6MNdVprrlFbpD1MMzeGndlBwDTuhgEhBh4FTqKdZfZBdNV14o++8KewY4C3A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369182;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=DD/keyOa1n9D+13tpkrxGuTllWxOWqI3c6WLkrDykxM=;
	b=n/DtSsWB7XLto41YPcA4Sg3FuAv5AG/5ESFDMgvYNFbNE8Cq79pE490ywkT5DUWWqb+i
	 SbJ/fRqbdv4uVFdTU6v+8+W3L7Rkg7C5m5uOri1Vviv02xG5jjDiT6dNCCnT/wuN+YuCM
	 3MVadorHlBbrTk9f3/lAs2St2We4Dx2mzj2s8tyUGJ763KPtUmqHmcScuVV2yNpry6SzS
	 so21ijGPbIgQFWEUPZUKSK9GNOY566pdGt5BaF31Nv4yVm1RSQN+ICPwY2I8ZIDolzBt6
	 ARjJUb4e6X8HufXjZMPmcImNXZawX62F65nV9VoeghLr7o9oqHJhNbF1cFmk62NLdEQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369182;
	bh=DD/keyOa1n9D+13tpkrxGuTllWxOWqI3c6WLkrDykxM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IlgOlAkg3+UZsky+XayJUrdg8SsuFdPAwBeg2kKlZghTuewmzOeBas5vE616JbUkA
	 2DrRrI3P83xaJ3XBt5vhhvCjYtMymTJ+sARlGzFmmh8bq2IB+4EyUaWlimjEy3aBiF
	 t7K+1FMtnXAqIz1ycbLMrXhXek/Pnt5M6agiPUGrJ+O2ofpDSbLQO8Dr3mJg1A2dMY
	 EyK0cbkoQZCkdRMEWIxj/U4wYAk6iGEsEZNSYapyYaL72iO1aG+bXj8PavgoNdlkBN
	 LNa5bp5tJoLcPzWi9/0hEw9bIn84GQY0t2lYVlrEIif9spY0G/v9/R/ITU7ub4ohVl
	 u6rgqe9Th9Ebw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3ECC940B2C;
	Fri, 30 Oct 2026 14:06:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B7DFD38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 91DF560ADC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tCwW8T4rgwgZ for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:05:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org F28CE607AC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369158;
 b=ihMmUJcbCAA7KPv7z8khrCASAX6gtd+59kNGZNB+cJ/PNM2rZNFxogoZErHDeEN2vWn9
 ft4zzor/Unf4XxWtXHNIL1NlKmckfMF5WDMysCbBc/cQNgAtgILcu+fyz1oQkJN5AMW69
 OUp+8351/tCzZMQjWtH81lhzfPJ8niJLnZPbtBIPDJTR83YSlSmeG2ldoB0/KJ2KYUp7r
 OCjPDlbrya2t0+Yk5r3VgBrF0Yvw2NCphZ0i2jLYinf5b7C9E21uqGgr/U9XANIvfC51x
 zpoYg1gYwqw36os3kwjB6oVFIz41lj3RA4OjA3DI9Zy0PBFH4X9iX4ukXAQmZo8t2Iw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369158;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Ix26WS9TyrWfgSoXuBuJ/E5ZZPGyZXdeoZblvCNxt+U=;
 b=N2vpSKfRWNxKEX5PMxYUZ1UEYyz2W+jT7eXOEUTpJtCV05OOF7Ujh0ym2pHEEijXut8Q
 eoWM5J4Ii4lzh700iTj8BkPnQmd7Rc5DDyYWb8BkaYdHtnqHY740tBKDi6Fd11M9YgB19
 yFxGcTSA24HXWh3oYS/r83GE7fwbTakH71Eg1X5UjAlsFbARohrL50QwR8/wHDCV6eG2y
 36hxTrkdJelCYfLsVf11mClvOAat/RchRUz49mlTSnn2JBHEV57gDOk0oSMMdbG8H1VCB
 gQ9TIz/TCIwrPl9/hYCw5JWlk0aI9sIg7Pgo2DRO/EMNoRtVaCBUjfr5F0FcLdrcDeg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F28CE607AC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EC0CD9D389; Fri, 30 Oct 2026 14:04:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:54 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d2423524b9ded72911f1dd5945386121b6d5d525
X-Git-Newrev: 073cd35212a4891fa030413d4c4f3fef39b57759
X-Patchwork-Hint: ignore
Message-Id: <20261030140429.EC0CD9D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/pkg-golang.mk:
 use golang toolchain default GOPROXY
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
Content-Type: multipart/mixed; boundary="===============1214905504932396706=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1214905504932396706==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/073cd35212a4891fa030413d4c4f3fef39b57759
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

This change sets the default GOPROXY value to match Go's built-in
default of "https://proxy.golang.org,direct" which provides several
benefits:

- Avoid package breakages due to missing module sources
- Better alignment with upstream Go toolchain defaults
- Faster downloads via the proxy compared to direct Git clones
- Maintains reproducible builds through Go's module checksum validation

The default value from the toolchain can be read with "go env GOPROXY"

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 84a940ebe1cca7c6df49062a8e9c250fe9221867)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/pkg-golang.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index bdf8de4d66..d1bb1a5ff5 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -88,7 +88,7 @@ $(2)_POST_PATCH_HOOKS += $(2)_GEN_GOMOD
 $(2)_DOWNLOAD_POST_PROCESS = go
 $(2)_DL_ENV += \
 	$$(HOST_GO_COMMON_ENV) \
-	GOPROXY=direct \
+	GOPROXY="https://proxy.golang.org,direct" \
 	$$($(2)_GO_ENV)
 
 # Because we append vendored info, we can't rely on the values being empty

--===============1214905504932396706==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1214905504932396706==--
