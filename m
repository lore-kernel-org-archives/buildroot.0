Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68EC8C79F82
	for <buildroot@archiver.kernel.org>; Tue,  8 Sep 2026 22:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A4D64068E;
	Tue,  8 Sep 2026 22:40:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pUl6Ep5VvQ8n; Tue,  8 Sep 2026 22:40:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 99C6F4067F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788907251;
	b=lk8JFLyVDh6cxMfP5xoLfBW+sIsCJ1t106CpvZzvUVONXYgFKt/AaQLqSjEO+wI8HPZ+
	 8pYTMQ19qthBCLZ+ED5J+QDSJQrxlnl37pzlvfjxfXOlwhrnDVpArFpA+Ms67SQq5RkWK
	 +fQI4IfhiWo9ZldtXo07Dsk+EAGpDnM1MSoiUAgtD5v/KEXr9dqRF0tPehNn7Fc+lbPiW
	 1LMluk0OmV30RlD3C90pRIdeE7LcsQe4j55+wKZbIxcSUZfZ4uIvv9r9pTY81Ear02Fen
	 4pj4X6p0RM61Yo52AvJlafCqtSiG+GoO3K4xOfxZPZXmQmTybSBriszIoe1YvFWif3Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788907251;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=HQv6TZNwPBvdhuDLxUu+CuCPqTi7/30B0KxPWEa+g4g=;
	b=giPxZHuO/kI15PCh+LHgD6ww4RuBeSL6uh5LPn89ExhqcN3mp1HsB4pb+a7Gx30corM/
	 XB6EhXnklsp7bYClB5RzBuRCC7FRgebWaYDhCTtPsyIOubHBnY9aYEtFFYWw///ewqM/R
	 dVMd3aIeF7uGNtJPnqShD6C7IYTpniR/as38PP6vMBwMAgTJKvuyrIu7fNOPWv8aO+Iwe
	 M3ePuLH6RirPY8xe5e5Qq3GlH3bjUtymR/u9MH8xjk0E2ow6MY6dRdFLRzmPyZ2no2rvr
	 hzZiaPS2N9ZfjyB/NbV0SHTzZ5VXUipitki+gJB5SFZZ2QuZ+SV6aHnLT7qmnu8gfAA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788907251;
	bh=HQv6TZNwPBvdhuDLxUu+CuCPqTi7/30B0KxPWEa+g4g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=s8DzPsz10vUlfm2W66Or+AKBgtxjdMoQp0yYRvPzUdjHd741E/muWX+fECJ+tV7X7
	 WCcgZlr/+1jjoYrPCtvWm+dYbpT4cb6DVj+Q2B4/Fns5xVX8vbLzOVipdE3/arM7Bm
	 rHkcT/268WYGn0X7SZmlSq8RbfZnhd4fvPEBBn+V9hpxjCDS2YCgGcI/BcQP/MHG6E
	 BVXw+fCSWi8pciWKeG1vdgOE5EH7y2FyqyBTwrGZL/kk61ebIby25ZNBZkvsYvOUjx
	 HBbnOmgQc8DZcxu5kQNKiVRr8PUixMqQgqLHS3kU70e5C5iKB9QWrir6u0qDTAl2IL
	 lUE3llIZGla5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99C6F4067F;
	Tue,  8 Sep 2026 22:40:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CCC4A2E3
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 22:40:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5A0C40670
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 22:40:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zbppY8olcsTN for <buildroot@buildroot.org>;
 Tue,  8 Sep 2026 22:40:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 931554067F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788907249;
 b=IFaNXBsuZPnEr4UbDhemCaeocgMeUf0yA82aoNleMUMi/GNWM5Ex2L06KJcnLu7VKpHj
 /w2XR0d9IQReJ72etPSLFqmrYJPJ01c9AhJMJEOFXdaiPqeJNvE7MyLQ1kZFGV5QPe8z/
 gsd3ykCGvkxfi57V2rot10UH4xw1uaycE6Gjnna22UO/N5ij5tz4SK0KrzqRvJW816zg1
 UIvGXI+3faLqZ74s1vy1BPyVZaFsuGgGEx70fs+4+Xl9tIHvh0krx9++55qSbtUHBHIwR
 rCZBIqWYs8A/9iMPKJj/H+BKqWkZAOiueSdCDSFevhcDxhZQwuk4STMm7KE1/F+dMxw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788907249;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=4pQoc8GiS79LLf2UjYLUjDkMpzdeFEkKxi3wJq2TGbY=;
 b=fPIvSGbhTfCdblXhCo3icOD3VxMVtyqcG9qPeREGwCza1P+nlXbtBcf3kfXI5bx8jqzs
 9ERrUwBfASgU9jOz7Jdcj0lnOB3ioFk03NhrxC4GDAO2GuCj58htvcHZ7GG5he5xI2nt5
 bxVBI8xT8hzSZ5R2zMaS2t/HisrQNg3niZFIY2BhBIvG/1Ojo5rZlfyMEXC+W5VJ+des9
 rl4gCDDLRoEA/TtDNeVGbxmkAvcjOVNUW6+zaqBEEm+6Wj6vvzV2SzKE+Q3nT+pr9+yDZ
 FHo571/3zgBhxg1MyINZWAdiWay/W+BYS6USYWJa0w1hmDIDiKQYfOWlTmgqBlwgfdw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 931554067F
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 22:40:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 127889549C; Tue,  8 Sep 2026 19:01:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 8 Sep 2026 19:16:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d0c6a0c40eb940bb6cd12f835e00bb34edcba79b
X-Git-Newrev: eeec7b495f6b6127f0cf7020674f7853814a6d06
X-Patchwork-Hint: ignore
Message-Id: <20260908190130.127889549C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] tooolchain/toolchain-external: update
 toolchain-external-bootlin to 2026.08
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/eeec7b495f6b6127f0cf7020674f7853814a6d06
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

All toolchains have been rebuilt based on Buildroot 2026.08, which
means:

* The bleeding-edge toolchains are based on gcc 16.2, binutils 2.46.1,
  gdb 17.1, kernel headers 6.12, glibc 2.44, musl 1.2.6 or uclibc-ng
  1.0.59.

* The stable toolchains are based on gcc 15.3, binutils 2.45.1, gdb
  16.3, kernel headers 5.10, glibc 2.44, musl 1.2.6 or uclibc-ng 1.0.59.

The runtime tests related to those toolchains all pass fine:

  https://gitlab.com/tpetazzoni/buildroot/-/pipelines/2824569690

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../toolchain-external-bootlin/Config.in.options   | 1814 ++++++++++----------
 .../toolchain-external-bootlin.hash                |  872 +++++-----
 .../toolchain-external-bootlin.mk                  |  436 ++---
 3 files changed, 1594 insertions(+), 1528 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
