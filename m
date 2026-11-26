Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614C0606A327
	for <buildroot@archiver.kernel.org>; Thu, 26 Nov 2026 15:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RxmC1Ip4
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 347244059B;
	Thu, 26 Nov 2026 15:35:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vASVplArtUgt; Thu, 26 Nov 2026 15:35:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 64C934043B
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795707318;
	b=bbQQ9uq7g5bJZbU9sfYvtVIqJh6EWKCxcSHo4tamz0G8iglXSQvPT/UwIGcDGSzuFFIQ
	 k6COrMz0pnS9yYij/oNJGJK7jkVh6zMO0ia7wu4g+bDjLvJ7O/8waokEl/0OrYnrIwHqX
	 uq0jHUpM3TvX7LdakyiERJDBE/LhPiKC2gEhJWFb36QpQxvlunyspvN5SD39znuAc01oh
	 9Zqh1nHnNJSdMaXKTreVLmRSl90SlNcafv7e2CU9bBRXW54fVo1KWlSE32HokwAl3jikr
	 KkoaTnZjFNyw5jA8BdJ+gN7tkjIqRt7JllkkiRigjNVGEDTR4GVKbqckStdAz/by7Xw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795707318;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:References:
	 Content-Language:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=zp6zXYNeP1U/3hoDJtl+0jBUsqEaGWgljhr70gkk3vs=;
	b=eYwn4FeUsjox8obh63bBnEonVHm0YwGubrv1rDoOikZc1ycg925VldttHifNyVqT7nNK
	 skhU3/Z1wLdcQWHK9dLVex51pgPpucQRLPctG0LO+zAAiRxxp6U86/9ZgMe9NElwdAqiM
	 DX+xoAG3Dv615SgN+jhO/NC8/UpdUnkr6biAq/p6Gvrng2CwjSUyZxtknwirMiHZa6XGe
	 9GJnI0oqOBwVdh4PnsfWlhqGwkffmcqkxkAhpeiZubW7zCwpDD81QicQMEbL6bUUFMEYt
	 GKyfun4P5KpKlPcAKnrxxIsYLDhuEEqsjyTI2MV0QG2IPbvKYg9lVuGP2/TwwFYIxdg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795707318;
	bh=zp6zXYNeP1U/3hoDJtl+0jBUsqEaGWgljhr70gkk3vs=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=RxmC1Ip4AJLRcLcOCop5YEmtorlaQ8ROmvKa0wdo0kqChqkUPsUIfX1QubqPbdUa9
	 XIuK9lYh56GiwicDZIrdQJ4g6ucz9BeoHuEziwY2sIY7Hn6rQHL59MB5cR0gYE8dnU
	 OGWhoU5bQEUKGvPUxxQBH6aRtVVBkUR3EaXv/dkZS68cfT2QuPzTf7XAhfZ4Esf0Yt
	 EXcZjMRZvFd8X3DksSJBdzi6cRWjboFcD6yMNVHxW4YH99PUujitYdVXmEwJsmA/Gq
	 ERhn+gugitCCAUe1jvG9vDGDoHjptvMuBTFykWvLpRQRB6fnOs+tYCgngdjB5W4cSH
	 cbyrqe+mscjyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64C934043B;
	Thu, 26 Nov 2026 15:35:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A7D9C311
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 15:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A3D138111F
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 15:35:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VG5FnRNUmFOr for <buildroot@buildroot.org>;
 Thu, 26 Nov 2026 15:35:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 253788111E
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 253788111E
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 15:35:14 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id A11FB2C8516C;
 Thu, 26 Nov 2026 16:35:12 +0100 (CET)
Message-ID: <80fa2436-380f-4d13-9131-2c7c9094026f@bubu1.eu>
Date: Thu, 26 Nov 2026 16:35:11 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Waldemar Brodkorb <wbx@openadk.org>, buildroot@buildroot.org
References: <awg9hZZwc-YoI9tH@waldemar-brodkorb.de>
Content-Language: en-US
In-Reply-To: <awg9hZZwc-YoI9tH@waldemar-brodkorb.de>
Subject: Re: [Buildroot] [PATCH] package/perl-cgi: security update to 5.02
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Waldemar,

On 11/26/26 15:09, Waldemar Brodkorb wrote:
> See here for the Changes:
> https://github.com/leejo/CGI.pm/blob/master/Changes
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
Applied to master after adding more info to the commit message from 
upstream's release notes:

Thanks for the contribution!
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
