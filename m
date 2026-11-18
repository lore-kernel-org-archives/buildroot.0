Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C746E606A32F
	for <buildroot@archiver.kernel.org>; Wed, 18 Nov 2026 18:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RvePzXjp
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C8F8606DE;
	Wed, 18 Nov 2026 18:24:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6b-MiE_MIcdd; Wed, 18 Nov 2026 18:24:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BA886606BA
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795026289;
	b=eVe1pVNRVVRM+pivtqM9IEMeY3Ajh0Dut0Iz6Nctv5B2WFDKX1MBoRTlNDtLS/pfe4mP
	 cWvwH7Tgi9EalM0YyqVEfvnXKMivP7EA+yPmWP1syYh+Tr8/EblEyha07T+/eblhHVAMl
	 gZyGptvZ+u64cq4tYvkQWe1Ceseq1mPaUrhyYiVOeO5Nq3zvzr0km/Xj0h4BwcHOe1RRs
	 yvx5RwSbmMOSMMs1to9ERCLlc/oKIAajfF+VEktLiqJxs0rdHbok/mvFwvdTAetH3h4gT
	 8fnL5xc2fTTVPu9sUYaRYg7dcixcJoGhkjUXoPPMsGHRcyq5UxkN0kguU8XptRZM4oQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795026289;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=Z94PNs6/NIUh8TwXExarzkZWoHY944x0GdXuwzYhL/0=;
	b=Gb54VRMz1+YrEyVKipmZGCWXWB8hLMwezdGRMkfc7gSlVh4SUUCM0MsqSh9ZMzwcM3lW
	 P1MteCBUvFE5QPvL7uKMIxr0LFYLz8XyLufUjXZ6nJLn+3ChcOEHeIbt7tR9w9KrUth4E
	 u/gOzqufFgrtR1vI2rGdI0mjKQ00e2b7r2RpqQ7rfc7nouqC4xoWLruU+8GexpldnaFKO
	 JFmXPBx4pQ7g8F+zYuGjd6oUcsPbnnESEoTdnBFBNEnhytE7wqNrqdkHVsFhwmJhDQeXV
	 CfLE2mj/X6Gq+4vFeI6CZzXKvIOrFDbJX8muIZtGjNfdQ1TkgE42D1ysfxMgzZmkPGg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795026289;
	bh=Z94PNs6/NIUh8TwXExarzkZWoHY944x0GdXuwzYhL/0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RvePzXjp+j2YeC0SL4pyjajvue0bZstkHhXjWDQ6u6179O/ky0xFNGEdxwRcD+Paf
	 c+ORO9hb2A+dB+2T6FcxOhSTqlPxe7kfs6agx4agvVnUDTJ9Onpypux4qxZbe/HOOz
	 1S5u4RSzIZdfw25Y40RPieHigG3dqKISnMbd1dwj/LeVxqjdh2s56Zff5ZU9fvqGX8
	 sfryiroIN+k1suTR7wKyfeYh6SO3LUKKBMW68PIn1gfZ78uhtiJmmYiPW0BiR2h+J5
	 tUpKPJjCF/TmF4TXrqIqa5cHrs84ThZ3HzZGbrQnQZkYNxJGfc7tn0mMF8CK53yrzO
	 xoXV7ibYM8JYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA886606BA;
	Wed, 18 Nov 2026 18:24:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 98F5813C
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 18:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DCE14052A
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 18:24:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6NOlalQb6P-o for <buildroot@buildroot.org>;
 Wed, 18 Nov 2026 18:24:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 840E94029E
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 840E94029E
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 18:24:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 771AD13F88D;
 Wed, 18 Nov 2026 19:24:42 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Wed, 18 Nov 2026 19:24:42 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 18 Nov 2026 19:24:42 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20261118181503.157176-1-bernd@kuhls.net>
References: <20261118181503.157176-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.21
Message-ID: <3507005906c90f207d1b8a8ad170072f@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/libmspack: security bump
 version to 0.12alpha
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 18/11/2026 19:15, Bernd Kuhls wrote:
> https://seclists.org/oss-sec/2026/q4/686
> https://github.com/kyz/libmspack/blob/v0.12alpha/libmspack/ChangeLog
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
