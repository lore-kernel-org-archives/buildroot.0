Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E35606A320
	for <buildroot@archiver.kernel.org>; Thu, 19 Nov 2026 13:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=NHQ0JRRV
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 641B460D71;
	Thu, 19 Nov 2026 13:05:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6rO9SgI8Zn2P; Thu, 19 Nov 2026 13:05:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6BE0160D78
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795093543;
	b=Doz0UlqwFHcwqfrJfBjsE5g/g+h4oHLpzFZRYQkxbM1C+l6HPiCO37OVUewTDDYHYkrL
	 5UMGa8xwYddFuXVnSvtmjPKZu68F1uG5xqAK+qhPwBpJUJ5O7n+1QlF7/01b2DILkN94b
	 moYPQjxaEVTQoovVv83FELFMPdP8PKpG8o/43KesuV4eVNYJzdS7xNs3+A6U20cjVIZuz
	 f3Rro94/xwZZOrVokTpzw/WwllZlox0s7XDCYwGPiJUmDQO3NXCLjJZNVmfw/JOp1bU56
	 2MDsDOfCG6E5IOP9Mi8sXNc1jw00nEEFmOMa/krtrlOjwk+2S5bHYQgh4jHfyLKBQ7A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795093543;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=cAG4LM/EMp/aENYHNrhxpcv2x0Qr44neV6Y/AHhp5zA=;
	b=bxvoOd9hMHJYx1t8rkCqCZsnHCfyWMHirqpnu5/iUh08j7fPDCkOgVUHl94ohfhqp1f6
	 itnQ9fPtrIPrXIiRTfbAX+OElB6+rbo9FrbdHRb/GIG2nn/2Fmrw01LSusqplUVmQdQSo
	 iZrjeKAecDodRDpflQCslFbGcHVQeAeWjYZN8FhGVNZXA3GHJvPPzDzpsLB5eZQc3rbZg
	 J+qLepYPWpYeQdUVJmtk5pyFWStMLG9xTOZStIaiLlEKyL6qSQL+z1htGgPpvWCN+9gMV
	 LcLN5rSngxloawhS7mnTaFKdDeAYEqGRhj1k8M5FB2iQJCBTuXSmJqLeYZsvDhrunAw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795093543;
	bh=cAG4LM/EMp/aENYHNrhxpcv2x0Qr44neV6Y/AHhp5zA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NHQ0JRRVWxRABV9BlfU//xhi3TE2pBD1sCXcL///G5+Oq/PlnMsGqR+zUulhHe0ER
	 vlRidkwTI8ElWSorKQrwfS2s9ms3aoDDGxHnVhXAR6lSS4rylqjw3rHsyXoGeMJU+0
	 HLm9OBKkRj9fDobh+8uhX1WDQ/PthmI07pnr2JGuVBByiWMBFTi24xES+LPDn3WB8o
	 JehzLnO13X1KBpJ0CA1r8GPce5d3Thgz/ItCXUDrMY/B5GXWT3UvEwyfVXkz9dlvw5
	 7yUJJZ1eSOJhZuQ+vR7FIPKWXKRGPTmG7gnvqkjADydhhEqpnTfDXxO2L5h3iU31kZ
	 QMdMoEDLmAp9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BE0160D78;
	Thu, 19 Nov 2026 13:05:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DF7D61E7
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 13:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D15A260D78
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 13:05:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1rwA9f2wxN-n for <buildroot@buildroot.org>;
 Thu, 19 Nov 2026 13:05:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4E69860D71
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4E69860D71
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 13:05:38 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 75CA02C85592;
 Thu, 19 Nov 2026 14:05:36 +0100 (CET)
Message-ID: <af209fc0-8627-4245-8490-32bdaec3aa1b@bubu1.eu>
Date: Thu, 19 Nov 2026 14:05:35 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Perale <thomas.perale@mind.be>
References: <20261119083331.195248-1-peter@korsgaard.com>
Content-Language: en-US
In-Reply-To: <20261119083331.195248-1-peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH] package/haproxy: security bump to version
 3.4.8
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
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/19/26 09:33, Peter Korsgaard wrote:
> Fixes the following vulnerabilities:
> 
> CVE-2026-110353: HAProxy 3.2 before 3.4.6 allows a remote unauthenticated
> attacker to cause a denial of service (worker-thread CPU exhaustion) via a
> truncated HTTP/2 PING frame
> 
> CVE-2026-110354: HAProxy 3 before 3.4.6 allows a remote unauthenticated
> attacker to cause a denial of service (persistent worker-thread CPU
> exhaustion) via an HTTP/1.1 chunked request.
> 
> In addition to a number of bugfixes. Release notes:
> 
> 3.4.5: https://www.mail-archive.com/haproxy@formilux.org/msg47506.html
> 3.4.6: https://www.mail-archive.com/haproxy@formilux.org/msg47531.html
> 3.4.7: https://www.mail-archive.com/haproxy@formilux.org/msg47598.html
> 3.4.8: https://www.mail-archive.com/haproxy@formilux.org/msg47800.html
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Applied to master, thanks!

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
