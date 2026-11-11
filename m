Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4862606A31C
	for <buildroot@archiver.kernel.org>; Wed, 11 Nov 2026 11:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ivTYC4E2
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88DE840B23;
	Wed, 11 Nov 2026 11:35:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LQxwrUqViARl; Wed, 11 Nov 2026 11:35:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AE56B40B17
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794396935;
	b=VfE5yFSdbP1x346cEyGRD+vIssgdl+hgFG/9HcSqY9aQTmy/19jnqWrYiROFh6jvyxDP
	 haNUbuYAGUHyR1+WBqR1axrFWq5GvtktkUjQuWAPohPsW1aOjxfDFUzdsn5GXZ7urlPfq
	 IIwI6VBBuTQ5qsjFufCyTErtVNC8OVcXifj1cJa+cX5uNruWGTUUwXFSfI0o5OM/yZ2+u
	 +luiqKAJ/UVuZRwXnkKPiHIU7aSlogIaOlaDbQS7ABTz/Agg1a45QXd3CnAT+O/auEHnY
	 VFgnMBOqc1EU5YWerjVve6kAeheBZkqxMBcZLv0C+zHgn4OkEHfSVrTzx2k0ET8P8dg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794396935;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=KYbu4ps1GMb+LCPFTeVEht0h3DNOHZE3KnKIKfpywmc=;
	b=MauMCjTlYvDeXGvAXWDAgMDCybETpLAbQdSoQWgMhzYq6h3tPUb39ubGEiI2NidDMC/4
	 LmfoYvsJf2KAq5c96++ZPnX63/F0okW72dZalfdLgK1u1pWHu5uV+8zT4iWn8hdyLXeN7
	 hioJZpgG5LhvMroPGA1aX8Fy+CoRt+WMraa80oOy4SiVOys7wg/UFbVhuwTYSULEM+PGP
	 R/s/PLZ2WN5AIDD6G3pAYF+731iB/51IL1M+rFw6zjk6djmIzsV8RvhRGdqR8r2Q1yOjo
	 AV1cQdrFCeeWf3iWywAarc1+FfVCeWOrPoausyycGK4SIAFaW0wKcfo4uiWqYZToKmQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794396935;
	bh=KYbu4ps1GMb+LCPFTeVEht0h3DNOHZE3KnKIKfpywmc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ivTYC4E2naI69ZF6VgmNu0WPDhHHjPGqYRgV+wtTT8y2HK2SGcLjx19VEwIBdcqbu
	 uBeEUJDcWCdM8bv5cKaSdniSoKyXNBH5LdIzMq392WwuoDq3YqD5ACgEiWxJcJjZTy
	 2chPoRH6bCL6wTjZm0NzrRS2r/GZQ3jt7DMiSCjUtTOkjw09ZCS6842LCY8tLUcgdB
	 2SRyO4/uROKTC5I0WupZwVrTRUnb3W3ZSy577Fdv31z87p6zXH+cJrFTwi46l2d/VY
	 ct3NwUUEmRVBY3v4ypC4jGZnTmQs4VdJ9ENay8KcuP9BvDkUL71wTMTv5i8+B5RXK1
	 6fLgkhjyTiMng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE56B40B17;
	Wed, 11 Nov 2026 11:35:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B691017CC
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 11:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92DD540B17
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 11:35:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w-Tzdu664p3Z for <buildroot@buildroot.org>;
 Wed, 11 Nov 2026 11:35:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DBD1D40B16
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DBD1D40B16
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 11:35:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id AFCBC78034D;
 Wed, 11 Nov 2026 12:35:28 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Wed, 11 Nov 2026 12:35:28 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 11 Nov 2026 12:35:28 +0100
To: Alexander Shirokov <shirokovalexs@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261109075547.418921-1-shirokovalexs@gmail.com>
References: <20261109075547.418921-1-shirokovalexs@gmail.com>
User-Agent: Webmail Free/1.6.21
Message-ID: <997825ad9d4add278985e387f33e13d6@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/broot: bump to version 1.62.0
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
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 09/11/2026 08:55, Alexander Shirokov wrote:
> Changelog: https://github.com/Canop/broot/blob/v1.62.0/CHANGELOG.md
> 
> Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
