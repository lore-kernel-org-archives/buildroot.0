Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC582606A31F
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=seiefpPw
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A85181172;
	Fri, 30 Oct 2026 14:06:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YTleWIM09BUc; Fri, 30 Oct 2026 14:06:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CC9E381136
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369170;
	b=gq8/jL40aFD/zfH+nGd5GRUD1kfzyPfrg9+yvGKTIS98Nyao5aE5b8lDJgcpJ7ZwifBC
	 1/wniXSICB3a7tRVcitqK2J6BcotXRROcJPrXSzc9MEO4wQS9qPnP9RsvErBxErxuu3Ne
	 KZBJjXiu9NFf8H0eau5+1XgcpTzRa4znVBM4UPFDmEGQETvfwoEBu5PrOR0DT27O0MNEL
	 YbC3OOFdskJVyRKK6VpQOPakHAO+OPr79b+RS9W4HsVyP9+78NKBovi/mbuDLbl/cVFwe
	 +msZpLdVbDPh4zUxpMg1vY3jYIOInKFRuz2W5KjMpsfw9nrNr8mORoLjeCe/QOiJqfg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369170;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=he/gRpgWuJk0QZqt48OlpH2q7ekm65DNGz2bJAtbyUU=;
	b=qR8t3fn5Vh1WgElvbw9V6OOJ97WTRsKwP3JKDTjdK1/RoMQzvho/VN71rEZBDEt9GBor
	 5nXWJygPOpQNmhdvgAlTXPbykNecTg2A4qEtfjjjx9Q4HXS/jbSxbgYu5rclWH5z14U8w
	 ni9j2CjoZdziYoROu4sIVVnCMBKME2gXfFwaueB1SVIhqUz2wwjS+7SJoAF7F9yUR5uTT
	 ovIYnzdPN//P1I4gDexzGmd1xJHNc0w3Xb3zsDKxW/cuG67ID2r+wQ4i545uzjA7UdvYN
	 s8ig2NPOD3Tj8BGkbNvQGifW6fe4LIF6gEMUAcaFdsdEKhoamsB3pNZcsOaglUR8S9Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369169;
	bh=he/gRpgWuJk0QZqt48OlpH2q7ekm65DNGz2bJAtbyUU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=seiefpPwPhgqGpQ+vxFrfhfYOymf+o9AnEWSMbEeB3EFwfQQAc3afYylZwh5DeRTP
	 +iXGvTTzApx/kVEGrl4euK3u7PhSQi81/5nIuKAsFSMm2OO2yjeBRmnv3P5y5deLy+
	 r0oLNtBCoY2ZaqOGMvLaCy7Zb29WpRypk2PAy//HdxQ0qw6noUyZyx9byIEqlvnA0q
	 NO423LNYpyJw9bcYyvOd8rVkS/w0T2EWbfgq0WAmcLO4tZ6vXQFpi25cDToFhnkCd8
	 1tpHi5dCPmvbycSDqLYnT6YkdaQNCB4V9chu8BXXtRTtGmfiyUMJ8eytn3KKyZ8uW4
	 rQ+A1SSttpZKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC9E381136;
	Fri, 30 Oct 2026 14:06:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 021ADD44
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7CB5607A0
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sHDzJ4Ssg5ZW for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:05:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 45E5C60AC2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369157;
 b=Hfaj4Sws1Xe7ueoMxr8r11qGeYmYIjHrK5coTJJc1UQ83llFyR6MIhy/6goSKwSYBW8v
 Ri2IEj0TGnn9bT02Se/jHF5BAyrVOqIV6BMQu9XgW63rwQ0PnjRRd2jVPV295Z4L3m6iQ
 OL3XnpfkamxXC0FAqA1bUy7vaSJCeO8HUXiP0jJJT+N+Ze/Bz1OCmKjrnh4HGIS73HxyA
 8HK9ewr7fea+PRNhUSdcpDkMsg1saxt8HC1rIDtl+3CDilVXjJOMgFtUgCWYBm1DDvbgX
 aC303j7+w3T0rATvTkf02BovPpKB4u7YRv/0lao74jrZyd8llvP7HvEYsmjn8OsuBng==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369157;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=/wf7ukUty3MvY7oRTGv3AhH8ss1Z2nA4k11BhqMyKZ8=;
 b=JdgNdsPYYc7iOj8MsRq33FjUI/wStcFAHltsA6eNvJ78o91qMfY2CRkwIj0gMgAsC6nn
 EicVxlpzw8ObGjheVHCMpE/641NE2HcFe6AXYy2YVm4AgPfmr8nVm9ERQwFosHdRQxKdQ
 LN5u3NhZ9aKOCirgH8QxxjrlLdGerTWxv7WTfrkIpd7cPYzrRfQ+b0bIviREY4Br/w4Gv
 bI8sfyunfFsY/69XbY9tqZFd5YHqhkLTqJE1tunel5dVqsLsD2/+ev0ylSkEmBhyIXXn7
 S8RJFwakZPrnOwTGK1ypEXhet2LYL9S6GaPuQ9ZLq/ZZtrCBt5vswVxNwCTEnm5U9Bw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45E5C60AC2
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 65B479D388; Fri, 30 Oct 2026 14:04:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:54 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ba56b3bac54a635ca70ef46f5d7e4261283df789
X-Git-Newrev: 2a86b6463fe9adf2ad20a7da4c4fe1035214df1d
X-Patchwork-Hint: ignore
Message-Id: <20261030140429.65B479D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/fmlib: add
 warning about the need for NXP kernel
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
Content-Type: multipart/mixed; boundary="===============4210889788293319673=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4210889788293319673==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2a86b6463fe9adf2ad20a7da4c4fe1035214df1d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Building fmlib, either on PowerPC or ARM64 against an upstream kernel
will fail to build as the kernel modules include fm_ioctls.h, which
doesn't exist upstream. fmlib will only build with NXP-provided Linux
kernel sources. This commit mentions this in the Config.in help text.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 47cffe76f391863199e9c2ef577bdc7a0137832a)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/fmlib/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/fmlib/Config.in b/package/fmlib/Config.in
index 459d5bf102..17ab47ec08 100644
--- a/package/fmlib/Config.in
+++ b/package/fmlib/Config.in
@@ -13,6 +13,9 @@ config BR2_PACKAGE_FMLIB
 	  configure driver parameters and PCD (parse - classify -
 	  distribute) rules.
 
+	  This package builds kernel modules that need header files
+	  only available in NXP-provided Linux kernel sources.
+
 	  https://github.com/nxp-qoriq/fmlib
 
 if BR2_PACKAGE_FMLIB

--===============4210889788293319673==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4210889788293319673==--
