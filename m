Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C319FF8875
	for <buildroot@archiver.kernel.org>; Wed, 29 Apr 2026 12:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AF6E615F4;
	Wed, 29 Apr 2026 12:55:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wQRDPKgH_REw; Wed, 29 Apr 2026 12:55:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3774360FF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777467313;
	bh=Y5WafAiIvqoRyuIUHMWUI8461WFwdkgdnb75Cq3TpGk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=d5rmhbkQQ48ZtUCxJ98CeY6bxPaPD16ObzjozJkCPCEV4z7Qso9lUJHPe9xF4+IKk
	 jz+Jxd1+UWsWpGzpN55Y1fVqGy0dGg/gfmHEJ0oRSopFNf+oX+Ef8Y6oDQvVRO8kGJ
	 dUzmQ4h+VItTVRYfrXnsHsqigvPtRkMmWFMgkOZhlgU0pKmhRIucGfZDirJ4Q3+cKs
	 /CTZ7Cn2LR5f20eHvEFUzMz8gt5hlUZ13oTsI5oPU5MG6uzUNBlteddRx9nAM0hczz
	 48TcA8bGjyes+uOan8hoQKI1iHGBXlCmGyFby0x3cYMqhLLgU6xfPjEgvwh9j7Lnuu
	 vyWTEDv6XJ1hQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3774360FF4;
	Wed, 29 Apr 2026 12:55:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CD6DC23D
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 12:55:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BEAB78121E
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 12:55:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rdj1EacJv4Lt for <buildroot@buildroot.org>;
 Wed, 29 Apr 2026 12:55:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D770E811D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D770E811D8
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D770E811D8
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 12:55:10 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 9E1DC2C80C2A;
 Wed, 29 Apr 2026 14:55:08 +0200 (CEST)
Message-ID: <3f14a474-e0bf-4bf5-b895-d4fabbb9d1ff@bubu1.eu>
Date: Wed, 29 Apr 2026 14:55:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>, buildroot@buildroot.org,
 Titouan Christophe <titouan.christophe@mind.be>,
 Thomas Perale <thomas.perale@mind.be>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
References: <20260129161012.1610562-1-raphael.pavlidis@gmail.com>
 <20260129161012.1610562-2-raphael.pavlidis@gmail.com>
 <6da5581e-2794-45d5-8879-3e399354e1a8@bubu1.eu>
Content-Language: en-US
In-Reply-To: <6da5581e-2794-45d5-8879-3e399354e1a8@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1777467308; bh=HVlputLplY8pXggSXvrHYtMsBChhVJRW0aMLxIexJAk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=ZKXTxLFfQ7Z9qJc3r+pxcupHT7qrUv8ccexzDv8PbMFlCdupk9hT6zRSMEg9ST21T
 OPHp9KN987EX0GnABy8HPrqKdLCSQLq3dzJDI066FONDhCayZPHkP+lsXn6pCHRLqw
 JmSlb9lU6FGyO9rfWPw3FI6I2dVVyI89x0cVsYS82RuHzJQY8Pg8KDc8H5brNgf+rn
 EhiVPqOahOq6g52pT/wevmB1emiuFH2gvDeF9FlB8NyNbJOfctUR8QWK4VVyTYoNbC
 Gv6jWHq1eiCnApfjBpZ1rtRwPVRikbzhbPgC82MIPU+yebhfX9HiHJ3VWBUpWjElYK
 VsZC5WT5E5ZVA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=ZKXTxLFf
Subject: Re: [Buildroot] [PATCH v1 2/3] package/linux-pam: security bump to
 version 1.7.2
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 4/29/26 14:48, Marcus Hoffmann via buildroot wrote:
> Hi Raphael,
> 
> On 1/29/26 17:10, Raphael Pavlidis wrote:
>> The build system was changed from autotools to meson.
>>
>> Changelog:
>> https://github.com/linux-pam/linux-pam/releases/tag/v1.7.0
>> https://github.com/linux-pam/linux-pam/releases/tag/v1.7.1
>> https://github.com/linux-pam/linux-pam/releases/tag/v1.7.2
>> Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
>> ---
> Applied to master after adding a note to the vulnerability fixed in this 
> bump (https://github.com/linux-pam/linux-pam/security/advisories/GHSA- 
> f9p8-gjr4-j9gx / CVE-2025-6020).
As for the builroot stable branches, debian lists these three commits to 
be the fix[1]:

Fixed by: 
https://github.com/linux-pam/linux-pam/commit/475bd60c552b98c7eddb3270b0b4196847c0072e 
(v1.7.1)
Fixed by: 
https://github.com/linux-pam/linux-pam/commit/592d84e1265d04c3104acee815a503856db503a1 
(v1.7.1)
Fixed by: 
https://github.com/linux-pam/linux-pam/commit/976c20079358d133514568fc7fd95c02df8b5773 
(v1.7.1)

Not sure how easy they are to backport to 1.6.x though debian seems to 
have them for 1.4 and 1.5?

[1] https://security-tracker.debian.org/tracker/CVE-2025-6020

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
