Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF19606A321
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 12:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=YFy9Fy7d
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A6FF81546;
	Fri, 23 Oct 2026 12:32:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FVIr1yUhpRBG; Fri, 23 Oct 2026 12:32:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A5B2381659
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792758754;
	b=fyPr9BIaW+Ox6tiyLMMCqMD2DvRPrvDNYvD50xRUmt1prFdTVvSgoMLtMBqstNI56Jzf
	 McMzkdAK6UdIUjo+Q93xEQnM9WGlPHlJCK/hefriXf6R5hU4YILsy19KkCkOIgz136DBq
	 mkoxpb1xenEt5yLcDzNGK0p4xUK2ZizXloYJa71qnM70dJLj76b5bGGviidN7LYggpjKo
	 lJB/YnE1eN27PVdcmK6Iz4WQEkuh2cH3rR7Wd0sl6oB6gz2S4jFbbfOg89GcwwE6VDvAC
	 gEHTCSeMRUpRgPEOveqwWaRasxWVrnD0Nobqf83p97Bu5cAwqXNBcfeworhXFhNl8yw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792758754;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=EwxgyuNZY4b/vzP5PoSNY13wulcdD7LLAOHyMvaGK2A=;
	b=EDzrA4yL6k4A5bJHlq6JwDVrhwEfqF7MRtYg+IxeINq7nrmwmQ3JoKsyXqSsa8cjUSDz
	 qsmNey0oaYJF+Qibg75wo4gSlw0UB2exMTZ7XB+WslWe/G+I6lckaMZd8ArNSlMUFEYJS
	 rBSYahWtY7k8MLGzwZbPkq+ffsX/nt7kw54yvBd4/H06JRizgPVElfTrxHuS91WJ4q74P
	 GMGSUo+DC1a6LROr2srhW024sDLf6u3cRWYR2FOCasJHmESPyQMuBrYXb56in1+AxPEDq
	 LDqFmHnnhv93vKmtmILLh7yHCvl3YF7GNpEITQf2lM3BZRc8kd0Tg3SvWCnWek3ldSw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792758754;
	bh=EwxgyuNZY4b/vzP5PoSNY13wulcdD7LLAOHyMvaGK2A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YFy9Fy7dHTNONMsccliy0OB/XvC1QNlBALlbA8PghIemDDO2GZ0YlK2x/v9Qbapx2
	 N0sc6hdZ76e2Idq3tS7Z2Jh9nEBd/U76ZowNKeI0oAmn5GtMh5jl1484QewmV6pxYd
	 NDLJCg/IMoxGkYz0xAZ0UHqIjB0FZ+0Aw506qq90TibglVBdg2roo96fk2rKTMcgoB
	 eeVaLZuTKO2r9WsQ7L0bCLM2Z2xV9SlQ0Amr0eWHHdCzuy0ZBpvUey9usmn/bvh2Hj
	 SziF68lUVvlv8+89xd8pSSRAuuRyT9yW9OTbrr/aGP7FK3fkWXOxfCowmshbsL13ix
	 J4J+EzwW+Ik+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5B2381659;
	Fri, 23 Oct 2026 12:32:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 16C2A12C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08B80401D2
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9uEy8jNABGw0 for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 12:32:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 6D9B0401CC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792758727;
 b=BkcEhiIVqNSU+18gUxxHOXAKE8inMyIjlDUL0k8cTSJ23yvoQIPod00/BUsXb7+HGPoo
 qQWOIv+YYIWb/bilypXm8yZ0ntU9HbGksT9IHQdNwD5CSRoHfidUJjVAJYYl4DSKXCL6g
 741HoF/f4kWiPxf/CLGXhYDwRQJye39XZDLh6bovoSHnyXJjm32+3+qmd/nr29ZU7Yogn
 DhGI1ANo74Wpdq+HgyQuXjyxRd3nXnrd8Sc6kgsnTeXGaqfG+6xFYvpVNnOO7jxuwH9Sx
 wsfiOK0jxTRLRM7k4kSWUrg4szlyHaHxmtSOqyD2clNol07M6mwpnmnpbz1PYwLJ7jg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792758727;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=gQ/5fIKbeN7t1YkxkyU8ssaec3PKq+7nHXvn9ulXHFI=;
 b=fnJvbcn0fNxg8HLm2J9Uxec5y2oDM2wZmgTeNfjQ6C8bA8qmMGTigk8kqQTqA6Jy4ajQ
 kRx/s1YxlyN9wFH/cBD3eOpVpWUsTBhKgMTGcQ6b5QkgNr2FOeYxDa5rUEGrx/DHwrz/A
 w5f0Ssew8AvEbwYphFQIctPt80LkN4Lyb8ijidrs7hgm/SZ+ag24N+IXUy7DVtCsFaiAY
 tZ7Q6xrWUDHX4IodePoC7sbEH6vDIBGuSMBkiUO9GvZVV/B/tcJZrh09z8P1w9RoY0c0N
 bXkp7WWJGIcnBInVzB/8rx+Mkq/ErZkVSUbcHlZsfHKsI3mfHqOlSZIQyknZBLyR2dQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D9B0401CC
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E816B9B9F8; Fri, 23 Oct 2026 12:30:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 20:50:27 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: aa7f2143977774187382a04db36bf81e5ed71d49
X-Git-Newrev: 90653b4b276df304637ce96783d339ec3fe24008
X-Patchwork-Hint: ignore
Message-Id: <20261023123042.E816B9B9F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x]
 board/librecomputer/lafrite/readme.txt: document UART pinout
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
Content-Type: multipart/mixed; boundary="===============7585871855006154586=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7585871855006154586==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/90653b4b276df304637ce96783d339ec3fe24008
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

The lafrite board exposes the console UART on the GPIO header.  Document the
pinout for ease of use.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit d6243220d771684129a8db85add129fee4a61712)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 board/librecomputer/lafrite/readme.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/board/librecomputer/lafrite/readme.txt b/board/librecomputer/lafrite/readme.txt
index c439c5e91d..86afa855e6 100644
--- a/board/librecomputer/lafrite/readme.txt
+++ b/board/librecomputer/lafrite/readme.txt
@@ -32,3 +32,10 @@ How to boot
 
 Insert flash drive to the USB connector furthest away from the IR
 receiver and power up board. The system will boot automatically.
+
+A serial console is available on the GPIO header with the following
+pinout:
+
+- TX: pin 3
+- RX: pin 5
+- Ground: pin 6

--===============7585871855006154586==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7585871855006154586==--
