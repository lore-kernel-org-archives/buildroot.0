Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 917B8CCF2C4
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 14:29:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F16B6070A;
	Sun, 18 Oct 2026 14:29:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MjUOZwR-VG7x; Sun, 18 Oct 2026 14:29:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 72D5F60652
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792333766;
	b=RSR+Fofdwc9xY8vAqpBT8jzJvG3xnv8f3pHngEoSoEHzcA0RLdCor+1Jotlp76adwvs+
	 JSt9g7QAF38s6nbItmsXXZuzMmRHrQjctD5p9TNQ+8TrWnQLPIy+CKJG66JfdXL44l6O5
	 WWpNRshjghgIa5ik+7qkh+s1yYZhqaAFMXPmrQiAfeH4LBEJG6dYH1MNV9FVBpdTUKNs6
	 MFHtKb4nGxbXeFMuMaiFv7b1vrkjb27sWV+pKwiMWhcNvAxAnpxxwKPDLurnPwx9AyNoR
	 DcHGutGVBQHg0flPbe5gmgVhzt+A87SX9o2ghrghPUVqqPrnXPoqWlH3zHqpJeRsLKg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792333766;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=Fp5Z3qtLJujiCOzoJg/CODeqAia0Omr1PYVsLIW/mME=;
	b=lWCu1PEzb0ha3ZHUfxLRIZ/B15mnqj452Ojb21yYjvnaqIDxMQJ5laEiJpcdW/ZxvGnN
	 2So5zCze2EY1Oo3h25SXqqjzp7SPmQEaUbpX62QDByJOklDkDKQw82MyjEl0VFBjILdXk
	 awAn14sgn1V6p+WfzBTeUGWWUrAIrqSFvy8zIhAIQN1tfWKwyknjGiJCcTXnXjucPjcXe
	 PsYLshfndFbCaVJJPIZLQ9mUNn8cYW7HNvWua6goRqkDKHxJ1NeBoSwP+B0TK4SH7xaFG
	 nE8GEFFytOWeW8XtEcbxVbWx102EeZsSPGl/k3WXRHm2ROsTQsJMTiyeJCwIZLj6Rjg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792333766;
	bh=Fp5Z3qtLJujiCOzoJg/CODeqAia0Omr1PYVsLIW/mME=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GBtn9gz7HxBwHv0ocQQkvsrfDrJ409kelHclHQ8zjKW2/PAkP8viBJQPKFTENz6Pg
	 vlXHPlW9UNdXgSzBqbWtm2ecsdx0BQKbZ8dROtfgbXG3eIebnNlXTrbWATUrm7j0I+
	 d9S3JqWA52diTU9PhNxmxcAg9+oRMvixQpHBly+fFEtoHcB9WY08whc6bOwVQr/97p
	 qkChN32/gaRTqGEWmRzZSc+sQl9EQPA4WQYXqB0jnFmUpiNEIpNvl1LZ2/5N+MBGbZ
	 xHQRbOIvXyUSbPwrbYhsls1xPBA5ucKibIXZKtj/+vXzBHSruYdHd6fEJQ7jpA8sNS
	 UV3Mop1YKji9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72D5F60652;
	Sun, 18 Oct 2026 14:29:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 985232A8
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:29:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95F9A406CB
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:29:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9EtVJG0BrPa3 for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 14:29:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org ED3FE405E7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792333765;
 b=sF947edfLLSvkILxXpz5rbEIKHcIMnZMkFHSpse/BRt690c6JhSQ9VLp1DIbirTq3iJG
 z8bvE/uyIQ+arPVuFjrEcruohZB2Kcy+efe5wIAdjctOKrjzIiQ0DUM0uauR1qaK6Sdmt
 Hnf0GD9ZySmzi0LGh8gq6L6Q6C7HRZeSt3bI8JLq+ZLTUTRk/wd8Fmfeu1xbun8kpwpiJ
 dK6ZJbPwsQLLAAf1jmtB5kPD3NK3h11V87kBnZt4astA2MLgn7U8OPc0+Z0B8Zg87yygV
 Ok0fgMJMg1ZWPq5fa7+DrGa0jweEY/Nytqoy01d95+f+Yr8lwTgnhc/4tjJIm8V1Iig==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792333765;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=awyLErPRQ77I/ZziMpclWd3944AdbeOe5V0WcJCQt/4=;
 b=TdUMeYhxW/9Sb7QLa9HYyJ/LmMlz82Oysu9MAgqtIxy6aJNfc3fPcWwVfwSKSDfeuzWe
 Neb1GbtWvfqLlLhyPydUaoMVSn3AGTXoJbNSOL+OQxFSt3T1aI2Kyt/NcszMOsgFOrBZK
 gIjLWj6Y4N+1oIwZXXsBVIFe8pSnvEuMQtKMeqhHvk4vVm2QmucaCZUKnYVrWZCBjb/WG
 naEqSFE3x8wRlv/f2Qlya4iG0EBbSZzuW/g2VmcCymQJ66WELv+H3Z7mvL/VPNNX6okO1
 6FfWJBnOb/4sJQtaJCNKV3vjGPn39fQ9Q9yI622WkSz0TDKZ367kanMCrNTst4A/Ckg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=j2o7geTk; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::15"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ED3FE405E7
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:29:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 17906780383;
 Sun, 18 Oct 2026 16:29:21 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 18 Oct 2026 16:29:21 +0200
MIME-Version: 1.0
Date: Sun, 18 Oct 2026 16:29:21 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261015215210.3426895-12-james.hilliard1@gmail.com>
References: <20261015215210.3426895-12-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <298f2184ab83252869ebc0246235ecd5@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-pydyf: bump to version 0.13.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 15/10/2026 23:51, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
