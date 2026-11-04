Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC41606A335
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 22:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Kvmo02HB;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=m.gmane-mx.org header.i=@m.gmane-mx.org header.a=rsa-sha256 header.s=ciao2026 header.b=FjpcM2lw
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 765D18119A;
	Wed,  4 Nov 2026 22:05:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fpuh6_ghs99N; Wed,  4 Nov 2026 22:05:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7F2D9811CA
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793829913;
	b=qES8OO7lCIv8UV4fQ0OWclid3LzhrtEpsfa50iksV37IzgBkJyVf+QRa0YCq4SVtcrBc
	 wLurVePozDBvfMJl8NPE2NVwbPIXz8cqmnSnaIekON68z8F/b3z2MEJEn2Z87t17E5tMJ
	 gE+B0v7NatbVp1zo/FSWGO5Zr2Cc4cvB/W7gbbox3jSLZ14+RHJu+wtMuk4HxBhf4naSw
	 Rh6ossy6JdGM8S9rKsLLiKlwf479oHCs0pOrHaAiIXDZfQL7VFWgeV3lqlh/rxMlKOiNH
	 BDdPdfdce+tOp1OMU8lO0x8RT5gTnPRRQoJKQToIV+y303UJi0AMenZKbj0DJCXLD0g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793829913;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:X-Injected-Via-Gmane:To:From:Date:Message-ID:
	 References:MIME-Version:User-Agent:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=V/aBXP65kCKDcsjc5qHV0a2o+d/AuRAoaKw0n/hmOPM=;
	b=HvoAZNlh7/Re3VBA+wF+46mtIzoGf9knq1onD63OVhv1waY1gWLYuWbUwxBnx8whwNdr
	 LwsEv9d37icErkNnziL7P93XPWfVD1MoXEI0FiFRM9Lk2ek/MbQBRwjau8v8mBo3MN8V3
	 ZA5WzgamyVop8yBSOUqhbKTX5+Ph4oQM5aIBuCTGJCd5cdMKHtRfPHg3xYtPV5Bb2xUDW
	 DDUyB34gbvLKIiq864Byb+Vh85pdLJy1NNeUlnSsN/DJaSG+o8BETWZN5ziwpm3XXpHUw
	 7BHdFB479SyI447WXv1CwEg5iJvFoSqvmcTfmiruwCDElNyNJWYKKkyk3+yo13MOFGg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793829913;
	bh=V/aBXP65kCKDcsjc5qHV0a2o+d/AuRAoaKw0n/hmOPM=;
	h=To:From:Date:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Kvmo02HBXNvpSTAGPmUb+5GFCKHilauN/HoVz2TSdAi11xWxc9Ib1YPf4mvoCHFBR
	 tZzcDd3ivWOO+sO6wyCSzgDvCTatqoDQZrQjXXh2pDtQoW1TvvndvQ3+O03+6+djqJ
	 SjtsT8xBrgV601mtDXb0SjHIq+5IdpUm51ahZ4KrylIKANKZ0r0v1OnA5KA31Duhuz
	 nnCKz+LRdEf10UUsYyN4fRKEdVW/BDTnOvwflWaynG0bYNV/6FhLam5vDYrQQ45EZQ
	 WDD04e4Btu8Tup5BFc56UFYVxM+wJyOi3G9RASwH574TRYFZgojrMLALInUVyoJuhL
	 mlZ0Q3fe8jZcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F2D9811CA;
	Wed,  4 Nov 2026 22:05:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CDAF437B
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:05:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF6A4607A3
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:05:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J_2DW_cHLNdw for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 22:05:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EA37A605D7
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=49.12.148.96
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=49.12.148.96;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=m.gmane-mx.org header.i=@m.gmane-mx.org
 header.a=rsa-sha256 header.s=ciao2026 header.b=FjpcM2lw
Received: from ciao.gmane.io (ciao.gmane.io [49.12.148.96])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA37A605D7
 for <buildroot@uclibc.org>; Wed,  4 Nov 2026 22:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=m.gmane-mx.org; s=ciao2026; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Date:Subject:From:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wfXrn8Gg+MQLlPYjE8fyI/bMGdunZ5XpC5SRn1AEvY0=; b=FjpcM2lw3LUjQwA5XwLBpI0sEB
 Y3Ln5SriegaDiCKbE6jzX/P/t9i15VNBoIbZuCQOXn5jHmp3em9mv0OzuJOs7WfQwSTmRyWUPJuoa
 6TcFQvpvfBSsC5efMu2DjQPj/2BgkPBz28d6+UPH5iR/vT/hGcvqvj5LbhJsnlnRlRLu0q/PC08s9
 X0RkiSwZRBumCQIndetqdnN4yWSCZtESbVkzgToNE2u8zYDIrP23zkNdsIaDKI6uIufzSZIbRKicF
 /n+cNE8w8rN0D31y0Qn+yNzioh+x5PQvEKBmVNX+apnqeIRg2YXoWbq7uCKB9uqw6ZOe17H7avhq2
 /7NB8rVg==;
Received: from list by ciao.gmane.io with local (Exim 4.98.2)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>)
 id 1xOj6Q-00000008WC9-3typ for buildroot@uclibc.org;
 Wed, 04 Nov 2026 23:05:06 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Wed, 04 Nov 2026 23:04:12 +0100
Message-ID: <pan$86fe$f3e6f0b9$c5c5a1e6$45dd349@ID-313208.user.individual.net>
References: <20261102201434.12138-1-bernd@kuhls.net>
 <auuqeiJezoi26OeE__37191.4018340007$1793829569$gmane$org@windsurf>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
Subject: Re: [Buildroot] [PATCH 1/1] package/clamav: fix broken database
 updates with OpenSSL 4.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am Wed, 4 Nov 2026 22:59:03 +0100 schrieb Thomas Petazzoni via buildroot:

> On Mon, Nov 02, 2026 at 09:14:34PM +0100, Bernd Kuhls wrote:
>> Removed patch 0001 and added a patch series cherry-picked from
>> https://github.com/markarce/clamav/commits/perf/cache-evp-md-fetch-1.5/
>> exluding all unit test updates.
>> The series also includes a different fix for the ASN1_TIME type change
>> previously solved by patch 0001.
>> 
>> Signed-off-by: Bernd Kuhls
>> <bernd@kuhls.net>
> 
> As usual for fixes: which commit is being fixed by this? Is it
> 8df2ad69de03c61378a85dc08daa1e9a2fa46920 ?

Hi Thomas,

no, the error fixed by this patch only occurs with OpenSSL >= 4.1, not 
with the OpenSSL versions we currently have in buildroot. So there is no 
need to backport this patch to any LTS branches.

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
